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
$dumpfile("test.vcd");
$dumpvars();
fail = 0;
clk = 0;

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
// * Set all inputs high
// 11_11111_111111:-:1:1:1:1:1:1:1:1:1:1:1:1:1:1:1:'z:'z:'z:'z:1:'z:1:-:1:1:1:1:1:'z:'z:'z:'z:
//------------------------

#2;
I <= 'b11_11111_111111;
nCEm <= 1;
nCEu <= 1;
nOEy <= 1;
Ic <= 1;
Iovr <= 1;
In <= 1;
Iz <= 1;
nEz <= 1;
nEc <= 1;
nEn <= 1;
nEovr <= 1;
Yz <= 1;
Yc <= 1;
Yn <= 1;
Yovr <= 1;
nOEct <= 1;
Cx <= 1;
nSE <= 1;
SIO0 <= 1;
SIOn <= 1;
QIO0 <= 1;
QIOn <= 1;
#2;
clk <= 1;		// Cycle No: 1
#2;

verify(oYz === 'z, "Assert 0 : < oYz !== 'z >");	// Vector No: 0
verify(oYc === 'z, "Assert 1 : < oYc !== 'z >");
verify(oYn === 'z, "Assert 2 : < oYn !== 'z >");
verify(oYovr === 'z, "Assert 3 : < oYovr !== 'z >");
verify(CT === 'z, "Assert 4 : < CT !== 'z >");
verify(oSIO0 === 'z, "Assert 5 : < oSIO0 !== 'z >");
verify(oSIOn === 'z, "Assert 6 : < oSIOn !== 'z >");
verify(oQIO0 === 'z, "Assert 7 : < oQIO0 !== 'z >");
verify(oQIOn === 'z, "Assert 8 : < oQIOn !== 'z >");
#2;
clk <= 0;

// * Clear uSR; nCEu=0; nOEy=0; read oY
// 00_00000_000011:-:-:0:0:-:-:-:-:-:-:-:-:-:-:-:-:0:0:0:0:1:'z:1:0:-:-:-:-:-:-:-:-:-:
//------------------------

#2;
I <= 'b00_00000_000011;
nCEu <= 0;
nOEy <= 0;
nOEct <= 1;
Cx <= 1;
#2;
clk <= 1;		// Cycle No: 2
#2;

verify(oYz === 0, "Assert 9 : < oYz !== 0 >");	// Vector No: 1
verify(oYc === 0, "Assert 10 : < oYc !== 0 >");
verify(oYn === 0, "Assert 11 : < oYn !== 0 >");
verify(oYovr === 0, "Assert 12 : < oYovr !== 0 >");
verify(CT === 'z, "Assert 13 : < CT !== 'z >");
verify(Co === 0, "Assert 14 : < Co !== 0 >");
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
#4;
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
