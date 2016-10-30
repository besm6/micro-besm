`default_nettype none

//
// External bus arbiter for micro-BESM
//
module arbiter(
    input  wire        clk,
    input  wire        reset,
    input  wire  [3:0] i_request,   // input request

    output logic [1:0] o_arx,       // busio register index
    output logic       o_ecx,       // busio port enable
    output logic       o_wrx,       // busio write enable
    output logic       o_astb,      // memory address strobe
    output logic       o_rd,        // memory read
    output logic       o_wr,        // memory write
    output logic       o_done       // resulting acknowledge
);
timeunit 1ns / 10ps;

always @(posedge clk)
    if (reset) begin
        // Reset everything
        o_arx <= 2'b11;
        o_ecx <= 0;
        o_wrx <= 0;
        o_astb <= 0;
        o_rd <= 0;
        o_wr <= 0;
        o_done <= 1;
    end
    else if (i_request == 0) begin
        // Clear previous request
        o_done <= 0;
    end
    else if (i_request != 0 && o_done == 0) begin
        //TODO: start new operation
        if (testbench.tracefd)
            $fdisplay(testbench.tracefd, "(%0d) *** Arbiter op=%0d not implemented yet!", $time, i_request);
        o_done <= 1;
    end

endmodule
