`default_nettype none

//
// Am2901 - Four-Bit Bipolar Microprocessor Slice
//
module am2901(
    input  wire   [8:0] I,          // Instruction word
    input  wire   [3:0] Aadd,       // Address input to RAM (for read)
    input  wire   [3:0] Badd,       // Address input to RAM (for read/write)
    input  wire   [3:0] D,          // Data input to chip
    output logic  [3:0] Y,          // Data output from chip
    input  wire         RAM0,       // Up/down shifter port, LSB of RAM
    input  wire         RAM3,       // Up/down shifter port, MSB of RAM
    input  wire         Q0,         // Up/down shifter port, LSB of Q-register
    input  wire         Q3,         // Up/down shifter port, MSB of Q-register
    output logic        oRAM0,      // Output direction of the above signals
    output logic        oRAM3,      // --//--
    output logic        oQ0,        // --//--
    output logic        oQ3,        // --//--
    input  wire         clk,        // Clock
    input  wire         C0,         // Carry input to ALU
    input  wire         nOE,        // Tri-state driver for Y output
    output logic        C4,         // Carry output from ALU
    output logic        nG,         // Generate term from ALU for carry lookahead
    output logic        nP,         // Propagate term from ALU for carry lookahead
    output logic        OVR,        // Overflow output from ALU
    output logic        F3,         // MSB of the ALU output
    output logic        F30         // Zero signal
);
timeunit 1ns / 10ps;

logic [3:0] ram[15:0];
logic [3:0] re, s;
logic [3:0] a, b, q, f;

// According to datasheet, A and B outputs have a latch
always @(*)
    if (clk == 1)
        a = ram[Aadd];

always @(*)
    if (clk == 1)
        b = ram[Badd];

// Select the source operands for ALU. Selected operands are "re" and "s".
always_comb case (I[2:0])
  'b000,
  'b001: re = a;

  'b010,
  'b011,
  'b100: re = 'b0000;

default: re = D;
endcase

always_comb case (I[2:0])
  'b100,
  'b101: s = a;

  'b001,
  'b011: s = b;

  'b111: s = 'b0000;

default: s = q;
endcase

//-----------------------------------------------------------------------

logic [4:0] R_ext, S_ext, result, temp_p, temp_g;

// To facilitate computation of carry-out "C4", we extend the chosen
// ALU operands "re" and "s" (4 bit operands) by 1 bit in the MSB position.

// Thus the extended operands "R_ext" and "S_ext" (5 bit operands) are
// formed and are used in the ALU operation. The extra bit is set to '0'
// initially. The ALU's extended output (5 bits long) is "result".

assign R_ext = (I[5:3] == 'b001) ? {1'b0, ~re} : {1'b0, re};
assign S_ext = (I[5:3] == 'b010) ? {1'b0, ~s} : {1'b0, s};

// Select the function for ALU.

// In the add/subtract operations, the carry-input "C0" (1 bit) is extended
// by 4 bits (all '0') in the more significant bits to match its length to
// that of "R_ext" and "S_ext". Then, these three operands are added.

// Add/subtract operations are done on 2's complement operands.

always_comb unique case(I[5:3])
  'b000,
  'b001,
  'b010: result = R_ext + S_ext + C0;

  'b011: result = R_ext | S_ext;

  'b100: result = R_ext & S_ext;

  'b101: result = ~R_ext & S_ext;

  'b110: result = R_ext ^ S_ext;

  'b111: result = ~(R_ext ^ S_ext);
default: ;
endcase

// Evaluate other ALU outputs.

// From extended output "result" (5 bits), we obtain the normal ALU output,
// "f" (4 bits) by leaving out the MSB (which corresponds to carry-out "C4").

// To facilitate computation of carry lookahead terms "nP" and "nG", we
// compute intermediate terms "temp_p" and "temp_g".

assign f = result[3:0];
assign OVR = (R_ext[3] == S_ext[3]) && (R_ext[3] != result[3]);
assign temp_p = R_ext | S_ext;
assign temp_g = R_ext & S_ext;
assign nP = (temp_p != 'b1111);
assign nG = !(temp_g[3] ||
              (temp_p[3] && temp_g[2]) ||
              (temp_p[3] && temp_p[2] && temp_g[1]) ||
              (temp_p[3] && temp_p[2] && temp_p[1] && temp_g[0])
             );

assign F3 = result[3];
assign F30 = (result[3:0] == 'b0000);

// TODO: For logical functions, C4 output is a bit more complicated than that.
// See Figure 9 in Am2901B/Am2901C datasheet.
assign C4 = result[4];

//-----------------------------------------------------------------------

always @(posedge clk) begin
    // Write to RAM with/without shifting. RAM destinations are
    // addressed by "Badd".
    case (I[8:7])
    'b01: ram[Badd] <= f;
    'b10: ram[Badd] <= {RAM3, f[3:1]};
    'b11: ram[Badd] <= {f[2:0], RAM0};
    endcase
end

always @(posedge clk) begin
    // Write to Q register with/without shifting.
    case (I[8:6])
    'b000: q <= f;
    'b100: q <= {Q3, q[3:1]};
    'b110: q <= {q[2:0], Q0};
    endcase
end

// Generate data output "Y"
assign Y = nOE ? 'z : (I[8:6] == 'b010) ? a : f;

// Generate bidirectional shifter signals.
assign oRAM0 = (I[8:7] == 'b10) ? f[0] : '0;
assign oRAM3 = (I[8:7] == 'b11) ? f[3] : '0;
assign oQ3   = (I[8:7] == 'b11) ? q[3] : '0;
assign oQ0   = (I[8:7] == 'b10) ? q[0] : '0;

endmodule
