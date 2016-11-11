`default_nettype none

//
// Run initest.
// See initest.src for sources.
//
module testbench();

// Global time parameters.
timeunit 1ns / 10ps;

// Inputs.
logic        clk, reset;
logic [63:0] i_data;
logic  [7:0] i_tag;

// Outputs.
logic [63:0] o_ad;                      // address/data output
logic  [7:0] o_tag;                     // tag output
logic        o_astb;                    // address strobe
logic        o_rd;                      // read op
logic        o_wr;                      // write op

// Instantiate CPU.
cpu cpu(clk, reset, i_data, i_tag,
    o_ad, o_tag, o_astb, o_rd, o_wr);

// Setup trace moninor.
tracer tr();
logic [19:0] waddr;                     // needed for tracer

//--------------------------------------------------------------
// Microinstruction ROM.
//
logic [111:0] memory[4096] = '{
    `include "../microcode/initest.v"
    default: '0
};

string tracefile = "output.trace";
int limit;
int trace;                              // Trace level
int tracefd;                            // Trace file descriptor
time ctime;                             // Current time
logic [11:0] pc_x;                      // Current PC address at execution stage
logic [112:1] opcode_x;                 // Current opcode at execution stage

//
// Generate clock 500MHz.
//
always #1 clk = ~clk;

//
// Main loop.
//
initial begin
    $display("");
    $display("--------------------------------");

    // Dump waveforms.
    if ($test$plusargs("dump")) begin
        $dumpfile("output.vcd");
        $dumpvars();
    end

    // Enable detailed instruction trace to file.
    trace = 2;
    $display("Generate trace file %0S", tracefile);
    tracefd = $fopen(tracefile, "w");

    // Limit the simulation by specified number of cycles.
    if (! $value$plusargs("limit=%d", limit)) begin
        // Default limit value.
        limit = 100000;
        $display("Limit: %0d", limit);
        $fdisplay(tracefd, "Limit: %0d", limit);
    end

    cpu.memory = memory;

    // Start with reset active
    clk = 1;
    reset = 1;

    // Hold reset for a while.
    #2 reset = 0;

    // Run until limit.
    #limit begin
        $display("\n----- Time Limit Exceeded -----");
        $fdisplay(tracefd, "\n----- Time Limit Exceeded -----");
        $finish(1);
    end
end

//
// Print a message to stdout and trace file
//
task message(input string msg);
    $display("*** %s", msg);
    $fdisplay(tracefd, "(%0d) *** %s", ctime, msg);
endtask

//
// Print message when test passes the label.
//
task check_pass(input int label, input string msg);
    logic  [3:0] sqi;
    logic [11:0] a;
    assign sqi = opcode_x[112:109];
    assign a   = opcode_x[108:97];

    // Look for CONT operation with given address
    if (sqi == 14 && a == label)
        message(msg);
endtask

//
// Check for a jump from label `from' to label `to'.
// When jump detected, consider the test passed and
// go instead to the target address.
//
task check_jump(
    input int label_from,
    input int label_to,
    input int target,
    input string msg
);
    if (pc_x == label_from && tr.pc_f == label_to) begin
        message(msg);
        tr.pc_x = target;
        cpu.control.uPC = target;
        cpu.opcode = cpu.memory[target];
        tr.opcode_x = cpu.opcode;
    end
endtask

