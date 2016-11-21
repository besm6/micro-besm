//
// Trace monitor.
//
// This is not a synthesizable code, but a part of verification testbench.
// The main role of tracer is to observe the behavior of the processor
// and print the trace log to a file.
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
logic [19:0] waddr_x;                   // Memory address

//
// Current time
//
time ctime;

//
// Signal for the test for every graduated instruction.
//
event instruction_retired;

bit old_reset = 0;                      // Previous state of reset
logic [63:0] const_value;               // Constant value
logic [8:0] const_addr;                 // Constant address

// Get time at the rising edge of the clock.
always @(posedge clk) begin
    ctime = $time;
    pc_f = cpu.control_Y;
end

// At negative clock edge, when all the signals are quiet,
// print the state of the processor.
always @(negedge clk)
    if (fd) begin
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
        end

        if (testbench.trace > 1) begin
            // Print last executed micro-instruction
            if (!reset)
                print_uop(pc_x, opcode_x, const_addr, const_value);

            // Print changed state
            print_changed_2901();
            print_changed_2904();
            print_changed_2910();
            print_changed_cpu(opcode_x);
            print_changed_timer();
        end

        // Print memory transactions
        if (!testbench.o_astb && testbench.o_wr)
            $fdisplay(fd, "(%0d)               Memory Store [%h] = %h:%h",
                ctime, waddr_x, testbench.o_tag, testbench.o_ad);
        else if (!testbench.o_astb && cpu.arb.wrx)
            $fdisplay(fd, "(%0d)               Memory %0s [%h] = %h:%h",
                ctime, (cpu.arb_opc == 8) ? "Fetch" : "Load",
                waddr_x, testbench.i_tag, testbench.i_data);

        if (testbench.trace && cpu.MAP == 1 && cpu.DSRC == 8) begin
            // When MAP=ME and DSRC=COMA: print BESM instruction.
            print_insn();
        end

        if (testbench.trace > 1 && !reset) begin
            // Print changed busio state _last_,
            // as it actually comes from the _next_ microinstruction.
            print_changed_bb1();
        end

        if (!reset && $isunknown(cpu.opcode)) begin
            $fdisplay(fd, "(%0d) *** Unknown state: cpu.opcode=%h", ctime, cpu.opcode);
            $display("\n----- Fatal Error! -----");
            $fdisplay(fd, "\n----- Fatal Error! -----");
            $finish(1);
        end

        // Get data from fetch stage
        pc_x = pc_f;
        opcode_x = cpu.opcode;
        const_value = cpu.PROM;
        const_addr = cpu.A[8:0];
        waddr_x = testbench.waddr;

        ->instruction_retired;
    end

