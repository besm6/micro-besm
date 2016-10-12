module testbench();

    // Inputs.
    logic [3:0] nDA, nDB, nDC, nDX;
    logic [1:0] AA, AB, AC, AX;
    logic nECA, nECB, nECC, nECX;
    logic nWA, nWB, nWC, nWX;
    logic nRA, nRB, nRC, nRX;
    logic nCI;

    // Outputs.
    logic [3:0] out_nDA, out_nDB, out_nDC, out_nDX;
    logic nCO, E;

    bit [3:0] n;

    k1802bb1 dut(
        nDA, out_nDA, nDB, out_nDB, nDC, out_nDC, nDX, out_nDX,
        AA, AB, AC, AX,             // address
        nECA, nECB, nECC, nECX,     // enable channel
        nWA, nWB, nWC, nWX,         // write strobe
        nRA, nRB, nRC, nRX,         // read strobe
        nCI,                        // counter input
        nCO,                        // counter input
        E);                         // compare output

    // Status
    bit fail;

    // Read value from the variable.
    task verify(input check, input string message);
        if (!check) begin
            $display ("%s", message);
            fail = 1;
        end
    endtask

    task verify4(logic [3:0] rval, logic [3:0] val, input string message);
        if (rval !== val) begin
            $display ("Assert %s: 'b%04b !== 'b%04b", message, rval, val);
            fail = 1;
        end
    endtask

    // Write data to register RG0-RG3 via port A..X.
    task write_A(logic [1:0] r, logic [3:0] val);
        AA = r; nDA = ~val; nECA = 0; nWA = 0; #1; nWA = 1; #1; nECA = 1; #1;
    endtask
    task write_B(logic [1:0] r, logic [3:0] val);
        AB = r; nDB = ~val; nECB = 0; nWB = 0; #1; nWB = 1; #1; nECB = 1; #1;
    endtask
    task write_C(logic [1:0] r, logic [3:0] val);
        AC = r; nDC = ~val; nECC = 0; nWC = 0; #1; nWC = 1; #1; nECC = 1; #1;
    endtask
    task write_X(logic [1:0] r, logic [3:0] val);
        AX = r; nDX = ~val; nECX = 0; nWX = 0; #1; nWX = 1; #1; nECX = 1; #1;
    endtask

    // Read data from register RG0-RG3 via port A..X, and verify.
    task read_A(logic [1:0] r, logic [3:0] val);
        logic [3:0] rval;
        AA = r; nECA = 0; nRA = 0; #1; rval = ~out_nDA; #1; nRA = 1; nECA = 1; #1;
        verify4(rval, val, "read_A");
    endtask
    task read_B(logic [1:0] r, logic [3:0] val);
        logic [3:0] rval;
        AB = r; nECB = 0; nRB = 0; #1; rval = ~out_nDB; #1; nRB = 1; nECB = 1; #1;
        verify4(rval, val, "read_B");
    endtask
    task read_C(logic [1:0] r, logic [3:0] val);
        logic [3:0] rval;
        AC = r; nECC = 0; nRC = 0; #1; rval = ~out_nDC; #1; nRC = 1; nECC = 1; #1;
        verify4(rval, val, "read_C");
    endtask
    task read_X(logic [1:0] r, logic [3:0] val);
        logic [3:0] rval;
        AX = r; nECX = 0; nRX = 0; #1; rval = ~out_nDX; #1; nRX = 1; nECX = 1; #1;
        verify4(rval, val, "read_X");
    endtask

    // Read and verify values of registers RG0-RG3.
    task read_and_verify();
        read_A(0, n);           // Read A: RG0 -> n
        read_B(1, n+1);         //      B: RG1 -> n+1
        read_C(2, n+2);         //      C: RG2 -> n+2
        read_X(3, n+3);         //      D: RG3 -> n+3

        read_A(1, n+1);         // Read A: RG1 -> n+1
        read_B(2, n+2);         //      B: RG2 -> n+2
        read_C(3, n+3);         //      C: RG3 -> n+3
        read_X(0, n);           //      D: RG0 -> n

        read_A(2, n+2);         // Read A: RG2 -> n+2
        read_B(3, n+3);         //      B: RG3 -> n+3
        read_C(0, n);           //      C: RG0 -> n
        read_X(1, n+1);         //      D: RG1 -> n+1

        read_A(3, n+3);         // Read A: RG3 -> n+3
        read_B(0, n);           //      B: RG0 -> n
        read_C(1, n+1);         //      C: RG1 -> n+1
        read_X(2, n+2);         //      D: RG2 -> n+2
    endtask

initial begin
$display("------------------------");
$dumpfile("test.vcd");
$dumpvars();
fail = 0;

//------------------------

// Initial state
nDA <= 'b1111;
nDB <= 'b1111;
nDC <= 'b1111;
nDX <= 'b1111;
AA <= 'b11;
AB <= 'b11;
AC <= 'b11;
AX <= 'b11;
nECA <= 1;
nECB <= 1;
nECC <= 1;
nECX <= 1;
nWA <= 1;
nWB <= 1;
nWC <= 1;
nWX <= 1;
nRA <= 1;
nRB <= 1;
nRC <= 1;
nRX <= 1;
nCI <= 0;
#1;

verify(out_nDA === 4'hz, "Assert 0:  out_nDA !== 4'hz");    // Vector No: 0
verify(out_nDB === 4'hz, "Assert 1: out_nDB !== 4'hz");
verify(out_nDC === 4'hz, "Assert 2: out_nDC !== 4'hz");
verify(out_nDX === 4'hz, "Assert 3: out_nDX !== 4'hz");
#1;

//------------------------
n = 0;
write_A(0, n);          // Write A: n   -> RG0
write_B(1, n+1);        //       B: n+1 -> RG1
write_C(2, n+2);        //       C: n+2 -> RG2
write_X(3, n+3);        //       D: n+3 -> RG3

verify(nCO === 1, "Assert 4: nCO !== 0");
verify(E === 0, "Assert 5: E !== 0");

read_and_verify();

//------------------------
n += 3;
write_A(1, n+1);        // Write A: n+1 -> RG1
write_B(2, n+2);        //       B: n+2 -> RG2
write_C(3, n+3);        //       C: n+3 -> RG3
write_X(0, n);          //       D: n   -> RG0

read_and_verify();

//------------------------
n += 7;
write_A(2, n+2);        // Write A: n+2 -> RG2
write_B(3, n+3);        //       B: n+3 -> RG3
write_C(0, n);          //       C: n   -> RG0
write_X(1, n+1);        //       D: n+1 -> RG1

read_and_verify();

//------------------------
n += 9;
write_A(3, n+3);        // Write A: n+3 -> RG3
write_B(0, n);          //       B: n   -> RG0
write_C(1, n+1);        //       C: n+1 -> RG1
write_X(2, n+2);        //       D: n+2 -> RG2

read_and_verify();

//------------------------
//TODO: check counter mode

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
