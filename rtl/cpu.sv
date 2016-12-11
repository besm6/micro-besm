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

module cpu(
    input  wire         clk,        // clock
    input  wire         reset,      // global reset
    input  wire  [63:0] i_data,     // data bus input
    input  wire   [7:0] i_tag,      // tag bus input
    output logic [63:0] o_ad,       // address/data output
    output logic  [7:0] o_tag,      // tag output
    output logic        o_astb,     // address strobe
    output logic        o_atomic,   // r-m-w transaction
    output logic        o_rd,       // read op
    output logic        o_wr,       // write op
    output logic        o_wforce    // ignore write protection bit
);
timeunit 1ns / 10ps;

// Internal registers
logic  [4:0] modgn;             // РНГ: регистр номера группы памяти модификаторов
logic  [7:0] procn;             // РНП: регистр номера процесса
logic [31:0] rr;                // регистр режимов и триггеры признаков
logic [31:0] vaddr;             // регистр исполнительного адреса
logic [19:0] physad;            // физический адрес, результат трансляции vaddr
logic [63:0] sh_out;            // результат сдвига
logic [10:0] pshift;            // регистр параметра сдвига
logic  [6:0] clz_out;           // результат поиска левой единицы
logic  [7:0] instr_code;        // код операции команды
logic [31:0] instr_addr;        // адресная часть команды
logic [11:0] jump_addr;         // ПНА КОП основного или дополнительного формата
logic [11:0] rwio_addr;         // ПНА команд rmod/wmod и обмена с пультовым процессором
logic [11:0] grp_addr;          // ПНА групп
logic [11:0] intr_addr;         // ПНА прерываний

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

// Interrupts
logic       int_flag;           // Take interrupt immediately
logic [4:0] int_vect;           // Interrupt vector
logic       g_int;              // Глобальный признак наличия прерываний
logic       prg_int;            // Генерация программного прерывания TODO
logic       ext_int;            // Генерация внешнего прерывания TODO
logic       clock_int;          // Прерывание от часов счетного времени (CT) TODO
logic       timer_int;          // Прерывание от таймера счетного времени (CTT) TODO

// Память обмена с пультовым процессором
logic [7:0] mpmem[16];
logic tx_busy;                  // В памяти обмена ЦП->ПП есть информация TODO
logic rx_busy;                  // В памяти обмена ПП->ЦП есть информация TODO

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
logic no_rtag, no_badacc, no_progtag, no_intr, single_step, no_wprot;
logic no_rprot, flag_negaddr, no_procnm, no_paging, flag_jump;
logic [1:0] rr_unused;

// Биты расширения регистра режимов (РРР)
logic itag_cmd;                 // ПК - признак команд
logic mode_besm6;               // РЭ - режим эмуляции БЭСМ-6
logic itag_besm6;               // режим совместимости команды
logic dtag_besm6;               // режим совместимости операнда
logic dtag_noload;              // ЗЧП - запрет чтения операнда из памяти
logic dtag_nostore;             // ЗЗП - запрет записи операнда в память TODO
logic itag_nofetch;             // ЗВП - запрет выборки команды из памяти
logic itag_nojump;              // ЗПУ - запрет передачи управления на команду TODO
logic itag_pint, dtag_pint;     // ПИНТ - программная интерпретация тега

logic instr_ir15;               // stack mode flag
logic tkk;                      // признак правой команды стандартизатора (TKK)
logic halt;                     // триггер "Останов", сбрасывается только из пультового процессора
logic run;                      // триггер "Пуск", устанавливается только из пультового процессора
logic acc_besm6;                // тег РЭ сумматора

// Signals for arbiter
logic  [3:0] arb_opc;           // код операции арбитра
logic        arb_req;           // запрос к арбитру
logic        arb_rdy;           // ответ арбитра

// External bus interface
logic [63:0] bus_DA;            // A data input
logic [71:0] bus_DB;            // B data input
logic [71:0] bus_DX;            // X data bus
logic  [1:0] bus_ARX;           // X address input
logic        bus_ECBTAG;        // B tag port enable
logic        bus_ECX;           // X port enable
logic        bus_WRX;           // X write enable
logic [63:0] bus_oDA;           // A data output, no tag
logic [71:0] bus_oDB;           // B data output
logic [71:0] bus_oDX;           // X data output
logic [63:0] bus_iword;         // fetch result: instruction word from RG1
logic  [7:0] bus_itag;          // fetch result: tag from RG1
logic  [7:0] bus_dtag;          // load result: tag from RG2