//
// Print BESM instruction.
//
task print_insn();
    static string op_name[256] = '{
          0:"atx",   1:"stx",   2:"02",    3:"xts",   4:"04",    5:"05",    6:"06",    7:"07",
          8:"xta",   9:"aax",  10:"aex",  11:"arx",  12:"0c",   13:"aox",  14:"a/x",  15:"0f",
         16:"apx",  17:"aux",  18:"acx",  19:"anx",  20:"e+x",  21:"e-x",  22:"asx",  23:"17",
         24:"jmp",  25:"vjm",  26:"1a",   27:"vlm",  28:"1c",   29:"1d",   30:"1e",   31:"1f",
         32:"jmeq", 33:"jmne", 34:"jmge", 35:"jmlt", 36:"jmle", 37:"jmgt", 38:"26",   39:"27",
         40:"28",   41:"29",   42:"2a",   43:"2b",   44:"2c",   45:"2d",   46:"2e",   47:"2f",
         48:"30",   49:"31",   50:"32",   51:"33",   52:"34",   53:"35",   54:"36",   55:"37",
         56:"38",   57:"39",   58:"3a",   59:"wtc",  60:"vtm",  61:"utm",  62:"3e",   63:"3f",
         64:"40",   65:"41",   66:"42",   67:"uts",  68:"44",   69:"45",   70:"46",   71:"47",
         72:"uta",  73:"aau",  74:"aeu",  75:"4b",   76:"4c",   77:"aou",  78:"4e",   79:"4f",
         80:"50",   81:"51",   82:"acu",  83:"anu",  84:"54",   85:"55",   86:"56",   87:"57",
         88:"58",   89:"59",   90:"5a",   91:"5b",   92:"5c",   93:"5d",   94:"5e",   95:"5f",
         96:"60",   97:"61",   98:"62",   99:"63",  100:"64",  101:"65",  102:"66",  103:"67",
        104:"68",  105:"69",  106:"6a",  107:"6b",  108:"6c",  109:"6d",  110:"6e",  111:"6f",
        112:"70",  113:"71",  114:"72",  115:"73",  116:"74",  117:"75",  118:"76",  119:"77",
        120:"78",  121:"79",  122:"7a",  123:"7b",  124:"7c",  125:"7d",  126:"7e",  127:"7f",
        128:"ext/",129:"a+u", 130:"a-u", 131:"u-a", 132:"84",  133:"85",  134:"a/u", 135:"a*u",
        136:"uty", 137:"89",  138:"8a",  139:"8b",  140:"8c",  141:"8d",  142:"8e",  143:"8f",
        144:"utc", 145:"91",  146:"92",  147:"93",  148:"xty", 149:"yax", 150:"yex", 151:"yox",
        152:"ytx", 153:"a+l", 154:"a-l", 155:"l-a", 156:"9c",  157:"9d",  158:"a/l", 159:"a*l",
        160:"vtmh",161:"vtmq",162:"vtmb",163:"vtmf",164:"utcs",165:"a5",  166:"a6",  167:"a7",
        168:"a8",  169:"vrm", 170:"uzas",171:"u1as",172:"jovr",173:"jcry",174:"jagt",175:"jage",
        176:"jalt",177:"jale",178:"jaeq",179:"jane",180:"b4",  181:"jmps",182:"ath", 183:"sth",
        184:"hta", 185:"hts", 186:"a+h", 187:"a-h", 188:"h-a", 189:"bd",  190:"be",  191:"a/h",
        192:"a*h", 193:"aah", 194:"aeh", 195:"aoh", 196:"atq", 197:"stq", 198:"qta", 199:"qts",
        200:"aeq", 201:"aaq", 202:"aoq", 203:"atb", 204:"stb", 205:"bta", 206:"bts", 207:"aeb",
        208:"aab", 209:"aob", 210:"atf", 211:"stf", 212:"fta", 213:"fts", 214:"aef", 215:"aaf",
        216:"aof", 217:"setf",218:"clrf",219:"xtr", 220:"atd", 221:"dta", 222:"de",  223:"df",
        224:"e0",  225:"e1",  226:"e2",  227:"e3",  228:"e4",  229:"a+x", 230:"a-x", 231:"x-a",
        232:"amx", 233:"avx", 234:"a*x", 235:"uza", 236:"uia", 237:"ed",  238:"ee",  239:"ef",
        240:"rmod",241:"wmod",242:"setr",243:"clrr",244:"semr",245:"ttx", 246:"tta", 247:"semw",
        248:"smon",249:"cmon",250:"fa",  251:"fb",  252:"fc",  253:"ijp", 254:"fe",  255:"ff"
    };
    static string ext_name[256] = '{
          0:"extc",  1:"3f01",  2:"3f02",  3:"3f03",  4:"3f04",  5:"3f05",  6:"3f06",  7:"3f07",
          8:"3f08",  9:"3f09", 10:"3f0a", 11:"3f0b", 12:"3f0c", 13:"3f0d", 14:"3f0e", 15:"3f0f",
         16:"3f10", 17:"3f11", 18:"3f12", 19:"3f13", 20:"3f14", 21:"3f15", 22:"asn",  23:"3f17",
         24:"3f18", 25:"3f19", 26:"3f1a", 27:"3f1b", 28:"e+n",  29:"e-n",  30:"3f1e", 31:"3f1f",
         32:"ati",  33:"sti",  34:"its",  35:"3f23", 36:"mtj",  37:"j+m",  38:"3f26", 39:"j-m",
         40:"3f28", 41:"3f29", 42:"3f2a", 43:"3f2b", 44:"3f2c", 45:"3f2d", 46:"3f2e", 47:"3f2f",
         48:"3f30", 49:"3f31", 50:"3f32", 51:"3f33", 52:"3f34", 53:"3f35", 54:"3f36", 55:"3f37",
         56:"3f38", 57:"3f39", 58:"3f3a", 59:"3f3b", 60:"3f3c", 61:"3f3d", 62:"3f3e", 63:"3f3f",
         64:"3f40", 65:"3f41", 66:"3f42", 67:"3f43", 68:"3f44", 69:"3f45", 70:"3f46", 71:"3f47",
         72:"3f48", 73:"3f49", 74:"3f4a", 75:"3f4b", 76:"3f4c", 77:"3f4d", 78:"3f4e", 79:"3f4f",
         80:"3f50", 81:"3f51", 82:"3f52", 83:"3f53", 84:"3f54", 85:"3f55", 86:"3f56", 87:"3f57",
         88:"3f58", 89:"3f59", 90:"3f5a", 91:"3f5b", 92:"3f5c", 93:"3f5d", 94:"3f5e", 95:"3f5f",
         96:"3f60", 97:"3f61", 98:"3f62", 99:"3f63",100:"3f64",101:"3f65",102:"3f66",103:"3f67",
        104:"3f68",105:"3f69",106:"3f6a",107:"3f6b",108:"3f6c",109:"3f6d",110:"3f6e",111:"3f6f",
        112:"3f70",113:"3f71",114:"3f72",115:"3f73",116:"3f74",117:"3f75",118:"3f76",119:"3f77",
        120:"3f78",121:"3f79",122:"3f7a",123:"3f7b",124:"3f7c",125:"3f7d",126:"3f7e",127:"3f7f",
        128:"ita", 129:"yta", 130:"ntr", 131:"rte", 132:"aay", 133:"aey", 134:"aoy", 135:"retsz",
        136:"rets",137:"3f89",138:"3f8a",139:"3f8b",140:"3f8c",141:"3f8d",142:"3f8e",143:"3f8f",
        144:"mcj", 145:"msn", 146:"3f92",147:"3f93",148:"mpac",149:"munp",150:"asna",151:"3f97",
        152:"3f98",153:"3f99",154:"3f9a",155:"3f9b",156:"3f9c",157:"3f9d",158:"3f9e",159:"3f9f",
        160:"3fa0",161:"extf",162:"a+i", 163:"a-i", 164:"i-a", 165:"3fa5",166:"3fa6",167:"a/i",
        168:"a*i", 169:"aai", 170:"aei", 171:"aoi", 172:"3fac",173:"3fad",174:"3fae",175:"3faf",
        176:"nta", 177:"nts", 178:"aen", 179:"aan", 180:"aon", 181:"3fb5",182:"3fb6",183:"3fb7",
        184:"3fb8",185:"3fb9",186:"3fba",187:"3fbb",188:"3fbc",189:"3fbd",190:"3fbe",191:"3fbf",
        192:"3fc0",193:"3fc1",194:"3fc2",195:"3fc3",196:"3fc4",197:"3fc5",198:"3fc6",199:"3fc7",
        200:"3fc8",201:"3fc9",202:"3fca",203:"3fcb",204:"3fcc",205:"3fcd",206:"3fce",207:"3fcf",
        208:"3fd0",209:"3fd1",210:"3fd2",211:"3fd3",212:"3fd4",213:"3fd5",214:"3fd6",215:"3fd7",
        216:"3fd8",217:"3fd9",218:"3fda",219:"3fdb",220:"3fdc",221:"3fdd",222:"3fde",223:"3fdf",
        224:"3fe0",225:"3fe1",226:"3fe2",227:"3fe3",228:"3fe4",229:"3fe5",230:"3fe6",231:"3fe7",
        232:"3fe8",233:"3fe9",234:"3fea",235:"3feb",236:"3fec",237:"3fed",238:"3fee",239:"3fef",
        240:"3ff0",241:"3ff1",242:"3ff2",243:"3ff3",244:"3ff4",245:"3ff5",246:"3ff6",247:"3ff7",
        248:"3ff8",249:"3ff9",250:"3ffa",251:"3ffb",252:"3ffc",253:"3ffd",254:"ret", 255:"hlt"
    };
    logic [19:0] pc, rg0;
    logic [31:0] opcode;
    string name;

    assign pc = {
        cpu.alu.p19_16.ram[3], cpu.alu.p15_12.ram[3],
        cpu.alu.p11_8.ram[3],  cpu.alu.p7_4.ram[3],
        cpu.alu.p3_0.ram[3] };
    assign rg0 = {
        cpu.busio.b16_19.RG[0], cpu.busio.b12_15.RG[0],
        cpu.busio.b8_11.RG[0],  cpu.busio.b4_7.RG[0],
        cpu.busio.b0_3.RG[0] };
    assign opcode =
        cpu.tkk ? cpu.bus_oDC[31:0] : cpu.bus_oDC[63:32];

    $fwrite(fd, "(%0d) %h %h: %h", ctime, pc, rg0, opcode);
    if ($isunknown(cpu.instr_reg)) begin
        $fdisplay(fd, " *** Unknown");
        return;
    end

    name = cpu.instr_ext ? ext_name[cpu.instr_code] : op_name[cpu.instr_code];
    $fwrite(fd, " %s ", name);
    if (cpu.addr != 0)
        $fwrite(fd, "%h", cpu.addr);
    if (cpu.instr_reg != 0)
        $fwrite(fd, "(%0d)", cpu.instr_reg);
    $fdisplay(fd, "");
