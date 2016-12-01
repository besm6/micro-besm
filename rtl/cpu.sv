//
// Micro-BESM processor
//
// Copyright (c) 2016 Serge Vakulenko
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//
`default_nettype none

`define TODO 'z

module cpu(
    input  wire         clk,        // Clock
    input  wire         reset,      // Global reset
    input  wire  [63:0] i_data,     // data bus input
    input  wire   [7:0] i_tag,      // tag bus input
    output logic [63:0] o_ad,       // address/data output
    output logic  [7:0] o_tag,      // tag output
    output logic        o_astb,     // address strobe
    output logic        o_atomic,   // r-m-w transaction
    output logic        o_rd,       // read op
    output logic        o_wr        // write op
);
timeunit 1ns / 10ps;

// Internal registers
logic  [4:0] modgn;             // РНГ: регистр номера группы памяти модификаторов
logic  [7:0] procn;             // РНП: регистр номера процесса
logic [31:0] rr;                // регистр режимов и триггеры признаков
logic [31:0] ureg;              // регистр исполнительного адреса
logic [19:0] physad;            // физический адрес, результат трансляции ureg
logic [63:0] sh_out;            // результат сдвига
logic [10:0] pshift;            // регистр параметра сдвига
logic  [6:0] clz_out;           // результат поиска левой единицы
logic  [7:0] instr_code;        // код операции команды
logic [31:0] instr_addr;        // адресная часть команды
logic [11:0] jump_addr;         // ПНА КОП основного или дополнительного формата
logic [11:0] rwio_addr;         // ПНА команд rmod/wmod и обмена с пультовым процессором
logic [11:0] grp_addr;          // ПНА групп TODO

// Signals for ALU
logic  [8:0] alu_I;             // ALU instruction, from ALUD, FUNC and ALUS
logic        alu_C0;            // Carry input
logic [63:0] alu_Y;             // Y bus output from ALU

// Signals for status/shift unit
logic [12:0] ss_I;              // Status/Shift instruction, from SHMUX and STOPC
logic  [3:0] ss_Y;              // Y bus input
logic  [3:0] ss_oY;             // Y bus output from Status/Shift
logic        ss_CT;             // Conditional test output

// Global data bus D and Y
logic [63:0] D;
logic [63:0] Y;

logic stopm0, stopm1;           // Флаги останова

// Память обмена с пультовым процессором
logic [7:0] mpmem[16];

// Память приписок страниц
logic [19:0] pg_map[1024];
logic        pg_used[1024];     // БОБР, page has been referenced
logic        pg_dirty[1024];    // БИЗМ, page had been modified
logic        pg_reprio[1024];   // БМСП, reprioritize request
logic  [2:0] pg_access;         // both for current page
logic  [9:0] pg_index;          // РФС: регистр физической страницы
logic [11:0] pg_prio0[1024];    // page priority 0
logic [11:0] pg_prio1[1024];    // page priority 1
logic        pg_fill;           // fill pg_prio[] with 1s
logic  [9:0] pg_fcnt;           // fill count
logic        pg_changed;        // flag for tracer

// Мультиплексор условий
logic cond;

// Биты регистра режимов (РР)
logic [2:0] grp;
logic normb, rndb, ovrib, bnb, ovrftb, drg, rcb, cb, cemlrg, intstp, tr0, tr1;
logic flag_v, flag_c, flag_n, flag_z, no_badop;
logic no_rtag, no_badacc, no_progtag, no_intr, no_wtag, single_step, no_wprot;
logic no_rprot, flag_negaddr, no_procnm, no_paging, flag_jump;
logic [1:0] rr_unused;

// Биты расширения регистра режимов (РРР)
logic rrr_cmd;                  // 1 - признак команд (ПК)
logic rrr_besm6;                // 2 - режим эмуляции БЭСМ-6 (РЭ)
logic rrr_noload;               // 3 - запрет чтения операнда из памяти (ЗЧП)
logic rrr_nostore;              // 4 - запрет записи операнда в память (ЗЗП)
logic rrr_nofetch;              // 5 - запрет выборки команды из памяти (ЗВП)
logic rrr_nojump;               // 6 - запрет передачи управления на команду (ЗПУ)
logic rrr_pint;                 // 8 - программная интерпретация тега (ПИНТ)

logic instr_ir15;               // stack mode flag
logic tkk;                      // признак правой команды стандартизатора (TKK)
logic halt;                     // триггер "Останов", сбрасывается только из пультового процессора
logic run;                      // триггер "Пуск", устанавливается только из пультового процессора

