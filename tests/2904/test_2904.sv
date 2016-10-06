module testbench();

    // Input signals
    logic [12:0] I;
    logic        clk, nCEm, nCEu, nOEy;
    logic        Ic, Iovr, In, Iz;
    logic        nEz, nEc, nEn, nEovr;
    logic        Yz, Yc, Yn, Yovr;
    logic        nOEct;
    logic        Cx;
    logic        nSE, SIO0, SIOn, QIO0, QIOn;

    // Output signals
    logic        oYz, oYc, oYn, oYovr;
    logic        CT;
    logic        Co;
    logic        oSIO0, oSIOn, oQIO0, oQIOn;

    // Device under test
    am2904 dut (
        I,
        clk, nCEm, nCEu, nOEy,
        Ic, Iovr, In, Iz,
        nEz, nEc, nEn, nEovr,
        Yz, Yc, Yn, Yovr,
        oYz, oYc, oYn, oYovr,
        nOEct, CT,
        Cx, Co,
        nSE, SIO0, SIOn, QIO0, QIOn,
        oSIO0, oSIOn, oQIO0, oQIOn
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

// *****************************************************
// *                                                   *
// *   Simulation test vectors (binary format) for     *
// *   the Am2904 status and shift control unit        *
// *                                                   *
// *   Developed on Oct 5, 2016 by Serge Vakulenko     *
// *                                                   *
// *****************************************************
// **************************
// *                        *
// * Micro Status Register  *
// *                        *
// **************************
// * Clear uSR and MSR; nOEy=0; read oY
// 00_00000_000011:-:-:-:0:-:-:-:-:-:-:-:-:-:-:-:-:0:0:0:0:-:-:-:-:-:-:-:-:-:-:-:-:-:
//------------------------

#2;
I <= 'b00_00000_000011;
nOEy <= 0;
#2;
clk <= 1;		// Cycle No: 1
#2;

verify(oYz === 0, "Assert 0 : < oYz !== 0 >");	// Vector No: 0
verify(oYc === 0, "Assert 1 : < oYc !== 0 >");
verify(oYn === 0, "Assert 2 : < oYn !== 0 >");
verify(oYovr === 0, "Assert 3 : < oYovr !== 0 >");
#2;

clk <= 0;
// ***************************
// *                         *
// * Machine Status Register *
// *                         *
// ***************************
// * TODO
// ******************************
// *                            *
// * Condition Code Multiplexer *
// *                            *
// ******************************
// * TODO
// ******************************
// *                            *
// * Shift Linkage Multiplexer  *
// *                            *
// ******************************
// * TODO
// ********************************
// *                              *
// * Carry-In Control Multiplexer *
// *                              *
// ********************************
// * TODO
// **************************************************
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
