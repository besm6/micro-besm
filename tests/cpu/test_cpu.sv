// Global time parameters.
timeunit 1ns;
timeprecision 10ps;

module testbench();

// Inputs.
logic clk, reset;

// Instantiate CPU.
cpu cpu(clk, reset);

string hexfile = "input.hex";           // Input file name
string tracefile = "output.trace";
string wavefile = "output.vcd";
int limit;
int trace;                              // Trace level
int tracefd;                            // Trace file descriptor

//
// Generate clock at 100MHz.
//
always #5 clk = ~clk;

//
// Main loop.
//
initial begin
    // Print help message, if +trace option not specified.
    $display("");
    if (! $value$plusargs("trace=%d", trace)) begin
        $display("----- Trace option required -----");
        $display("Options:");
        $display("    +trace=0          No tracing");
        $display("    +trace=1          Trace instructions and registers to file %s", tracefile);
        $display("    +trace=2          Trace micro-instructions");
        $display("    +hexfile=NAME     Load hex file (default %0s)", hexfile);
        $display("    +limit=NUM        Limit execution to a number of cycles (default %0d)", limit);
        $display("    +dump             Dump waveforms to file %s", wavefile);
        $display("");
        $finish(1);
    end
    $display("--------------------------------");

    // Input file name.
    if (! $value$plusargs("hexfile=%s", hexfile)) begin
        // Use default input file
    end

    // Dump waveforms.
    if ($test$plusargs("dump")) begin
        $dumpfile(wavefile);
        $dumpvars();
    end

    // Enable instruction trace to file.
    if (trace) begin
        $display("Generate trace file %0S", tracefile);
        tracefd = $fopen(tracefile, "w");
        $fdisplay(tracefd, "Trace file for %0S", hexfile);
    end

    // Limit the simulation by specified number of cycles.
    if (! $value$plusargs("limit=%d", limit)) begin
        // Default limit value.
        limit = 100000;
        $display("Limit: %0d", limit);
        if (trace)
            $fdisplay(tracefd, "Limit: %0d", limit);
    end

    // Load hex file.
    //TODO: load_hex(hexfile);

    // Start with reset active
    clk = 1;
    reset = 1;

    // Hold reset for a while.
    #100 reset = 0;

    // Run until limit.
    #limit begin
        $display("\n----- Time Limit Exceeded -----");
        $finish(1);
    end
end