//
// Addresses of initest.
//
localparam LABEL_PSBU1  = 1;
localparam LABEL_MPU1   = 6;
localparam LABEL_ERRINI = 7;
localparam LABEL_PSBU2  = 9;
localparam LABEL_LBU2   = 20;
localparam LABEL_PSBU3  = 22;
localparam LABEL_LBU3   = 32;
localparam LABEL_PSBU4  = 34;
localparam LABEL_BU5    = 52;
localparam LABEL_PSBU5  = 53;
localparam LABEL_BU6    = 81;
localparam LABEL_PSBU6  = 82;
localparam LABEL_LBU6   = 90;
localparam LABEL_PSBU7  = 92;
localparam LABEL_LBU7   = 99;
localparam LABEL_PSBU8  = 101;
localparam LABEL_PSBU9  = 107;
localparam LABEL_LABL9  = 115;
localparam LABEL_PSBUA  = 117;
localparam LABEL_MICB   = 140;
localparam LABEL_PSMICB = 141;
localparam LABEL_PSMIB1 = 147;
localparam LABEL_PSMICC = 153;
localparam LABEL_PSMICD = 162;
localparam LABEL_PSMID1 = 168;
localparam LABEL_PSMICE = 174;
localparam LABEL_PSMIE1 = 181;
localparam LABEL_PSMI14 = 191;
localparam LABEL_PSMIE2 = 204;
localparam LABEL_PSMIE3 = 211;
localparam LABEL_PSMI11 = 221;
localparam LABEL_PSMI12 = 235;
localparam LABEL_PSMI13 = 244;
localparam LABEL_PSM131 = 278;
localparam LABEL_PSMI10 = 312;
localparam LABEL_RPMI15 = 322;
localparam LABEL_PSMI16 = 328;
localparam LABEL_PSM161 = 334;
localparam LABEL_PSMI17 = 344;
localparam LABEL_RPMI18 = 355;
localparam LABEL_RPMI19 = 359;
localparam LABEL_PSMI1A = 362;
localparam LABEL_PSMI1B = 372;
localparam LABEL_PSMI1C = 382;
localparam LABEL_PSMI1D = 389;
localparam LABEL_PSMI1E = 396;
localparam LABEL_PSMI1F = 401;
localparam LABEL_PSMI20 = 406;
localparam LABEL_CSH1   = 413;
localparam LABEL_STSH1M = 428;
localparam LABEL_STSH1N = 437;
localparam LABEL_CSH2   = 441;
localparam LABEL_STSH3  = 455;
localparam LABEL_STSH4  = 463;
localparam LABEL_PSPMP2 = 467;
localparam LABEL_PSPMP3 = 472;
localparam LABEL_PSPMP4 = 487;
localparam LABEL_CROM1  = 502;
localparam LABEL_CMPU5  = 508;
localparam LABEL_CMPU6  = 517;
localparam LABEL_CMPU7  = 533;
localparam LABEL_CMPU8  = 548;
localparam LABEL_CMPU9  = 557;
localparam LABEL_CMPUA  = 566;
localparam LABEL_CMPUB  = 581;
localparam LABEL_CMPUC  = 594;
localparam LABEL_CMPUD  = 604;
localparam LABEL_CMPUE  = 618;
localparam LABEL_CCTF   = 630;
localparam LABEL_CCT10  = 639;
localparam LABEL_CCT11  = 648;
localparam LABEL_CCT12  = 657;
localparam LABEL_CCT13  = 666;
localparam LABEL_CCT14  = 677;
localparam LABEL_CCT15  = 688;
localparam LABEL_CCT16  = 695;
localparam LABEL_CCT17  = 708;
localparam LABEL_CCT18  = 717;
localparam LABEL_CMPS19 = 741;
localparam LABEL_CMPS1A = 749;
localparam LABEL_CMPS1B = 761;
localparam LABEL_CMPS1C = 787;
localparam LABEL_CMPS1D = 795;
localparam LABEL_CMPS1E = 808;
localparam LABEL_CMPS1F = 831;
localparam LABEL_CMPS20 = 846;
localparam LABEL_CMPS21 = 863;
localparam LABEL_CMPS22 = 872;
localparam LABEL_CMPS23 = 882;
localparam LABEL_CMPS24 = 890;
localparam LABEL_CH25   = 901;
localparam LABEL_CH26   = 916;
localparam LABEL_CH27   = 938;
localparam LABEL_CH28   = 954;
localparam LABEL_CH29   = 969;
localparam LABEL_CMPS2A = 978;
localparam LABEL_CMPS2B = 986;
localparam LABEL_CMPS2C = 997;
localparam LABEL_CC31   = 1005;
localparam LABEL_CC32   = 1076;
localparam LABEL_CTG2D  = 1092;
localparam LABEL_CTG2E  = 1110;
localparam LABEL_CTG2F  = 1125;
localparam LABEL_CTG30  = 1137;
localparam LABEL_CTG31  = 1150;
localparam LABEL_CTG32  = 1161;
localparam LABEL_CTG33  = 1173;
localparam LABEL_CTG34  = 1193;
localparam LABEL_LABL35 = 1227;
localparam LABEL_CROM2  = 1300;
localparam LABEL_CROM3  = 1321;
localparam LABEL_CSH5   = 1346;
localparam LABEL_CSH6   = 1355;
localparam LABEL_CSH7   = 1368;
localparam LABEL_CSH8   = 1383;
localparam LABEL_CSH9   = 1396;
localparam LABEL_CSHA   = 1409;
localparam LABEL_CSHB   = 1424;
localparam LABEL_CSHC   = 1437;
localparam LABEL_CSHD   = 1450;
localparam LABEL_CSHE   = 1465;
localparam LABEL_CSHF   = 1478;
localparam LABEL_CSH10  = 1491;
localparam LABEL_CSH11  = 1504;
localparam LABEL_CSH12  = 1523;
localparam LABEL_CSH13  = 1542;
localparam LABEL_CSH14  = 1558;
localparam LABEL_CSH15  = 1576;
localparam LABEL_CSH16  = 1589;
localparam LABEL_CSH17  = 1600;
localparam LABEL_CSH18  = 1611;
localparam LABEL_CSH19  = 1622;
localparam LABEL_CSH1A  = 1634;
localparam LABEL_CSH1B  = 1649;
localparam LABEL_CSH1C  = 1665;
localparam LABEL_CSH1D  = 1683;
localparam LABEL_CSH1E  = 1697;
localparam LABEL_CSH1F  = 1711;
localparam LABEL_CSH20  = 1726;
localparam LABEL_CSH21  = 1741;
localparam LABEL_CSH22  = 1758;
localparam LABEL_S22    = 1766;
localparam LABEL_ERRTST = 1832;
localparam LABEL_ERRINF = 1834;
localparam LABEL_ERRINH = 1836;
localparam LABEL_ERR8F  = 1956;