// Signals for arbiter
logic  [3:0] arb_opc;           // код операции арбитра
logic        arb_req;           // запрос к арбитру
logic        arb_rdy;           // ответ арбитра

// External bus interface
// Inputs
logic [63:0] bus_DA;            // A data input
logic [71:0] bus_DB;            // B data input
logic [71:0] bus_DX;            // X data bus
logic  [1:0] bus_ARX;           // X address input
logic        bus_ECBTAG;        // B tag port enable
logic        bus_ECX;           // X port enable
logic        bus_WRX;           // X write enable

// Outputs
logic [63:0] bus_oDA;           // A data output
logic [71:0] bus_oDB;           // B data output
logic [71:0] bus_oDC;           // C data output
logic [71:0] bus_oDX;           // X data output

// Control unit
// Input signals
logic        control_nCC;       // Conditional Code Bit
logic        control_CI;        // Carry-in bit for microprogram counter
logic [11:0] control_D;         // 12-bit data input to chip

// Output signals
logic [11:0] control_Y;         // 12-bit address output
logic        control_nMAP;      // JMAP instruction: use rwio memory

//--------------------------------------------------------------
// Microinstruction ROM.
//
logic [111:0] memory[4096] = '{
    `include "../microcode/microcode.v"
    default: '0
};

logic [112:1] opcode;           // 112-bit latched opcode

always @(posedge clk)
    if (reset) begin
        opcode <= '0;           // Reset state
        halt <= 0;              // триггер "Останов"
        run <= 1;               // триггер "Пуск"
    end else
        opcode <= memory[control_Y];

// Microinstruction fields.
wire  [3:0] SQI   = opcode[112:109]; // Код операции селектора адреса микропрограмм СУАМ
wire [11:0] A     = opcode[108:97];  // Адрес следующей микрокоманды или адрес ПЗУ констант
wire  [1:0] MAP   = opcode[96:95];   // Выбор источника адреса, поступающего на вход D СУАМ
wire        ALU   = opcode[94];      // Разрешение выдачи информации из МПС на шину Y
wire  [2:0] ALUD  = opcode[93:91];   // Управление приемниками результата АЛУ
wire  [2:0] FUNC  = opcode[90:88];   // Код операции АЛУ МПС
wire  [2:0] ALUS  = opcode[87:85];   // Управление источниками операндов на входы АЛУ
wire        H     = opcode[84];      // Управление разрядностью АЛУ
wire  [3:0] RB    = opcode[83:80];   // Адрес регистра канала B МПС
wire  [3:0] RA    = opcode[79:76];   // Адрес регистра канала A МПС
wire  [1:0] CI    = opcode[75:74];   // Управление переносом C0 АЛУ МПС, разряды I12-I11
wire  [3:0] SHMUX = opcode[73:70];   // Сдвиг в МПС, разряды I9-I6 КОП СУСС
wire  [5:0] STOPC = opcode[69:64];   // Разряды I5-I0 КОП СУСС
wire        MOD   = opcode[63];      // Привилегированный режим обращения к специальным регистрам
wire  [6:0] PSHF  = opcode[62:56];   // Параметр сдвига сдвигателя
wire  [1:0] MNSA  = opcode[62:61];   // Адрес источника номера модификатора
wire  [4:0] MODNM = opcode[60:56];   // Номер модификатора в группе регистров
wire  [3:0] DSRC  = opcode[55:52];   // Управление источниками информации на шину D
wire  [3:0] YDST  = opcode[51:48];   // Управление приемниками информации с шины Y ЦП
wire  [1:0] sh_op = opcode[47:46];   // Код операции сдвигателя: CYCL, LOG, ARIPH или EMULF
wire  [3:0] ARBI  = opcode[45:42];   // Код операции арбитра общей шины
wire        RLD   = opcode[41];      // Загрузка регистра селектора адреса СУАМ и ШФ шин Y ЦП и D СУАМ
wire        LETC  = opcode[40];      // Прохождение признака ПИА на вход ПНА команд
wire  [2:0] CYSTR = opcode[39:37];   // Длительность тактового импульса
wire        SCI   = opcode[36];      // Передача условия на вход инкрементора
wire        ICI   = opcode[35];      // Инверсия условия на вход инкрементора (CI) СУАМ, не используется
wire        ICC   = opcode[34];      // Инверсия условий, выбираемых полем COND
wire        ISE   = opcode[33];      // Разрешение внешних и внутренних прерываний
wire        CEM   = opcode[32];      // Разрешение записи в машинный регистр состояния M CYCC
wire        CEN   = opcode[31];      // Разрешение записи в микромашинный регистр состояния N CYCC
wire        CSM   = opcode[30];      // Управление обращением к памяти модификаторов
wire        WEM   = opcode[29];      // Разрешение записи в память модификаторов
wire        ECB   = opcode[28];      // Выбор канала B БОИ данных
wire        WRB   = opcode[27];      // Запись по каналу B в БОИ данных и БОИ тега
wire  [1:0] BRA   = opcode[26:25];   // Адрес регистра канала B БОИ даннных и БОИ тега
wire        ECA   = opcode[24];      // Выбор канала A БОИ данных
wire        WRA   = opcode[23];      // Запись по каналу A в БОИ данных.
wire  [1:0] ARA   = opcode[22:21];   // Адрес регистра канала A БОИ даннных
wire  [2:0] YDEV  = opcode[20:18];   // Выбор источника или приемника информации с шины Y
wire        WRY   = opcode[17];      // Запись в источники или приемники шины Y
wire  [2:0] DDEV  = opcode[16:14];   // Выбор источника или приемника информации с шины D
wire        WRD   = opcode[13];      // Управление записью в источники или приемники шины D
wire        IOMP  = opcode[12];      // Выбор дешифратора триггеров признаков или часов и таймера
wire  [4:0] FFCNT = opcode[11:7];    // Установка/сброс триггеров признаков
wire  [3:0] MPADR = opcode[10:7];    // Адрес регистра в блоке обмена с ПП
wire  [4:0] COND  = opcode[6:2];     // Выбор условия, подлежащего проверке
wire        MPS   = opcode[1];       // Выбор источника параметра сдвига

//--------------------------------------------------------------
// Microinstruction control unit.
//
// БИС СУАМ вырабатывает сигналы /VE, /ME, /PE, которые
// используются для выборки внешних источников, подключенных к
// шине D:
//  * преобразователь начального адреса команд RMOD,WMOD и обращений
//    ПП (при наличии признака MOD, сигнал /ME);
//  * дополнительный преобразователь адреса, задающий адреса векторов
//    прерывания. A также знаков сомножителей для коррекции
//    произведения (VE). (сигнал /PE не используется).
//
// Каждой микрокомандой вырабатывается только один сигнал
// разрешения для внешнего источника.
//
// Сигналы I0-I3 поступают из микропрограммы; /RLD - с дешифратора
// триггеров признаков; /CC - с мультиплексора условий; выходы
// Y0-Y11 передают полученный адрес микрокоманды; на вход CI в
// зависимости от 36 разряда МП подается либо “1”, либо прямой или
// инверсный выход с мультиплексора условий, либо “0” в момент
// входа в микропрограмму обработки прерываний; сигнал /CCEN
// всегда равен “0”.

am2910 control(clk,
    SQI, '0, control_nCC, ~RLD, control_CI, '0,
    control_D, control_Y, , , control_nMAP, );

// Carry-in bit for microprogram counter
// Ignore ICI, as if always enabled
assign control_CI = !SCI ? '1 : ~control_nCC;

// 12-bit data input
assign control_D =
    (MAP == 0) ? A :            // PE, конвейерный регистр
    (MAP == 1) ? jump_addr :    // ME, ПНА КОП основного или дополнительного формата
    (MAP == 2) ? grp_addr :     // GRP, ПНА групп и микропрограммные признаки "След0" И "След1"
 !control_nMAP ? rwio_addr :    // JMAP instruction, use rwio memory
                 alu_Y[11:0];   // Выход АЛУ

assign control_nCC = ICC ? cond : ~cond;

// Выбор условия, подлежащего проверке.
always_comb case (COND)
      0: cond = 1;          // YES, "да"
      1: cond = normb;      // NORMB, блокировка нормализации (БНОР)
      2: cond = rndb;       // RNDB, блокировка округления (БОКР)
      3: cond = ovrib;      // OVRIB, блокировка прерывания по переполнению (БПП)
      4: cond = bnb;        // BNB, блокировка выхода числа за диапазон БЭСМ-6 (ББЧ)
      5: cond = ovrftb;     // OVRFTB, блокировка проверки переполнения поля упрятывания (БППУ)
      6: cond = drg;        // DRG, режим диспетчера (РД)
      7: cond = rrr_besm6;  // EMLRG, режим эмуляции
      8: cond = rcb;        // RCB, признак правой команды (ППК)
      9: cond = cb;         // CB, признак изменения адреса 16 регистром (ПИА)
     10: cond = cemlrg;     // CEMLRG, РЭС, 20-й разряд PP (резерв)
     11: cond = ss_CT;      // CT, сигнал CT CYCC
     12: cond = tr1;        // TR1, След1
     13: cond = intstp;     // INTSTP, признак останова по прерыванию (ПОП)
     14: cond = instr_ir15; // IR15, стековый режим команды (ИР15)
     15: cond = tkk;        // TKK, признак правой команды стандартизатора (TKK)
     16: cond = run;        // RUN, "пуск" от ПП
     19: cond = `TODO;      // INT, признак наличия прерываний
     20: cond = ~pg_fill;   // FULMEM, память БМСП заполнена единицами
     21: cond = arb_rdy;    // ARBRDY, готовность арбитра
     22: cond = tr0;        // TR0, След0
     23: cond = `TODO;      // CPMP, память обмена "ЦП -> ПП" свободна
default: cond = 1;
endcase

//--------------------------------------------------------------
// Constant ROM.
//
logic [63:0] const_ROM[512] = '{
    `include "../microcode/constants.v"
    default: '0
};
logic [63:0] PROM;              // ПЗУ констант

