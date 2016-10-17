module cpu(
    input               clk,    // Clock
    input               reset   // Global reset
    //TODO
);

// Internal registers
logic  [5:0] MODGN;             // РНГ: регистр номера группы памяти модификаторов
logic  [7:0] PROCN;             // РНП: регистр номера процесса
logic [31:0] CNT;               // регистр режимов и триггеры признаков
logic  [9:0] PHYSPG;            // РФС: регистр физической страницы
logic  [3:0] ARBOPC;            // код операции арбитра
logic [31:0] ADRREG;            // регистр исполнительного адреса (запись)
logic  [6:0] PSHIFT;            // регистр параметра сдвига (только запись)
logic        CCLR;              // запуск сброса кэша

//TODO:
logic  [7:0] OPC;               // код операции команды
logic [31:0] COMA;              // адресная часть команды
logic [63:0] SHIFT;             // результат сдвига
logic  [6:0] LOS;               // результат поиска левой единицы
logic [11:0] BADDR;             // ПНА КОП основного или дополнительного формата
logic [11:0] GRADDR;            // ПНА групп

// Instruction fields
logic  [3:0] SQI;
logic [11:0] A;
logic  [1:0] MAP;
logic  [2:0] ALUD;
logic  [2:0] FUNC;
logic  [2:0] ALUS;
logic  [3:0] RB;
logic  [3:0] RA;
logic  [1:0] CI;
logic  [3:0] SHMUX;
logic  [5:0] STOPC;
logic  [6:0] PSHF;
logic  [1:0] MNSA;
logic  [4:0] MODNM;
logic  [3:0] DSRC;
logic  [3:0] YDST;
logic  [1:0] SHF;
logic  [3:0] ARBI;
logic  [2:0] CYSTR;
logic  [1:0] BRA;
logic  [1:0] ARA;
logic  [2:0] YDEV;
logic  [2:0] DDEV;
logic  [4:0] FFCNT;
logic  [3:0] MPADR;
logic  [4:0] COND;
logic        ALU, H, MOD, RLD, LETC, SCI, ICI, ICC, ISE, CEM, CEN,
             CSM, WEM, ECB, WRB, ECA, WRA, WRY, WRD, IOMP, MPS;

// Signals for ALU
logic  [8:0] alu_I;             // ALU instruction, from ALUD, FUNC and ALUS
logic  [3:0] alu_A;             // A register address, from RA
logic  [3:0] alu_B;             // B register address, from RB
logic [63:0] alu_D;             // D bus input
logic        alu_C0;            // Carry input
logic        alu_mode32;        // 32-bit mode flag, from H

logic [63:0] alu_Y;             // Y bus output from ALU

// Signals for status/shift unit
logic [12:0] ss_I;              // Status/Shift instruction, from SHMUX and STOPC
logic        ss_nCEM;           // Machine status register enable, from CEM
logic        ss_nCEN;           // Micro status register enable, from CEN

logic  [3:0] ss_Y;              // Y bus output from Status/Shift
logic        ss_CT;             // Conditional test output
logic        ss_CO;             // Carry multiplexer output

// Global data bus Y
logic [63:0] Y;

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
//    поизведения (VE). (сигнал /PE не используется).
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

// Input signals
logic  [3:0] control_I;         // Four-bit instruction
logic        control_nCC;       // Conditional Code Bit
logic        control_nRLD;      // Unconditional load bit for register/counter
logic        control_CI;        // Carry-in bit for microprogram counter
logic [11:0] control_D;         // 12-bit data input to chip

// Output signals
logic [11:0] control_Y;         // 12-bit address output
logic        control_nVE;       // Vector output enable
logic        control_nME;       // Mapping PROM output enable
logic        control_nFULL;     // Stack full flag

am2910 control(clk,
    control_I, '0, control_nCC, control_nRLD, control_CI, '0,
    control_D, control_Y, , control_nVE, control_nME, control_nFULL);

assign control_I    = SQI;      // Four-bit instruction
assign control_nRLD = RLD;      // Unconditional load bit for register/counter

// Carry-in bit for microprogram counter
assign control_CI = ss_CT;
//TODO:
//assign control_CI = SCI ? 1 :
//                    irq ? 0 :
//                    ICI ? ~cond_mux : cond_mux;

// 12-bit data input
assign control_D =
    (MAP == 0) ? A :            // PE, конвейерный регистр
    (MAP == 1) ? BADDR :        // ME, ПНА КОП основного или дополнительного формата
    (MAP == 2) ? GRADDR :       // GRP, ПНА групп и микропрограммные признаки "След0" И "След1"
                 '0;            // вход D не используется

//TODO:
//assign control_D = !control_nME & MOD ? pna_mod :
//                   !control_nVE       ? pna_irq : x;

