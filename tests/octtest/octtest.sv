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
localparam LABEL_CBOI8  = 30;
localparam LABEL_CBOI9  = 59;
localparam LABEL_CBOI91 = 79;
localparam LABEL_CBOIA  = 108;
localparam LABEL_CBOIB  = 120;
localparam LABEL_CBOIC  = 135;
localparam LABEL_CBOID  = 167;
localparam LABEL_CBOIE  = 206;
localparam LABEL_PSSTF  = 239;
localparam LABEL_CST10  = 280;
localparam LABEL_CST11  = 308;
localparam LABEL_CST12  = 347;
localparam LABEL_CST13  = 381;
localparam LABEL_CST14  = 423;
localparam LABEL_CST15  = 476;
localparam LABEL_CST25  = 534;
localparam LABEL_CST16  = 581;
localparam LABEL_CST17  = 665;
localparam LABEL_CST18  = 695;
localparam LABEL_CST19  = 732;
localparam LABEL_CST1A  = 768;
localparam LABEL_CST1B  = 827;
localparam LABEL_CMODF  = 889;
localparam LABEL_CMOD15 = 899;
localparam LABEL_MC19   = 914;
localparam LABEL_MC29   = 936;
localparam LABEL_MC39   = 963;
localparam LABEL_CMOD1B = 984;
localparam LABEL_CMOD1D = 994;
localparam LABEL_CCA4   = 1012;
localparam LABEL_CADR28 = 1087;
localparam LABEL_CADR29 = 1129;
localparam LABEL_CADR2A = 1160;
localparam LABEL_CADR2B = 1190;
localparam LABEL_CADR2C = 1218;
localparam LABEL_CADR2D = 1250;
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
    // БОИ данных
    //
    check_jump(LABEL_CBOI6+2, LABEL_CBOI6, LABEL_PSBOI7-1, "Test CBOI6 pass");
    check_pass(LABEL_CBOI7,  "Test CBOI7 pass");
    check_pass(LABEL_CBOI8,  "Test CBOI8 pass");
    check_pass(LABEL_CBOI9,  "Test CBOI9 pass");
    check_pass(LABEL_CBOI91, "Test CBOI91 pass");

    //
    // БОИ данных и тега
    //
    check_pass(LABEL_CBOIA,  "Test CBOIA pass");
    check_pass(LABEL_CBOIB,  "Test CBOIB pass");
    check_pass(LABEL_CBOIC,  "Test CBOIC pass");
    check_pass(LABEL_CBOID,  "Test CBOID pass");
    check_pass(LABEL_CBOIE,  "Test CBOIE pass");

    //
    // Стандартизатор команд
    //
    check_jump(LABEL_PSSTF-1, LABEL_PSSTF, LABEL_CST10-6, "Skip CICTF");
    check_pass(LABEL_CST10,  "Test CST10 pass");
    check_pass(LABEL_CST11,  "Test CST11 pass");
    check_pass(LABEL_CST12,  "Test CST12 pass");
    check_pass(LABEL_CST13,  "Test CST13 pass");
    check_pass(LABEL_CST14,  "Test CST14 pass");
    check_pass(LABEL_CST15,  "Test CST15 pass");
    check_pass(LABEL_CST25,  "Test CST25 pass");
    check_pass(LABEL_CST16,  "Test CST16 pass");
    check_pass(LABEL_CST17,  "Test CST17 pass");
    check_pass(LABEL_CST18,  "Test CST18 pass");
    check_pass(LABEL_CST19,  "Test CST19 pass");
    check_pass(LABEL_CST1A,  "Test CST1A pass");
    check_pass(LABEL_CST1B,  "Test CST1B pass");

    //
    // Память модификаторов с БОИ
    //
    check_pass(LABEL_CMODF,  "Test CMODF pass");
    check_pass(LABEL_CMOD15, "Test CMOD15 pass");
    check_pass(LABEL_MC19,   "Test MC19 pass");
    check_pass(LABEL_MC29,   "Test MC29 pass");
    check_pass(LABEL_MC39,   "Test MC39 pass");
    check_pass(LABEL_CMOD1B, "Test CMOD1B pass");
    check_pass(LABEL_CMOD1D, "Test CMOD1D pass");

    //
    // Изменение регистра КОП арбитра после физ.адреса
    //
    check_pass(LABEL_CCA4,   "Test CCA4 pass");

    //
    // Физ.адрес + запись N страницы в РФС + изменение БОБР, БИЗМ
    //
    check_pass(LABEL_CADR28, "Test CADR28 pass");
    check_pass(LABEL_CADR29, "Test CADR29 pass");
    check_pass(LABEL_CADR2A, "Test CADR2A pass");
    check_pass(LABEL_CADR2B, "Test CADR2B pass");
    check_pass(LABEL_CADR2C, "Test CADR2C pass");
    check_pass(LABEL_CADR2D, "Test CADR2D pass");

    if (pc_x == LABEL_INCR2D+2) begin
        message("Test PASS");
        $display("--------------------------------");
        $finish(0);
    end
end

endmodule