assign PROM = const_ROM[A[8:0]];

//--------------------------------------------------------------
// Modifier memory.
//
logic [3:0] instr_reg;          // поле модификатора команды
logic [31:0] mr_mem[1024];      // память регистров-модификаторов
logic [31:0] mr_read;           // read from mr_mem[]
logic [4:0] mn;                 // номер модификатора

assign mn =
    (MNSA == 0) ? ureg[4:0] :   // U, регистр исполнительного адреса
    (MNSA == 1) ? instr_reg :   // IRA, поле модификатора команды
    (MNSA == 3) ? ~MODNM :      // MP, поле MODNM микрокоманды
                  '0;           // не используется

assign mr_read =                // read modifier memory
    (mn[4] & MNSA!=3 & !MOD)
        ? '0                    // need MOD to access M[16:31]
        : mr_mem[{modgn, mn}];

always @(posedge clk)
    if (CSM & WEM) begin
        if (mn == 0 & MNSA != 3)
            ;                   // cannot write to M0 from ureg
        else if (mn[4] & MNSA != 3 & !MOD)
            ;                   // need MOD to write to M[16:32], no ureg
        else
            mr_mem[{modgn, mn}] <= Y[31:0];
    end

//--------------------------------------------------------------
// Timer
//
wire        tm_out0;                // output of timer0: use it as clock for timer1
wire        tm_out1;                // output of timer1: interrupt TODO
wire        tm_out2;                // output of timer2: interrupt TODO
logic       tm_clk0;                // clock for timer0, 1MHz
wire        tm_clk1 = tm_out0;      // clock for timer1, 100Hz
logic       tm_clk2;                // clock for timer2, 100kHz
logic [3:0] tm_counter2;            // divider for clk2
wire  [7:0] tm_dout;                // data output bus

