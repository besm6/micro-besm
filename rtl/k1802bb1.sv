//
// K1802BB1 - Multiport RAM 4x4
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

module k1802bb1(
    input  wire        clk,
    input  wire  [3:0] nDA,     // A data bus input...
    output logic [3:0] onDA,    // ...and output
    input  wire  [3:0] nDB,     // B data bus input...
    output logic [3:0] onDB,    // ...and output
    input  wire  [3:0] nDC,     // C data bus input...
    output logic [3:0] onDC,    // ...and output
    input  wire  [3:0] nDX,     // X data bus input...
    output logic [3:0] onDX,    // ...and output

    input  wire  [1:0] AA,      // A address input
    input  wire  [1:0] AB,      // B address input
    input  wire  [1:0] AC,      // C address input
    input  wire  [1:0] AX,      // X address input

    input  wire        nECA,    // A port enable
    input  wire        nECB,    // B port enable
    input  wire        nECC,    // C port enable
    input  wire        nECX,    // X port enable

    input  wire        nWA,     // A write enable
    input  wire        nWB,     // B write enable
    input  wire        nWC,     // C write enable
    input  wire        nWX,     // X write enable

    input  wire        nRA,     // A read enable
    input  wire        nRB,     // B read enable
    input  wire        nRC,     // C read enable
    input  wire        nRX,     // X read enable

    input  wire        nCI,     // counter input
    output logic       nCO,     // counter overflow
    output logic       E        // counter equal flag RG0==RG3
);
timeunit 1ns / 10ps;

// Internal RAM.
// Register RG0 is edge-sensitive,
// registers RG1-RG3 are level sensitive.
logic [3:0] RG[4];

// Output bus enable.
logic outA, outB, outC, outX;
assign outA = !nECA & !nRA;         // bus A output enable
assign outB = !nECB & !nRB;         // bus B output enable
assign outC = !nECC & !nRC;         // bus C output enable
assign outX = !nECX & !nRX;         // bus D output enable

// Select signals.
logic selA0, selA1, selA2, selA3;
assign selA0 = !nECA & (AA == 0);   // port A selects RG0
assign selA1 = !nECA & (AA == 1);   // port A selects RG1
assign selA2 = !nECA & (AA == 2);   // port A selects RG2
assign selA3 = !nECA & (AA == 3);   // port A selects RG3

logic selB0, selB1, selB2, selB3;
assign selB0 = !nECB & (AB == 0);   // port B selects RG0
assign selB1 = !nECB & (AB == 1);   // port B selects RG1
assign selB2 = !nECB & (AB == 2);   // port B selects RG2
assign selB3 = !nECB & (AB == 3);   // port B selects RG3

logic selC0, selC1, selC2, selC3;
assign selC0 = !nECC & (AC == 0);   // port C selects RG0
assign selC1 = !nECC & (AC == 1);   // port C selects RG1
assign selC2 = !nECC & (AC == 2);   // port C selects RG2
assign selC3 = !nECC & (AC == 3);   // port C selects RG3

logic selX0, selX1, selX2, selX3;
assign selX0 = !nECX & (AX == 0);   // port X selects RG0
assign selX1 = !nECX & (AX == 1);   // port X selects RG1
assign selX2 = !nECX & (AX == 2);   // port X selects RG2
assign selX3 = !nECX & (AX == 3);   // port X selects RG3

// Clock and enable signals for RGi.
logic en0, en1, en2, en3;

assign en0 = ((selA0 & !nWA) |     // clock for flip-flop RG0
              (selB0 & !nWB) |
              (selC0 & !nWC) |
              (selX0 & !nWX)) & !nCI;
assign en1 = (selA1 & !nWA) |       // data enable for latch RG1
             (selB1 & !nWB) |
             (selC1 & !nWC) |
             (selX1 & !nWX);
assign en2 = (selA2 & !nWA) |       // data enable for latch RG2
             (selB2 & !nWB) |
             (selC2 & !nWC) |
             (selX2 & !nWX);
assign en3 = (selA3 & !nWA) |       // data enable for latch RG3
             (selB3 & !nWB) |
             (selC3 & !nWC) |
             (selX3 & !nWX);

// Counter overflow bit.
logic CO;

//
// Flip-flop RG0 and latches RG1-RG3.
//
always @(posedge clk)   // rising edge sensitive
    if (en0) begin
        if (nCI)
            {CO, RG[0]} <= RG[0] + 1;
        else begin
            RG[0] <= {4{!outA & !nWA & selA0}} & ~nDA |
                     {4{!outB & !nWB & selB0}} & ~nDB |
                     {4{!outC & !nWC & selC0}} & ~nDC |
                     {4{!outX & !nWX & selX0}} & ~nDX;
            CO <= 0;
        end
    end

always @(negedge clk)   // falling edge sensitive!
    if (en1)
        RG[1] <= {4{!outA & !nWA & selA1}} & ~nDA |
                 {4{!outB & !nWB & selB1}} & ~nDB |
                 {4{!outC & !nWC & selC1}} & ~nDC |
                 {4{!outX & !nWX & selX1}} & ~nDX;

always @(negedge clk)   // falling edge sensitive!
    if (en2)
        RG[2] <= {4{!outA & !nWA & selA2}} & ~nDA |
                 {4{!outB & !nWB & selB2}} & ~nDB |
                 {4{!outC & !nWC & selC2}} & ~nDC |
                 {4{!outX & !nWX & selX2}} & ~nDX;

always @(negedge clk)   // falling edge sensitive!
    if (en3)
        RG[3] <= {4{!outA & !nWA & selA3}} & ~nDA |
                 {4{!outB & !nWB & selB3}} & ~nDB |
                 {4{!outC & !nWC & selC3}} & ~nDC |
                 {4{!outX & !nWX & selX3}} & ~nDX;

// Read RGi.
assign onDA = !outA ? 4'hf :
              selA0 ? ~RG[0] :
              selA1 ? ~RG[1] :
              selA2 ? ~RG[2] :
              selA3 ? ~RG[3] : 4'hf;
assign onDB = !outB ? 4'hf :
              selB0 ? ~RG[0] :
              selB1 ? ~RG[1] :
              selB2 ? ~RG[2] :
              selB3 ? ~RG[3] : 4'hf;
assign onDC = !outC ? 4'hf :
              selC0 ? ~RG[0] :
              selC1 ? ~RG[1] :
              selC2 ? ~RG[2] :
              selC3 ? ~RG[3] : 4'hf;
assign onDX = !outX ? 4'hf :
              selX0 ? ~RG[0] :
              selX1 ? ~RG[1] :
              selX2 ? ~RG[2] :
              selX3 ? ~RG[3] : 4'hf;

// Counter overflow output.
assign nCO = !CO | nCI;

// Compare RG0 and RG3.
assign E = (RG[0] == RG[3]);

endmodule
