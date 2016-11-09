`default_nettype none

//
// Test bench for i8253
//
module testbench;

reg         rd, wr, cs, clk, clk_en;
reg   [1:0] a;
reg   [7:0] din;
reg  [15:0] datao;
reg   [7:0] dout;
wire  [2:0] out;
integer     errors;

// Intel 8253 under test
i8253 dut(clk, cs, rd, wr, a, din, dout, out);

// Generate clock, slow, enabled by clk_en
always begin
    #500;
    if (clk_en)
        clk = ~clk;
end

// Write to a register
task write(
    input [1:0] address,
    input [7:0] data
);
    a = address;
    cs = 1;
    din = data;
    #10;
    wr = 1;
    #10;
    wr = 0;
    cs = 0;
endtask

// Read from a register
task read(
    input   [1:0] address,
    output [15:0] data
);
    // Count latching operation
    write(2'b11, {address, 6'b000000});
    #10;
    //$display("read: %b", dout);
    //#10;

    // Read LSB first, then MSB
    write(2'b11, {address, 6'b110000});
    #10;
    //$display("read: %b", dout);
    //#10;

    // Read LSB
    a = address;
    cs = 1;
    #10;
    rd = 1;
    #10;
    $display("read lo: %b", dout);
    data[7:0] = dout;
    rd = 0;
    cs = 0;

    // Read MSB
    a = address;
    cs = 1;
    #10;
    rd = 1;
    #10;
    $display("read hi: %b", dout);
    data[15:8] = dout;
    rd = 0;
    cs = 0;
endtask

initial begin
    $dumpfile("output.vcd");
    $dumpvars();

    // Initialize
    $display("Set up 8253");
    clk_en = 0;
    clk = 0;
    rd = 0;
    wr = 0;
    cs = 0;
    a = '0;
    din = '0;
    errors = 0;

    $display("Read/write registers without clock");

    // Set counter #0 as mode=3, value a55a
    write(2'b11, 8'h36);
    write(2'b00, 8'ha5);
    write(2'b00, 8'h5a);

    // Read it back
    read(0, datao);
    if (datao !== 16'ha55a) begin
        $display("Count wrong: %h", datao);
        errors += 1;
    end




`ifdef notdef
    @(posedge clk);

    // Start Test of Timer 0
    // This involves setting timer 0 to LSB MSB Mode 3 by inputting 36h.
    // The initial timer count is set to 0, which means that a square
    // wave will be generated every 65536 counts
    @(posedge clk);
    $display("************");
    $display("Test Timer 0");
    $display("************");

    // Setup counter #0 as mode 3
    write(2'b11, 8'h36);
    write(2'b00, 8'h00);
    write(2'b00, 8'h00);

    // Loop and be sure that our output is high
    for (int i=0; i<32768; i=i+1) begin
        @(posedge clk);
        if (out[0] !== 1'b1) begin
            $display("ERR OUT NOT 1, %b",out[0]);
            errors += 1;
        end
    end
    // Loop and be sure that our output is low
    for (int i=0; i<32768; i=i+1) begin
        @(posedge clk);
        if (out[0] !== 1'b0) begin
            $display("ERR OUT NOT 0, %b",out[0]);
            errors += 1;
        end
    end
    // Loop and be sure that our output is high
    for (int i=0; i<32768; i=i+1) begin
        @(posedge clk);
        if (out[0] !== 1'b1) begin
            $display("ERR OUT NOT 1, %b",out[0]);
            errors += 1;
        end
    end
    // Loop and be sure that our output is low
    for (int i=0; i<32768; i=i+1) begin
        @(posedge clk);
        if (out[0] !== 1'b0) begin
            $display("ERR OUT NOT 0, %b",out[0]);
            errors += 1;
        end
    end

    // Start Test of Timer 1
    // This involves setting timer 1 to LSB Mode 2 by inputting 54h.
    // The initial timer count is set to 12h, which means that a rate
    // will be generated every 18 counts to refresh memory
    @(posedge clk);
    $display("************");
    $display("Test Timer 1");
    $display("************");

    write(2'b11, 8'h54);
    write(2'b01, 8'h12);

    //@(posedge clk);
    for (int i=0; i<17; i=i+1) begin
        @(posedge clk);
        if (out[1] !== 1'b1) begin
            $display("ERR OUT NOT 1, %b",out[1]);
            errors += 1;
        end
    end
    @(posedge clk);
    if (out[1] !== 1'b0) begin
        $display("ERR OUT NOT 0, %b",out[1]);
        errors += 1;
    end
    // Loop and be sure that our output is low
    for (int i=0; i<17; i=i+1) begin
        @(posedge clk);
        if (out[1] !== 1'b1) begin
            $display("ERR OUT NOT 1, %b",out[1]);
            errors += 1;
        end
    end
    @(posedge clk);
    if (out[1] !== 1'b0) begin
        $display("ERR OUT NOT 0, %b",out[1]);
        errors += 1;
    end
    // Loop and be sure that our output is low
    for (int i=0; i<17; i=i+1) begin
        @(posedge clk);
        if (out[1] !== 1'b1) begin
            $display("ERR OUT NOT 1, %b",out[1]);
            errors += 1;
        end
    end
    @(posedge clk);
    if (out[1] !== 1'b0) begin
        $display("ERR OUT NOT 0, %b",out[1]);
        errors += 1;
    end

    // Start Test of Timer 2
    // This involves setting timer 2 to LSB MSB Mode 3 by inputting b6h.
    // The initial timer count is set to 0533h, which means that a clock
    // of 1331 for the speaker beep
    @(posedge clk);
    $display("************");
    $display("Test Timer 2");
    $display("************");

    write(2'b11, 8'hb6);
    write(2'b10, 8'h33);
    write(2'b10, 8'h05);

    // Loop and be sure that our output is high
    for (int i=0; i<666; i=i+1) begin
        @(posedge clk);
        if (out[2] !== 1'b1) begin
            $display("ERR OUT NOT 1, %b",out[2]);
            errors += 1;
        end
    end
    // Loop and be sure that our output is high
    for (int i=0; i<665; i=i+1) begin
        @(posedge clk);
        if (out[2] !== 1'b1) begin
            $display("ERR OUT NOT 1, %b",out[2]);
            errors += 1;
        end
    end
    // Loop and be sure that our output is high
    for (int i=0; i<666; i=i+1) begin
        @(posedge clk);
        if (out[2] !== 1'b1) begin
            $display("ERR OUT NOT 1, %b",out[2]);
            errors += 1;
        end
    end
    // Loop and be sure that our output is high
    for (int i=0; i<665; i=i+1) begin
        @(posedge clk);
        if (out[2] !== 1'b1) begin
            $display("ERR OUT NOT 1, %b",out[2]);
            errors += 1;
        end
    end

    // Start Test of Timer Test
    // This involves making sure that the time will pass the bios' test
    @(posedge clk);
    $display("***************");
    $display("Test Timer Test");
    $display("***************");

    write(2'b11, 8'h10);
    write(2'b00, 8'h16);

    // Loop and be sure that our output is low
    for (int i=0; i<22; i=i+1) begin
        @(posedge clk);
        if (out[0] !== 1'b0) begin
            $display("ERR OUT NOT 0, %b",out[0]);
            errors += 1;
        end
    end

    // Loop and be sure that our output is high
    for (int i=0; i<51; i=i+1) begin
        @(posedge clk);
        if (out[0] !== 1'b1) begin
            $display("ERR OUT NOT 1, %b",out[0]);
            errors += 1;
        end
    end
    read(0, datao);
    if (datao !== 16'b1111111111001101) begin
        $display("Count wrong: %h", datao);
        errors += 1;
    end

    // Conclude Test
    @(posedge clk);
`endif

    if (errors > 0) begin
        $display("8253 TEST FAILURE WITH %d ERRORS",errors);
    end
    else begin
        $display("8253 TEST SUCCESS");
    end
    $finish();
end

endmodule
