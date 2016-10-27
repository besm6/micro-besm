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
// Test switcher.
//
initial begin
    forever begin
        // Wait for instruction, valid on leading edge of clk
        wait(clk);

        // Wait until everything is stable
        wait(!clk);

        if (tr.pc_x == 7) begin
            // At label ERRINI
            $display("Test CONT+CJP failed!");
            $fdisplay(tracefd, "Test CONT+CJP failed!");
            $finish(1);
        end
        if (tr.pc_x == 6 && tr.pc_f == 1) begin
            // Jump from MPU1 to label PSBU1
            $display("Test CONT+CJP pass");
            $fdisplay(tracefd, "Test CONT+CJP pass");

            // Next test
            tr.pc_x <= tr.pc_x + 2;
            cpu.control.uPC <= tr.pc_x + 2;
            cpu.opcode <= cpu.memory[tr.pc_x + 2];
        end
    end
end

endmodule