// Get time at the rising edge of the clock.
always @(posedge clk) begin
    ctime = $time;
    pc_x = tr.pc_x;
    opcode_x = tr.opcode_x;
end

// At negative clock edge, when all the signals are quiet,
// analyze the state of the processor.
always @(tr.instruction_retired) begin
    // In case of failure, the tests stop at label ERR*
    if (pc_x == LABEL_ERRINI || pc_x == LABEL_ERRTST ||
        pc_x == LABEL_ERRINF || pc_x == LABEL_ERRINH ||
        pc_x == LABEL_ERR8F) begin
        message("Test FAIL");
        $display("--------------------------------");
        $finish(1);
    end

    //
    // Проверка последовательности исполнения команд в БМПУ
    //
    check_jump(LABEL_MPU1,    LABEL_PSBU1, pc_x+2,     "Test CONT+CJP pass");
    check_jump(LABEL_LBU2,    LABEL_PSBU2, pc_x+2,     "Test LDCT+RPCT pass");
    check_jump(LABEL_LBU3,    LABEL_PSBU3, pc_x+2,     "Test JRP pass");
    check_jump(LABEL_PSBU4+2, LABEL_PSBU4, LABEL_BU5,  "Test CJS+CRTN pass");
    check_jump(LABEL_PSBU5+4, LABEL_PSBU5, LABEL_BU6,  "Test CJPP pass");
    check_jump(LABEL_LBU6,    LABEL_PSBU6, pc_x+1,     "Test PUSH pass");
    check_jump(LABEL_LBU7,    LABEL_PSBU7, pc_x+1,     "Test PUSH+LOOP pass");
    check_jump(LABEL_PSBU8+4, LABEL_PSBU8, pc_x+1,     "Test RFCT pass");
    check_jump(LABEL_LABL9,   LABEL_PSBU9, pc_x+1,     "Test JSRP pass");
    check_jump(LABEL_PSBUA+6, LABEL_PSBUA, LABEL_MICB, "Test TWB pass");

    //
    // Проверка всех сигналов, вырабатываемых микропрограммой
    //
    check_jump(LABEL_PSMICB+4, LABEL_PSMICB, pc_x+1,  "Test MAP pass");
    check_jump(LABEL_PSMIB1+4, LABEL_PSMIB1, pc_x+1,  "Test A pass");
    check_jump(LABEL_PSMICC+7, LABEL_PSMICC, pc_x+1,  "Test YDEV=MPMEM pass");
    check_jump(LABEL_PSMICD+4, LABEL_PSMICD, pc_x+1,  "Test ALUS+FUNC+ALUD+RA+RB pass");
    check_jump(LABEL_PSMID1+4, LABEL_PSMID1, pc_x+1,  "Test SHMUX+ALUD+STOPC+CI+CEM+CEN pass");
    check_jump(LABEL_PSMICE+5, LABEL_PSMICE, pc_x+1,  "Test MNSA+MODNM pass");
    check_jump(LABEL_PSMIE1+8, LABEL_PSMIE1, pc_x+1,  "Test ARA+BRA+ECA+ECB+WRA+WRB pass");
    check_jump(LABEL_PSMI14+11, LABEL_PSMI14, pc_x+1, "Test ARBI pass");
    check_jump(LABEL_PSMIE2+5, LABEL_PSMIE2, pc_x+1,  "Test SCI+ISE+LETC pass");
    check_jump(LABEL_PSMIE3+8, LABEL_PSMIE3, pc_x+1,  "Test CYSTR pass");
    check_jump(LABEL_PSMI11+12, LABEL_PSMI11, pc_x+1, "Test DSRC+YDST pass");
    check_jump(LABEL_PSMI12+7, LABEL_PSMI12, pc_x+1,  "Test YDEV+DDEV+WRY+WRD pass");
    check_jump(LABEL_PSMI13+32, LABEL_PSMI13, pc_x+1, "Test COND pass");
    check_jump(LABEL_PSM131+32, LABEL_PSM131, pc_x+1, "Test FFCNT pass");
    check_jump(LABEL_PSMI10+4, LABEL_PSMI10, pc_x+1,  "Test YDEVT pass");

    //
    // МПС + БОПП
    //
    check_jump(LABEL_RPMI15+4, LABEL_RPMI15, pc_x+1,  "Test ALU+Console pass");

    //
    // ПЗУ
    //
    check_jump(LABEL_PSMI16+4, LABEL_PSMI16, pc_x+1,  "Test DSRC=PROM pass");
    check_jump(LABEL_PSM161+8, LABEL_PSM161, pc_x+1,  "Test DSRC=PROM #2 pass");

    //
    // Сдвигатель
    //
    check_jump(LABEL_PSMI17+8, LABEL_PSMI17, pc_x+1,  "Test rotate-1-left pass");
    check_jump(LABEL_RPMI18+1, LABEL_RPMI18, pc_x+1,  "Test rotate-1-left #2 pass");
    check_jump(LABEL_RPMI19+1, LABEL_RPMI19, pc_x+1,  "Test rotate-1-right pass");
    check_jump(LABEL_PSMI1A+8, LABEL_PSMI1A, pc_x+1,  "Test shift-1-left pass");
    check_jump(LABEL_PSMI1B+8, LABEL_PSMI1B, pc_x+1,  "Test shift-1-right pass");
    check_jump(LABEL_PSMI1C+5, LABEL_PSMI1C, pc_x+1,  "Test arith.shift-16-right pass");
    check_jump(LABEL_PSMI1D+5, LABEL_PSMI1D, pc_x+1,  "Test arith.shift-16-right #2 pass");
    check_jump(LABEL_PSMI1E+3, LABEL_PSMI1E, pc_x+1,  "Test arith.shift-32-left pass");
    check_jump(LABEL_PSMI1F+3, LABEL_PSMI1F, pc_x+1,  "Test arith.shift-32-left #2 pass");
    check_jump(LABEL_PSMI20+3, LABEL_PSMI20, pc_x+1,  "Test shift-32-right pass");
    check_jump(LABEL_CSH1+6,   LABEL_CSH1,   pc_x+1,  "Test shift-left pass");
    check_jump(LABEL_STSH1M,   LABEL_STSH1M, pc_x+1,  "Test shift-left #2 pass");
    check_jump(LABEL_STSH1N,   LABEL_STSH1N, pc_x+1,  "Test shift-right pass");
    check_jump(LABEL_CSH2+6,   LABEL_CSH2,   pc_x+1,  "Test shift-right #2 pass");
    check_jump(LABEL_STSH3,    LABEL_STSH3,  pc_x+1,  "Test arith.shift-left pass");
    check_jump(LABEL_STSH4,    LABEL_STSH4,  pc_x+1,  "Test arith.shift-right pass");

    if (pc_x == LABEL_PSMI20+3 && tr.pc_f == LABEL_PSMI20) begin
        // Before shift-left test, we need to provide
        // a shift count in mpmem[7] byte.
        cpu.mpmem[7] <= 3;
    end

    //
    // Чтение, запись блока обмена с ПП
    //
    check_jump(LABEL_PSPMP2+1, LABEL_PSPMP2, pc_x+1,  "Test console pass");
    check_jump(LABEL_PSPMP3+11, LABEL_PSPMP3, pc_x+1, "Test console #2 pass");
    check_jump(LABEL_PSPMP4+11, LABEL_PSPMP4, pc_x+1, "Test console #3 pass");
    check_jump(LABEL_CROM1+2,  LABEL_CROM1,  pc_x+1,  "Test console #4 pass");

    //
    // Большой тест
    //
    check_pass(LABEL_CMPU5,  "Test CMPU5 pass");
    check_pass(LABEL_CMPU6,  "Test CMPU6 pass");
    check_pass(LABEL_CMPU7,  "Test CMPU7 pass");
    check_pass(LABEL_CMPU8,  "Test CMPU8 pass");
    check_pass(LABEL_CMPU9,  "Test CMPU9 pass");
    check_pass(LABEL_CMPUA,  "Test CMPUA pass");
    check_pass(LABEL_CMPUB,  "Test CMPUB pass");
    check_pass(LABEL_CMPUC,  "Test CMPUC pass");
    check_pass(LABEL_CMPUD,  "Test CMPUD pass");
    check_pass(LABEL_CMPUE,  "Test CMPUE pass");
    check_pass(LABEL_CCTF,   "Test CCTF pass");
    check_pass(LABEL_CCT10,  "Test CCT10 pass");
    check_pass(LABEL_CCT11,  "Test CCT11 pass");
    check_pass(LABEL_CCT12,  "Test CCT12 pass");
    check_pass(LABEL_CCT13,  "Test CCT13 pass");
    check_pass(LABEL_CCT14,  "Test CCT14 pass");
    check_pass(LABEL_CCT15,  "Test CCT15 pass");
    check_pass(LABEL_CCT16,  "Test CCT16 pass");
    check_pass(LABEL_CCT17,  "Test CCT17 pass");
    check_pass(LABEL_CCT18,  "Test CCT18 pass");
    check_pass(LABEL_CMPS19, "Test CMPS19 pass");
    check_pass(LABEL_CMPS1A, "Test CMPS1A pass");
    check_pass(LABEL_CMPS1B, "Test CMPS1B pass");
    check_pass(LABEL_CMPS1C, "Test CMPS1C pass");
    check_pass(LABEL_CMPS1D, "Test CMPS1D pass");
    check_pass(LABEL_CMPS1E, "Test CMPS1E pass");
    check_pass(LABEL_CMPS1F, "Test CMPS1F pass");
    check_pass(LABEL_CMPS20, "Test CMPS20 pass");
    check_pass(LABEL_CMPS21, "Test CMPS21 pass");
    check_pass(LABEL_CMPS22, "Test CMPS22 pass");
    check_pass(LABEL_CMPS23, "Test CMPS23 pass");
    check_pass(LABEL_CMPS24, "Test CMPS24 pass");
    check_pass(LABEL_CH25,   "Test CH25 pass");
    check_pass(LABEL_CH26,   "Test CH26 pass");
    check_pass(LABEL_CH27,   "Test CH27 pass");
    check_pass(LABEL_CH28,   "Test CH28 pass");
    check_pass(LABEL_CH29,   "Test CH29 pass");
    check_pass(LABEL_CMPS2A, "Test CMPS2A pass");
    check_pass(LABEL_CMPS2B, "Test CMPS2B pass");
    check_pass(LABEL_CMPS2C, "Test CMPS2C pass");
    check_pass(LABEL_CC31,   "Test CC31 pass");
    check_pass(LABEL_CC32,   "Test CC32 pass");
    check_pass(LABEL_CTG2D,  "Test CTG2D pass");
    check_pass(LABEL_CTG2E,  "Test CTG2E pass");
    check_pass(LABEL_CTG2F,  "Test CTG2F pass");
    check_pass(LABEL_CTG30,  "Test CTG30 pass");
    check_pass(LABEL_CTG31,  "Test CTG31 pass");
    check_pass(LABEL_CTG32,  "Test CTG32 pass");
    check_pass(LABEL_CTG33,  "Test CTG33 pass");
    check_pass(LABEL_CTG34,  "Test CTG34 pass");
    check_pass(LABEL_LABL35, "Test LABL35 pass");
    check_pass(LABEL_CROM2,  "Test CROM2 pass");
    check_pass(LABEL_CROM3,  "Test CROM3 pass");
    check_pass(LABEL_CSH5,   "Test CSH5 pass");
    check_pass(LABEL_CSH6,   "Test CSH6 pass");
    check_pass(LABEL_CSH7,   "Test CSH7 pass");
    check_pass(LABEL_CSH8,   "Test CSH8 pass");
    check_pass(LABEL_CSH9,   "Test CSH9 pass");
    check_pass(LABEL_CSHA,   "Test CSHA pass");
    check_pass(LABEL_CSHB,   "Test CSHB pass");
    check_pass(LABEL_CSHC,   "Test CSHC pass");
    check_pass(LABEL_CSHD,   "Test CSHD pass");
    check_pass(LABEL_CSHE,   "Test CSHE pass");
    check_pass(LABEL_CSHF,   "Test CSHF pass");
    check_pass(LABEL_CSH10,  "Test CSH10 pass");
    check_pass(LABEL_CSH11,  "Test CSH11 pass");
    check_pass(LABEL_CSH12,  "Test CSH12 pass");
    check_pass(LABEL_CSH13,  "Test CSH13 pass");
    check_pass(LABEL_CSH14,  "Test CSH14 pass");
    check_pass(LABEL_CSH15,  "Test CSH15 pass");
    check_pass(LABEL_CSH16,  "Test CSH16 pass");
    check_pass(LABEL_CSH17,  "Test CSH17 pass");
    check_pass(LABEL_CSH18,  "Test CSH18 pass");
    check_pass(LABEL_CSH19,  "Test CSH19 pass");
    check_pass(LABEL_CSH1A,  "Test CSH1A pass");
    check_pass(LABEL_CSH1B,  "Test CSH1B pass");
    check_pass(LABEL_CSH1C,  "Test CSH1C pass");
    check_pass(LABEL_CSH1D,  "Test CSH1D pass");
    check_pass(LABEL_CSH1E,  "Test CSH1E pass");
    check_pass(LABEL_CSH1F,  "Test CSH1F pass");
    check_pass(LABEL_CSH20,  "Test CSH20 pass");
    check_pass(LABEL_CSH21,  "Test CSH21 pass");
    check_pass(LABEL_CSH22,  "Test CSH22 pass");

    if (pc_x == LABEL_S22+4) begin
        message("Test PASS");
        $display("--------------------------------");
        $finish(0);
    end
end

endmodule