wire tm_cs = (DDEV == 4);           // CTIME: chip select
wire tm_wr = (DSRC == 15) & WRD;    // WT: write strobe from Y bus
wire tm_rd = (DSRC == 14);          // RT: read strobe to Y bus

i8253 timer(clk, tm_cs, tm_rd, tm_wr,
            FFCNT[1:0], Y[7:0], tm_dout,
            tm_clk0, tm_clk1, tm_clk2,
            tm_out0, tm_out1, tm_out2);

// Clock divider by 2.
always @(posedge clk) begin
   if (reset)
        tm_clk0 <= 0;
    else if (!halt)
        tm_clk0 <= ~tm_clk0;
end

// Clock divider by 20.
always @(posedge clk) begin
    if (reset) begin
        tm_counter2 <= 0;
        tm_clk2 <= 0;
    end else if (tm_counter2 == 9) begin
        tm_counter2 <= 0;
        if (!halt)
            tm_clk2 <= ~tm_clk2;
    end else begin
        tm_counter2 <= tm_counter2 + 1;
    end
end

//--------------------------------------------------------------
// Datapath: register file, ALU and status/shifts
//
datapath alu(clk,
    alu_I, RA, RB, D, alu_C0, H, alu_Y,
    ss_I, ~CEM, ~CEN, ss_Y, ss_oY, ss_CT);

assign alu_I = {ALUD, FUNC, ALUS};
assign alu_C0 = control_nCC;

