//
// External bus interface, based on K1802BB1 four-port 4-bit RAM chip.
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

module extbus(
    input  wire         clk,
    input  wire  [63:0] DA,     // A data bus input...
    output logic [63:0] oDA,    // ...and output (tag from RG2)
    input  wire  [71:0] DB,     // B data bus input...
    output logic [71:0] oDB,    // ...and output
    input  wire  [71:0] DX,     // X data bus input...
    output logic [71:0] oDX,    // ...and output

    input  wire   [1:0] AA,     // A address input
    input  wire   [1:0] AB,     // B address input
    input  wire   [1:0] AX,     // X address input

    input  wire         ECA,    // A port enable
    input  wire         ECB,    // B data port enable
    input  wire         ECBTAG, // B tag port enable
    input  wire         ECX,    // X port enable

    input  wire         WA,     // A write enable
    input  wire         WB,     // B write enable
    input  wire         WX,     // X write enable

    output logic [63:0] iword,  // RG1 data output
    output logic  [7:0] itag,   // RG1 tag output
    output logic  [7:0] dtag    // RG2 tag output
);
timeunit 1ns / 10ps;

wire [1:0] AC  = 2'b01;         // C address: select RG1
wire       ECC = '1;            // C port always enabled
wire       WC  = '0;            // no write on C port

// Inverted output data
logic [71:0] onDA;
logic [71:0] onDB;
logic [71:0] onDC;
logic [71:0] onDX;

assign oDA   = ~onDA[63:0];
assign dtag  = ~onDA[71:64];

assign oDB   = ~onDB;

assign iword = ~onDC[63:0];
assign itag  = ~onDC[71:64];

assign oDX   = ~onDX;

