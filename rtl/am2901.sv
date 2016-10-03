module a2901(
	input  logic [8:0] i,
	input  logic [3:0] Aadd, Badd,
	input  logic [3:0] d,
	output logic [3:0] y,
	input  logic       ram0, ram3, q0, q3,
	output logic       ram0out, ram3out, q0out, q3out,
	input  logic       clk, c0, OEbar,
	output logic       c4, Gbar, Pbar, ovr, f3, f30
);

logic [3:0] ram[15:0];
logic [3:0] re, s;
logic [3:0] a, b, q, f;

assign a = ram[Aadd];
assign b = ram[Badd];

// SELECT THE SOURCE OPERANDS FOR ALU. SELECTED OPERANDS ARE "RE" AND "S".

always_comb case (i[2:0])
'b000, 'b001: re = a;
'b010, 'b011, 'b100: re = 'b0000;
default: re = d;
endcase

always_comb case (i[2:0])
'b100, 'b101: s = a;
'b001, 'b011: s = b;
'b111: s = 'b0000;
default: s = q;
endcase

//-----------------------------------------------------------------------

logic [4:0] R_ext,S_ext,result,temp_p,temp_g;

//   TO FACILITATE COMPUTATION OF CARRY-OUT "C4", WE EXTEND THE CHOSEN
//   ALU OPERANDS "RE" AND "S" (4 BIT OPERANDS) BY 1 BIT IN THE MSB POSITION.

//   THUS THE EXTENDED OPERANDS "R_EXT" AND "S_EXT" (5 BIT OPERANDS) ARE
//   FORMED AND ARE USED IN THE ALU OPERATION. THE EXTRA BIT IS SET TO '0'
//   INITIALLY. THE ALU'S EXTENDED OUTPUT ( 5 BITS LONG) IS "result".

assign R_ext = i[5:3] == 'b001 ? {1'b0, ~re} : {1'b0, re};
assign S_ext = i[5:3] == 'b010 ? {1'b0, ~s} : {1'b0, s};

// SELECT THE FUNCTION FOR ALU.

//   IN THE ADD/SUBTRACT OPERATIONS, THE CARRY-INPUT "C0" (1 BIT) IS EXTENDED
//   BY 4 BITS ( ALL '0') IN THE MORE SIGNIFICANT BITS TO MATCH ITS LENGTH TO
//   THAT OF "R_ext" AND "S_ext". THEN, THESE THREE OPERANDS ARE ADDED.

//   ADD/SUBTRACT OPERATIONS ARE DONE ON 2'S COMPLEMENT OPERANDS.

always_comb unique case(i[5:3])
'b000, 'b001, 'b010: result = R_ext + S_ext + c0;
'b011: result = R_ext | S_ext;
'b100: result = R_ext & S_ext;
'b101: result = ~R_ext & S_ext;
'b110: result = R_ext ^ S_ext;
'b111: result = ~(R_ext ^ S_ext);
default: ;
endcase

// EVALUATE OTHER ALU OUTPUTS.

//  FROM EXTENDED OUTPUT "result" ( 5 BITS), WE OBTAIN THE NORMAL ALU OUTPUT,
//  "F" (4 BITS) BY LEAVING OUT THE MSB ( WHICH CORRESPONDS TO CARRY-OUT
//  "C4").

//  TO FACILITATE COMPUTATION OF CARRY LOOKAHEAD TERMS "Pbar" AND "Gbar", WE
//  COMPUTE INTERMEDIATE TERMS "temp_p" AND "temp_g".

assign f = result[3:0];
assign ovr = R_ext[3] == S_ext[3] && R_ext[3] != result[3];
assign c4 = result[4];
assign temp_p = R_ext | S_ext;
assign temp_g = R_ext & S_ext;
assign Pbar = temp_p != 'b1111;
assign Gbar = !(temp_g[3] ||
             (temp_p[3] && temp_g[2]) ||
             (temp_p[3] && temp_p[2] && temp_g[1]) ||
             (temp_p[3] && temp_p[2] && temp_p[1] && temp_g[0])
	);

assign f3 = result[3];
assign f30 = result[3:0] == 'b0000;

//-----------------------------------------------------------------------

always @(posedge clk) begin
// WRITE TO RAM WITH/WITHOUT SHIFTING. RAM DESTINATIONS ARE
// ADDRESSED BY "Badd".
case (i[8:7])
'b01: ram[Badd] <= f;
'b10: ram[Badd] <= {ram3, f[3:1]};
'b11: ram[Badd] <= {f[2:0], ram0};
endcase
end

always @(posedge clk) begin
// WRITE TO Q REGISTER WITH/WITHOUT SHIFTING.
case (i[8:6])
'b000: q <= f;
'b100: q <= {q3, q[3:1]};
'b110: q <= {q[2:0], q0};
endcase
end

// GENERATE DATA OUTPUT "Y"
assign y = OEbar ? 'z : i[8:6] == 'b010 ? a : f;

// GENERATE BIDIRECTIONAL SHIFTER SIGNALS.
assign ram0out = i[8:7] == 'b10 ? f[0] : 'z;
assign ram3out = i[8:7] == 'b11 ? f[3] : 'z;
assign q3out = i[8:7] == 'b11 ? q[3] : 'z;
assign q0out = i[8:7] == 'b10 ? q[0] : 'z;

endmodule