//
// Trace monitor.
//
initial begin
    automatic int old_mst = 0;
    automatic int old_ust = 0;
    automatic bit old_reset = 0;

    if (! trace)
        $exit;

    forever begin
        // Wait for instruction, valid on leading edge of clk
        wait(clk);

        if (reset) begin
            if (!old_reset) begin               // Reset
                $fdisplay(tracefd, "(%0d) ---- Reset", $time);
                old_reset = 1;
            end
        end else begin
            if (old_reset) begin                // Clear reset
                $fdisplay(tracefd, "(%0d) ---- End reset", $time);
                old_reset = 0;
            end

            if ($isunknown(cpu.SQI) || $isunknown(cpu.A)) begin
                $fdisplay(tracefd, "(%0d) SQI=%b A=%b", $time, cpu.SQI, cpu.A);
                $display("\n----- Unknown state reached! -----");
                $fdisplay(tracefd, "\n----- Unknown state reached! -----");
                $finish(1);
            end

            if (trace > 1)
                print_uop();                    // Print micro-instruction

            //TODO: print_insn();

            //TODO: if (old_mst != cpu.mst) print...
        end

        #5;
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

    $fwrite(tracefd, "(%0d) %-4s", $time, sqi_name[cpu.SQI]);
    if (cpu.A != 0)
        $fwrite(tracefd, " %h", cpu.A);
    else
        $fwrite(tracefd, "    ");

    if (cpu.MAP   != 3)  $fwrite(tracefd, " map=%0s", map_name[cpu.MAP]);
    if (cpu.ALU   != 0)  $fwrite(tracefd, " ALU");
    if (cpu.ALUD  != 1)  $fwrite(tracefd, " alud=%0s", alud_name[cpu.ALUD]);
    if (cpu.FUNC  != 0)  $fwrite(tracefd, " func=%0s", func_name[cpu.FUNC]);
    if (cpu.ALUS  != 0)  $fwrite(tracefd, " alus=%0s", alus_name[cpu.ALUS]);
    if (cpu.H     != 0)  $fwrite(tracefd, " H");
    if (cpu.RB    != 10) $fwrite(tracefd, " rb=%0s", rb_name[cpu.RB]);
    if (cpu.RA    != 0)  $fwrite(tracefd, " ra=%0s", ra_name[cpu.RA]);
    if (cpu.CI    != 0)  $fwrite(tracefd, " ci=%0s", ci_name[cpu.CI]);
    if (cpu.SHMUX != 0)  $fwrite(tracefd, " shmux=%0s", shmux_name[cpu.SHMUX]);
    if (cpu.STOPC != 20) $fwrite(tracefd, " stopc=%0s", stopc_name[cpu.STOPC]);
    if (cpu.MOD   != 0)  $fwrite(tracefd, " MOD");
    if (cpu.PSHF  != 64) $fwrite(tracefd, " pshf=%0d", int'(cpu.PSHF) - 64);
    if (cpu.MNSA  != 2)  $fwrite(tracefd, " mnsa=%0s", mnsa_name[cpu.MNSA]);
    if (cpu.MODNM != 0)  $fwrite(tracefd, " modnm=%0s", modnm_name[cpu.MODNM]);
    if (cpu.DSRC  != 0)  $fwrite(tracefd, " dsrc=%0s", dsrc_name[cpu.DSRC]);
    if (cpu.YDST  != 0)  $fwrite(tracefd, " ydst=%0s", ydst_name[cpu.YDST]);
    if (cpu.SHF   != 0)  $fwrite(tracefd, " shf=%0s", shf_name[cpu.SHF]);
    if (cpu.ARBI  != 0)  $fwrite(tracefd, " arbi=%0s", arbi_name[cpu.ARBI]);
    if (cpu.RLD   != 0)  $fwrite(tracefd, " RLD");
    if (cpu.LETC  != 0)  $fwrite(tracefd, " LETC");
    if (cpu.SCI   != 0)  $fwrite(tracefd, " SCI");
    if (cpu.ICI   != 0)  $fwrite(tracefd, " ICI");
    if (cpu.ICC   != 0)  $fwrite(tracefd, " ICC");
    if (cpu.ISE   != 0)  $fwrite(tracefd, " ISE");
    if (cpu.CEM   != 0)  $fwrite(tracefd, " CEM");
    if (cpu.CEN   != 0)  $fwrite(tracefd, " CEN");
    if (cpu.CSM   != 0)  $fwrite(tracefd, " CSM");
    if (cpu.WEM   != 0)  $fwrite(tracefd, " WEM");
    if (cpu.ECB   != 0)  $fwrite(tracefd, " ECB");
    if (cpu.WRB   != 0)  $fwrite(tracefd, " WRB");
    if (cpu.BRA   != 3)  $fwrite(tracefd, " bra=%0s", bra_name[cpu.BRA]);
    if (cpu.ECA   != 0)  $fwrite(tracefd, " ECA");
    if (cpu.WRA   != 0)  $fwrite(tracefd, " WRA");
    if (cpu.ARA   != 3)  $fwrite(tracefd, " ara=%0s", bra_name[cpu.ARA]);
    if (cpu.YDEV  != 0)  $fwrite(tracefd, " ydev=%0s", ydev_name[cpu.YDEV]);
    if (cpu.WRY   != 0)  $fwrite(tracefd, " WRY");
    if (cpu.DDEV  != 0)  $fwrite(tracefd, " ddev=%0s", ddev_name[cpu.DDEV]);
    if (cpu.WRD   != 0)  $fwrite(tracefd, " WRD");

    if (cpu.IOMP  != 0)  $fwrite(tracefd, " IOMP mpadr=%0s", mpadr_name[cpu.MPADR]);
    else
    if (cpu.FFCNT != 0)  $fwrite(tracefd, " ffcnt=%0s", ffcnt_name[cpu.FFCNT]);

    if (cpu.COND  != 0)  $fwrite(tracefd, " cond=%0s", cond_name[cpu.COND]);
    if (cpu.MPS   != 0)  $fwrite(tracefd, " MPS");
    $fdisplay(tracefd, "");
endtask

endmodule