// Управление источниками информации на шину D.
assign D =
    // DSRC mux
    (DSRC == 1)  ? {1'b1, modgn, 5'd0} : // MODGN: регистр номера группы памяти модификаторов
    (DSRC == 2)  ? procn :              // PROCN: регистр номера процесса
    (DSRC == 3)  ? rr :                 // CNT: регистр режимов и триггеры признаков
    (DSRC == 4)  ? {pg_index, 10'd0} :  // PHYSPG: регистр физической страницы
    (DSRC == 5)  ? arb_opc :            // ARBOPC: регистр КОП арбитра
    (DSRC == 8)  ? instr_addr :         // COMA: адресная часть команды
    (DSRC == 9)  ? sh_out :             // SHIFT: результат сдвига
    (DSRC == 10) ? instr_code :         // OPC: код операции команды
    (DSRC == 11) ? clz_out :            // LOS: результат поиска левой единицы
    (DSRC == 12) ? PROM :               // PROM: ПЗУ констант
    (DSRC == 14) ? tm_dout :            // RTIME, сигнал чтения часов/таймеров

    // DDEV mux
    (DDEV == 1)  ? pg_access :          // ВВ: БОБР, БИЗМ
    (DDEV == 2)  ? pg_reprio[pg_index] : // MODB: БМСП
    (DDEV == 5)  ? {ss_oY, 6'd0} :      // STATUS: Y bus output from Status/Shift
    (DDEV == 6)  ? pg_prio0[pg_index] : // PPMEM0: память приоритетов страниц 0
    (DDEV == 7)  ? pg_prio1[pg_index] : // PPMEM1: память приоритетов страниц 1

    // Others
    (CSM & !WEM) ? mr_read :            // регистр-модификатор
    (ECA & !WRA) ? bus_oDA :            // канал A БОИ данных
                   instr_addr;          // источник не указан: адресная часть команды?

assign Y =
                   ALU ? alu_Y :                // Y bus output from ALU
    (YDEV == 1 & !WRB) ? bus_oDB[71:64] :       // ECBTAG, канал В БОИ тега
    (YDEV == 2 & !WRY) ? physad :               // PHYSAD, физический адрес (только на чтение)
    (YDEV == 3 & !WRY) ? ureg :                 // RADRR, регистр исполнительного адреса (чтение)
    (YDEV == 4 & !WRY) ? pg_map[ureg[19:10]] :  // PSMEM, память приписок (CS);
    (YDEV == 5 & !WRY) ? mpmem[MPADR] :         // МРМЕМ, память обмена с ПП;
          (ECB & !WRB) ? bus_oDB[63:0] :        // канал B БОИ данных
                         '0;

// Управление приемниками информации с шины Y ЦП.
always @(posedge clk)
    case (YDST)
     1: modgn    <= Y[9:5];     // MODGN, регистр номера группы памяти модификаторов
     2: procn    <= Y[7:0];     // PROCN, регистр номера процесса
   /*3: rr       <= Y[31:0];*/  // CNT, регистр режимов и триггеры признаков
   /*4: pg_index <= Y[19:10];*/ // PHYSPG, регистр физической страницы
   /*5: arb_opc  <= Y[3:0];*/   // ARBOPC, код операции арбитра
     8: ureg     <= Y[31:0];    // ADRREG, регистр исполнительного адреса (запись)
   /*9: pshift   <= Y[10:0];*/  // PSHIFT, регистр параметра сдвига (только запись)
    endcase

// Запись в источники или приемники шины Y.
always @(posedge clk)
    if (WRY)
        case (YDEV)
         4: begin                   // PSMEM, память приписок (CS)
                pg_map[ureg[19:10]] <= Y[19:0];
                pg_changed <= 1;
            end
         5: mpmem[MPADR] <= Y[7:0]; // МРМЕМ, память обмена с ПП
         6: stopm0 <= Y[0];         // STOPM0, флаг останова 0
         7: stopm1 <= Y[0];         // STOPM1, флаг останова 1
        endcase

//assign cclr = (YDST == 10);       // запуск сброса кэша

assign ss_I = {CI, alu_I[7], SHMUX, STOPC};
assign ss_Y = Y[9:6];               // status bits: Z N C V

//--------------------------------------------------------------
// Shifter.
//
shifter sh(Y, PSHF, pshift, sh_op, sh_out);

always @(posedge clk)
    if (YDST == 9)
        pshift <= Y[10:0];
    else if (PSHF != 64)
        pshift <= '0;

//--------------------------------------------------------------
// Count leading zeroes.
//
clz clz(Y, clz_out);

//--------------------------------------------------------------
// External bus interface
//
assign bus_ECBTAG = (YDEV == 1);    // ydev=ECBTAG, выбор регистров БОИ тега

assign bus_DA = D;
assign bus_DB = {Y[7:0], Y};
assign bus_DX = {i_tag, i_data};
assign o_ad   = bus_oDX[63:0];
assign o_tag  = bus_oDX[71:64];

extbus busio(
    clk,
    bus_DA, bus_oDA,                    // A data bus
    bus_DB, bus_oDB,                    // B data bus
    72'b00, bus_oDC,                    // C data bus
    bus_DX, bus_oDX,                    // X data bus
    ARA, BRA,          2'b01, bus_ARX,  // address inputs
    ECA, ECB, bus_ECBTAG, '1, bus_ECX,  // port enable
    WRA, WRB,             '0, bus_WRX   // write enable
);

//--------------------------------------------------------------
// Arbiter
//
arbiter arb(clk, reset,
    arb_req,                            // input request strobe
    arb_req ? ARBI : arb_opc,           // input opcode
    bus_ARX, bus_ECX, bus_WRX,          // X bus control
    o_astb, o_atomic, o_rd, o_wr,       // external memory interface
    arb_rdy                             // resulting status
);
assign arb_req = (YDEV == 2);           // PHYSAD, request to external bus

always @(posedge clk)
    if (arb_req)
        arb_opc <= ARBI;                // PHYSAD, set from microinstruction
    else if (YDST == 5)
        arb_opc <= Y[3:0];              // ARBOPC, set from Y data bus

//--------------------------------------------------------------
// Instruction decoder
//
logic instr_ext;                // extended opcode flag
logic [19:0] addr;
wire uflag = LETC & cb;         // признак изменения адресом (ПИА)

decoder dec(
    bus_oDC[63:0],              // instruction word
    rrr_besm6,                  // besm6 compatibility (РЭ)
    tkk,                        // right half flag (ТКК)
    instr_reg,                  // modifier index
    instr_code,                 // instruction code (КОП)
    instr_ext,                  // extended opcode flag
    instr_ir15,                 // stack mode flag
    addr                        // address
);
assign instr_addr = {{12{addr[19]}}, addr};

logic [11:0] optab[4096] = '{
    `include "../microcode/optab.v"
    default: '0
};
assign jump_addr = optab[{instr_ext, rrr_besm6, instr_ir15, uflag, instr_code}];

//--------------------------------------------------------------
// Mode register (РР)
//
assign rr = {       // регистр режимов (РР)
    rr_unused,      // РР.31-30 - not specified
    flag_jump,      // РР.29 - признак команды передачи управления (ППУ)
    rcb,            // РР.28 - RCB, признак правой команды (ППК)
    cb,             // РР.27 - CB, признак изменения адреса 16 регистром (ПИА)
    no_paging,      // РР.26 - блокировка приписки (БП)
    no_procnm,      // РР.25 - блокировка проверки номера процесса (БПНП)
    flag_negaddr,   // РР.24 - режим отрицательных адресов (РОА)
    no_rprot,       // РР.23 - блокировка защиты страниц по обращению (БЗО)
    no_wprot,       // РР.22 - блокировка защиты страниц по записи (БЗЗ)
    intstp,         // РР.21 - признак останова по прерыванию (ПОП)
    single_step,    // РР.20 - режим пошагового выполнения команд (РШ)
    cemlrg,         // РР.19 - CEMLRG, РЭС, 20-й разряд PP (резерв)
    no_wtag,        // РР.18 - блокировка проверки тега при записи (БПТЗ)
    no_intr,        // РР.17 - блокировка внешних прерываний (БВП)
    no_progtag,     // РР.16 - блокировка программной интерпретации тега (БПИНТ)
    no_badacc,      // РР.15 - блокировка реакции на чужой сумматор (БЧС)
    no_rtag,        // РР.14 - блокир.проверки тега при чтении операнда (БПТЧ)
    no_badop,       // РР.13 - блокировка реакции на чужой операнд (БЧОП)
    drg,            // РР.12 - DRG, режим диспетчера (РД)
    ovrftb,         // РР.11 - OVRFTB, блокировка проверки переполнения поля упрятывания (БППУ)
    bnb,            // РР.10 - BNB, блокировка выхода числа за диапазон БЭСМ-6 (ББЧ)
    flag_z,         // РР.9 - признак нуля (ПН или Z)
    flag_n,         // РР.8 - признак знака (ПЗ или N)
    flag_c,         // РР.7 - признак переноса (ППС или С)
    flag_v,         // РР.6 - признак переполнения (ПП или OVR)
    ovrib,          // РР.5 - OVRIB, блокировка прерывания при переполнении (БПП)
    grp,            // РР.4-2 - группа для условных переходов (ГС,ГУ,ГЛ)
    rndb,           // РР.1 - RNDB, блокировка округления (БОКР)
    normb           // РР.0 - NORMB, блокировка нормализации (БНОР)
};
always @(posedge clk)
    if (YDST == 3) begin
        rr_unused    <= Y[31:30];
        flag_jump    <= Y[29];
        rcb          <= Y[28];
        cb           <= Y[27];
        no_paging    <= Y[26];
        no_procnm    <= Y[25];
        flag_negaddr <= Y[24];
        no_rprot     <= Y[23];
        no_wprot     <= Y[22];
        intstp       <= Y[21];
        single_step  <= Y[20];
        cemlrg       <= Y[19];
        no_wtag      <= Y[18];
        no_intr      <= Y[17];
        no_progtag   <= Y[16];
        no_badacc    <= Y[15];
        no_rtag      <= Y[14];
        no_badop     <= Y[13];
        drg          <= Y[12];
        ovrftb       <= Y[11];
        bnb          <= Y[10];
        flag_z       <= Y[9];
        flag_n       <= Y[8];
        flag_c       <= Y[7];
        flag_v       <= Y[6];
        ovrib        <= Y[5];
        grp          <= Y[4:2];
        rndb         <= Y[1];
        normb        <= Y[0];
    end

//--------------------------------------------------------------
// Extended mode register
//
logic rrr_update;                   // need to update RRR

always @(posedge clk)
    if (reset)
        rrr_update <= '0;
    else if (bus_WRX & bus_ARX == 'b01)
        rrr_update <= '1;           // tag changed
    else
        rrr_update <= '0;

// Режим эмуляции БЭСМ-6 (РЭ)
always @(posedge clk)
    if (reset)
        rrr_besm6 <= 0;             // изначально РЭ=0
    else if (rrr_update)
        rrr_besm6 <= bus_oDC[65];   // берем из тега командного слова
    else if (! IOMP)
        case (FFCNT)
        20: rrr_besm6 <= '0;        // SETNR, установка НР
        22: rrr_besm6 <= '1;        // SETER, установка РЭ
        endcase

// Остальные биты тега командного слова TODO
always @(posedge clk)
    if (rrr_update) begin
        rrr_cmd     <= bus_oDC[64]; // ПК - признак команд
        rrr_noload  <= bus_oDC[66]; // ЗЧП - запрет чтения операнда из памяти
        rrr_nostore <= bus_oDC[67]; // ЗЗП - запрет записи операнда в память
        rrr_nofetch <= bus_oDC[68]; // ЗВП - запрет выборки команды из памяти
        rrr_nojump  <= bus_oDC[69]; // ЗПУ - запрет передачи управления на команду
        rrr_pint    <= bus_oDC[71]; // ПИНТ - программная интерпретация тега
    end

//--------------------------------------------------------------
// Триггеры признаков
//
always @(posedge clk)
    if (! IOMP) case (FFCNT)
     1: grp <= 3'b001;      // LOGGRP, установка логической группы
     2: grp <= 3'b010;      // MULGRP, установка группы умножения
     3: grp <= 3'b100;      // ADDGRP, установка группы сложения
   /*5: cb <= '1;*/         // SЕТС, установка триггера ПИА
   /*6: rcb <= '0;*/        // CLRRCB, сброс триггера ППК
   /*7: rcb <= '1;*/        // SETRCB, установка триггера ППК
     8: flag_jump <= '0;    // CLRJMP, сброс триггера ППУ
     9: flag_jump <= '1;    // SETJMP, установка триггера ППУ
    10: no_intr <= '0;      // SETEI, сброс маски прерываний (разрешение прерываний)
    11: no_intr <= '1;      // CLREI, установка маски прерываний (запрет прерываний)
    12: tr0 <= '0;          // CLRTR0, сброс микропрограммного признака "След0"
    13: tr0 <= '1;          // SETTR0, установка мп признака "След0"
    14: tr1 <= '0;          // CLRTR1, сброс мп признака "След1"
    15: tr1 <= '1;          // SETTR1, установка мп признака "След1"
    16: /*TODO <= '0*/;     // CLRCT, сброс прерывания от часов счетного времени
    17: /*TODO <= '0*/;     // CLRCTT, сброс прерывания от таймера счетного времени
    18: tkk <= '0;          // CLRTKK, сброс триггера коммутации команд - ТКК (ППК стандартизатора)
    19: tkk <= '1;          // SЕТТКК, установка ТКК
    20: /*rrr_besm6 <= 0*/; // SETNR, установка НР
    21: begin               // STRTLD, запуск загрузки памяти БМСП единицами
            pg_fill <= '1;
            pg_fcnt <= pg_index;
        end
    22: /*rrr_besm6 <= 1*/; // SETER, установка РЭ
    23: tkk <= ~tkk;        // СНТКК, переброс ТКК (работает в счетном режиме!)
    24: halt <= '1;         // SETHLT, установка триггера "Останов" (Halt)
    25: /*TODO <= '0*/;     // CLRINT, сброс прерываний (кроме прерываний от таймеров)
    26: run <= '0;          // CLRRUN, сброс триггера "Пуск"
    27: /*TODO <= '1*/;     // RDMPCP, установка признака "память обмена ПП -> ЦП прочитана"
    28: /*TODO <= '1*/;     // LDMPCP, установка признака "в памяти обмена ПП -> ЦП есть информация"
    29: /*TODO <= '1*/;     // LDCPMP, установка признака "в памяти обмена ЦП -> ПП есть информация"
    30: /*TODO <= '1*/;     // PRGINT, установка программного прерывания с номером 31
    31: /*TODO <= '1*/;     // EXTINT, установка внешнего прерывания на магистраль
    endcase

// Признак изменения адресом (ПИА) устанавливается и сбрасывается разными путями
always @(posedge clk)
    if (DDEV == 3)          // ddev=CLRCD
        cb <= '0;           // сброс ПИА, дополнительный сигнал
    else if (!IOMP & FFCNT == 5)    // ffcnt=SЕТС
        cb <= '1;           // установка триггера ПИА

// ППК, признак правой команды
always @(posedge clk)
    if (ISE)
        rcb <= tkk;         // Копирование ТКК в ППК
    else if (!IOMP)
        case (FFCNT)
          6: rcb <= '0;     // CLRRCB, сброс триггера ППК
          7: rcb <= '1;     // SETRCB, установка триггера ППК
        endcase

// БОБР, БИЗМ: блокировка обращения, блокировка изменения
always @(posedge clk)
    if (WRD & DDEV == 1) begin  // ddev=ВВ: БОБР, БИЗМ
        pg_used[pg_index] <= D[1];
        pg_dirty[pg_index] <= D[2];
        pg_changed <= 1;
    end

assign pg_access = { pg_dirty[pg_index], pg_used[pg_index], 1'b0 };

// БМСП, бит модификации списка приоритетов
always @(posedge clk)
    if (reset)
        pg_fill <= 0;
    else if (pg_fill) begin     // Заполнение памяти БМСП единицами
        pg_reprio[pg_fcnt] <= 1;
        if (pg_fcnt[9:0] == 1023)
            pg_fill <= 0;
        else;
            pg_fcnt <= pg_fcnt + 1;
        pg_changed <= 1;
    end else if (WRD & DDEV == 2) begin // MODB, БМСП
        pg_reprio[pg_index] <= D[0];
        pg_changed <= 1;
    end

// PPMEM0/1, память приоритетов страниц
always @(posedge clk) begin
    if (WRD & DDEV == 6) begin  // РРМЕМ0, ОЗУ приоритетов страниц 0
        pg_prio0[pg_index] <= Y;
        pg_changed <= 1;
    end
    if (WRD & DDEV == 7) begin  // РРМЕМ1, ОЗУ приоритетов страниц 1
        pg_prio1[pg_index] <= Y;
        pg_changed <= 1;
    end
end

// Translate virtual address into physical address.
wire [9:0] pg_translated =
    no_paging ? ureg[19:10]
              : pg_map[ureg[19:10]][19:10];

assign physad = {pg_translated, ureg[9:0]};

always @(posedge clk)
    if (arb_req) begin
        pg_index <= pg_translated;  // PHYSAD, set from microinstruction

        // Update `used' bit (БОБР)
        pg_used[pg_translated] <= 1;
        pg_changed <= 1;

        // Update `dirty' bit (БИЗМ)
        case (ARBI)
         2, // CCWR, запись в кэш команд
         4, // DCWR, запись в кэш операндов
        10, // DWR, запись результата
        11, // RDMWR, чтение - модификация - запись
        12: // BTRWR, запись в режиме блочной передачи
            pg_dirty[pg_translated] <= 1;
        endcase

    end else if (YDST == 4)
        pg_index <= Y[19:10];       // PHYSPG, регистр физической страницы

//--------------------------------------------------------------
// RWIO table
//
logic [11:0] rwiotab[2048] = '{
    `include "../microcode/rwiotab.v"
    default: '0
};

always @(posedge clk)
    rwio_addr <= rwiotab[{tr1, tr0, instr_addr[13:10], instr_addr[4:0]}];

endmodule