//
// Data bus 63:0
//
k1802bb1 b0_3  (clk,
                ~DA[3:0],   onDA[3:0],
                ~DB[3:0],   onDB[3:0],
                4'b1111,    onDC[3:0],
                ~DX[3:0],   onDX[3:0],
                AA,   AB,   AC,   AX,
                ~ECA, ~ECB, ~ECC, ~ECX,
                ~WA,  ~WB,  ~WC,  ~WX,
                WA,   WB,   WC,   WX,
                '0, , );
k1802bb1 b4_7  (clk,
                ~DA[7:4],   onDA[7:4],
                ~DB[7:4],   onDB[7:4],
                4'b1111,    onDC[7:4],
                ~DX[7:4],   onDX[7:4],
                AA,   AB,   AC,   AX,
                ~ECA, ~ECB, ~ECC, ~ECX,
                ~WA,  ~WB,  ~WC,  ~WX,
                WA,   WB,   WC,   WX,
                '0, , );
k1802bb1 b8_11 (clk,
                ~DA[11:8],  onDA[11:8],
                ~DB[11:8],  onDB[11:8],
                4'b1111,    onDC[11:8],
                ~DX[11:8],  onDX[11:8],
                AA,   AB,   AC,   AX,
                ~ECA, ~ECB, ~ECC, ~ECX,
                ~WA,  ~WB,  ~WC,  ~WX,
                WA,   WB,   WC,   WX,
                '0, , );
k1802bb1 b12_15(clk,
                ~DA[15:12], onDA[15:12],
                ~DB[15:12], onDB[15:12],
                4'b1111,    onDC[15:12],
                ~DX[15:12], onDX[15:12],
                AA,   AB,   AC,   AX,
                ~ECA, ~ECB, ~ECC, ~ECX,
                ~WA,  ~WB,  ~WC,  ~WX,
                WA,   WB,   WC,   WX,
                '0, , );
k1802bb1 b16_19(clk,
                ~DA[19:16], onDA[19:16],
                ~DB[19:16], onDB[19:16],
                4'b1111,    onDC[19:16],
                ~DX[19:16], onDX[19:16],
                AA,   AB,   AC,   AX,
                ~ECA, ~ECB, ~ECC, ~ECX,
                ~WA,  ~WB,  ~WC,  ~WX,
                WA,   WB,   WC,   WX,
                '0, , );
k1802bb1 b20_23(clk,
                ~DA[23:20], onDA[23:20],
                ~DB[23:20], onDB[23:20],
                4'b1111,    onDC[23:20],
                ~DX[23:20], onDX[23:20],
                AA,   AB,   AC,   AX,
                ~ECA, ~ECB, ~ECC, ~ECX,
                ~WA,  ~WB,  ~WC,  ~WX,
                WA,   WB,   WC,   WX,
                '0, , );
k1802bb1 b24_27(clk,
                ~DA[27:24], onDA[27:24],
                ~DB[27:24], onDB[27:24],
                4'b1111,    onDC[27:24],
                ~DX[27:24], onDX[27:24],
                AA,   AB,   AC,   AX,
                ~ECA, ~ECB, ~ECC, ~ECX,
                ~WA,  ~WB,  ~WC,  ~WX,
                WA,   WB,   WC,   WX,
                '0, , );
k1802bb1 b28_31(clk,
                ~DA[31:28], onDA[31:28],
                ~DB[31:28], onDB[31:28],
                4'b1111,    onDC[31:28],
                ~DX[31:28], onDX[31:28],
                AA,   AB,   AC,   AX,
                ~ECA, ~ECB, ~ECC, ~ECX,
                ~WA,  ~WB,  ~WC,  ~WX,
                WA,   WB,   WC,   WX,
                '0, , );
k1802bb1 b32_35(clk,
                ~DA[35:32], onDA[35:32],
                ~DB[35:32], onDB[35:32],
                4'b1111,    onDC[35:32],
                ~DX[35:32], onDX[35:32],
                AA,   AB,   AC,   AX,
                ~ECA, ~ECB, ~ECC, ~ECX,
                ~WA,  ~WB,  ~WC,  ~WX,
                WA,   WB,   WC,   WX,
                '0, , );
k1802bb1 b36_39(clk,
                ~DA[39:36], onDA[39:36],
                ~DB[39:36], onDB[39:36],
                4'b1111,    onDC[39:36],
                ~DX[39:36], onDX[39:36],
                AA,   AB,   AC,   AX,
                ~ECA, ~ECB, ~ECC, ~ECX,
                ~WA,  ~WB,  ~WC,  ~WX,
                WA,   WB,   WC,   WX,
                '0, , );
k1802bb1 b40_43(clk,
                ~DA[43:40], onDA[43:40],
                ~DB[43:40], onDB[43:40],
                4'b1111,    onDC[43:40],
                ~DX[43:40], onDX[43:40],
                AA,   AB,   AC,   AX,
                ~ECA, ~ECB, ~ECC, ~ECX,
                ~WA,  ~WB,  ~WC,  ~WX,
                WA,   WB,   WC,   WX,
                '0, , );
k1802bb1 b44_47(clk,
                ~DA[47:44], onDA[47:44],
                ~DB[47:44], onDB[47:44],
                4'b1111,    onDC[47:44],
                ~DX[47:44], onDX[47:44],
                AA,   AB,   AC,   AX,
                ~ECA, ~ECB, ~ECC, ~ECX,
                ~WA,  ~WB,  ~WC,  ~WX,
                WA,   WB,   WC,   WX,
                '0, , );
k1802bb1 b48_51(clk,
                ~DA[51:48], onDA[51:48],
                ~DB[51:48], onDB[51:48],
                4'b1111,    onDC[51:48],
                ~DX[51:48], onDX[51:48],
                AA,   AB,   AC,   AX,
                ~ECA, ~ECB, ~ECC, ~ECX,
                ~WA,  ~WB,  ~WC,  ~WX,
                WA,   WB,   WC,   WX,
                '0, , );
k1802bb1 b52_55(clk,
                ~DA[55:52], onDA[55:52],
                ~DB[55:52], onDB[55:52],
                4'b1111,    onDC[55:52],
                ~DX[55:52], onDX[55:52],
                AA,   AB,   AC,   AX,
                ~ECA, ~ECB, ~ECC, ~ECX,
                ~WA,  ~WB,  ~WC,  ~WX,
                WA,   WB,   WC,   WX,
                '0, , );
k1802bb1 b56_59(clk,
                ~DA[59:56], onDA[59:56],
                ~DB[59:56], onDB[59:56],
                4'b1111,    onDC[59:56],
                ~DX[59:56], onDX[59:56],
                AA,   AB,   AC,   AX,
                ~ECA, ~ECB, ~ECC, ~ECX,
                ~WA,  ~WB,  ~WC,  ~WX,
                WA,   WB,   WC,   WX,
                '0, , );
k1802bb1 b60_63(clk,
                ~DA[63:60], onDA[63:60],
                ~DB[63:60], onDB[63:60],
                4'b1111,    onDC[63:60],
                ~DX[63:60], onDX[63:60],
                AA,   AB,   AC,   AX,
                ~ECA, ~ECB, ~ECC, ~ECX,
                ~WA,  ~WB,  ~WC,  ~WX,
                WA,   WB,   WC,   WX,
                '0, , );

//
// Tag 71:64
// On port A, always read a tag from RG2.
//
k1802bb1 b64_67(clk,
                4'b1111,    onDA[67:64],
                ~DB[67:64], onDB[67:64],
                4'b1111,    onDC[67:64],
                ~DX[67:64], onDX[67:64],
                2'd2, AB,      AC,   AX,
                '0,   ~ECBTAG, ~ECC, ~ECX,
                '1,   ~WB,     ~WC,  ~WX,
                '0,   WB,      WC,   WX,
                '0, , );
k1802bb1 b68_71(clk,
                4'b1111,    onDA[71:68],
                ~DB[71:68], onDB[71:68],
                4'b1111,    onDC[71:68],
                ~DX[71:68], onDX[71:68],
                2'd2, AB,      AC,   AX,
                '0,   ~ECBTAG, ~ECC, ~ECX,
                '1,   ~WB,     ~WC,  ~WX,
                '0,   WB,      WC,   WX,
                '0, , );

endmodule
