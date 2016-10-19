//
// Trace monitor.
//
module tracer(
    input   clk,    // Clock
    input   reset   // Global reset
);

timeunit 1ns;
timeprecision 10ps;

//
// Descriptor of output trace file
//
int fd;
assign fd = testbench.tracefd;

//
// Last fetch address
//
logic [11:0] pc;
always @(posedge clk)
    if (reset)
        pc <= '0;
    else
        pc <= cpu.control_Y;

initial begin
    static bit old_reset = 0;

    // Wait until trace file opened
    wait(fd);

    forever begin
        // Wait for instruction, valid on leading edge of clk
        wait(clk);

        if (reset) begin
            if (!old_reset) begin               // Reset
                $fdisplay(fd, "(%0d) *** Reset", $time);
                old_reset = 1;
            end
        end else begin
            if (old_reset) begin                // Clear reset
                $fdisplay(fd, "(%0d) *** Clear reset", $time);
                old_reset = 0;
            end

            if ($isunknown(cpu.SQI) || $isunknown(cpu.A)) begin
                $fdisplay(fd, "(%0d) *** Unknown state: SQI=%b A=%b", $time, cpu.SQI, cpu.A);
                $display("\n----- Fatal Error! -----");
                $fdisplay(fd, "\n----- Fatal Error! -----");
                $finish(1);
            end

            if (testbench.trace > 1) begin
                print_uop();                    // Print micro-instruction
                print_changed_2901();           // Print changed state
                print_changed_2904();
                print_changed_2910();
                //print_changed_bb1();
                print_changed_cpu();

                //TODO: печать памяти модификаторов и таблицы приписки

                if (cpu.DSRC == 12) begin
                    // Чтение ПЗУ констант
                    $fdisplay(fd, "(%0d) Read Const[%0d] = %h",
                        $time, cpu.control_Y[8:0], cpu.PROM);
                end
            end

            //TODO: print_insn();               // Print instruction
        end

        wait(!clk);
    end
end

