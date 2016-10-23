module testbench();

    // Inputs.
    logic [63:0] word;          // instruction word
    logic        pe;            // besm6 compatibility
    logic        tkk;           // right half

    // Outputs.
    logic  [3:0] ir;            // modifier index
    logic  [7:0] op;            // opcode
    logic        extop;         // extended opcode flag
    logic [19:0] addr;          // address

    bit [3:0] n;

    decoder dut(word, pe, tkk,
        ir, op, extop, addr);

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
