//
// Am2904 - Status and Shift Control Unit
//
module am2904(
    input        nCEm,      // Machine status register enable
    input        nCEu,      // Micro status register enable
    output logic Co,        // Carry multiplexer out
    input        clk,       // Clock
    output logic CT,        // Conditional test
    input        Cx,        // Carry multiplexer in
    input        nEz,       // Zero status enable
    input        nEc,       // Carry status enable
    input        nEn,       // Sign status enable
    input        nEovr,     // Overflow status enable
    input [12:0] I,         // Instruction
    input        Ic,        // Carry status from ALU
    input        Iovr,      // Overflow status from ALU
    input        In,        // Sign status from ALU
    input        Iz,        // Zero status from ALU
    input        nOEct,     // CT output enable
    input        nOEy,      // Y output enable
    input        nSE,       // Shift enable
    input        SIO0,      // Serial shift, RAM0 of least significant slice
    input        SIOn,      // Serial shift, RAM3 of most significant slice
    input        QIO0,      // Serial shift, QIO0 of least significant slice
    input        QIOn,      // Serial shift, QIO3 of most significant slice
    output logic oSIO0,     // Output direction of the above signals
    output logic oSIOn,     // --//--
    output logic oQIO0,     // --//--
    output logic oQIOn,     // --//--
    input        Yz,        // Zero status bus input
    input        Yc,        // Carry status bus input
    input        Yn,        // Sign status bus input
    input        Yovr,      // Overflow status bus input
    output logic oYz,       // Output direction of the above signals
    output logic oYc,       // --//--
    output logic oYn,       // --//--
    output logic oYovr,     // --//--
);

//------------------------------------------------------
// Micro Status Register
//
logic [3:0] uSR;
logic [3:0] uSR_new;
logic uZ, uC, uN, uOVR;

assign uZ   = uSR[0];
assign uC   = uSR[1];
assign uN   = uSR[2];
assign uOVR = uSR[3];

always @(posedge clk) begin
    if (!nCEu)
        uSR <= uSR_new;
end

always_comb case (I[5:0])

// Bit operations: ---- OVR - N - C - Z
     'o10: uSR_new = {uOVR, uN, uC, 0};         // reset zero bit
     'o11: uSR_new = {uOVR, uN, uC, 1};         // set zero bit
     'o12: uSR_new = {uOVR, uN, 0,  uZ};        // reset carry bit
     'o13: uSR_new = {uOVR, uN, 1,  uZ};        // set carry bit
     'o14: uSR_new = {uOVR, 0,  uC, uZ};        // reset sign bit
     'o15: uSR_new = {uOVR, 1,  uC, uZ};        // set sign bit
     'o16: uSR_new = {0,    uN, uC, uZ};        // reset overflow bit
     'o17: uSR_new = {1,    uN, uC, uZ};        // set overflow bit

// Register operations
     'o00: uSR_new = MSR;                       // load MSR to uSR
     'o01: uSR_new = 4'b1111;                   // set uSR
     'o02: uSR_new = MSR;                       // register swap
     'o03: uSR_new = 4'b0000;                   // reset uSR

// Load operations: --- OVR ------ N - C -- Z
'o06,'o07: uSR_new = {Iovr|uOVR,In, Ic,  Iz};   // load with overflow retain
'o30,'o31,
'o50,'o51,
'o70,'o71: uSR_new = {Iovr,     In, ~Ic, Iz};   // load with carry invert
default:   uSR_new = {Iovr,     In, Ic,  Iz};   // load directly from Ix
endcase

//------------------------------------------------------
// Machine Status Register
//
logic [3:0] MSR;
logic [3:0] MSR_new;
logic MZ, MC, MN, MOVR;

assign MZ   = MSR[0];
assign MC   = MSR[1];
assign MN   = MSR[2];
assign MOVR = MSR[3];

always @(posedge clk) begin
    if (!nCEm & !nEz)
        MZ <= MSR_new[0];

    if (MC_override)
        MC <= MC_new;   // override from shift operation
    else if (!nCEm & !nEc)
        MC <= MSR_new[1];

    if (!nCEm & !nEn)
        MN <= MSR_new[2];

    if (!nCEm & !nEovr)
        MOVR <= MSR_new[3];
end

always_comb case (I[5:0])

// Register operations
     'o00: MSR_new = {Yovr, Yn, Yc, Yz};        // load Yx to MSR
     'o01: MSR_new = 4'b1111;                   // set MSR
     'o02: MSR_new = uSR;                       // register swap
     'o03: MSR_new = 4'b0000;                   // reset MSR
     'o05: MSR_new = ~MSR;                      // invert MSR

// Load operations: --- OVR - N - C --- Z
     'o04: MSR_new = {MC,   In, MOVR, Iz};      // load for shift through overflow
'o10,'o11,
'o30,'o31,
'o50,'o51,
'o70,'o71: MSR_new = {Iovr, In, ~Ic,  Iz};      // load with carry invert
  default: MSR_new = {Iovr, In, Ic,   Iz};      // load directly from Ix
endcase

//------------------------------------------------------
// Condition Code Multiplexer
//
logic [3:0] Y_new;
logic CT_new;