//
// Print micro-instruction.
//
task print_uop();
    static string sqi_name[16] = '{
         0: "jz",   1: "cjs",   2: "jmap",  3: "cjp",
         4: "push", 5: "jsrp",  6: "cjv",   7: "jrp",
         8: "rfct", 9: "rpct",  10: "crtn", 11: "cjpp",
        12: "ldct", 13: "loop", 14: "cont", 15: "twb"
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
        16:"RUN",   17:"NMLRDY",            19:"INT",
        20:"FULMEM",21:"ARBRDY",22:"TR0",   23:"CPMP",
        default: "???"
    };

    $fwrite(fd, "(%0d) %h: %-4s", $time, pc, sqi_name[cpu.SQI]);
    if (cpu.A != 0)
        $fwrite(fd, " %h", cpu.A);
    else
        $fwrite(fd, "    ");

    if (cpu.MAP   != 3)  $fwrite(fd, " map=%0s", map_name[cpu.MAP]);
    if (cpu.ALU   != 0)  $fwrite(fd, " ALU");
    if (cpu.ALUD  != 1)  $fwrite(fd, " alud=%0s", alud_name[cpu.ALUD]);
    if (cpu.FUNC  != 0)  $fwrite(fd, " func=%0s", func_name[cpu.FUNC]);
    if (cpu.ALUS  != 0)  $fwrite(fd, " alus=%0s", alus_name[cpu.ALUS]);
    if (cpu.H     != 0)  $fwrite(fd, " H");
    if (cpu.RB    != 10) $fwrite(fd, " rb=%0s", rb_name[cpu.RB]);
    if (cpu.RA    != 0)  $fwrite(fd, " ra=%0s", ra_name[cpu.RA]);
    if (cpu.CI    != 0)  $fwrite(fd, " ci=%0s", ci_name[cpu.CI]);
    if (cpu.SHMUX != 0)  $fwrite(fd, " shmux=%0s", shmux_name[cpu.SHMUX]);
    if (cpu.STOPC != 20) $fwrite(fd, " stopc=%0s", stopc_name[cpu.STOPC]);
    if (cpu.MOD   != 0)  $fwrite(fd, " MOD");
    if (cpu.PSHF  != 64) $fwrite(fd, " pshf=%0d", int'(cpu.PSHF) - 64);
    if (cpu.MNSA  != 2)  $fwrite(fd, " mnsa=%0s", mnsa_name[cpu.MNSA]);
    if (cpu.MODNM != 0)  $fwrite(fd, " modnm=%0s", modnm_name[cpu.MODNM]);
    if (cpu.DSRC  != 0)  $fwrite(fd, " dsrc=%0s", dsrc_name[cpu.DSRC]);
    if (cpu.YDST  != 0)  $fwrite(fd, " ydst=%0s", ydst_name[cpu.YDST]);
    if (cpu.SHF   != 0)  $fwrite(fd, " shf=%0s", shf_name[cpu.SHF]);
    if (cpu.ARBI  != 0)  $fwrite(fd, " arbi=%0s", arbi_name[cpu.ARBI]);
    if (cpu.RLD   != 0)  $fwrite(fd, " RLD");
    if (cpu.LETC  != 0)  $fwrite(fd, " LETC");
    if (cpu.SCI   != 0)  $fwrite(fd, " SCI");
    if (cpu.ICI   != 0)  $fwrite(fd, " ICI");
    if (cpu.ICC   != 0)  $fwrite(fd, " ICC");
    if (cpu.ISE   != 0)  $fwrite(fd, " ISE");
    if (cpu.CEM   != 0)  $fwrite(fd, " CEM");
    if (cpu.CEN   != 0)  $fwrite(fd, " CEN");
    if (cpu.CSM   != 0)  $fwrite(fd, " CSM");
    if (cpu.WEM   != 0)  $fwrite(fd, " WEM");
    if (cpu.ECB   != 0)  $fwrite(fd, " ECB");
    if (cpu.WRB   != 0)  $fwrite(fd, " WRB");
    if (cpu.BRA   != 3)  $fwrite(fd, " bra=%0s", bra_name[cpu.BRA]);
    if (cpu.ECA   != 0)  $fwrite(fd, " ECA");
    if (cpu.WRA   != 0)  $fwrite(fd, " WRA");
    if (cpu.ARA   != 3)  $fwrite(fd, " ara=%0s", bra_name[cpu.ARA]);
    if (cpu.YDEV  != 0)  $fwrite(fd, " ydev=%0s", ydev_name[cpu.YDEV]);
    if (cpu.WRY   != 0)  $fwrite(fd, " WRY");
    if (cpu.DDEV  != 0)  $fwrite(fd, " ddev=%0s", ddev_name[cpu.DDEV]);
    if (cpu.WRD   != 0)  $fwrite(fd, " WRD");

    if (cpu.IOMP  != 0)  $fwrite(fd, " IOMP mpadr=%0s", mpadr_name[cpu.MPADR]);
    else
    if (cpu.FFCNT != 0)  $fwrite(fd, " ffcnt=%0s", ffcnt_name[cpu.FFCNT]);

    if (cpu.COND  != 0)  $fwrite(fd, " cond=%0s", cond_name[cpu.COND]);
    if (cpu.MPS   != 0)  $fwrite(fd, " MPS");
    $fdisplay(fd, "");
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

    if (r0  !== old_r0)  begin $fdisplay(fd, "(%0d) Write alu.R0 = %h",  $time, r0);  old_r0  = r0;  end
    if (r1  !== old_r1)  begin $fdisplay(fd, "(%0d) Write alu.R1 = %h",  $time, r1);  old_r1  = r1;  end
    if (r2  !== old_r2)  begin $fdisplay(fd, "(%0d) Write alu.R2 = %h",  $time, r2);  old_r2  = r2;  end
    if (r3  !== old_r3)  begin $fdisplay(fd, "(%0d) Write alu.R3 = %h",  $time, r3);  old_r3  = r3;  end
    if (r4  !== old_r4)  begin $fdisplay(fd, "(%0d) Write alu.R4 = %h",  $time, r4);  old_r4  = r4;  end
    if (r5  !== old_r5)  begin $fdisplay(fd, "(%0d) Write alu.R5 = %h",  $time, r5);  old_r5  = r5;  end
    if (r6  !== old_r6)  begin $fdisplay(fd, "(%0d) Write alu.R6 = %h",  $time, r6);  old_r6  = r6;  end
    if (r7  !== old_r7)  begin $fdisplay(fd, "(%0d) Write alu.R7 = %h",  $time, r7);  old_r7  = r7;  end
    if (r8  !== old_r8)  begin $fdisplay(fd, "(%0d) Write alu.R8 = %h",  $time, r8);  old_r8  = r8;  end
    if (r9  !== old_r9)  begin $fdisplay(fd, "(%0d) Write alu.R9 = %h",  $time, r9);  old_r9  = r9;  end
    if (r10 !== old_r10) begin $fdisplay(fd, "(%0d) Write alu.R10 = %h", $time, r10); old_r10 = r10; end
    if (r11 !== old_r11) begin $fdisplay(fd, "(%0d) Write alu.R11 = %h", $time, r11); old_r11 = r11; end
    if (r12 !== old_r12) begin $fdisplay(fd, "(%0d) Write alu.R12 = %h", $time, r12); old_r12 = r12; end
    if (r13 !== old_r13) begin $fdisplay(fd, "(%0d) Write alu.R13 = %h", $time, r13); old_r13 = r13; end
    if (r14 !== old_r14) begin $fdisplay(fd, "(%0d) Write alu.R14 = %h", $time, r14); old_r14 = r14; end
    if (r15 !== old_r15) begin $fdisplay(fd, "(%0d) Write alu.R15 = %h", $time, r15); old_r15 = r15; end
    if (q   !== old_q)   begin $fdisplay(fd, "(%0d) Write alu.Q = %h",   $time, q);   old_q = q;     end
endtask

//
// Print changed state of Am2904 chip
//
task print_changed_2904();
    logic [3:0] MSR, uSR;
    static logic [3:0] old_MSR, old_uSR;

    assign MSR = cpu.alu.status.MSR;
    assign uSR = cpu.alu.status.uSR;

    if (MSR !== old_MSR) begin $fdisplay(fd, "(%0d) Write alu.MSR = %b", $time, MSR); old_MSR = MSR; end
    if (uSR !== old_uSR) begin $fdisplay(fd, "(%0d) Write alu.uSR = %b", $time, uSR); old_uSR = uSR; end
endtask

// Print changed state of Am2910 chip
task print_changed_2910();
    logic [2:0] sp;
    logic [11:0] stack0, stack1, stack2, stack3, stack4, stack5;
    static logic [2:0] old_sp;
    static logic [11:0] old_stack0, old_stack1, old_stack2, old_stack3, old_stack4, old_stack5;

    assign sp = cpu.control.sp;
    assign stack0 = cpu.control.reg_file[0];
    assign stack1 = cpu.control.reg_file[1];
    assign stack2 = cpu.control.reg_file[2];
    assign stack3 = cpu.control.reg_file[3];
    assign stack4 = cpu.control.reg_file[4];
    assign stack5 = cpu.control.reg_file[5];

    if (sp !== old_sp) begin $fdisplay(fd, "(%0d) control.SP = %h", $time, sp); old_sp = sp; end
    if (stack0 !== old_stack0) begin $fdisplay(fd, "(%0d) Write control.Stack0 = %h", $time, stack0); old_stack0 = stack0; end
    if (stack1 !== old_stack1) begin $fdisplay(fd, "(%0d) Write control.Stack1 = %h", $time, stack1); old_stack1 = stack1; end
    if (stack2 !== old_stack2) begin $fdisplay(fd, "(%0d) Write control.Stack2 = %h", $time, stack2); old_stack2 = stack2; end
    if (stack3 !== old_stack3) begin $fdisplay(fd, "(%0d) Write control.Stack3 = %h", $time, stack3); old_stack3 = stack3; end
    if (stack4 !== old_stack4) begin $fdisplay(fd, "(%0d) Write control.Stack4 = %h", $time, stack4); old_stack4 = stack4; end
    if (stack5 !== old_stack5) begin $fdisplay(fd, "(%0d) Write control.Stack5 = %h", $time, stack5); old_stack5 = stack5; end
endtask

// Print changed state of internal CPU registers
task print_changed_cpu();
    logic  [5:0] modgn;
    logic  [7:0] procn;
    logic [31:0] cnt;
    logic  [9:0] physpg;
    logic  [3:0] arbopc;
    logic [31:0] adrreg;
    logic  [6:0] pshift;
    static logic  [5:0] old_modgn;
    static logic  [7:0] old_procn;
    static logic [31:0] old_cnt;
    static logic  [9:0] old_physpg;
    static logic  [3:0] old_arbopc;
    static logic [31:0] old_adrreg;
    static logic  [6:0] old_pshift;

    assign modgn  = cpu.MODGN;
    assign procn  = cpu.PROCN;
    assign cnt    = cpu.CNT;
    assign physpg = cpu.PHYSPG;
    assign arbopc = cpu.ARBOPC;
    assign adrreg = cpu.ADRREG;
    assign pshift = cpu.PSHIFT;

    if (modgn  !== old_modgn)  begin $fdisplay(fd, "(%0d) Write MODGN = %h",  $time, modgn);  old_modgn  = modgn;  end
    if (procn  !== old_procn)  begin $fdisplay(fd, "(%0d) Write PROCN = %h",  $time, procn);  old_procn  = procn;  end
    if (cnt    !== old_cnt)    begin $fdisplay(fd, "(%0d) Write CNT = %h",    $time, cnt);    old_cnt    = cnt;    end
    if (physpg !== old_physpg) begin $fdisplay(fd, "(%0d) Write PHYSPG = %h", $time, physpg); old_physpg = physpg; end
    if (arbopc !== old_arbopc) begin $fdisplay(fd, "(%0d) Write ARBOPC = %h", $time, arbopc); old_arbopc = arbopc; end
    if (adrreg !== old_adrreg) begin $fdisplay(fd, "(%0d) Write ADRREG = %h", $time, adrreg); old_adrreg = adrreg; end
    if (pshift !== old_pshift) begin $fdisplay(fd, "(%0d) Write PSHIFT = %h", $time, pshift); old_pshift = pshift; end
endtask

endmodule
