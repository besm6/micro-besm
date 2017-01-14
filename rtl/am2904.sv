//
// Am2904 - Status and Shift Control Unit
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

module am2904(
    input  wire [12:0] I,   // Instruction

    input  wire  clk,       // Clock
    input  wire  nCEm,      // Machine status register enable
    input  wire  nCEu,      // Micro status register enable
    input  wire  Ic,        // Carry status from ALU
    input  wire  Iovr,      // Overflow status from ALU
    input  wire  In,        // Sign status from ALU
    input  wire  Iz,        // Zero status from ALU
    input  wire  nEz,       // Zero status enable
    input  wire  nEc,       // Carry status enable
    input  wire  nEn,       // Sign status enable
    input  wire  nEovr,     // Overflow status enable
    input  wire  Yz,        // Zero status bus input
    input  wire  Yc,        // Carry status bus input
    input  wire  Yn,        // Sign status bus input
    input  wire  Yovr,      // Overflow status bus input
    output logic oYz,       // Output direction of the above signals
    output logic oYc,       // --//--
    output logic oYn,       // --//--
    output logic oYovr,     // --//--

    output logic CT,        // Conditional test

    input  wire  Cx,        // Carry multiplexer in
    output logic Co,        // Carry multiplexer out

    input  wire  nSE,       // Shift enable
    input  wire  SIO0,      // Serial shift, RAM0 of least significant slice
    input  wire  SIOn,      // Serial shift, RAM3 of most significant slice
    input  wire  QIO0,      // Serial shift, QIO0 of least significant slice
    input  wire  QIOn,      // Serial shift, QIO3 of most significant slice
    output logic oSIO0,     // Output direction of the above signals
    output logic oSIOn,     // --//--
    output logic oQIO0,     // --//--
    output logic oQIOn      // --//--
);
timeunit 1ns / 10ps;

//------------------------------------------------------
// Micro Status Register
//
logic [3:0] uSR;
logic [3:0] MSR;
logic [3:0] uSR_new;
logic uZ, uC, uN, uOVR;

assign uOVR = uSR[0];
assign uC   = uSR[1];
assign uN   = uSR[2];
assign uZ   = uSR[3];

always @(posedge clk) begin
    if (!nCEu)
        uSR <= uSR_new;
end

always_comb case (I[5:0])

// Bit operations: --- Z -- N --- C --- OVR
     'o10: uSR_new = {1'b0, uN,   uC,   uOVR};  // reset zero bit
     'o11: uSR_new = {1'b1, uN,   uC,   uOVR};  // set zero bit
     'o12: uSR_new = {uZ,   uN,   1'b0, uOVR};  // reset carry bit
     'o13: uSR_new = {uZ,   uN,   1'b1, uOVR};  // set carry bit
     'o14: uSR_new = {uZ,   1'b0, uC,   uOVR};  // reset sign bit
     'o15: uSR_new = {uZ,   1'b1, uC,   uOVR};  // set sign bit
     'o16: uSR_new = {uZ,   uN,   uC,   1'b0};  // reset overflow bit
     'o17: uSR_new = {uZ,   uN,   uC,   1'b1};  // set overflow bit

// Register operations
     'o00: uSR_new = MSR;                       // load MSR to uSR
     'o01: uSR_new = 4'b1111;                   // set uSR
     'o02: uSR_new = MSR;                       // register swap
     'o03: uSR_new = 4'b0000;                   // reset uSR

// Load operations: -- Z - N - C - OVR
'o06,'o07: uSR_new = {Iz, In, Ic,  Iovr|uOVR};  // load with overflow retain
'o30,'o31,
'o50,'o51,
'o70,'o71: uSR_new = {Iz, In, ~Ic, Iovr};       // load with carry invert
default:   uSR_new = {Iz, In, Ic,  Iovr};       // load directly from Ix
endcase

//------------------------------------------------------
// Machine Status Register
//
logic [3:0] MSR_new;
logic MZ, MC, MN, MOVR;
logic MC_override, MC_new;

assign MSR = {MZ, MN, MC, MOVR};

always @(posedge clk) begin
    if (!nCEm & !nEz)
        MZ <= MSR_new[3];

    if (!nCEm & !nEn)
        MN <= MSR_new[2];

    if (MC_override)
        MC <= MC_new;           // override from shift operation
    else if (!nCEm & !nEc)
        MC <= MSR_new[1];

    if (!nCEm & !nEovr)
        MOVR <= MSR_new[0];
end

always_comb case (I[5:0])

// Register operations
     'o00: MSR_new = {Yz, Yn, Yc, Yovr};        // load Yx to MSR
     'o01: MSR_new = 4'b1111;                   // set MSR
     'o02: MSR_new = uSR;                       // register swap
     'o03: MSR_new = 4'b0000;                   // reset MSR
     'o05: MSR_new = ~MSR;                      // invert MSR

