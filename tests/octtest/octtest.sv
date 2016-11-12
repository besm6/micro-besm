`default_nettype none

//
// Run octtest.
// See octtest.src for sources.
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
    `include "../microcode/octtest.v"
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
    // Look for CONT operation with given address
    if (opcode_x[112:109] == 14 &&      // sqi: CONT
        opcode_x[96:95]   == 0 &&       // map: PE
        opcode_x[108:97]  == label)     // a: target address
        message(msg);
endtask

//
// Jump to a specified address.
//
task jump(input int target);
    tr.pc_x = target;
    cpu.control.uPC = target;
    cpu.opcode = cpu.memory[target];
    tr.opcode_x = cpu.opcode;
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
        jump(target);
    end
endtask

//
// Addresses of octtest.
//
localparam LABEL_PSBOI6 = 1;
localparam LABEL_CBOI6  = 3;
localparam LABEL_PSBOI7 = 7;
localparam LABEL_CBOI7  = 13;

localparam LABEL_INCR2D = 1270;
localparam LABEL_ERRTST = 1277;
localparam LABEL_ERRINF = 1279;
localparam LABEL_ERRINH = 1281;

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
    if (pc_x == LABEL_ERRTST || pc_x == LABEL_ERRINF ||
        pc_x == LABEL_ERRINH) begin
        message("Test FAIL");
        $display("--------------------------------");
        $finish(1);
    end

    //
    // Поиск левой единицы
    //
    check_jump(LABEL_CBOI6+2, LABEL_CBOI6, LABEL_PSBOI7-1, "Test CBOI6 pass");
    check_pass(LABEL_CBOI7,  "Test CBOI7 pass");

    //TODO

    if (pc_x == LABEL_INCR2D+2) begin
        message("Test PASS");
        $display("--------------------------------");
        $finish(0);
    end
end

endmodule
