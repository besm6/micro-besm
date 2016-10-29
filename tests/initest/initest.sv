`default_nettype none

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

//
// Generate clock at 100MHz.
//
always #5 clk = ~clk;

//
// Main loop.
//
initial begin
    $display("");
    $display("--------------------------------");

    // Dump waveforms.
    $dumpfile("output.vcd");
    $dumpvars();

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
    #10 reset = 0;

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
// Check for a jump from label `from' to label `to'.
// When jump detected, consider the test passed and
// go instead to the target address.
//
task check_pass(
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

//
// Test switcher.
//
initial begin
    forever begin
        // Wait for instruction, valid on leading edge of clk
        wait(clk);
        ctime = $time;
        pc_x = tr.pc_x;

        // Wait until everything is stable
        wait(!clk);
        #1;

        // In case of failure, the tests stop at label ERRINI
        if (pc_x == LABEL_ERRINI) begin
            message("Test FAIL");
            $finish(1);
        end

        //
        // Проверка последовательности исполнения команд в БМПУ
        //
        check_pass(LABEL_MPU1,    LABEL_PSBU1, pc_x+2,     "Test CONT+CJP pass");
        check_pass(LABEL_LBU2,    LABEL_PSBU2, pc_x+2,     "Test LDCT+RPCT pass");
        check_pass(LABEL_LBU3,    LABEL_PSBU3, pc_x+2,     "Test JRP pass");
        check_pass(LABEL_PSBU4+2, LABEL_PSBU4, LABEL_BU5,  "Test CJS+CRTN pass");
        check_pass(LABEL_PSBU5+4, LABEL_PSBU5, LABEL_BU6,  "Test CJPP pass");
        check_pass(LABEL_LBU6,    LABEL_PSBU6, pc_x+1,     "Test PUSH pass");
        check_pass(LABEL_LBU7,    LABEL_PSBU7, pc_x+1,     "Test PUSH+LOOP pass");
        check_pass(LABEL_PSBU8+4, LABEL_PSBU8, pc_x+1,     "Test RFCT pass");
        check_pass(LABEL_LABL9,   LABEL_PSBU9, pc_x+1,     "Test JSRP pass");
        check_pass(LABEL_PSBUA+6, LABEL_PSBUA, LABEL_MICB, "Test TWB pass");

        //
        // Проверка всех сигналов, вырабатываемых микропрограммой
        //
        check_pass(LABEL_PSMICB+4, LABEL_PSMICB, pc_x+1,  "Test MAP pass");
        check_pass(LABEL_PSMIB1+4, LABEL_PSMIB1, pc_x+1,  "Test A pass");
        check_pass(LABEL_PSMICC+7, LABEL_PSMICC, pc_x+1,  "Test YDEV=MPMEM pass");
        check_pass(LABEL_PSMICD+4, LABEL_PSMICD, pc_x+1,  "Test ALUS+FUNC+ALUD+RA+RB pass");
        check_pass(LABEL_PSMID1+4, LABEL_PSMID1, pc_x+1,  "Test SHMUX+ALUD+STOPC+CI+CEM+CEN pass");
        check_pass(LABEL_PSMICE+5, LABEL_PSMICE, pc_x+1,  "Test MNSA+MODNM pass");
        check_pass(LABEL_PSMIE1+8, LABEL_PSMIE1, pc_x+1,  "Test ARA+BRA+ECA+ECB+WRA+WRB pass");
        check_pass(LABEL_PSMI14+11, LABEL_PSMI14, pc_x+1, "Test ARBI pass");
        check_pass(LABEL_PSMIE2+5, LABEL_PSMIE2, pc_x+1,  "Test SCI+ISE+LETC pass");
        check_pass(LABEL_PSMIE3+8, LABEL_PSMIE3, pc_x+1,  "Test CYSTR pass");
        check_pass(LABEL_PSMI11+12, LABEL_PSMI11, pc_x+1, "Test DSRC+YDST pass");
        check_pass(LABEL_PSMI12+7, LABEL_PSMI12, pc_x+1,  "Test YDEV+DDEV+WRY+WRD pass");
        check_pass(LABEL_PSMI13+32, LABEL_PSMI13, pc_x+1, "Test COND pass");
        check_pass(LABEL_PSM131+32, LABEL_PSM131, pc_x+1, "Test FFCNT pass");
        check_pass(LABEL_PSMI10+4, LABEL_PSMI10, pc_x+1,  "Test YDEVT pass");

        //
        // МПС + БОПП
        //
        check_pass(LABEL_RPMI15+4, LABEL_RPMI15, pc_x+1,  "Test ALU+Console pass");

        //
        // ПЗУ
        //
        check_pass(LABEL_PSMI16+4, LABEL_PSMI16, pc_x+1,  "Test DSRC=PROM pass");
        check_pass(LABEL_PSM161+8, LABEL_PSM161, pc_x+1,  "Test DSRC=PROM #2 pass");

        //
        // Сдвигатель
        //

        //TODO
    end
end

endmodule