// Load operations: - Z - N - C --- OVR
     'o04: MSR_new = {Iz, In, MOVR, MC};        // load for shift through overflow
'o10,'o11,
'o30,'o31,
'o50,'o51,
'o70,'o71: MSR_new = {Iz, In, ~Ic,  Iovr};      // load with carry invert
  default: MSR_new = {Iz, In, Ic,   Iovr};      // load directly from Ix
endcase

//------------------------------------------------------
// Condition Code Multiplexer
//
logic [3:0] Y_new;

always_comb case (I[5:4])
'b00,'b01: Y_new = uSR;
     'b10: Y_new = MSR;
     'b11: Y_new = {Iz, In, Ic, Iovr};
  default: ;
endcase

assign oYovr = Y_new[0];
assign oYc   = Y_new[1];
assign oYn   = Y_new[2];
assign oYz   = Y_new[3];

always_comb case (I[5:0])
'h00,'h10: CT = (uN ^ uOVR) | uZ;
'h01,'h11: CT = (uN == uOVR) & ~uZ;
'h02,'h12: CT = (uN ^ uOVR);
'h03,'h13: CT = (uN == uOVR);
'h04,'h14: CT = uZ;
'h05,'h15: CT = ~uZ;
'h06,'h16: CT = uOVR;
'h07,'h17: CT = ~uOVR;
'h08,'h18: CT = uC | uZ;
'h09,'h19: CT = ~uC & ~uZ;
'h0a,'h1a: CT = uC;
'h0b,'h1b: CT = ~uC;
'h0c,'h1c: CT = ~uC | uZ;
'h0d,'h1d: CT = uC & ~uZ;

     'h0e: CT = (In ^ MN);
     'h0f: CT = (In == MN);

     'h1e: CT = uN;
     'h1f: CT = ~uN;

     'h20: CT = (MN ^ MOVR) | MZ;
     'h21: CT = (MN == MOVR) & ~MZ;
     'h22: CT = (MN ^ MOVR);
     'h23: CT = (MN == MOVR);
     'h24: CT = MZ;
     'h25: CT = ~MZ;
     'h26: CT = MOVR;
     'h27: CT = ~MOVR;
     'h28: CT = MC | MZ;
     'h29: CT = ~MC & ~MZ;
     'h2a: CT = MC;
     'h2b: CT = ~MC;
     'h2c: CT = ~MC | MZ;
     'h2d: CT = MC & ~MZ;
     'h2e: CT = MN;
     'h2f: CT = ~MN;

     'h30: CT = (In ^ Iovr) | Iz;
     'h31: CT = (In == Iovr) & ~Iz;
     'h32: CT = (In ^ Iovr);
     'h33: CT = (In == Iovr);
     'h34: CT = Iz;
     'h35: CT = ~Iz;
     'h36: CT = Iovr;
     'h37: CT = ~Iovr;
     'h38: CT = ~Ic | Iz;
     'h39: CT = Ic & ~Iz;
     'h3a: CT = Ic;
     'h3b: CT = ~Ic;
     'h3c: CT = ~Ic | Iz;
     'h3d: CT = Ic & ~Iz;
     'h3e: CT = In;
     'h3f: CT = ~In;

  default: ;
endcase

//------------------------------------------------------
// Shift Linkage Multiplexer
//
logic shift_op[5:0];

assign oSIO0 = shift_op[5];
assign oSIOn = shift_op[4];
assign oQIO0 = shift_op[3];
assign oQIOn = shift_op[2];

assign MC_override = !nSE & shift_op[1];
assign MC_new      = shift_op[0];

