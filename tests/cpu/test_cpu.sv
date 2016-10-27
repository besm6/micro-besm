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

//
// 1Mword of tagged RAM
//
logic [63:0] mem[1024*1024];            // main RAM
logic  [7:0] tag[1024*1024];            // tags
logic [19:0] waddr;                     // latched word address

always @(posedge clk) begin
    if (o_astb) begin
        waddr = o_ad[19:0];             // Address latch

    end else if (o_wr) begin
        mem[waddr] = o_ad;              // Memory store
        tag[waddr] = o_tag;

    end else if (o_rd) begin
        i_data = mem[waddr];            // Memory load
        i_tag = tag[waddr];
    end
end

string tracefile = "output.trace";
string wavefile = "output.vcd";
string uprog = "micro-BESM";            // Input file name with microprogram
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
        $display("    +uprog=NAME       Load microprogram code");
        $display("    +limit=NUM        Limit execution to a number of cycles (default %0d)", limit);
        $display("    +dump             Dump waveforms to file %s", wavefile);
        $display("");
        $finish(1);
    end
    $display("--------------------------------");

    if ($value$plusargs("uprog=%s", uprog)) begin
        // Load microprogram code.
        load_uprog();
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
        $fdisplay(tracefd, "Trace file for %0S\n", uprog);
    end

    // Limit the simulation by specified number of cycles.
    if (! $value$plusargs("limit=%d", limit)) begin
        // Default limit value.
        limit = 100000;
        $display("Limit: %0d", limit);
        if (trace)
            $fdisplay(tracefd, "Limit: %0d", limit);
    end

    // Start with reset active
    clk = 1;
    reset = 1;

    // Hold reset for a while.
    #10 reset = 0;

    // Run until limit.
    #limit begin
        $display("\n----- Time Limit Exceeded -----");
        if (trace)
            $fdisplay(tracefd, "\n----- Time Limit Exceeded -----");
        $finish(1);
    end
end

//
// Load microprogram code, optional.
//
task load_uprog();
    int fd, i, count;
    string line;
    logic [111:0] opcode;

    // Open file with microcode image.
    fd = $fopen(uprog, "r");
    if (fd == 0) begin
        $error("%s: Cannot open", uprog);
        $finish(1);
    end

    // Clear the microprogram memory.
    for (i=0; i<4096; i+=1) begin
        cpu.memory[4096] = '0;
    end

    // Read microcode image.
    count = 0;
    while ($fgets(line, fd)) begin
        if (line[0] == "/")
            continue;

        if ($sscanf(line, "%d: 112'h%x,", i, opcode) == 2) begin
            //$display("%8d: %028x", i, opcode);
            cpu.memory[i] = opcode;
            count += 1;
        end
    end
    $fclose(fd);
    $display("Load %0d instructions from %s.", count, uprog);
endtask

endmodule
