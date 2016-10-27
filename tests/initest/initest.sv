`default_nettype none

// Global time parameters.
timeunit 1ns;
timeprecision 10ps;

module testbench();

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
string wavefile = "output.vcd";
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
    $dumpfile(wavefile);
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
task message(string msg);
    $display("*** %s", msg);
    $fdisplay(tracefd, "(%0d) *** %s", ctime, msg);
endtask

//
// Check for a jump from label `from' to label `to'.
// When jump detected, consider the test passed and
// go instead to the target address.
//
task check_pass(int label_from, int label_to, int target, string msg);
    if (pc_x == label_from && tr.pc_f == label_to) begin
        message(msg);
        tr.pc_x = target;
        cpu.control.uPC = target;
        cpu.opcode = cpu.memory[target];
    end
endtask

//
// Addresses of initest.
//
localparam LABEL_PSBU1  = 1;
localparam LABEL_MPU1   = 6;
localparam LABEL_ERRINI = 7;
localparam LABEL_PSBU2  = 9;
localparam LABEL_LBU2   = 'h14;

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

        if (pc_x == LABEL_ERRINI) begin
            // At label ERRINI
            message("Test CONT+CJP failed!");
            $finish(1);
        end
        check_pass(LABEL_MPU1, LABEL_PSBU1, pc_x+2, "Test CONT+CJP pass");
        check_pass(LABEL_LBU2, LABEL_PSBU2, pc_x+2, "Test LDCT+RPCT pass");
        //TODO
    end
end

endmodule