always_comb case (I[5:4])
   'b0x: Y_new = uSR;
   'b10: Y_new = MSR;
   'b11: Y_new = {Iovr, In, Ic, Iz};
default: Y_new = 'z;
endcase

assign oYz   = nOEy ? 'z : Y_new[0];
assign oYc   = nOEy ? 'z : Y_new[1];
assign oYn   = nOEy ? 'z : Y_new[2];
assign oYovr = nOEy ? 'z : Y_new[3];

always_comb case (I[5:0])
'h00,'h10: CT_new = (uN ^ uOVR) | uZ;
'h01,'h11: CT_new = (uN == uOVR) & ~uZ;
'h02,'h12: CT_new = (uN ^ uOVR);
'h03,'h13: CT_new = (uN == uOVR);
'h04,'h14: CT_new = uZ;
'h05,'h15: CT_new = ~uZ;
'h06,'h16: CT_new = uOVR;
'h07,'h17: CT_new = ~uOVR;
'h08,'h18: CT_new = uC | uZ;
'h09,'h19: CT_new = ~uC & ~uZ;
'h0a,'h1a: CT_new = uC;
'h0b,'h1b: CT_new = ~uC;
'h0c,'h1c: CT_new = ~uC | uZ;
'h0d,'h1d: CT_new = uC & ~uZ;

     'h0e: CT_new = (In ^ MN);
     'h0f: CT_new = (In == MN);

     'h1e: CT_new = uN;
     'h1f: CT_new = ~uN;

     'h20: CT_new = (MN ^ MOVR) | MZ;
     'h21: CT_new = (MN == MOVR) & ~MZ;
     'h22: CT_new = (MN ^ MOVR);
     'h23: CT_new = (MN == MOVR);
     'h24: CT_new = MZ;
     'h25: CT_new = ~MZ;
     'h26: CT_new = MOVR;
     'h27: CT_new = ~MOVR;
     'h28: CT_new = MC | MZ;
     'h29: CT_new = ~MC & ~MZ;
     'h2a: CT_new = MC;
     'h2b: CT_new = ~MC;
     'h2c: CT_new = ~MC | MZ;
     'h2d: CT_new = MC & ~MZ;
     'h2e: CT_new = MN;
     'h2f: CT_new = ~MN;

     'h30: CT_new = (In ^ Iovr) | Iz;
     'h31: CT_new = (In == Iovr) & ~Iz;
     'h32: CT_new = (In ^ Iovr);
     'h33: CT_new = (In == Iovr);
     'h34: CT_new = Iz;
     'h35: CT_new = ~Iz;
     'h36: CT_new = Iovr;
     'h37: CT_new = ~Iovr;
     'h38: CT_new = ~Ic | Iz;
     'h39: CT_new = Ic & ~Iz;
     'h3a: CT_new = Ic;
     'h3b: CT_new = ~Ic;
     'h3c: CT_new = ~Ic | Iz;
     'h3d: CT_new = Ic & ~Iz;
     'h3e: CT_new = In;
     'h3f: CT_new = ~In;

  default: ;
endcase

assign CT = nOEct ? 'z : C_new;

//------------------------------------------------------
// Shift Linkage Multiplexer
//
logic SIO0_new, SIOn_new, QIO0_new, QIOn_new;
logic MC_override, MC_new;

assign oSIO0 = nSE ? 'z : SIO0_new;
assign oSIOn = nSE ? 'z : SIOn_new;
assign oQIO0 = nSE ? 'z : QIO0_new;
assign oQIOn = nSE ? 'z : QIOn_new;

//TODO: add brief description of each shift
always_comb case (I[10:6])
// Down shifts
   'o00: begin SIO0_new = 'z; SIOn_new = 0;       QIO0_new = 'z; QIOn_new = 0;    MC_override = 0; MC_new = 0;    end
   'o01: begin SIO0_new = 'z; SIOn_new = 1;       QIO0_new = 'z; QIOn_new = 1;    MC_override = 0; MC_new = 0;    end
   'o02: begin SIO0_new = 'z; SIOn_new = 0;       QIO0_new = 'z; QIOn_new = MN;   MC_override = 1; MC_new = SIO0; end
   'o03: begin SIO0_new = 'z; SIOn_new = 1;       QIO0_new = 'z; QIOn_new = SIO0; MC_override = 0; MC_new = 0;    end
   'o04: begin SIO0_new = 'z; SIOn_new = MC;      QIO0_new = 'z; QIOn_new = SIO0; MC_override = 0; MC_new = 0;    end
   'o05: begin SIO0_new = 'z; SIOn_new = MN;      QIO0_new = 'z; QIOn_new = SIO0; MC_override = 0; MC_new = 0;    end
   'o06: begin SIO0_new = 'z; SIOn_new = 0;       QIO0_new = 'z; QIOn_new = SIO0; MC_override = 0; MC_new = 0;    end
   'o07: begin SIO0_new = 'z; SIOn_new = 0;       QIO0_new = 'z; QIOn_new = SIO0; MC_override = 1; MC_new = QIO0; end
   'o10: begin SIO0_new = 'z; SIOn_new = SIO0;    QIO0_new = 'z; QIOn_new = QIO0; MC_override = 1; MC_new = SIO0; end
   'o11: begin SIO0_new = 'z; SIOn_new = MC;      QIO0_new = 'z; QIOn_new = QIO0; MC_override = 1; MC_new = SIO0; end
   'o12: begin SIO0_new = 'z; SIOn_new = SIO0;    QIO0_new = 'z; QIOn_new = QIO0; MC_override = 0; MC_new = 0;    end
   'o13: begin SIO0_new = 'z; SIOn_new = IC;      QIO0_new = 'z; QIOn_new = SIO0; MC_override = 0; MC_new = 0;    end
   'o14: begin SIO0_new = 'z; SIOn_new = MC;      QIO0_new = 'z; QIOn_new = SIO0; MC_override = 1; MC_new = QIO0; end
   'o15: begin SIO0_new = 'z; SIOn_new = QIO0;    QIO0_new = 'z; QIOn_new = SIO0; MC_override = 1; MC_new = QIO0; end
   'o16: begin SIO0_new = 'z; SIOn_new = In^Iovr; QIO0_new = 'z; QIOn_new = SIO0; MC_override = 0; MC_new = 0;    end
   'o17: begin SIO0_new = 'z; SIOn_new = QIO0;    QIO0_new = 'z; QIOn_new = SIO0; MC_override = 0; MC_new = 0;    end

