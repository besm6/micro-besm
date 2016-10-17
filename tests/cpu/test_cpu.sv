module testbench();

    // Inputs.
    logic clk, reset;

    cpu dut(clk, reset);

    // Status
    bit fail;

    // Read value from the variable.
    task verify(input check, input string message);
        if (!check) begin
            $display ("%s", message);
            fail = 1;
        end
    endtask

always begin
    clk <= 0;
    #1;
    clk <= 1;
    #1;
end

initial begin
$display("------------------------");
$dumpfile("test.vcd");
$dumpvars();
fail = 0;

//------------------------

// Initial state
reset <= 1;
#4;
reset <= 0;

//TODO
#4

//------------------------
#1;
if (fail) begin
    $display("Test FAIL");
    $display("------------------------");
    $finish(1);
end
$display("Test PASS");
$display("------------------------");
$finish;

end

endmodule
