module testbench();

    // Input signals
    logic [8:0] I;
    logic [3:0] Aadd, Badd;
    logic [3:0] D;
    logic       RAM0, RAM3, Q0, Q3;
    logic       clk, C0, OEbar;

    // Output signals
    logic [3:0] Y;
    logic       RAM0out, RAM3out, Q0out, Q3out;
    logic       C4, Gbar, Pbar, OVR, F3, F30;

    // Device under test
    am2904 dut (
        I,
        Aadd, Badd,
        D,
        Y,
        RAM0, RAM3, Q0, Q3,
        RAM0out, RAM3out, Q0out, Q3out,
        clk, C0, OEbar,
        C4, Gbar, Pbar, OVR, F3, F30
    );

    // Status
    bit fail;

    // Read value from the variable.
    task verify(input check, input string message);
        if (!check) begin
            $display ("%s", message);
            fail = 1;
        end
    endtask

initial begin
$display("------------------------");
fail = 0;

// ************************
// *                      *
// * TEST VECTORS FOR ALU *
// *                      *
// ************************
// ******** ADDITION  R + S ********
//------------------------

clk <= 1;		// Cycle No: 0
#1;

I <= 'b000000111;
D <= 'b0000;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1
#1;

I <= 'b001000110;
D <= 'b0000;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b0000, "Assert 0 : < Y !== 'b0000 >");	// Vector No: 0
verify(C4 === 0, "Assert 1 : < C4 !== 0 >");
verify(Gbar === 1, "Assert 2 : < Gbar !== 1 >");
verify(Pbar === 1, "Assert 3 : < Pbar !== 1 >");
verify(OVR === 0, "Assert 4 : < OVR !== 0 >");
verify(F3 === 0, "Assert 5 : < F3 !== 0 >");
verify(F30 === 1, "Assert 6 : < F30 !== 1 >");
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 2
#1;

I <= 'b000000111;
D <= 'b0000;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 3
#1;

I <= 'b001000110;
D <= 'b0000;
C0 <= 1;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b0001, "Assert 7 : < Y !== 'b0001 >");	// Vector No: 1
verify(C4 === 0, "Assert 8 : < C4 !== 0 >");
verify(Gbar === 1, "Assert 9 : < Gbar !== 1 >");
verify(Pbar === 1, "Assert 10 : < Pbar !== 1 >");
verify(OVR === 0, "Assert 11 : < OVR !== 0 >");
verify(F3 === 0, "Assert 12 : < F3 !== 0 >");
verify(F30 === 0, "Assert 13 : < F30 !== 0 >");
#1;

//TODO

// ************************
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
