//
// Barrel shifter for micro-BESM
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

module shifter(
    input  wire  [63:0] in,         // input data
    input  wire         psel,       // parameter select
    input  wire   [6:0] param,      // shift amount
    input  wire  [10:0] wide_param, // shift parameter, wide
    input  wire   [1:0] op,         // shift mode
    output logic [63:0] out         // output data
);
timeunit 1ns / 10ps;

//
// Shift direction
//
wire right = psel ? param[6]
                  : wide_param[10];

//
// Shift amount
//
wire [6:0] n = psel ? (right ? {1'b0, param[5:0]}
                             : {1'b0, -param[5:0]})
                    : (right ? wide_param[6:0]
                             : -wide_param[6:0]);

always_comb
    if (right)
        case (op)                           // Right shift

         0: out = {in, in} >> n[5:0];       // cyclic shift

         1: out = in >> n;                  // logical shift

         2: out = n < 64 ?                  // arithmetic shift
                    {{64{in[63]}}, in} >> n :
                    {64{in[63]}};

         3: begin                           // conversion to BESM-6 format
                out = in >> n;
                out = {in[63], {4{~in[63]}}, out[58:0]};
            end
        endcase
    else
        case (op)                           // Left shift

         0: out = {in, in} << n[5:0] >> 64; // cyclic shift

         1: out = in << n;                  // logical shift

         2: out = {in[63], in[62:0] << n};  // arithmetic shift

         3: out = in << n;                  // not used

        endcase
endmodule