// Up shifts
   'o20: begin SIO0_new = 0;    SIOn_new = 'z; QIO0_new = 0;    QIOn_new = 'z; MC_override = 1; MC_new = SIOn; end
   'o21: begin SIO0_new = 1;    SIOn_new = 'z; QIO0_new = 1;    QIOn_new = 'z; MC_override = 1; MC_new = SIOn; end
   'o22: begin SIO0_new = 0;    SIOn_new = 'z; QIO0_new = 0;    QIOn_new = 'z; MC_override = 0; MC_new = 0;    end
   'o23: begin SIO0_new = 1;    SIOn_new = 'z; QIO0_new = 1;    QIOn_new = 'z; MC_override = 0; MC_new = 0;    end
   'o24: begin SIO0_new = QIOn; SIOn_new = 'z; QIO0_new = 0;    QIOn_new = 'z; MC_override = 1; MC_new = SIOn; end
   'o25: begin SIO0_new = QIOn; SIOn_new = 'z; QIO0_new = 1;    QIOn_new = 'z; MC_override = 1; MC_new = SIOn; end
   'o26: begin SIO0_new = QIOn; SIOn_new = 'z; QIO0_new = 0;    QIOn_new = 'z; MC_override = 0; MC_new = 0;    end
   'o27: begin SIO0_new = QIOn; SIOn_new = 'z; QIO0_new = 1;    QIOn_new = 'z; MC_override = 0; MC_new = 0;    end
   'o30: begin SIO0_new = SIOn; SIOn_new = 'z; QIO0_new = QIOn; QIOn_new = 'z; MC_override = 1; MC_new = SIOn; end
   'o31: begin SIO0_new = MC;   SIOn_new = 'z; QIO0_new = QIOn; QIOn_new = 'z; MC_override = 1; MC_new = SIOn; end
   'o32: begin SIO0_new = SIOn; SIOn_new = 'z; QIO0_new = QIOn; QIOn_new = 'z; MC_override = 0; MC_new = 0;    end
   'o33: begin SIO0_new = MC;   SIOn_new = 'z; QIO0_new = 0;    QIOn_new = 'z; MC_override = 0; MC_new = 0;    end
   'o34: begin SIO0_new = QIOn; SIOn_new = 'z; QIO0_new = MC;   QIOn_new = 'z; MC_override = 1; MC_new = SIOn; end
   'o35: begin SIO0_new = QIOn; SIOn_new = 'z; QIO0_new = SIOn; QIOn_new = 'z; MC_override = 1; MC_new = SIOn; end
   'o36: begin SIO0_new = QIOn; SIOn_new = 'z; QIO0_new = MC;   QIOn_new = 'z; MC_override = 0; MC_new = 0;    end
   'o37: begin SIO0_new = QIOn; SIOn_new = 'z; QIO0_new = SIOn; QIOn_new = 'z; MC_override = 0; MC_new = 0;    end

default: ;
endcase

//------------------------------------------------------
// Carry-In Control Multiplexer
//

//assign Co = (I[12] == 0) ? I[11] :
//            (I[11] == 0) ? Cx :
//            (I[5]  == 0) ? ((I[3:1] == 4) ? ~uC : uC) :
//                           ((I[3:1] == 4) ? ~MC : MC);

always_comb case ({I[12:11], I[5], I[3:1]})
'b00xxxx: Co = 0;
'b01xxxx: Co = 1;
'b10xxxx: Co = Cx;
'b1100xx,
'b110x1x,
'b110xx1: Co = uC;
'b110100: Co = ~uC;
'b1110xx,
'b111x1x,
'b111xx1: Co = MC;
'b111100: Co = ~MC;
 default: ;
endcase

endmodule