// Control unit
// Input signals
logic        control_nCC;       // Conditional Code Bit
logic        control_CI;        // Carry-in bit for microprogram counter
logic [11:0] control_D;         // 12-bit data input to chip

// Output signals
logic [11:0] control_Y;         // 12-bit address output
logic        control_nMAP;      // JMAP instruction: use rwio memory
logic        control_nVECT;     // CJV instruction: use intr memory

//--------------------------------------------------------------
// Microinstruction ROM.
//
logic [111:0] memory[4096] = '{
    `include "../microcode/microcode.v"
    default: '0
};

logic  [11:0] opaddr;           // opcode address
logic [112:1] opcode;           // 112-bit latched opcode

always @(posedge clk)
    if (reset)
        opcode <= '0;           // Reset state
    else
        opcode <= memory[opaddr];

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
//    прерывания (VE). (сигнал /PE не используется).
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
    control_D, control_Y, , control_nVECT, control_nMAP, );

// Carry-in bit for microprogram counter
// Ignore ICI, as if always enabled
assign control_CI =
    int_flag ? '0 :             // Interrupt: no address increment
        !SCI ? '1 :             // Increment by 1
               ~control_nCC;    // Conditional

// 12-bit data input
assign control_D =
    (MAP == 0) ? A :            // PE, конвейерный регистр
    (MAP == 1) ? jump_addr :    // ME, ПНА КОП основного или дополнительного формата
    (MAP == 2) ? grp_addr :     // GRP, ПНА групп и микропрограммные признаки "След0" И "След1"
 !control_nMAP ? rwio_addr :    // JMAP instruction, use rwio memory
!control_nVECT ? intr_addr :    // CJV instruction, use intr memory
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
      7: cond = mode_besm6; // EMLRG, режим эмуляции
      8: cond = rcb;        // RCB, признак правой команды (ППК)
      9: cond = cb;         // CB, признак изменения адреса 16 регистром (ПИА)
     10: cond = cemlrg;     // CEMLRG, РЭС, 20-й разряд PP (резерв)
     11: cond = ss_CT;      // CT, сигнал CT CYCC
     12: cond = tr1;        // TR1, След1
     13: cond = intstp;     // INTSTP, признак останова по прерыванию (ПОП)
     14: cond = instr_ir15; // IR15, стековый режим команды (ИР15)
     15: cond = tkk;        // TKK, признак правой команды стандартизатора (TKK)
     16: cond = run;        // RUN, "пуск" от ПП
     19: cond = g_int;      // INT, признак наличия прерываний
     20: cond = ~pg_fill;   // FULMEM, память БМСП заполнена единицами
     21: cond = arb_rdy;    // ARBRDY, готовность арбитра
     22: cond = tr0;        // TR0, След0
     23: cond = ~tx_busy;   // CPMP, память обмена "ЦП -> ПП" свободна
default: cond = 1;
endcase

//--------------------------------------------------------------
// Constant ROM.
//
const logic [63:0] const_ROM[512] = '{
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
    (MNSA == 0) ? vaddr[4:0] :  // U, регистр исполнительного адреса
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
            ;                   // cannot write to M0 from vaddr
        else if (mn[4] & MNSA != 3 & !MOD)
            ;                   // need MOD to write to M[16:32], no vaddr
        else
            mr_mem[{modgn, mn}] <= Y[31:0];
    end

//--------------------------------------------------------------
// Timer
//
wire        tm_out0;                // output of timer0: use it as clock for timer1
wire        tm_out1;                // output of timer1: interrupt
wire        tm_out2;                // output of timer2: interrupt
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

// Clock and timer interrupts
always @(posedge clk) begin
    if (tm_out1)
        clock_int <= '1;            // CT interrupt flag
    if (tm_out2)
        timer_int <= '1;            // CTT interrupt flag
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
    (YDEV == 3 & !WRY) ? vaddr :                // RADRR, регистр исполнительного адреса (чтение)
    (YDEV == 4 & !WRY) ? pg_map[vaddr[19:10]] : // PSMEM, память приписок (CS);
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
     8: vaddr    <= Y[31:0];    // ADRREG, регистр исполнительного адреса (запись)
   /*9: pshift   <= Y[10:0];*/  // PSHIFT, регистр параметра сдвига (только запись)
    endcase

// Запись в источники или приемники шины Y.
always @(posedge clk)
    if (WRY)
        case (YDEV)
         4: begin                   // PSMEM, память приписок (CS)
                pg_map[vaddr[19:10]] <= Y[19:0];
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
    bus_DA, bus_oDA,                // A data bus
    bus_DB, bus_oDB,                // B data bus
    bus_DX, bus_oDX,                // X data bus
    ARA, BRA,             bus_ARX,  // address inputs
    ECA, ECB, bus_ECBTAG, bus_ECX,  // port enable
    WRA, WRB,             bus_WRX,  // write enable
    bus_iword,                      // fetch result: instruction word
    bus_itag,                       // fetch result: tag
    bus_dtag                        // load result: tag
);

//--------------------------------------------------------------
// Arbiter
//
arbiter arb(clk, reset,
    arb_req,                        // input request strobe
    arb_req ? ARBI : arb_opc,       // input opcode
    bus_ARX, bus_ECX, bus_WRX,      // X bus control
    o_astb, o_atomic, o_rd, o_wr,   // external memory interface
    arb_rdy                         // resulting status
);
assign arb_req = (YDEV == 2);       // PHYSAD, request to external bus

always @(posedge clk)
    if (arb_req)
        arb_opc <= ARBI;            // PHYSAD, set from microinstruction
    else if (YDST == 5)
        arb_opc <= Y[3:0];          // ARBOPC, set from Y data bus

//--------------------------------------------------------------
// Instruction decoder
//
logic instr_ext;                // extended opcode flag
logic [19:0] addr;
wire uflag = LETC & cb;         // признак изменения адресом (ПИА)

decoder dec(
    bus_iword,                  // instruction word
    mode_besm6,                 // besm6 compatibility (РЭ)
    tkk,                        // right half flag (ТКК)
    instr_reg,                  // modifier index
    instr_code,                 // instruction code (КОП)
    instr_ext,                  // extended opcode flag
    instr_ir15,                 // stack mode flag
    addr                        // address
);
assign instr_addr = {{12{addr[19]}}, addr};

const logic [11:0] optab[4096] = '{
    `include "../microcode/optab.v"
    default: '0
};
assign jump_addr = optab[{instr_ext, mode_besm6, instr_ir15, uflag, instr_code}];

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
    o_wforce,       // РР.18 - блокировка проверки тега при записи (БПТЗ)
    no_intr,        // РР.17 - блокировка внешних прерываний (БВП)
    no_progtag,     // РР.16 - блокировка программной интерпретации тега (БПИНТ)
    no_badacc,      // РР.15 - блокировка реакции на чужой сумматор (БЧС)
    no_rtag,        // РР.14 - блокировка проверки тега при чтении операнда (БПТЧ)
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
    if (YDST == 3) begin            // CNT, регистр режимов и триггеры признаков
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
        o_wforce     <= Y[18];
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
// Tags
//
logic tag_fetch;                    // instruction tag update
logic tag_load;                     // data tag update