// Выбор условия, подлежащего проверке.
always_comb case (COND)
      0: control_nCC = 0;       // YES, "да"
      1: control_nCC = 1;       // NORMB, блокировка нормализации (БНОР)
      2: control_nCC = 1;       // RNDB, блокировка округления (БОКР)
      3: control_nCC = 1;       // OVRIB, блокировка прерывания по переполнению (БПП)
      4: control_nCC = 1;       // BNB, блокировка выхода числа за диапазон БЭСМ-6 (ББЧ)
      5: control_nCC = 1;       // OVRFTB, блокировка проверки переполнения поля упрятывания (БППУ)
      6: control_nCC = 1;       // DRG, режим диспетчера
      7: control_nCC = 1;       // EMLRG, режим эмуляции
      8: control_nCC = 1;       // RCB, ППК
      9: control_nCC = 1;       // CB, ПИА
     10: control_nCC = 1;       // CEMLRG, РЭС, 20-й разряд PP (резерв)
     11: control_nCC = ss_CT;   // CT, сигнал CT CYCC
     12: control_nCC = 1;       // TR1, След1
     13: control_nCC = 1;       // INTSTP, ПОП
     14: control_nCC = 1;       // IR15, ИР15
     15: control_nCC = 1;       // TKKB, TKK
     16: control_nCC = 1;       // RUN, "пуск" от ПП
     17: control_nCC = 1;       // NMLRDY, отсутствие готовности умножителя
     19: control_nCC = 1;       // INT, признак наличия прерываний
     20: control_nCC = 1;       // FULMEM, ОЗУ БМСП единицами заполнено
     21: control_nCC = 1;       // ARBRDY, готовность арбитра
     22: control_nCC = 1;       // TR0, След0
     23: control_nCC = 1;       // CPMP, ОЗУ обмена "ЦП -> ПП" свободно
default: control_nCC = 1;
endcase

//--------------------------------------------------------------
// Microinstruction ROM.
//
logic [111:0] memory[4096] = '{
    `include "../microcode/microcode.v"
    default: '0
};
logic [112:1] opcode;           // 112-bit registered opcode

always @(posedge clk)
    if (reset)
        opcode <= '0;           // Reset state
    else
        opcode <= memory[control_Y];

//
// Microinstruction fields.
//
assign SQI   = opcode[112:109]; // Код операции селектора адреса микропрограмм СУАМ
assign A     = opcode[108:97];  // Адрес следующей микрокоманды или адрес ПЗУ констант
assign MAP   = opcode[96:95];   // Выбор источника адреса, поступающего на вход D СУАМ
assign ALU   = opcode[94];      // Разрешение выдачи информации из МПС на шину Y
assign ALUD  = opcode[93:91];   // Управление приемниками результата АЛУ
assign FUNC  = opcode[90:88];   // Код операции АЛУ МПС
assign ALUS  = opcode[87:85];   // Управление источниками операндов на входы АЛУ
assign H     = opcode[84];      // Управление разрядностью АЛУ
assign RB    = opcode[83:80];   // Адрес регистра канала B МПС
assign RA    = opcode[79:76];   // Адрес регистра канала A МПС
assign CI    = opcode[75:74];   // Управление переносом C0 АЛУ МПС, разряды I12-I11
assign SHMUX = opcode[73:70];   // Сдвиг в МПС, разряды I9-I6 КОП СУСС
assign STOPC = opcode[69:64];   // Разряды I5-I0 КОП СУСС
assign MOD   = opcode[63];      // Привилегированный режим обращения к специальным регистрам
assign PSHF  = opcode[62:56];   // Параметр сдвига сдвигателя
assign MNSA  = opcode[62:61];   // Адрес источника номера модификатора
assign MODNM = opcode[60:56];   // Номер модификатора в группе регистров
assign DSRC  = opcode[55:52];   // Управление источниками информации на шину D
assign YDST  = opcode[51:48];   // Управление приемниками информации с шины Y ЦП
assign SHF   = opcode[47:46];   // Код операции сдвигателя
assign ARBI  = opcode[45:42];   // Код операции арбитра общей шины
assign RLD   = opcode[41];      // Загрузка регистра селектора адреса СУАМ и ШФ шин Y ЦП и D СУАМ
assign LETC  = opcode[40];      // Прохождением признака ПИА на вход ПНА команд
assign CYSTR = opcode[39:37];   // Длительность тактового импульса
assign SCI   = opcode[36];      // Передача условия на вход инкрементора
assign ICI   = opcode[35];      // Инверсия условия на вход инкрементора (CI) СУАМ
assign ICC   = opcode[34];      // Инверсия условий, выбираемых полем COND
assign ISE   = opcode[33];      // Разрешение внешних и внутренних прерываний
assign CEM   = opcode[32];      // Разрешение записи в машинный регистр состояния M CYCC
assign CEN   = opcode[31];      // Разрешение записи в микромашинный регистр состояния N CYCC
assign CSM   = opcode[30];      // Управление обращением к ОЗУ модификаторов
assign WEM   = opcode[29];      // Разрешение записи в ОЗУ модификаторов
assign ECB   = opcode[28];      // Выбор канал а B БОИ данных
assign WRB   = opcode[27];      // Запись по каналу B в БОИ данных и БОИ тега
assign BRA   = opcode[26:25];   // Адрес регистра канала B БОИ даннных и БОИ тега
assign ECA   = opcode[24];      // Выбор канала A БОИ данных
assign WRA   = opcode[23];      // Запись по каналу A в БОИ данных.
assign ARA   = opcode[22:21];   // Адрес регистра канала A БОИ даннных
assign YDEV  = opcode[20:18];   // Выбор источника или приемника информации с шины Y
assign WRY   = opcode[17];      // Запись в источники или приемники шины Y
assign DDEV  = opcode[16:14];   // Выбор источника или приемника информации с шины D
assign WRD   = opcode[13];      // Управление записью в источники или приемники шины D
assign IOMP  = opcode[12];      // Выбор дешифратора триггеров признаков или часов и таймера
assign FFCNT = opcode[11:7];    // Установка/сброс триггеров признаков
assign MPADR = opcode[10:7];    // Адрес регистра в блоке обмена с ПП
assign COND  = opcode[6:2];     // Выбор условия, подлежащего проверке
assign MPS   = opcode[1];       // Выбор источника параметра сдвига

//--------------------------------------------------------------
// Constant ROM.
//
logic [63:0] const_ROM[512] = '{
    `include "../microcode/constants.v"
    default: '0
};
logic [63:0] PROM;              // ПЗУ констант

