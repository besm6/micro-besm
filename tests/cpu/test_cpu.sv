// Global time parameters.
timeunit 1ns;
timeprecision 10ps;

module testbench();

// Inputs.
logic clk, reset;

// Instantiate CPU.
cpu cpu(clk, reset);

// Setup trace moninor.
tracer tr(clk, reset);

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

endmodule