always @(posedge clk) begin
    // RG1 updated: fetch complete
    tag_fetch <= !reset & bus_WRX & (bus_ARX == 'b01);

    // RG2 updated: load complete
    tag_load <= !reset & bus_WRX & (bus_ARX == 'b10);
end

// Режим эмуляции БЭСМ-6 (РЭ)
always @(posedge clk)
    if (reset)
        mode_besm6 <= 0;            // изначально РЭ=0
    else if (tag_fetch)
        mode_besm6 <= bus_itag[1];  // берем из тега командного слова
    else if (! IOMP)
        case (FFCNT)
        20: mode_besm6 <= '0;       // SETNR, установка НР
        22: mode_besm6 <= '1;       // SETER, установка РЭ
        endcase

// Тег сумматора
always @(posedge clk)
    if (YDEV == 1 & WRB)
        acc_besm6 <= bus_DB[65];    // бит РЭ тега регистра RG3

// Остальные биты тега командного слова
assign itag_cmd     = bus_itag[0]; // ПК - признак команд
assign itag_besm6   = bus_itag[1]; // режим совместимости команды
assign itag_nofetch = bus_itag[4]; // ЗВП - запрет выборки команды из памяти
assign itag_nojump  = bus_itag[5]; // ЗПУ - запрет передачи управления на команду
assign itag_pint    = bus_itag[7]; // ПИНТ - программная интерпретация тега

// Биты тега операнда, извлечённого из памяти
assign dtag_besm6   = bus_dtag[1]; // режим совместимости операнда
assign dtag_noload  = bus_dtag[2]; // ЗЧП - запрет чтения операнда из памяти
assign dtag_nostore = bus_dtag[3]; // ЗЗП - запрет записи операнда в память
assign dtag_pint    = bus_dtag[7]; // ПИНТ - программная интерпретация тега

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
    16: clock_int <= '0;    // CLRCT, сброс прерывания от часов счетного времени
    17: timer_int <= '0;    // CLRCTT, сброс прерывания от таймера счетного времени
    18: tkk <= '0;          // CLRTKK, сброс триггера коммутации команд - ТКК (ППК стандартизатора)
    19: tkk <= '1;          // SЕТТКК, установка ТКК
    20: /*mode_besm6 <= 0*/; // SETNR, установка НР
    21: pg_fcnt <= pg_index; // STRTLD, запуск загрузки памяти БМСП единицами
    22: /*mode_besm6 <= 1*/; // SETER, установка РЭ
    23: tkk <= ~tkk;        // СНТКК, переброс ТКК (работает в счетном режиме!)
    24: /*halt <= '1*/;     // SETHLT, установка триггера "Останов" (Halt)
    25: g_int <= '0;        // CLRINT, сброс прерываний (кроме прерываний от таймеров)
    26: /*run <= '0*/;      // CLRRUN, сброс триггера "Пуск"
    27: rx_busy <= '0;      // RDMPCP, установка признака "память обмена ПП -> ЦП прочитана"
    28: rx_busy <= '1;      // LDMPCP, установка признака "в памяти обмена ПП -> ЦП есть информация"
    29: tx_busy <= '1;      // LDCPMP, установка признака "в памяти обмена ЦП -> ПП есть информация"
    30: prg_int <= '1;      // PRGINT, установка программного прерывания с номером 31
    31: ext_int <= '1;      // EXTINT, установка внешнего прерывания на магистраль
    endcase

// Триггер "Останов"
always @(posedge clk)
    if (reset)
        halt <= '0;
    else if (!IOMP && FFCNT == 24)  // ffcnt=SETHLT
        halt <= '1;                 // установка триггера "Останов" (Halt)

// Триггер "Пуск"
always @(posedge clk)
    if (reset)
        run <= '1;
    else if (!IOMP && FFCNT == 26)  // ffcnt=CLRRUN
        run <= '0;                  // сброс триггера "Пуск"

// Признак изменения адресом (ПИА) устанавливается и сбрасывается разными путями
always @(posedge clk)
    if (DDEV == 3)                  // ddev=CLRCD
        cb <= '0;                   // сброс ПИА, дополнительный сигнал
    else if (!IOMP & FFCNT == 5)    // ffcnt=SЕТС
        cb <= '1;                   // установка триггера ПИА

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
        pg_fill <= '0;
    else if (!IOMP && FFCNT == 21)  // ffcnt=STRTLD
        pg_fill <= '1;              // запуск загрузки памяти БМСП единицами
    else if (pg_fill) begin         // заполнение памяти БМСП единицами
        pg_reprio[pg_fcnt] <= 1;
        if (pg_fcnt[9:0] == 1023)
            pg_fill <= '0;
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

// Virtual page index
wire [9:0] pg_virt =
    mode_besm6 ? vaddr[14:10] : // 15 bits in besm6 mode
                 vaddr[19:10];  // 20 bits in normal mode

// Translate virtual page into physical page index
wire [9:0] pg_translated =
    no_paging ? pg_virt
              : pg_map[pg_virt][19:10];

// Translate virtual address into physical address.
assign physad = {pg_translated, vaddr[9:0]};

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

//TODO: rewrite pg_dirty, pg_changed and pg_used as single always block

//--------------------------------------------------------------
// RWIO table
//
const logic [11:0] rwiotab[2048] = '{
    `include "../microcode/rwiotab.v"
    default: '0
};

always @(posedge clk)
    rwio_addr <= rwiotab[{tr1, tr0, instr_addr[13:10], instr_addr[4:0]}];

//--------------------------------------------------------------
// Group table
//
const logic [11:0] grouptab[32] = '{
    `include "../microcode/grouptab.v"
    default: '0
};

assign grp_addr = grouptab[{tr1, tr0, grp}];

//--------------------------------------------------------------
// Interrupt table
//
logic [11:0] intrtab[32] = '{
    `include "../microcode/intrtab.v"
    default: '0
};

// Jump address for current interrupt vector
assign intr_addr = intrtab[int_vect];

// Flag to take interrupt immediately
assign int_flag = (g_int & ISE & !no_intr);

// On interrupt, jump to address 001
assign opaddr =
    int_flag ? 'h001                // Interrupt
             : control_Y;           // Regular execution

// Set interrupt flag and vector
always @(posedge clk) begin
    // Этих прерываний не бывает:
    // 0 - отсутствующий блок памяти
    // 1 - многократная ошибка
    // 2 - "time out" при обращении к памяти
    // 3 - "time out" при обращении к шине
    // 5 - резерв

    // 9 - программная интерпретация тега команды
    if (tag_fetch & itag_pint & !no_progtag) begin
        g_int <= '1;                // ПИНТ (при БПИНТ=0) при выборке команды
        int_vect <= 9;
    end

    // 10 - программная интерпретация тега операнда
    else if (tag_load & dtag_pint & !no_progtag) begin
        g_int <= '1;                // ПИНТ (при БПИНТ=0) при чтении из памяти
        int_vect <= 10;
    end

    // 11 - защита адреса при чтении
    else if (tag_load & dtag_noload & !no_rtag) begin
        g_int <= '1;                // ЗЧП (при БПТЧ=0) при чтении из памяти
        int_vect <= 11;
    end

    // 12 - контроль команды
    else if (tag_fetch & !itag_cmd) begin
        g_int <= '1;                // ПК при выборке команды
        int_vect <= 12;
    end

    // 18 - защита выборки команды
    else if (tag_fetch & itag_nofetch) begin
        g_int <= '1;                // ЗВП при выборке команды
        int_vect <= 18;
    end

    // 19 - защита передачи управления
    else if (tag_fetch & itag_nojump & flag_jump) begin
        g_int <= '1;                // ЗПУ и ППУ при выборке команды
        int_vect <= 19;
    end

    // 20 - защита адреса при записи
    else if (o_wr & i_tag[3] & !o_wforce) begin
        g_int <= '1;                // ЗЗП (при БПТЗ=0) при записи в память
        int_vect <= 20;
    end

    // 21 - чужой сумматор
    else if (tag_fetch & (itag_besm6 != acc_besm6) & !no_badacc) begin
        g_int <= '1;                // несовпадение РЭ с тегом сумматора (при БЧС=0)
        int_vect <= 21;
    end

    // 22 - чужой операнд
    else if (tag_load & (dtag_besm6 != acc_besm6) & !no_badop) begin
        g_int <= '1;                // несовпадение РЭ с тегом операнда (при БЧОП=0)
        int_vect <= 22;
    end

    //TODO: interrupts
    // 4 - программное прерывание
    // 6 - отсутствующий адрес памяти в новом режиме
    // 7 - отрицательный номер страницы у команды
    // 8 - отрицательный номер страницы у операнда
    // 13 - математический адрес равен 0
    // 14 - чужой регистр приписки при чтении/записи операнда
    // 15 - чужой регистр приписки при выборке команд
    // 16 - защита страницы при обращении
    // 17 - защита страницы при записи
    // 23 - запрос модификации приоритетов страниц
    // 24 - останов при совпадении адресов по запросу ПП
    // 25 - “time-out” при блокировке внешних прерываний
    // 26 - внешние прерывания
    // 27 - останов (halt)
    // 28 - шаговое прерывание
    // 29 - обращение блока связи ПП на чтение/запись регистров
    // 30 - аппаратная часть часов счетного времени равна 0
    // 31 - аппаратная часть таймера счетного времени равна 0
end

endmodule
