//
// Am2904 - Status and Shift Control Unit
//
module am2904(
    input        nCEm,      //+ Machine status register enable
    input        nCEu,      //+ Micro status register enable
    output logic Co,        // Carry multiplexer out
    input        clk,       //+ Clock
    output logic CT,        // Conditional test
    input        Cx,        // Carry multiplexer in
    input        nEz,       //+ Zero status enable
    input        nEc,       //+ Carry status enable
    input        nEn,       //+ Sign status enable
    input        nEovr,     //+ Overflow status enable
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

//
// Micro Status Register
//
logic [3:0] uSR;
logic [3:0] uSR_input;

always @(posedge clk) begin
    if (nCEu == 0)
        uSR <= uSR_input;
end

always_comb case (I[5:0])

// Bit operations: OVR --- N ----- C ----- Z
'o10: uSR_input = {uSR[3], uSR[2], uSR[1], 0};      // reset zero bit
'o11: uSR_input = {uSR[3], uSR[2], uSR[1], 1};      // set zero bit
'o12: uSR_input = {uSR[3], uSR[2], 0,      uSR[0]}; // reset carry bit
'o13: uSR_input = {uSR[3], uSR[2], 1,      uSR[0]}; // set carry bit
'o14: uSR_input = {uSR[3], 0,      uSR[1], uSR[0]}; // reset sign bit
'o15: uSR_input = {uSR[3], 1,      uSR[1], uSR[0]}; // set sign bit
'o16: uSR_input = {0,      uSR[2], uSR[1], uSR[0]}; // reset overflow bit
'o17: uSR_input = {1,      uSR[2], uSR[1], uSR[0]}; // set overflow bit

// Register operations
'o00: uSR_input = MSR;          // load MSR to uSR
'o01: uSR_input = 4'b1111;      // set uSR
'o02: uSR_input = MSR;          // register swap
'o03: uSR_input = 4'b0000;      // reset uSR

// Load operations: --- OVR -------- N - C -- Z
'o06,'o07: uSR_input = {Iovr|uSR[3], In, Ic,  Iz};  // load with overflow retain
'o30,'o31,
'o50,'o51,
'o70,'o71: uSR_input = {Iovr,        In, ~Ic, Iz};  // load with carry invert
default:   uSR_input = {Iovr,        In, Ic,  Iz};  // load directly from Ix
endcase

//
// Machine Status Register
//
logic [3:0] MSR;
logic [3:0] MSR_input;

always @(posedge clk) begin
    if (nCEm == 0) begin
        if (nEz == 0) begin
            MSR[0] <= MSR_input[0];
        if (nEc == 0) begin
            MSR[1] <= MSR_input[1];
        if (nEn == 0) begin
            MSR[2] <= MSR_input[2];
        if (nEovr == 0) begin
            MSR[3] <= MSR_input[3];
    end
end

always_comb case (I[5:0])

// Register operations
'o00: MSR_input = {Yovr, Yn, Yc, Yz};   // load Yx to MSR
'o01: MSR_input = 4'b1111;              // set MSR
'o02: MSR_input = uSR;                  // register swap
'o03: MSR_input = 4'b0000;              // reset MSR
'o05: MSR_input = ~MSR;                 // invert MSR

// Load operations: --- OVR --- N - C ----- Z
'o04:      MSR_input = {MSR[1], In, MSR[3], Iz};    // load for shift through overflow
'o10,'o11,
'o30,'o31,
'o50,'o51,
'o70,'o71: MSR_input = {Iovr,   In, ~Ic,    Iz};    // load with carry invert
default:   MSR_input = {Iovr,   In, Ic,     Iz};    // load directly from Ix
endcase

//TODO

endmodule