endtask

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
        12: "PROM", 13:"13",    14: "RT",   15: "WT"
    };
    static string ydst_name[16] = '{
        0: "-",     1: "MODGN", 2: "PROCN", 3: "CNT",
        4: "PHYSPG",5: "ARBOPC",6: "MUL1",  7: "MUL2",
        8: "ADRREG",9: "PSHIFT",10:"CCLR",  11:"BTRCLR",
        12:"12",    13:"13",    14:"14",    15:"15"
    };
    static string shf_name[4] = '{
        0: "CYCL",  1: "LOG",   2: "ARIPH", 3: "EMULF"
    };
    static string arbi_name[16] = '{
        0: "-",     1: "CCRD",  2: "CCWR",  3: "DCRD",
        4: "DCWR",  5: "5",     6: "6",     7: "7",
        8: "FETCH", 9: "DRD",   10:"DWR",   11:"RDMWR",
        12:"BTRWR", 13:"BTRRD", 14:"BICLR", 15:"BIRD"
    };
    static string bra_name[4] = '{
        0: "RG0",   1: "RG1",   2: "RG2",   3: "RG3"
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
        4: "4",     5: "SETC",  6: "CLRRCB",7: "SETRCB",
        8: "CLRJMP",9: "SETJMP",10:"SETEI", 11:"CLREI",
        12:"CLRTR0",13:"SETTR0",14:"CLRTR1",15:"SETTR1",
        16:"CLRCT", 17:"CLRCTT",18:"CLRTKK",19:"SETTKK",
        20:"SETNR", 21:"STRTLD",22:"SETER", 23:"CHTKK",
        24:"SETHLT",25:"CLRINT",26:"CLRRUN",27:"RDMPCP",
        28:"LDMPCP",29:"LDCPMP",30:"PRGINT",31:"EXTINT"
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

    $fwrite(fd, "(%0d) %h: %s", ctime, pc, sqi_name[SQI]);

    if (A != 0) $fwrite(fd, " %h", A);
    else        $fwrite(fd, "    ");

    if (MAP   != 3)  $fwrite(fd, " map=%0s", map_name[MAP]);
    if (ALU   != 0)  $fwrite(fd, " ALU");
    if (ALUS  != 0)  $fwrite(fd, " alus=%0s", alus_name[ALUS]);
    if (RA    != 0)  $fwrite(fd, " ra=%0s", ra_name[RA]);
    if (FUNC  != 0)  $fwrite(fd, " func=%0s", func_name[FUNC]);
    if (H     != 0)  $fwrite(fd, " H");
    if (ALUD  != 1)  $fwrite(fd, " alud=%0s", alud_name[ALUD]);
    if (RB    != 10) $fwrite(fd, " rb=%0s", rb_name[RB]);
    if (CI    != 0)  $fwrite(fd, " ci=%0s", ci_name[CI]);
    if (SHMUX != 0)  $fwrite(fd, " shmux=%0s", shmux_name[SHMUX]);
    if (STOPC != 20) $fwrite(fd, " stopc=%0s", stopc_name[STOPC]);
    if (MOD   != 0)  $fwrite(fd, " MOD");
    if (DSRC  != 0)  $fwrite(fd, " dsrc=%0s", dsrc_name[DSRC]);
    if (DSRC  == 9)  $fwrite(fd, " shf=%0s", shf_name[SHF]);
    if (CSM   != 0) begin
                     $fwrite(fd, " CSM");
    if (MNSA  != 2)  $fwrite(fd, " mnsa=%0s", mnsa_name[MNSA]);
    if (MODNM != 0)  $fwrite(fd, " modnm=%0s", modnm_name[MODNM]);
    end else
    if (DSRC  == 9 ||
        PSHF  != 64) $fwrite(fd, " pshf=%0d", int'(PSHF) - 64);
    if (YDST  != 0)  $fwrite(fd, " ydst=%0s", ydst_name[YDST]);
    if (ARBI  != 0)  $fwrite(fd, " arbi=%0s", arbi_name[ARBI]);
    if (RLD   != 0)  $fwrite(fd, " RLD");
    if (LETC  != 0)  $fwrite(fd, " LETC");
    if (SCI   != 0)  $fwrite(fd, " SCI");
    if (ICI   != 0)  $fwrite(fd, " ICI");
    if (ICC   != 0)  $fwrite(fd, " ICC");
    if (ISE   != 0)  $fwrite(fd, " ISE");
    if (CEM   != 0)  $fwrite(fd, " CEM");
    if (CEN   != 0)  $fwrite(fd, " CEN");
    if (WEM   != 0)  $fwrite(fd, " WEM");
    if (ECB   != 0)  $fwrite(fd, " ECB");
    if (WRB   != 0)  $fwrite(fd, " WRB");
    if (BRA   != 3 ||
        ECB)         $fwrite(fd, " bra=%0s", bra_name[BRA]);
    if (ECA   != 0)  $fwrite(fd, " ECA");
    if (WRA   != 0)  $fwrite(fd, " WRA");
    if (ARA   != 3 ||
        ECA)         $fwrite(fd, " ara=%0s", bra_name[ARA]);
    if (YDEV  != 0)  $fwrite(fd, " ydev=%0s", ydev_name[YDEV]);
    if (WRY   != 0)  $fwrite(fd, " WRY");
    if (DDEV  != 0)  $fwrite(fd, " ddev=%0s", ddev_name[DDEV]);
    if (WRD   != 0)  $fwrite(fd, " WRD");

    if (IOMP  != 0)
        if (DDEV == 4) $fwrite(fd, " IOMP ffcnt=%0d", FFCNT);
        else           $fwrite(fd, " IOMP mpadr=%0s", mpadr_name[MPADR]);
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
    case (COND)
    16: $fdisplay(fd, "(%0d) *** cond=RUN not implemented yet!", ctime);
    17: $fdisplay(fd, "(%0d) *** cond=NMLRDY not implemented yet!", ctime);
    19: $fdisplay(fd, "(%0d) *** cond=INT not implemented yet!", ctime);
    23: $fdisplay(fd, "(%0d) *** cond=CPMP not implemented yet!", ctime);
    endcase

    if (!IOMP)
        case (FFCNT)
        16: $fdisplay(fd, "(%0d) *** ffcnt=CLRCT not implemented yet!", ctime);
        17: $fdisplay(fd, "(%0d) *** ffcnt=CLRCTT not implemented yet!", ctime);
        25: $fdisplay(fd, "(%0d) *** ffcnt=CLRINT not implemented yet!", ctime);
        26: $fdisplay(fd, "(%0d) *** ffcnt=CLRRUN not implemented yet!", ctime);
        27: $fdisplay(fd, "(%0d) *** ffcnt=RDMPCP not implemented yet!", ctime);
        28: $fdisplay(fd, "(%0d) *** ffcnt=LDMPCP not implemented yet!", ctime);
        29: $fdisplay(fd, "(%0d) *** ffcnt=LDCPMP not implemented yet!", ctime);
        30: $fdisplay(fd, "(%0d) *** ffcnt=PRGINT not implemented yet!", ctime);
        31: $fdisplay(fd, "(%0d) *** ffcnt=EXTINT not implemented yet!", ctime);
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
    static logic [2:0] old_sp;
    static logic [11:0] old_stack0, old_stack1, old_stack2, old_stack3;
    static logic [11:0] old_stack4, old_stack5, old_cnt;

    assign sp = cpu.control.SP;
    assign cnt = cpu.control.Cnt;
    assign stack0 = cpu.control.stack[0];
    assign stack1 = cpu.control.stack[1];
    assign stack2 = cpu.control.stack[2];
    assign stack3 = cpu.control.stack[3];
    assign stack4 = cpu.control.stack[4];
    assign stack5 = cpu.control.stack[5];

    if (sp     !== old_sp)     begin $fdisplay(fd, "(%0d)               Write cu.SP = %h",  ctime, sp);  old_sp  = sp;  end
    if (cnt    !== old_cnt)    begin $fdisplay(fd, "(%0d)               Write cu.Cnt = %h", ctime, cnt); old_cnt = cnt; end
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
    if (rg1 !== old_rg1) begin $fdisplay(fd, "(%0d)               Write bus.RG1 = %h:%h", ctime, rg1[71:64], rg1[63:0]); old_rg1 = rg1; end
    if (rg2 !== old_rg2) begin $fdisplay(fd, "(%0d)               Write bus.RG2 = %h:%h", ctime, rg2[71:64], rg2[63:0]); old_rg2 = rg2; end
    if (rg3 !== old_rg3) begin $fdisplay(fd, "(%0d)               Write bus.RG3 = %h:%h", ctime, rg3[71:64], rg3[63:0]); old_rg3 = rg3; end
endtask

//
// Print changed state of internal CPU registers
//
task print_changed_cpu(
    input logic [112:1] opcode
);
    static string ir_name[32] = '{
        0:"M0",     1:"M1",     2:"M2",     3:"M3",
        4:"M4",     5:"M5",     6:"M6",     7:"M7",
        8:"M8",     9:"M9",     10:"M10",   11:"M11",
        12:"M12",   13:"M13",   14:"M14",   15:"SP",
        16:"C",     17:"RR",    18:"RRR",   19:"SPRADR",
        20:"CTT",   21:"CTL",   22:"CTR",   23:"ACL",
        24:"ACR",   25:"YCL",   26:"YCR",   27:"PCC",
        28:"PCCC",  29:"SVFA",  30:"PROCNC",31:"MREZ"
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
        8: "FETCH", 9: "DRD",   10:"DWR",   11:"RDMWR",
        12:"BTRWR", 13:"BTRRD", 14:"BICLR", 15:"BIRD"
    };
    static logic  [4:0] old_modgn;
    static logic  [7:0] old_procn;
    static logic  [9:0] old_physpg;
    static logic  [3:0] old_arbopc;
    static logic [31:0] old_ureg;
    static logic [10:0] old_pshift;
    static logic [31:0] old_rr;
    static logic [31:0] old_mrmem[1024];
    static logic  [7:0] old_mpmem[16];
    static logic [19:0] old_pgmap[1024];
    static logic [11:0] old_pgprio0[1024];
    static logic [11:0] old_pgprio1[1024];
    static logic        old_pgused[1024];
    static logic        old_pgdirty[1024];
    static logic        old_pgreprio[1024];
    static logic        old_stopm0, old_stopm1, old_halt, old_tkk, old_besm6;

    automatic logic  [4:0] modgn  = cpu.modgn;
    automatic logic  [7:0] procn  = cpu.procn;
    automatic logic  [9:0] physpg = cpu.pg_index;
    automatic logic  [3:0] arbopc = cpu.arb_opc;
    automatic logic [31:0] ureg   = cpu.ureg;
    automatic logic [10:0] pshift = cpu.pshift;
    automatic logic [31:0] rr     = cpu.rr;
    automatic logic        stopm0 = cpu.stopm0;
    automatic logic        stopm1 = cpu.stopm1;
    automatic logic        halt   = cpu.halt;
    automatic logic        tkk    = cpu.tkk;
    automatic logic        besm6  = cpu.besm6_mode;
    automatic logic        csm    = opcode[30];
    automatic logic        wem    = opcode[29];
    automatic logic  [2:0] ydev   = opcode[20:18];
    automatic logic        wry    = opcode[17];
    automatic logic  [2:0] ddev   = opcode[16:14];
    automatic logic        wrd    = opcode[13];
    automatic logic  [4:0] cond   = opcode[6:2];

    //
    // Internal registers
    //
    if (modgn  !== old_modgn)  begin $fdisplay(fd, "(%0d)               Write MODGN = %h",  ctime, modgn);  old_modgn  = modgn;  end
    if (procn  !== old_procn)  begin $fdisplay(fd, "(%0d)               Write PROCN = %h",  ctime, procn);  old_procn  = procn;  end
    if (physpg !== old_physpg) begin $fdisplay(fd, "(%0d)               Write PHYSPG = %h", ctime, physpg); old_physpg = physpg; end
    if (arbopc !== old_arbopc) begin $fdisplay(fd, "(%0d)               Write ARBOPC = %h (%0s)", ctime, arbopc, arbopc_name[arbopc]);
                                                                                                            old_arbopc = arbopc; end
    if (ureg   !== old_ureg)   begin $fdisplay(fd, "(%0d)               Write UREG = %h",   ctime, ureg);   old_ureg   = ureg;   end
    if (rr     !== old_rr)     begin $fdisplay(fd, "(%0d)               Write RR = %h",     ctime, rr);     old_rr     = rr;     end
    if (pshift !== old_pshift) begin $fdisplay(fd, "(%0d)               Write PSHIFT = %h", ctime, pshift); old_pshift = pshift; end
    if (stopm0 !== old_stopm0) begin $fdisplay(fd, "(%0d)               Write STOPM0 = %h", ctime, stopm0); old_stopm0 = stopm0; end
    if (stopm1 !== old_stopm1) begin $fdisplay(fd, "(%1d)               Write STOPM1 = %h", ctime, stopm1); old_stopm1 = stopm1; end
    if (halt   !== old_halt)   begin $fdisplay(fd, "(%1d)               Write HALT = %h",   ctime, halt);   old_halt   = halt;   end
    if (tkk    !== old_tkk)    begin $fdisplay(fd, "(%1d)               Write TKK = %h",    ctime, tkk);    old_tkk    = tkk;    end
    if (besm6  !== old_besm6)  begin $fdisplay(fd, "(%1d)               Write BESM6 = %h",  ctime, besm6);  old_besm6  = besm6;  end

    //
    // Index-registers
    //
    if (csm & wem) begin
        for (int i=old_modgn*32; i<old_modgn*32+32; i+=1)
            if (cpu.mr_mem[i] !== old_mrmem[i]) begin
                $fdisplay(fd, "(%0d)               Write %0s[%0d] = %h",
                    ctime, ir_name[i[4:0]], i[9:5], cpu.mr_mem[i]);
                old_mrmem[i] = cpu.mr_mem[i];
            end
    end

    //
    // I/O memory for console processor
    //
    if (wry && ydev==5) begin
        for (int i=0; i<16; i+=1)
            if (cpu.mpmem[i] !== old_mpmem[i]) begin
                $fdisplay(fd, "(%0d)               Write %0s = %h",
                    ctime, mpadr_name[i], cpu.mpmem[i]);
                old_mpmem[i] = cpu.mpmem[i];
            end
    end

    //
    // Page map
    //
    if (cpu.pg_changed) begin
        cpu.pg_changed = 0;
        for (int i=0; i<1024; i+=1)
            if (cpu.pg_map[i] !== old_pgmap[i]) begin
                $fdisplay(fd, "(%0d)               Write Page[%0d] = %h",
                    ctime, i, cpu.pg_map[i]);
                old_pgmap[i] = cpu.pg_map[i];
            end
        for (int i=0; i<1024; i+=1)
            if (cpu.pg_used[i] !== old_pgused[i]) begin
                $fdisplay(fd, "(%0d)               Write PageUsed[%0d] = %h",
                    ctime, i, cpu.pg_used[i]);
                old_pgused[i] = cpu.pg_used[i];
            end
        for (int i=0; i<1024; i+=1)
            if (cpu.pg_dirty[i] !== old_pgdirty[i]) begin
                $fdisplay(fd, "(%0d)               Write PageDirty[%0d] = %h",
                    ctime, i, cpu.pg_dirty[i]);
                old_pgdirty[i] = cpu.pg_dirty[i];
            end
        for (int i=0; i<1024; i+=1)
            if (cpu.pg_reprio[i] !== old_pgreprio[i]) begin
                $fdisplay(fd, "(%0d)               Write PageReprio[%0d] = %h",
                    ctime, i, cpu.pg_reprio[i]);
                old_pgreprio[i] = cpu.pg_reprio[i];
            end
        for (int i=0; i<1024; i+=1)
            if (cpu.pg_prio0[i] !== old_pgprio0[i]) begin
                $fdisplay(fd, "(%0d)               Write PagePrio0[%0d] = %h",
                    ctime, i, cpu.pg_prio0[i]);
                old_pgprio0[i] = cpu.pg_prio0[i];
            end
        for (int i=0; i<1024; i+=1)
            if (cpu.pg_prio1[i] !== old_pgprio1[i]) begin
                $fdisplay(fd, "(%0d)               Write PagePrio1[%0d] = %h",
                    ctime, i, cpu.pg_prio1[i]);
                old_pgprio1[i] = cpu.pg_prio1[i];
            end
    end
