`default_nettype none

//
// Test bench for i8253
//
module testbench;

reg         rd, wr, cs, clk, clk_en;
reg   [1:0] a;
reg   [7:0] din;
reg  [15:0] data0, data1, data2;
reg   [7:0] dout;
wire        out0, out1, out2;
integer     errors;

//
// Intel 8253 under test
//
i8253 dut(clk, cs, rd, wr, a, din, dout, out0, out1, out2);

//
// Generate clock, slow, enabled by clk_en
//
always begin
    #500;
    if (clk_en)
        clk = ~clk;
end

//
// Write to a register
//
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

//
// Write to control register
//
task write_ctl(
    input [1:0] address,
    input [5:0] data
);
    write(3, {address, data});
endtask

//
// Write to counter register
//
task write_cnt(
    input  [1:0] address,
    input [15:0] data
);
    write(address, data[7:0]);
    write(address, data[15:8]);
endtask

// Read from a register
task read(
    input   [1:0] address,
    output [15:0] data
);
    // Count latching operation
    write_ctl(address, 6'b000000);
    #10;
    //$display("read: %b", dout);
    //#10;

    // Read LSB first, then MSB
    write_ctl(address, 6'b110000);
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
    $display("------------------------");
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

    // Set counter #0 as mode 0, value 1234
    write_ctl(0, 6'h30);
    write_cnt(0, 16'h1234);

    // Set counter #1 as mode 0, value 5678
    write_ctl(1, 6'h30);
    write_cnt(1, 16'h5678);

    // Set counter #2 as mode 0, value 9abc
    write_ctl(2, 6'h30);
    write_cnt(2, 16'h9abc);

    // Generate one clock pulse.
    clk_en = 1;
    @(posedge clk);
    @(negedge clk);
    clk_en = 0;

    // Read it back
    read(0, data0);
    read(1, data1);
    read(2, data2);
    if (data0 !== 'h1234) begin
        $display("Counter #0 wrong: %h", data0);
        errors += 1;
    end
    if (data1 !== 'h5678) begin
        $display("Counter #1 wrong: %h", data1);
        errors += 1;
    end
    if (data2 !== 'h9abc) begin
        $display("Counter #2 wrong: %h", data2);
        errors += 1;
    end

    // Start Test of Timer 0
    // This involves setting timer 0 to LSB MSB Mode 3 by inputting 36h.
    // The initial timer count is set to 20
    $display("************");
    $display("Test Timer 0");
    $display("************");

    // Setup counter #0 as mode 3
    write_ctl(0, 6'h36);
    write_cnt(0, 20);

    // Enable clock.
    clk_en = 1;
    @(posedge clk);

    // Loop and be sure that our output is high
    for (int i=0; i<32768; i+=1) begin
        @(posedge clk);
        if (out0 !== 1) begin
            $display("(%0d) Wrong out=%b", $time, out0);
            errors += 1;
        end
    end
    // Loop and be sure that our output is low
    for (int i=0; i<32768; i+=1) begin
        @(posedge clk);
        if (out0 !== 0) begin
            $display("(%0d) Wrong out=%b", $time, out0);
            errors += 1;
        end
    end
    // Loop and be sure that our output is high
    for (int i=0; i<32768; i+=1) begin
        @(posedge clk);
        if (out0 !== 1) begin
            $display("(%0d) Wrong out=%b", $time, out0);
            errors += 1;
        end
    end
    // Loop and be sure that our output is low
    for (int i=0; i<32768; i+=1) begin
        @(posedge clk);
        if (out0 !== 0) begin
            $display("(%0d) Wrong out=%b", $time, out0);
            errors += 1;
        end
    end

`ifdef notdef
    // Start Test of Timer 1
    // This involves setting timer 1 to LSB Mode 2 by inputting 54h.
    // The initial timer count is set to 12h, which means that a rate
    // will be generated every 18 counts to refresh memory
    @(posedge clk);
    $display("************");
    $display("Test Timer 1");
    $display("************");

    write_ctl(1, 6'h14);
    write_cnt(1, 18);

    //@(posedge clk);
    for (int i=0; i<17; i+=1) begin
        @(posedge clk);
        if (out1 !== 1) begin
            $display("ERR OUT NOT 1, %b", out1);
            errors += 1;
        end
    end
    @(posedge clk);
    if (out1 !== 0) begin
        $display("ERR OUT NOT 0, %b", out1);
        errors += 1;
    end
    // Loop and be sure that our output is low
    for (int i=0; i<17; i+=1) begin
        @(posedge clk);
        if (out1 !== 1) begin
            $display("ERR OUT NOT 1, %b", out1);
            errors += 1;
        end
    end
    @(posedge clk);
    if (out1 !== 0) begin
        $display("ERR OUT NOT 0, %b", out1);
        errors += 1;
    end
    // Loop and be sure that our output is low
    for (int i=0; i<17; i+=1) begin
        @(posedge clk);
        if (out1 !== 1) begin
            $display("ERR OUT NOT 1, %b", out1);
            errors += 1;
        end
    end
    @(posedge clk);
    if (out1 !== 0) begin
        $display("ERR OUT NOT 0, %b", out1);
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

    write_ctl(2, 6'h36);
    write_cnt(2, 1331);

    // Loop and be sure that our output is high
    for (int i=0; i<666; i+=1) begin
        @(posedge clk);
        if (out2 !== 1) begin
            $display("ERR OUT NOT 1, %b", out2);
            errors += 1;
        end
    end
    // Loop and be sure that our output is high
    for (int i=0; i<665; i+=1) begin
        @(posedge clk);
        if (out2 !== 1) begin
            $display("ERR OUT NOT 1, %b", out2);
            errors += 1;
        end
    end
    // Loop and be sure that our output is high
    for (int i=0; i<666; i+=1) begin
        @(posedge clk);
        if (out2 !== 1) begin
            $display("ERR OUT NOT 1, %b", out2);
            errors += 1;
        end
    end
    // Loop and be sure that our output is high
    for (int i=0; i<665; i+=1) begin
        @(posedge clk);
        if (out2 !== 1) begin
            $display("ERR OUT NOT 1, %b", out2);
            errors += 1;
        end
    end

    // Start Test of Timer Test
    // This involves making sure that the time will pass the bios' test
    @(posedge clk);
    $display("***************");
    $display("Test Timer Test");
    $display("***************");

    write_ctl(0, 8'h10);
    write_cnt(0, 22);

    // Loop and be sure that our output is low
    for (int i=0; i<22; i+=1) begin
        @(posedge clk);
        if (out0 !== 0) begin
            $display("ERR OUT NOT 0, %b", out0);
            errors += 1;
        end
    end

    // Loop and be sure that our output is high
    for (int i=0; i<51; i+=1) begin
        @(posedge clk);
        if (out0 !== 1) begin
            $display("ERR OUT NOT 1, %b", out0);
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
        $display("Test FAIL");
        $display("------------------------");
        $finish(1);
    end
    $display("Test PASS");
    $display("------------------------");
    $finish;
end

endmodule
