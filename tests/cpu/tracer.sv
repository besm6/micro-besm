`default_nettype none

//
// Trace monitor.
//
module tracer();

timeunit 1ns / 10ps;

//
// Global clock and reset
//
logic clk, reset;
assign clk   = cpu.clk;
assign reset = cpu.reset;

//
// Descriptor of output trace file
//
int fd;
assign fd = testbench.tracefd;

//
// Last fetch address
//
logic [11:0] pc_f;                      // PC at fetch stage
logic [11:0] pc_x;                      // PC at execute stage
logic [112:1] opcode_x;                 // Opcode at execute stage

// Current time
time ctime;

initial begin
    static bit old_reset = 0;
    static logic [63:0] const_value;    // Constant value
    static logic [8:0] const_addr;      // Constant address

    // Wait until trace file opened
    wait(fd);

    forever begin
        // Wait for instruction, valid on leading edge of clk
        wait(clk);

        // Get time
        ctime = $time;
        pc_f = cpu.control_Y;

        // Wait until everything is stable
        wait(!clk);

        if (reset) begin
            if (!old_reset) begin               // Reset
                $fdisplay(fd, "(%0d) *** Reset", ctime);
                old_reset = 1;
            end
        end else begin
            if (old_reset) begin                // Clear reset
                $fdisplay(fd, "(%0d) *** Clear reset", ctime);
                old_reset = 0;
            end
            if ($isunknown(cpu.opcode)) begin
                $fdisplay(fd, "(%0d) *** Unknown state: cpu.opcode=%h", ctime, cpu.opcode);
                $display("\n----- Fatal Error! -----");
                $fdisplay(fd, "\n----- Fatal Error! -----");
                $finish(1);
            end
        end

        if (testbench.trace > 1 /*&& !$isunknown(pc_x)*/) begin
            // Print last executed micro-instruction
            if (!reset)
                print_uop(pc_x, opcode_x, const_addr, const_value);

            // Print changed state
            print_changed_2901();
            print_changed_2904();
            print_changed_2910();
            print_changed_cpu(opcode_x);
        end

        // Print memory transactions
        if (!testbench.o_astb && testbench.o_wr)
            $fdisplay(fd, "(%0d)               Memory Store [%h] = %h:%h",
                ctime, testbench.waddr, testbench.o_tag, testbench.o_ad);
        else if (!testbench.o_astb && testbench.o_rd)
            $fdisplay(fd, "(%0d)               Memory Load [%h] = %h:%h",
                ctime, testbench.waddr, testbench.i_tag, testbench.i_data);

        //TODO: print_insn();               // Print instruction

        if (testbench.trace > 1 && !reset) begin
            // Print changed busio state _last_,
            // as it actually comes from the _next_ microinstruction.
            print_changed_bb1();
        end

        // Get data from fetch stage
        pc_x = pc_f;
        opcode_x = cpu.opcode;
        const_value = cpu.PROM;
        const_addr = cpu.A[8:0];
    end
end

//
// Print micro-instruction.
//
task print_uop(
    input logic [11:0] pc,
    input logic [112:1] opcode,
    input logic [8:0] const_addr,
    input logic [63:0] const_value
);
    static string sqi_name[16] = '{
        0: "jz  ", 1: "cjs ",  2: "jmap", 3: "cjp ",
        4: "push", 5: "jsrp",  6: "cjv ", 7: "jrp ",
        8: "rfct", 9: "rpct",  10:"crtn", 11:"cjpp",
        12:"ldct", 13:"loop",  14:"cont", 15:"twb "
    };
    static string map_name[4] = '{
        0: "PE",    1: "ME",    2: "GRP",   3: "-"
    };
    static string alud_name[8] = '{
        0: "Q",     1: "-",     2: "BA",    3: "B",
        4: "RSBQ",  5: "RSB",   6: "LSBQ",  7: "LSB"
    };
    static string func_name[8] = '{
        0: "-",     1: "SUBR",  2: "SUBS",  3: "OR",
        4: "AND",   5: "NOTRS", 6: "EXOR",  7: "EXNOR"
    };
    static string alus_name[8] = '{
        0: "-",     1: "AB",    2: "ZQ",    3: "ZB",
        4: "ZA",    5: "DA",    6: "DQ",    7: "DZ"
    };
    static string rb_name[16] = '{
        0: "A",     1: "Y",     2: "INTR",  3: "PC",
        4: "PCCP",  5: "DADR",  6: "HALF",  7: "BYTE",
        8: "EXPN",  9: "MANT",  10: "-",    11: "WR5",
        12: "WR4",  13: "WR3",  14: "WR2",  15: "WR1"
    };
    static string ra_name[16] = '{
        0: "-",     1: "Y",     2: "INTR",  3: "PC",
        4: "PCCP",  5: "DADR",  6: "HALF",  7: "BYTE",
        8: "EXPN",  9: "MANT",  10: "WR6",  11: "WR5",
        12: "WR4",  13: "WR3",  14: "WR2",  15: "WR1"
    };
    static string ci_name[4] = '{
        0: "-",     1: "CI1",   2: "CIX",   3: "CIC"
    };
    static string shmux_name[16] = '{
        0: "-",     1: "NSNSL", 2: "ASLLS", 3: "NDNS",
        4: "CDLDL", 5: "ADNDL", 6: "LDLD",  7: "LDLND",
        8: "RSLRSL",9: "RSSRSS",10: "RSRS", 11: "IDCS",
        12:"RDSRDS",13:"RDLRDL",14: "VDCD", 15: "RDRD"
    };
    static string stopc_name[64] = '{
        0: "YTOM",  1: "SETM",  2: "MCN",   3: "CLRN",
                    5: "INVM",              7: "OPC7",
        8: "CLRNZ", 9: "SETNZ", 10:"CLRNC", 11:"SETNC",
        12:"CLRNN", 13:"SETNN", 14:"CLRNV", 15:"SETNV",
                                18:"OPC18", 19:"OPC19",
        20:"-",     21:"/NZ",   22:"NV",    23:"/NV",
                                26:"NC",    27:"/NC",
                                30:"NN",    31:"/NN",
        32:"OPC32", 33:"OPC33", 34:"OPC34",
        36:"MZ",    37:"/MZ",   38:"MV",    39:"/MV",
                                42:"MC",    43:"/MC",
                                46:"MN",    47:"/MN",
        52:"IZ",    53:"/IZ",   54:"IV",    55:"/IV",
                                58:"IC",    59:"/IC",
                                62:"IN",    63:"/IN",
        default: "???"
    };
    static string mnsa_name[4] = '{
        0: "U",     1: "IRA",   2: "-",     3: "MP"
    };
    static string modnm_name[32] = '{
        0: "-",     1: "PROCN", 2: "SVFA",  3: "PCCC",
        4: "PCC",   5: "YCR",   6: "YCL",   7: "ACR",
        8: "ACL",   9: "CTR",   10:"CTL",   11:"CTT",
        12:"SPRAD", 13:"RRR",   14:"RR",    15:"C",
        16:"SP",    17:"M14",   18:"M13",   19:"M12",
        20:"M11",   21:"M10",   22:"M9",    23:"M8",
        24:"M7",    25:"M6",    26:"M5",    27:"M4",
        28:"M3",    29:"M2",    30:"M1",    31:"M0"
    };
    static string dsrc_name[16] = '{
        0: "-",     1: "MODGN", 2: "PROCN", 3: "CNT",
        4: "PHYSPG",5: "ARBOPC",6: "MULRZ1",7: "MULRZ2",
        8: "COMA",  9: "SHIFT", 10: "OPC",  11: "LOS",
        12: "PROM",             14: "RT",   15: "WT",
        default: "???"
    };
    static string ydst_name[16] = '{
        0: "-",     1: "MODGN", 2: "PROCN", 3: "CNT",
        4: "PHYSPG",5: "ARBOPC",6: "MUL1",  7: "MUL2",
        8: "ADRREG",9: "PSHIFT",10:"CCLR",  11:"BTRCLR",
        default: "???"
    };
    static string shf_name[4] = '{
        0: "-",     1: "LOG",   2: "ARIPH", 3: "EMULF"
    };
    static string arbi_name[16] = '{
        0: "-",     1: "CCRD",  2: "CCWR",  3: "DCRD",
        4: "DCWR",
        8: "FETCH", 9: "DRD",   10:"DWR",   11:"RDMWR",
        12:"BTRWR", 13:"BTRRD", 14:"BICLR", 15:"BIRD",
        default: "???"
    };
    static string bra_name[4] = '{
        0: "RG0",   1: "RG1",   2: "RG2",   3: "-"
    };
    static string ydev_name[8] = '{
        0: "-",     1: "ECBTAG",2: "PHYSAD",3: "RADRR",
        4: "PSMEM", 5: "MPMEM", 6: "STOPM0",7: "STOPM1"
    };
    static string ddev_name[8] = '{
        0: "-",     1: "BB",    2: "MODB",  3: "CLRCD",
        4: "CTIME", 5: "STATUS",6: "PPMEM0",7: "PPMEM1"
    };
    static string ffcnt_name[32] = '{
        0: "-",     1: "LOGGRP",2: "MULGRP",3: "ADDGRP",
                    5: "SETC",  6: "CLRRCB",7: "SETRCB",
        8: "CLRJMP",9: "SETJMP",10:"SETEI", 11:"CLREI",
        12:"CLRTR0",13:"SETTR0",14:"CLRTR1",15:"SETTR1",
        16:"CLRCT", 17:"CLRCTT",18:"CLRTKK",19:"SETTKK",
        20:"SETNR", 21:"STRTLD",22:"SETER", 23:"CHTKK",
        24:"SETHLT",25:"CLRINT",26:"CLRRUN",27:"RDMPCP",
        28:"LDMPCP",29:"LDCPMP",30:"PRGINT",31:"EXTINT",
        default: "???"
    };
    static string mpadr_name[16] = '{
        0: "INFB1", 1: "INFB2", 2: "FCP",   3: "FMP",
        4: "ADRB1", 5: "ADRB2", 6: "ADRB3", 7: "ADRB4",
        8: "DATAB1",9: "DATAB2",10:"DATAB3",11:"DATAB4",
        12:"DATAB5",13:"DATAB6",14:"DATAB7",15:"DATAB8"
    };
    static string cond_name[32] = '{
        0: "-",     1: "NORMB", 2: "RNDB",  3: "OVRIB",
        4: "BNB",   5: "OVRFTB",6: "DRG",   7: "EMLRG",
        8: "RCB",   9: "CB",    10:"CEMLRG",11:"CT",
        12:"TR1",   13:"INTSTP",14:"IR15",  15:"TKKB",
        16:"RUN",   17:"NMLRDY",18:"18",    19:"INT",
        20:"FULMEM",21:"ARBRDY",22:"TR0",   23:"CPMP",
        24:"24",    25:"25",    26:"26",    27:"27",
        28:"28",    29:"29",    30:"30",    31:"31"
    };

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

    $fwrite(fd, "(%0d) %h: %4s", ctime, pc, sqi_name[SQI]);

    if (A != 0) $fwrite(fd, " %h", A);
    else        $fwrite(fd, "    ");

    if (MAP   != 3)  $fwrite(fd, " map=%0s", map_name[MAP]);
    if (ALU   != 0)  $fwrite(fd, " ALU");
    if (ALUD  != 1)  $fwrite(fd, " alud=%0s", alud_name[ALUD]);
    if (FUNC  != 0)  $fwrite(fd, " func=%0s", func_name[FUNC]);
    if (ALUS  != 0)  $fwrite(fd, " alus=%0s", alus_name[ALUS]);
    if (H     != 0)  $fwrite(fd, " H");
    if (RB    != 10) $fwrite(fd, " rb=%0s", rb_name[RB]);
    if (RA    != 0)  $fwrite(fd, " ra=%0s", ra_name[RA]);
    if (CI    != 0)  $fwrite(fd, " ci=%0s", ci_name[CI]);
    if (SHMUX != 0)  $fwrite(fd, " shmux=%0s", shmux_name[SHMUX]);
    if (STOPC != 20) $fwrite(fd, " stopc=%0s", stopc_name[STOPC]);
    if (MOD   != 0)  $fwrite(fd, " MOD");
    if (PSHF  != 64) $fwrite(fd, " pshf=%0d", int'(PSHF) - 64);
    if (MNSA  != 2)  $fwrite(fd, " mnsa=%0s", mnsa_name[MNSA]);
    if (MODNM != 0)  $fwrite(fd, " modnm=%0s", modnm_name[MODNM]);
    if (DSRC  != 0)  $fwrite(fd, " dsrc=%0s", dsrc_name[DSRC]);
    if (YDST  != 0)  $fwrite(fd, " ydst=%0s", ydst_name[YDST]);
    if (SHF   != 0)  $fwrite(fd, " shf=%0s", shf_name[SHF]);
    if (ARBI  != 0)  $fwrite(fd, " arbi=%0s", arbi_name[ARBI]);
    if (RLD   != 0)  $fwrite(fd, " RLD");
    if (LETC  != 0)  $fwrite(fd, " LETC");
    if (SCI   != 0)  $fwrite(fd, " SCI");
    if (ICI   != 0)  $fwrite(fd, " ICI");
    if (ICC   != 0)  $fwrite(fd, " ICC");
    if (ISE   != 0)  $fwrite(fd, " ISE");
    if (CEM   != 0)  $fwrite(fd, " CEM");
    if (CEN   != 0)  $fwrite(fd, " CEN");
    if (CSM   != 0)  $fwrite(fd, " CSM");
    if (WEM   != 0)  $fwrite(fd, " WEM");
    if (ECB   != 0)  $fwrite(fd, " ECB");
    if (WRB   != 0)  $fwrite(fd, " WRB");
    if (BRA   != 3)  $fwrite(fd, " bra=%0s", bra_name[BRA]);
    if (ECA   != 0)  $fwrite(fd, " ECA");
    if (WRA   != 0)  $fwrite(fd, " WRA");
    if (ARA   != 3)  $fwrite(fd, " ara=%0s", bra_name[ARA]);
    if (YDEV  != 0)  $fwrite(fd, " ydev=%0s", ydev_name[YDEV]);
    if (WRY   != 0)  $fwrite(fd, " WRY");
    if (DDEV  != 0)  $fwrite(fd, " ddev=%0s", ddev_name[DDEV]);
    if (WRD   != 0)  $fwrite(fd, " WRD");

    if (IOMP  != 0)  $fwrite(fd, " IOMP mpadr=%0s", mpadr_name[MPADR]);
    else
    if (FFCNT != 0)  $fwrite(fd, " ffcnt=%0s", ffcnt_name[FFCNT]);

    if (COND  != 0)  $fwrite(fd, " cond=%0s", cond_name[COND]);
    if (MPS   != 0)  $fwrite(fd, " MPS");
    $fdisplay(fd, "");

    // Print reads, if any
    if (DSRC == 12) begin
        // Чтение ПЗУ констант
        $fdisplay(fd, "(%0d)               Read Const[%0d] = %h",
            ctime, const_addr, const_value);
    end

    //
    // Some features not implemented yet
    //
    if (DSRC==8 || DSRC==9 || DSRC==10 || DSRC==11)
        $fdisplay(fd, "(%0d) *** dsrc=%0s not implemented yet!",
            ctime, dsrc_name[DSRC]);
    if (YDST == 9)
        $fdisplay(fd, "(%0d) *** ydst=%0s not implemented yet!",
            ctime, ydst_name[YDST]);
    if (FFCNT != 0 && !IOMP)
        $fdisplay(fd, "(%0d) *** ffcnt=%0s not implemented yet!",
            ctime, ffcnt_name[FFCNT]);
    if (WRD != 0)
        $fdisplay(fd, "(%0d) *** WRD not implemented yet!", ctime);
    if (DDEV != 0)
        $fdisplay(fd, "(%0d) *** ddev=%0s not implemented yet!",
            ctime, ddev_name[DDEV]);
    case (COND)
         16: $fdisplay(fd, "(%0d) *** cond=RUN not implemented yet!", ctime);
         17: $fdisplay(fd, "(%0d) *** cond=NMLRDY not implemented yet!", ctime);
         19: $fdisplay(fd, "(%0d) *** cond=INT not implemented yet!", ctime);
         20: $fdisplay(fd, "(%0d) *** cond=FULMEM not implemented yet!", ctime);
         23: $fdisplay(fd, "(%0d) *** cond=CPMP not implemented yet!", ctime);
    endcase
    case (YDEV)
        2: $fdisplay(fd, "(%0d) *** ydev=PHYSAD not implemented yet!", ctime);
    endcase
endtask

//
// Print changed state of Am2901 chip
//
task print_changed_2901();
    logic [63:0] r0, r1, r2, r3, r4, r5, r6, r7,
                 r8, r9, r10, r11, r12, r13, r14, r15, q;
    static logic [63:0] old_r0, old_r1, old_r2, old_r3, old_r4, old_r5, old_r6, old_r7,
                        old_r8, old_r9, old_r10, old_r11, old_r12, old_r13, old_r14,
                        old_r15, old_q;

    assign r0 = { cpu.alu.p63_60.ram[0], cpu.alu.p59_56.ram[0], cpu.alu.p55_52.ram[0], cpu.alu.p51_48.ram[0],
                  cpu.alu.p47_44.ram[0], cpu.alu.p43_40.ram[0], cpu.alu.p39_36.ram[0], cpu.alu.p35_32.ram[0],
                  cpu.alu.p31_28.ram[0], cpu.alu.p27_24.ram[0], cpu.alu.p23_20.ram[0], cpu.alu.p19_16.ram[0],
                  cpu.alu.p15_12.ram[0], cpu.alu.p11_8.ram[0],  cpu.alu.p7_4.ram[0],   cpu.alu.p3_0.ram[0] };
    assign r1 = { cpu.alu.p63_60.ram[1], cpu.alu.p59_56.ram[1], cpu.alu.p55_52.ram[1], cpu.alu.p51_48.ram[1],
                  cpu.alu.p47_44.ram[1], cpu.alu.p43_40.ram[1], cpu.alu.p39_36.ram[1], cpu.alu.p35_32.ram[1],
                  cpu.alu.p31_28.ram[1], cpu.alu.p27_24.ram[1], cpu.alu.p23_20.ram[1], cpu.alu.p19_16.ram[1],
                  cpu.alu.p15_12.ram[1], cpu.alu.p11_8.ram[1],  cpu.alu.p7_4.ram[1],   cpu.alu.p3_0.ram[1] };
    assign r2 = { cpu.alu.p63_60.ram[2], cpu.alu.p59_56.ram[2], cpu.alu.p55_52.ram[2], cpu.alu.p51_48.ram[2],
                  cpu.alu.p47_44.ram[2], cpu.alu.p43_40.ram[2], cpu.alu.p39_36.ram[2], cpu.alu.p35_32.ram[2],
                  cpu.alu.p31_28.ram[2], cpu.alu.p27_24.ram[2], cpu.alu.p23_20.ram[2], cpu.alu.p19_16.ram[2],
                  cpu.alu.p15_12.ram[2], cpu.alu.p11_8.ram[2],  cpu.alu.p7_4.ram[2],   cpu.alu.p3_0.ram[2] };
    assign r3 = { cpu.alu.p63_60.ram[3], cpu.alu.p59_56.ram[3], cpu.alu.p55_52.ram[3], cpu.alu.p51_48.ram[3],
                  cpu.alu.p47_44.ram[3], cpu.alu.p43_40.ram[3], cpu.alu.p39_36.ram[3], cpu.alu.p35_32.ram[3],
                  cpu.alu.p31_28.ram[3], cpu.alu.p27_24.ram[3], cpu.alu.p23_20.ram[3], cpu.alu.p19_16.ram[3],
                  cpu.alu.p15_12.ram[3], cpu.alu.p11_8.ram[3],  cpu.alu.p7_4.ram[3],   cpu.alu.p3_0.ram[3] };
    assign r4 = { cpu.alu.p63_60.ram[4], cpu.alu.p59_56.ram[4], cpu.alu.p55_52.ram[4], cpu.alu.p51_48.ram[4],
                  cpu.alu.p47_44.ram[4], cpu.alu.p43_40.ram[4], cpu.alu.p39_36.ram[4], cpu.alu.p35_32.ram[4],
                  cpu.alu.p31_28.ram[4], cpu.alu.p27_24.ram[4], cpu.alu.p23_20.ram[4], cpu.alu.p19_16.ram[4],
                  cpu.alu.p15_12.ram[4], cpu.alu.p11_8.ram[4],  cpu.alu.p7_4.ram[4],   cpu.alu.p3_0.ram[4] };
    assign r5 = { cpu.alu.p63_60.ram[5], cpu.alu.p59_56.ram[5], cpu.alu.p55_52.ram[5], cpu.alu.p51_48.ram[5],
                  cpu.alu.p47_44.ram[5], cpu.alu.p43_40.ram[5], cpu.alu.p39_36.ram[5], cpu.alu.p35_32.ram[5],
                  cpu.alu.p31_28.ram[5], cpu.alu.p27_24.ram[5], cpu.alu.p23_20.ram[5], cpu.alu.p19_16.ram[5],
                  cpu.alu.p15_12.ram[5], cpu.alu.p11_8.ram[5],  cpu.alu.p7_4.ram[5],   cpu.alu.p3_0.ram[5] };
    assign r6 = { cpu.alu.p63_60.ram[6], cpu.alu.p59_56.ram[6], cpu.alu.p55_52.ram[6], cpu.alu.p51_48.ram[6],
                  cpu.alu.p47_44.ram[6], cpu.alu.p43_40.ram[6], cpu.alu.p39_36.ram[6], cpu.alu.p35_32.ram[6],
                  cpu.alu.p31_28.ram[6], cpu.alu.p27_24.ram[6], cpu.alu.p23_20.ram[6], cpu.alu.p19_16.ram[6],
                  cpu.alu.p15_12.ram[6], cpu.alu.p11_8.ram[6],  cpu.alu.p7_4.ram[6],   cpu.alu.p3_0.ram[6] };
    assign r7 = { cpu.alu.p63_60.ram[7], cpu.alu.p59_56.ram[7], cpu.alu.p55_52.ram[7], cpu.alu.p51_48.ram[7],
                  cpu.alu.p47_44.ram[7], cpu.alu.p43_40.ram[7], cpu.alu.p39_36.ram[7], cpu.alu.p35_32.ram[7],
                  cpu.alu.p31_28.ram[7], cpu.alu.p27_24.ram[7], cpu.alu.p23_20.ram[7], cpu.alu.p19_16.ram[7],
                  cpu.alu.p15_12.ram[7], cpu.alu.p11_8.ram[7],  cpu.alu.p7_4.ram[7],   cpu.alu.p3_0.ram[7] };
    assign r8 = { cpu.alu.p63_60.ram[8], cpu.alu.p59_56.ram[8], cpu.alu.p55_52.ram[8], cpu.alu.p51_48.ram[8],
                  cpu.alu.p47_44.ram[8], cpu.alu.p43_40.ram[8], cpu.alu.p39_36.ram[8], cpu.alu.p35_32.ram[8],
                  cpu.alu.p31_28.ram[8], cpu.alu.p27_24.ram[8], cpu.alu.p23_20.ram[8], cpu.alu.p19_16.ram[8],
                  cpu.alu.p15_12.ram[8], cpu.alu.p11_8.ram[8],  cpu.alu.p7_4.ram[8],   cpu.alu.p3_0.ram[8] };
    assign r9 = { cpu.alu.p63_60.ram[9], cpu.alu.p59_56.ram[9], cpu.alu.p55_52.ram[9], cpu.alu.p51_48.ram[9],
                  cpu.alu.p47_44.ram[9], cpu.alu.p43_40.ram[9], cpu.alu.p39_36.ram[9], cpu.alu.p35_32.ram[9],
                  cpu.alu.p31_28.ram[9], cpu.alu.p27_24.ram[9], cpu.alu.p23_20.ram[9], cpu.alu.p19_16.ram[9],
                  cpu.alu.p15_12.ram[9], cpu.alu.p11_8.ram[9],  cpu.alu.p7_4.ram[9],   cpu.alu.p3_0.ram[9] };
    assign r10 = { cpu.alu.p63_60.ram[10], cpu.alu.p59_56.ram[10], cpu.alu.p55_52.ram[10], cpu.alu.p51_48.ram[10],
                   cpu.alu.p47_44.ram[10], cpu.alu.p43_40.ram[10], cpu.alu.p39_36.ram[10], cpu.alu.p35_32.ram[10],
                   cpu.alu.p31_28.ram[10], cpu.alu.p27_24.ram[10], cpu.alu.p23_20.ram[10], cpu.alu.p19_16.ram[10],
                   cpu.alu.p15_12.ram[10], cpu.alu.p11_8.ram[10],  cpu.alu.p7_4.ram[10],   cpu.alu.p3_0.ram[10] };
    assign r11 = { cpu.alu.p63_60.ram[11], cpu.alu.p59_56.ram[11], cpu.alu.p55_52.ram[11], cpu.alu.p51_48.ram[11],
                   cpu.alu.p47_44.ram[11], cpu.alu.p43_40.ram[11], cpu.alu.p39_36.ram[11], cpu.alu.p35_32.ram[11],
                   cpu.alu.p31_28.ram[11], cpu.alu.p27_24.ram[11], cpu.alu.p23_20.ram[11], cpu.alu.p19_16.ram[11],
                   cpu.alu.p15_12.ram[11], cpu.alu.p11_8.ram[11],  cpu.alu.p7_4.ram[11],   cpu.alu.p3_0.ram[11] };
    assign r12 = { cpu.alu.p63_60.ram[12], cpu.alu.p59_56.ram[12], cpu.alu.p55_52.ram[12], cpu.alu.p51_48.ram[12],
                   cpu.alu.p47_44.ram[12], cpu.alu.p43_40.ram[12], cpu.alu.p39_36.ram[12], cpu.alu.p35_32.ram[12],
                   cpu.alu.p31_28.ram[12], cpu.alu.p27_24.ram[12], cpu.alu.p23_20.ram[12], cpu.alu.p19_16.ram[12],
                   cpu.alu.p15_12.ram[12], cpu.alu.p11_8.ram[12],  cpu.alu.p7_4.ram[12],   cpu.alu.p3_0.ram[12] };
    assign r13 = { cpu.alu.p63_60.ram[13], cpu.alu.p59_56.ram[13], cpu.alu.p55_52.ram[13], cpu.alu.p51_48.ram[13],
                   cpu.alu.p47_44.ram[13], cpu.alu.p43_40.ram[13], cpu.alu.p39_36.ram[13], cpu.alu.p35_32.ram[13],
                   cpu.alu.p31_28.ram[13], cpu.alu.p27_24.ram[13], cpu.alu.p23_20.ram[13], cpu.alu.p19_16.ram[13],
                   cpu.alu.p15_12.ram[13], cpu.alu.p11_8.ram[13],  cpu.alu.p7_4.ram[13],   cpu.alu.p3_0.ram[13] };
    assign r14 = { cpu.alu.p63_60.ram[14], cpu.alu.p59_56.ram[14], cpu.alu.p55_52.ram[14], cpu.alu.p51_48.ram[14],
                   cpu.alu.p47_44.ram[14], cpu.alu.p43_40.ram[14], cpu.alu.p39_36.ram[14], cpu.alu.p35_32.ram[14],
                   cpu.alu.p31_28.ram[14], cpu.alu.p27_24.ram[14], cpu.alu.p23_20.ram[14], cpu.alu.p19_16.ram[14],
                   cpu.alu.p15_12.ram[14], cpu.alu.p11_8.ram[14],  cpu.alu.p7_4.ram[14],   cpu.alu.p3_0.ram[14] };
    assign r15 = { cpu.alu.p63_60.ram[15], cpu.alu.p59_56.ram[15], cpu.alu.p55_52.ram[15], cpu.alu.p51_48.ram[15],
                   cpu.alu.p47_44.ram[15], cpu.alu.p43_40.ram[15], cpu.alu.p39_36.ram[15], cpu.alu.p35_32.ram[15],
                   cpu.alu.p31_28.ram[15], cpu.alu.p27_24.ram[15], cpu.alu.p23_20.ram[15], cpu.alu.p19_16.ram[15],
                   cpu.alu.p15_12.ram[15], cpu.alu.p11_8.ram[15],  cpu.alu.p7_4.ram[15],   cpu.alu.p3_0.ram[15] };
    assign q = { cpu.alu.p63_60.q, cpu.alu.p59_56.q, cpu.alu.p55_52.q, cpu.alu.p51_48.q,
                 cpu.alu.p47_44.q, cpu.alu.p43_40.q, cpu.alu.p39_36.q, cpu.alu.p35_32.q,
                 cpu.alu.p31_28.q, cpu.alu.p27_24.q, cpu.alu.p23_20.q, cpu.alu.p19_16.q,
                 cpu.alu.p15_12.q, cpu.alu.p11_8.q,  cpu.alu.p7_4.q,   cpu.alu.p3_0.q };

    if (r0  !== old_r0)  begin $fdisplay(fd, "(%0d)               Write alu.A = %h",    ctime, r0);  old_r0  = r0;  end
    if (r1  !== old_r1)  begin $fdisplay(fd, "(%0d)               Write alu.Y = %h",    ctime, r1);  old_r1  = r1;  end
    if (r2  !== old_r2)  begin $fdisplay(fd, "(%0d)               Write alu.INTR = %h", ctime, r2);  old_r2  = r2;  end
    if (r3  !== old_r3)  begin $fdisplay(fd, "(%0d)               Write alu.PC = %h",   ctime, r3);  old_r3  = r3;  end
    if (r4  !== old_r4)  begin $fdisplay(fd, "(%0d)               Write alu.PCCP = %h", ctime, r4);  old_r4  = r4;  end
    if (r5  !== old_r5)  begin $fdisplay(fd, "(%0d)               Write alu.DADR = %h", ctime, r5);  old_r5  = r5;  end
    if (r6  !== old_r6)  begin $fdisplay(fd, "(%0d)               Write alu.HALF = %h", ctime, r6);  old_r6  = r6;  end
    if (r7  !== old_r7)  begin $fdisplay(fd, "(%0d)               Write alu.BYTE = %h", ctime, r7);  old_r7  = r7;  end
    if (r8  !== old_r8)  begin $fdisplay(fd, "(%0d)               Write alu.EXPN = %h", ctime, r8);  old_r8  = r8;  end
    if (r9  !== old_r9)  begin $fdisplay(fd, "(%0d)               Write alu.MANT = %h", ctime, r9);  old_r9  = r9;  end
    if (r10 !== old_r10) begin $fdisplay(fd, "(%0d)               Write alu.WR6 = %h",  ctime, r10); old_r10 = r10; end
    if (r11 !== old_r11) begin $fdisplay(fd, "(%0d)               Write alu.WR5 = %h",  ctime, r11); old_r11 = r11; end
    if (r12 !== old_r12) begin $fdisplay(fd, "(%0d)               Write alu.WR4 = %h",  ctime, r12); old_r12 = r12; end
    if (r13 !== old_r13) begin $fdisplay(fd, "(%0d)               Write alu.WR3 = %h",  ctime, r13); old_r13 = r13; end
    if (r14 !== old_r14) begin $fdisplay(fd, "(%0d)               Write alu.WR2 = %h",  ctime, r14); old_r14 = r14; end
    if (r15 !== old_r15) begin $fdisplay(fd, "(%0d)               Write alu.WR1 = %h",  ctime, r15); old_r15 = r15; end
    if (q   !== old_q)   begin $fdisplay(fd, "(%0d)               Write alu.Q = %h",    ctime, q);   old_q = q;     end
endtask

//
// Print changed state of Am2904 chip
//
task print_changed_2904();
    logic [3:0] MSR, uSR;
    static logic [3:0] old_MSR, old_uSR;

    assign MSR = cpu.alu.status.MSR;
    assign uSR = cpu.alu.status.uSR;

    if (MSR !== old_MSR) begin $fdisplay(fd, "(%0d)               Write alu.MSR = %b", ctime, MSR); old_MSR = MSR; end
    if (uSR !== old_uSR) begin $fdisplay(fd, "(%0d)               Write alu.uSR = %b", ctime, uSR); old_uSR = uSR; end
endtask

//
// Print changed state of Am2910 chip
//
task print_changed_2910();
    logic [2:0] sp;
    logic [11:0] stack0, stack1, stack2, stack3, stack4, stack5, cnt;
    static logic [2:0] old_sp, old_cnt;
    static logic [11:0] old_stack0, old_stack1, old_stack2, old_stack3, old_stack4, old_stack5;

    assign sp = cpu.control.SP;
    assign cnt = cpu.control.Cnt;
    assign stack0 = cpu.control.stack[0];
    assign stack1 = cpu.control.stack[1];
    assign stack2 = cpu.control.stack[2];
    assign stack3 = cpu.control.stack[3];
    assign stack4 = cpu.control.stack[4];
    assign stack5 = cpu.control.stack[5];

    if (sp !== old_sp) begin $fdisplay(fd, "(%0d)               Write cu.SP = %h", ctime, sp); old_sp = sp; end
    if (cnt != old_cnt) begin $fdisplay(fd, "(%0d)               Write cu.Cnt = %h", ctime, cnt); old_cnt = cnt; end
    if (stack0 !== old_stack0) begin $fdisplay(fd, "(%0d)               Write cu.Stack0 = %h", ctime, stack0); old_stack0 = stack0; end
    if (stack1 !== old_stack1) begin $fdisplay(fd, "(%0d)               Write cu.Stack1 = %h", ctime, stack1); old_stack1 = stack1; end
    if (stack2 !== old_stack2) begin $fdisplay(fd, "(%0d)               Write cu.Stack2 = %h", ctime, stack2); old_stack2 = stack2; end
    if (stack3 !== old_stack3) begin $fdisplay(fd, "(%0d)               Write cu.Stack3 = %h", ctime, stack3); old_stack3 = stack3; end
    if (stack4 !== old_stack4) begin $fdisplay(fd, "(%0d)               Write cu.Stack4 = %h", ctime, stack4); old_stack4 = stack4; end
    if (stack5 !== old_stack5) begin $fdisplay(fd, "(%0d)               Write cu.Stack5 = %h", ctime, stack5); old_stack5 = stack5; end
endtask

//
// Print changed state of K1802BB1 chip
//
task print_changed_bb1();
    logic [63:0] rg0;
    static logic [63:0] old_rg0;
    logic [71:0] rg1, rg2, rg3;
    static logic [71:0] old_rg1, old_rg2, old_rg3;

    assign rg0 = { cpu.busio.b60_63.RG[0], cpu.busio.b56_59.RG[0], cpu.busio.b52_55.RG[0], cpu.busio.b48_51.RG[0],
                   cpu.busio.b44_47.RG[0], cpu.busio.b40_43.RG[0], cpu.busio.b36_39.RG[0], cpu.busio.b32_35.RG[0],
                   cpu.busio.b28_31.RG[0], cpu.busio.b24_27.RG[0], cpu.busio.b20_23.RG[0], cpu.busio.b16_19.RG[0],
                   cpu.busio.b12_15.RG[0], cpu.busio.b8_11.RG[0],  cpu.busio.b4_7.RG[0],   cpu.busio.b0_3.RG[0] };
    assign rg1 = { cpu.busio.b68_71.RG[1], cpu.busio.b64_67.RG[1],
                   cpu.busio.b60_63.RG[1], cpu.busio.b56_59.RG[1], cpu.busio.b52_55.RG[1], cpu.busio.b48_51.RG[1],
                   cpu.busio.b44_47.RG[1], cpu.busio.b40_43.RG[1], cpu.busio.b36_39.RG[1], cpu.busio.b32_35.RG[1],
                   cpu.busio.b28_31.RG[1], cpu.busio.b24_27.RG[1], cpu.busio.b20_23.RG[1], cpu.busio.b16_19.RG[1],
                   cpu.busio.b12_15.RG[1], cpu.busio.b8_11.RG[1],  cpu.busio.b4_7.RG[1],   cpu.busio.b0_3.RG[1] };
    assign rg2 = { cpu.busio.b68_71.RG[2], cpu.busio.b64_67.RG[2],
                   cpu.busio.b60_63.RG[2], cpu.busio.b56_59.RG[2], cpu.busio.b52_55.RG[2], cpu.busio.b48_51.RG[2],
                   cpu.busio.b44_47.RG[2], cpu.busio.b40_43.RG[2], cpu.busio.b36_39.RG[2], cpu.busio.b32_35.RG[2],
                   cpu.busio.b28_31.RG[2], cpu.busio.b24_27.RG[2], cpu.busio.b20_23.RG[2], cpu.busio.b16_19.RG[2],
                   cpu.busio.b12_15.RG[2], cpu.busio.b8_11.RG[2],  cpu.busio.b4_7.RG[2],   cpu.busio.b0_3.RG[2] };
    assign rg3 = { cpu.busio.b68_71.RG[3], cpu.busio.b64_67.RG[3],
                   cpu.busio.b60_63.RG[3], cpu.busio.b56_59.RG[3], cpu.busio.b52_55.RG[3], cpu.busio.b48_51.RG[3],
                   cpu.busio.b44_47.RG[3], cpu.busio.b40_43.RG[3], cpu.busio.b36_39.RG[3], cpu.busio.b32_35.RG[3],
                   cpu.busio.b28_31.RG[3], cpu.busio.b24_27.RG[3], cpu.busio.b20_23.RG[3], cpu.busio.b16_19.RG[3],
                   cpu.busio.b12_15.RG[3], cpu.busio.b8_11.RG[3],  cpu.busio.b4_7.RG[3],   cpu.busio.b0_3.RG[3] };

    if (rg0 !== old_rg0) begin $fdisplay(fd, "(%0d)               Write bus.RG0 = %h", ctime, rg0); old_rg0 = rg0; end
    if (rg1 !== old_rg1) begin $fdisplay(fd, "(%0d)               Write bus.RG1 = %h", ctime, rg1); old_rg1 = rg1; end
    if (rg2 !== old_rg2) begin $fdisplay(fd, "(%0d)               Write bus.RG2 = %h", ctime, rg2); old_rg2 = rg2; end
    if (rg3 !== old_rg3) begin $fdisplay(fd, "(%0d)               Write bus.RG3 = %h", ctime, rg3); old_rg3 = rg3; end
endtask

//
// Print changed state of internal CPU registers
//
task print_changed_cpu(
    input logic [112:1] opcode
);
    logic  [5:0] modgn;
    logic  [7:0] procn;
    logic [31:0] cnt;
    logic  [9:0] physpg;
    logic  [3:0] arbopc;
    logic [31:0] ureg;
    logic  [6:0] pshift;
    logic  [2:0] ydev;
    logic        stopm0, stopm1;
    static logic  [5:0] old_modgn;
    static logic  [7:0] old_procn;
    static logic [31:0] old_cnt;
    static logic  [9:0] old_physpg;
    static logic  [3:0] old_arbopc;
    static logic [31:0] old_ureg;
    static logic  [6:0] old_pshift;
    static logic [31:0] old_irmem[1024];
    static logic  [7:0] old_mpmem[16];
    static logic [19:0] old_psmem[1024];
    static logic        old_stopm0, old_stopm1;
    static string ir_name[32] = '{
        0:"М0",     1:"М1",     2:"М2",     3:"М3",
        4:"М4",     5:"М5",     6:"М6",     7:"М7",
        8:"М8",     9:"М9",     10:"М10",   11:"М11",
        12:"М12",   13:"М13",   14:"М14",   15:"SР",
        16:"С",     17:"RR",    18:"RRR",   19:"SPRADR",
        20:"СТТ",   21:"CTL",   22:"CTR",   23:"ACL",
        24:"ACR",   25:"YCL",   26:"YCR",   27:"РСС",
        28:"РССС",  29:"SVFA",  30:"PROCNC",31:"MREZ"
    };
    static string mpadr_name[16] = '{
        0: "INFB1", 1: "INFB2", 2: "FCP",   3: "FMP",
        4: "ADRB1", 5: "ADRB2", 6: "ADRB3", 7: "ADRB4",
        8: "DATAB1",9: "DATAB2",10:"DATAB3",11:"DATAB4",
        12:"DATAB5",13:"DATAB6",14:"DATAB7",15:"DATAB8"
    };
    static string arbopc_name[16] = '{
        0: "RST",   1: "CCRD",  2: "CCWR",  3: "DCRD",
        4: "DCWR",  5: "?",     6: "?",     7: "?",
        8: "FЕТСН", 9: "DRD",   10:"DWR",   11:"RDMWR",
        12:"BTRWR", 13:"BTRRD", 14:"BICLR", 15:"BIRD"
    };
    logic csm, wem, wry;

    assign modgn  = cpu.MODGN;
    assign procn  = cpu.PROCN;
    assign cnt    = cpu.CNT;
    assign physpg = cpu.PHYSPG;
    assign arbopc = cpu.arb_req;
    assign ureg   = cpu.UREG;
    assign pshift = cpu.PSHIFT;
    assign stopm0 = cpu.stopm0;
    assign stopm1 = cpu.stopm1;

    //
    // Internal registers
    //
    if (modgn  !== old_modgn)  begin $fdisplay(fd, "(%0d)               Write MODGN = %h",  ctime, modgn);  old_modgn  = modgn;  end
    if (procn  !== old_procn)  begin $fdisplay(fd, "(%0d)               Write PROCN = %h",  ctime, procn);  old_procn  = procn;  end
    if (cnt    !== old_cnt)    begin $fdisplay(fd, "(%0d)               Write CNT = %h",    ctime, cnt);    old_cnt    = cnt;    end
    if (physpg !== old_physpg) begin $fdisplay(fd, "(%0d)               Write PHYSPG = %h", ctime, physpg); old_physpg = physpg; end
    if (arbopc !== old_arbopc) begin $fdisplay(fd, "(%0d)               Write ARBOPC = %h (%0s)", ctime, arbopc, arbopc_name[arbopc]); old_arbopc = arbopc; end
    if (ureg   !== old_ureg)   begin $fdisplay(fd, "(%0d)               Write UREG = %h",   ctime, ureg);   old_ureg   = ureg;   end
    if (pshift !== old_pshift) begin $fdisplay(fd, "(%0d)               Write PSHIFT = %h", ctime, pshift); old_pshift = pshift; end
    if (stopm0 !== old_stopm0) begin $fdisplay(fd, "(%0d)               Write STOPM0 = %h", ctime, stopm0); old_stopm0 = stopm0; end
    if (stopm1 !== old_stopm1) begin $fdisplay(fd, "(%1d)               Write STOPM1 = %h", ctime, stopm1); old_stopm1 = stopm1; end

    //
    // Index-registers
    //
    assign csm = opcode[30];        // Управление обращением к ОЗУ модификаторов
    assign wem = opcode[29];        // Разрешение записи в ОЗУ модификаторов
    if (csm & wem) begin
        int i;
        for (i=old_modgn*32; i<old_modgn*32+32; i+=1)
            if (cpu.irmem[i] !== old_irmem[i]) begin
                $fdisplay(fd, "(%0d)               Write %0s[%d] = %h",
                    ctime, ir_name[i[4:0]], i[9:5], cpu.irmem[i]);
                old_irmem[i] = cpu.irmem[i];
            end
    end

    //
    // I/O memory for console processor
    //
    assign wry = opcode[17];        // Запись в источники или приемники шины Y
    assign ydev = opcode[20:18];    // Выбор источника или приемника информации с шины Y
    if (wry && ydev==5) begin
        int i;
        for (i=0; i<16; i+=1)
            if (cpu.mpmem[i] !== old_mpmem[i]) begin
                $fdisplay(fd, "(%0d)               Write %0s = %h",
                    ctime, mpadr_name[i], cpu.mpmem[i]);
                old_mpmem[i] = cpu.mpmem[i];
            end
    end

    //
    // Page map
    //
    if (wry && ydev==4) begin
        int i;
        for (i=0; i<1024; i+=1)
            if (cpu.psmem[i] !== old_psmem[i]) begin
                $fdisplay(fd, "(%0d)               Write Page[%0d] = %h",
                    ctime, i, cpu.psmem[i]);
                old_psmem[i] = cpu.psmem[i];
            end
    end
endtask

endmodule