endtask

//
// Print changed state of i8253 timer
//
task print_changed_timer();

    static logic [15:0] old_counter0;
    static logic [15:0] old_counter1;
    static logic [15:0] old_counter2;
    static logic [15:0] old_reload0;
    static logic [15:0] old_reload1;
    static logic [15:0] old_reload2;
    static logic [15:0] old_latch0;
    static logic [15:0] old_latch1;
    static logic [15:0] old_latch2;
    static logic  [5:0] old_control0;
    static logic  [5:0] old_control1;
    static logic  [5:0] old_control2;

    automatic logic [15:0] counter0 = cpu.timer.c0.counter;
    automatic logic [15:0] counter1 = cpu.timer.c1.counter;
    automatic logic [15:0] counter2 = cpu.timer.c2.counter;
    automatic logic [15:0] reload0 = cpu.timer.c0.reload_value;
    automatic logic [15:0] reload1 = cpu.timer.c1.reload_value;
    automatic logic [15:0] reload2 = cpu.timer.c2.reload_value;
    automatic logic [15:0] latch0 = cpu.timer.c0.rd.latch;
    automatic logic [15:0] latch1 = cpu.timer.c1.rd.latch;
    automatic logic [15:0] latch2 = cpu.timer.c2.rd.latch;
    automatic logic  [5:0] control0 = cpu.timer.c0.control_word;
    automatic logic  [5:0] control1 = cpu.timer.c1.control_word;
    automatic logic  [5:0] control2 = cpu.timer.c2.control_word;

    if (counter0 !== old_counter0) begin $fdisplay(fd, "(%0d)               Write timer.Count0 = %h",  ctime, counter0); old_counter0 = counter0; end
    if (counter1 !== old_counter1) begin $fdisplay(fd, "(%0d)               Write timer.Count1 = %h",  ctime, counter1); old_counter1 = counter1; end
    if (counter2 !== old_counter2) begin $fdisplay(fd, "(%0d)               Write timer.Count2 = %h",  ctime, counter2); old_counter2 = counter2; end
    if (reload0  !== old_reload0)  begin $fdisplay(fd, "(%0d)               Write timer.Reload0 = %h", ctime, reload0);  old_reload0  = reload0;  end
    if (reload1  !== old_reload1)  begin $fdisplay(fd, "(%0d)               Write timer.Reload1 = %h", ctime, reload1);  old_reload1  = reload1;  end
    if (reload2  !== old_reload2)  begin $fdisplay(fd, "(%0d)               Write timer.Reload2 = %h", ctime, reload2);  old_reload2  = reload2;  end
    if (latch0   !== old_latch0)   begin $fdisplay(fd, "(%0d)               Write timer.Latch0 = %h",  ctime, latch0);   old_latch0   = latch0;   end
    if (latch1   !== old_latch1)   begin $fdisplay(fd, "(%0d)               Write timer.Latch1 = %h",  ctime, latch1);   old_latch1   = latch1;   end
    if (latch2   !== old_latch2)   begin $fdisplay(fd, "(%0d)               Write timer.Latch2 = %h",  ctime, latch2);   old_latch2   = latch2;   end
    if (control0 !== old_control0) begin $fdisplay(fd, "(%0d)               Write timer.Ctl0 = %h",    ctime, control0); old_control0 = control0; end
    if (control1 !== old_control1) begin $fdisplay(fd, "(%0d)               Write timer.Ctl1 = %h",    ctime, control1); old_control1 = control1; end
    if (control2 !== old_control2) begin $fdisplay(fd, "(%0d)               Write timer.Ctl2 = %h",    ctime, control2); old_control2 = control2; end

endtask

endmodule
