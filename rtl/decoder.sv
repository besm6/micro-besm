`default_nettype none

//
// Instruction decoder for micro-BESM
//
module decoder(
    input  wire  [64:1] dc,     // instruction word
    input  wire         pe,     // besm6 compatibility
    input  wire         tkk,    // right half
    output logic  [3:0] ir,     // modifier index
    output logic  [7:0] op,     // opcode
    output logic        extop,  // extended opcode flag
    output logic        ir15,   // stack mode flag
    output logic [19:0] addr    // address
);
timeunit 1ns / 10ps;

logic [7:0] bop, xop;

// Modifier index
assign ir =
    pe ? tkk ? dc[36:33]                    // besm6 right half
             : {dc[64], dc[59:57]}          // besm6 left half
       : tkk ? dc[32:29]                    // right half
             : dc[64:61];                   // left half

assign ir15 = (ir == 15);                   // stack mode

// Base opcode
assign bop =
    pe ? tkk ? dc[32] ? {dc[32:28], 3'd0}   // besm6 right half
                      : dc[32:25]
             : dc[56] ? {dc[56:52], 3'd0}   // besm6 left half
                      : dc[56:49]
       : tkk ? dc[28:21]                    // right half
             : dc[60:53];                   // left half

// Extended opcode
assign xop = tkk ? dc[20:13]                // right half
                 : dc[52:45];               // left half

// Opcode
assign extop = (!pe & bop=='h3f);
assign op = extop ? xop : bop;

// Address field
assign addr =
    pe ? tkk ? dc[32] ? {5'd0, dc[27:13]}           // besm6 right half
                      : {5'd0, {3{dc[31]}}, dc[24:13]}
             : dc[56] ? {5'd0, dc[51:37]}           // besm6 left half
                      : {5'd0, {3{dc[55]}}, dc[48:37]}
       : tkk ? dc[20:1]                             // right half
             : dc[52:33];                           // left half

endmodule