assign PROM = const_ROM[control_Y[8:0]];

//--------------------------------------------------------------
// Datapath: register file, ALU and status/shifts
//

datapath alu(clk,
    alu_I, alu_A, alu_B, alu_D, alu_C0, alu_mode32, alu_Y,
    ss_I, ss_nCEM, ss_nCEN, ss_Y, ss_CT, ss_CO);

assign alu_I = {ALUD, FUNC, ALUS};
assign alu_A = RA;
assign alu_B = RB;
assign alu_mode32 = H;
assign alu_C0 = ss_CO;

// Управление источниками информации на шину D.
assign alu_D =
    (DSRC == 1)  ? {MODGN, 6'd0} : // регистр номера группы ОЗУ модификаторов
    (DSRC == 2)  ? PROCN :      // регистр номера процесса
    (DSRC == 3)  ? CNT :        // регистр режимов и триггеры признаков
    (DSRC == 4)  ? {PHYSPG, 11'd0} : // регистр физической страницы
    (DSRC == 5)  ? ARBOPC :     // регистр КОП арбитра
    (DSRC == 8)  ? COMA :       // адресная часть команды
    (DSRC == 9)  ? SHIFT :      // результат сдвига
    (DSRC == 10) ? OPC :        // код операции команды
    (DSRC == 11) ? LOS :        // результат поиска левой единицы
    (DSRC == 12) ? PROM :       // ПЗУ констант
                   '0;          // шина D не используется

assign Y = ALU ? alu_Y : '0;    // Y bus output from ALU

// Управление приемниками информации с шины Y ЦП.
always @(posedge clk)
    case (YDST)
     1: MODGN  <= Y[11:6];      // регистр номера группы памяти модификаторов
     2: PROCN  <= Y[7:0];       // регистр номера процесса
     3: CNT    <= Y[31:0];      // регистр режимов и триггеры признаков
     4: PHYSPG <= Y[20:11];     // регистр физической страницы
     5: ARBOPC <= Y[3:0];       // код операции арбитра
     8: ADRREG <= Y[31:0];      // регистр исполнительного адреса (запись)
     9: PSHIFT <= Y[6:0];       // регистр параметра сдвига (только запись)
    endcase
assign CCLR = (YDST == 10);     // запуск сброса кэша

assign ss_I = {CI, alu_I[7], SHMUX, STOPC};
assign ss_nCEM = !CEM;
assign ss_nCEN = !CEN;

//TODO: ss_Y;                   // Y bus output from Status/Shift

//--------------------------------------------------------------
`ifdef notdef
extbus boi(
    input        [71:0] DA,     // A data bus input...
    output logic [71:0] oDA,    // ...and output
    input        [71:0] DB,     // B data bus input...
    output logic [71:0] oDB,    // ...and output
    input        [71:0] DC,     // C data bus input...
    output logic [71:0] oDC,    // ...and output
    input        [71:0] DX,     // X data bus input...
    output logic [71:0] oDX,    // ...and output

    input         [1:0] AA,     // A address input
    input         [1:0] AB,     // B address input
    input         [1:0] AC,     // C address input
    input         [1:0] AX,     // X address input

    input               ECA,    // A port enable
    input               ECB,    // B port enable
    input               ECC,    // C port enable
    input               ECX,    // X port enable

    input               WA,     // A write enable
    input               WB,     // B write enable
    input               WC,     // C write enable
    input               WX      // X write enable
);

arbiter arb(
    //TODO
);
`endif

endmodule
