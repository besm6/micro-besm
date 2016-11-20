//
// 1Mword of tagged RAM
//
// Copyright (c) 2016 Serge Vakulenko
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//
`default_nettype none

module tmemory(
    input  wire         clk,            // clock
    input  wire  [63:0] i_ad,           // address/data input
    input  wire   [7:0] i_tag,          // tag bus input
    input  wire         i_astb,         // address strobe
    input  wire         i_atomic,       // r-m-w transaction
    input  wire         i_rd,           // read op
    input  wire         i_wr,           // write op
    output logic [63:0] o_data,         // data bus input
    output logic  [7:0] o_tag           // tag output
);
timeunit 1ns / 10ps;

logic [63:0] mem[1024*1024];            // main RAM
logic  [7:0] tag[1024*1024];            // tags
logic [19:0] waddr;                     // latched word address
logic [19:0] laddr;                     // last r/w address

always @(posedge clk) begin
    if (i_astb) begin
        laddr = waddr;                  // remember address of last r/w
        waddr = i_ad[19:0];             // address latch

    end else if (i_wr) begin
        if (i_atomic)                   // read-modify-write, set bit 55
            mem[waddr] = {i_ad[63:56], 1'b1, i_ad[54:0]};
        else
            mem[waddr] = i_ad;          // memory store

        tag[waddr] = i_tag;

        if (! i_atomic)
            waddr = waddr + 1;          // increment address for batch mode

    end else if (i_rd) begin
        case (waddr)
        'hfffff: begin                  // read Hamming syndrome
                o_data = 0;
                o_tag = 0;
            end
        'hffffe: begin                  // read address latch
                o_data = laddr;
                o_tag = 0;
            end
        'hffffd: begin                  // error correction mode
                o_data = 0;
                o_tag = 0;
            end
        default: begin                  // memory load
                o_data = mem[waddr];
                o_tag = tag[waddr];
                if (! i_atomic)
                    waddr = waddr + 1;  // increment address for batch mode
            end
        endcase
    end
end

endmodule