always_comb case (I[10:6])
// Down shifts ---- SIO0 SIOn -- QIO0 QIOn  ov  MC
   'o00: shift_op = {'0, '0,      '0, '0,   '0, '0};    // 0──>RAM──>    0──>Q──>

   'o01: shift_op = {'0, '1,      '0, '1,   '0, '0};    // 1──>RAM──>    1──>Q──>

   'o02: shift_op = {'0, '0,      '0, MN,   '1, SIO0};  // MC<──────┐
                                                        // 0───>RAM─┘   MN──>Q──>

   'o03: shift_op = {'0, '1,      '0, SIO0, '0, '0};    // 1───>RAM────────>Q───>

   'o04: shift_op = {'0, MC,      '0, SIO0, '0, '0};    // MC──>RAM────────>Q───>

   'o05: shift_op = {'0, MN,      '0, SIO0, '0, '0};    // MN──>RAM────────>Q───>

   'o06: shift_op = {'0, '0,      '0, SIO0, '0, '0};    // 0───>RAM────────>Q───>

   'o07: shift_op = {'0, '0,      '0, SIO0, '1, QIO0};  // MC<──────────────────┐
                                                        // 0───>RAM────────>Q───┘

   'o10: shift_op = {'0, SIO0,    '0, QIO0, '1, SIO0};  //     ┌───────┐ ┌──────┐
                                                        // MC<─┴─>RAM──┘ └──>Q──┘

   'o11: shift_op = {'0, MC,      '0, QIO0, '1, SIO0};  // v─────────┐   ┌──────┐
                                                        // MC──>RAM──┘   └──>Q──┘

   'o12: shift_op = {'0, SIO0,    '0, QIO0, '0, '0};    // ┌────────┐   ┌───────┐
                                                        // └──>RAM──┘   └──>Q───┘

   'o13: shift_op = {'0, Ic,      '0, SIO0, '0, '0};    // Iс──>RAM────────>Q───>

   'o14: shift_op = {'0, MC,      '0, SIO0, '1, QIO0};  // v────────────────────┐
                                                        // MC──>RAM────────>Q───┘

   'o15: shift_op = {'0, QIO0,    '0, SIO0, '1, QIO0};  //      ┌───────────────┐
                                                        // MC<──┴──>RAM────>Q───┘

   'o16: shift_op = {'0, In^Iovr, '0, SIO0, '0, '0};    // In^Iovr───>RAM───>Q──>

   'o17: shift_op = {'0, QIO0,    '0, SIO0, '0, '0};    // ┌────────────────────┐
                                                        // └───>RAM──────>Q─────┘

// Up shifts ------- SIO0  SIOn  QIO0  QIOn  ov MC
   'o20: shift_op = {'0,   '0,    '0,   '0, '1, SIOn};  // MC<──RAM<──0  <──Q<──0

   'o21: shift_op = {'1,   '0,    '1,   '0, '1, SIOn};  // MC<──RAM<──1  <──Q<──1

   'o22: shift_op = {'0,   '0,    '0,   '0, '0, '0};    // <───RAM<───0  <──Q<──0

   'o23: shift_op = {'1,   '0,    '1,   '0, '0, '0};    // <───RAM<───1  <──Q<──1

   'o24: shift_op = {QIOn, '0,    '0,   '0, '1, SIOn};  // MC<──RAM<───────Q<───0

   'o25: shift_op = {QIOn, '0,    '1,   '0, '1, SIOn};  // MC<──RAM<───────Q<───1

   'o26: shift_op = {QIOn, '0,    '0,   '0, '0, '0};    // <───RAM<────────Q<───0

   'o27: shift_op = {QIOn, '0,    '1,   '0, '0, '0};    // <───RAM<────────Q<───1

   'o30: shift_op = {SIOn, '0,    QIOn, '0, '1, SIOn};  //     ┌───────┐ ┌──────┐
                                                        // MC<─┴─RAM<──┘ └──Q<──┘

   'o31: shift_op = {MC,   '0,    QIOn, '0, '1, SIOn};  // ┌─────────┐  ┌───────┐
                                                        // MC<──RAM<─┘  └──Q<───┘

   'o32: shift_op = {SIOn, '0,    QIOn, '0, '0, '0};    // ┌───────┐   ┌────────┐
                                                        // └──RAM<─┘   └───Q<───┘

   'o33: shift_op = {MC,   '0,    '0,   '0, '0, '0};    // MC──────┐
                                                        // <──RAM<─┘   <───Q<───0

   'o34: shift_op = {QIOn, '0,    MC,   '0, '1, SIOn};  // ┌────────────────────┐
                                                        // MC<──RAM<──────Q<────┘

   'o35: shift_op = {QIOn, '0,    SIOn, '0, '1, SIOn};  //      ┌───────────────┐
                                                        // MC<──┴──RAM<────Q<───┘

   'o36: shift_op = {QIOn, '0,    MC,   '0, '0, '0};    // MC───────────────────┐
                                                        // <───RAM<───────Q<────┘

   'o37: shift_op = {QIOn, '0,    SIOn, '0, '0, '0};    // ┌────────────────────┐
                                                        // └───RAM<───────Q<────┘
default: ;
endcase

//------------------------------------------------------
// Carry-In Control Multiplexer
//
assign Co = (I[12] == 0) ? I[11] :
            (I[11] == 0) ? Cx :
            (I[5]  == 0) ? ((I[3:1] == 4) ? ~uC : uC) :
                           ((I[3:1] == 4) ? ~MC : MC);

//always_comb case ({I[12:11], I[5], I[3:1]})
//'b00xxxx: Co = 0;
//'b01xxxx: Co = 1;
//'b10xxxx: Co = Cx;
//'b1100xx,
//'b110x1x,
//'b110xx1: Co = uC;
//'b110100: Co = ~uC;
//'b1110xx,
//'b111x1x,
//'b111xx1: Co = MC;
//'b111100: Co = ~MC;
// default: ;
//endcase

endmodule
