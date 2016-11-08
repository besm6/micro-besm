//
// Am2902 - High-Speed Look-Ahead Carry Generator
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

module am2902(
    input  wire  Cin,       // Carry-in input N
    input  wire  nG0,       // Generate term input 0
    input  wire  nP0,       // Propagate term input 0
    input  wire  nG1,       // Generate term input 1
    input  wire  nP1,       // Propagate term input 1
    input  wire  nG2,       // Generate term input 2
    input  wire  nP2,       // Propagate term input 2
    input  wire  nG3,       // Generate term input 3
    input  wire  nP3,       // Propagate term input 3
    output logic Cout1,     // Carry-out output N+1
    output logic Cout2,     // Carry-out output N+2
    output logic Cout3,     // Carry-out output N+3
    output logic nG,        // Generate term output
    output logic nP         // Propagate term output
);
timeunit 1ns / 10ps;

// According to datasheet:
// Cout1 = G0 | (P0 & Cin)
// Cout2 = G1 | (P1 & G0) | (P1 & P0 & Cin)
// Cout3 = G2 | (P2 & G1) | (P2 & P1 & G0) | (P2 & P1 & P0 & Cin)
// G = G3 | (P3 & G2) | (P3 & P2 & G1) | (P3 & P2 & P1 & G0)
// P = P3 & P2 & P1 & P0

assign Cout1 = !nG0 | (!nP0 & Cin);
assign Cout2 = !nG1 | (!nP1 & !nG0) | (!nP1 & !nP0 & Cin);
assign Cout3 = !nG2 | (!nP2 & !nG1) | (!nP2 & !nP1 & !nG0) | (!nP2 & !nP1 & !nP0 & Cin);
assign nG = !(!nG3 | (!nP3 & !nG2) | (!nP3 & !nP2 & !nG1) | (!nP3 & !nP2 & !nP1 & !nG0));
assign nP = !(!nP3 & !nP2 & !nP1 & !nP0);

endmodule
