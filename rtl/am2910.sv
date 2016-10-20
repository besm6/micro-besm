`default_nettype none

//
// Am2910 - Microprogram Controller
//
module am2910(
    input  wire         clk,        // Clock
    input  wire   [3:0] I,          // Four-bit instruction
    input  wire         nCCEN,      // Conditional Code Enable bit
    input  wire         nCC,        // Conditional Code Bit
    input  wire         nRLD,       // Unconditional load bit for register/counter
    input  wire         CI,         // Carry-in bit for microprogram counter
    input  wire         nOE,        // Tri-state driver control bit
    input  wire  [11:0] D,          // 12-bit data input to chip
    output logic [11:0] Y,          // 12-bit data output from chip
    output logic        nPL,        // Pipeline register output enable
    output logic        nVECT,      // Vector output enable
    output logic        nMAP,       // Mapping PROM output enable
    output logic        nFULL       // Stack full flag
);

logic [2:0] sp;
logic R_sel, D_sel, uPC_sel, stack_sel, decr, load, Rzero_bar, clear, push, pop;
logic [11:0] Y_temp, RE, uPC;
logic [11:0] reg_file[5:0];

always_comb case (1'b1)
    R_sel: Y_temp = RE;
    D_sel: Y_temp = D;
  uPC_sel: Y_temp = uPC;
stack_sel: Y_temp = reg_file[sp];
  default: Y_temp = '0;
endcase

assign Y = nOE ? 'z : Y_temp;

always @(posedge clk) begin
    if (load || !nRLD)
        RE <= D;
    else if (decr && nRLD)
        RE <= RE - 1;
end

assign Rzero_bar = RE != 0;

always @(posedge clk) begin
    if (clear)
        uPC <= 0;
    else
        uPC <= Y_temp + CI;
end

logic [2:0] write_address;

always @(posedge clk) begin
    if (pop && sp != 0)
        sp <= sp - 1;
    else if (push && sp != 5)
        sp <= sp + 1;
    else if (clear)
        sp <= 0;

    if (push)
        reg_file[write_address] <= uPC;
end

assign write_address = (sp == 5) ? sp : sp+1;

assign nFULL = (sp != 5);

logic fail;

assign fail = (nCC & !nCCEN);

assign D_sel = (I == 'b0010) ||
               (Rzero_bar && I == 'b1001) ||
               (!Rzero_bar && fail && I == 'b1111) ||
               (!fail && ((I == 'b0001) || (I == 'b0011) ||
                          (I == 'b0101) || (I == 'b0110) ||
                          (I == 'b0111) || (I == 'b1011)
                         )
               );

assign uPC_sel = (I == 'b0100) || (I == 'b1100) || (I == 'b1110) ||
                 (fail && ((I == 'b0001) || (I == 'b0011) ||
                           (I == 'b0110) || (I == 'b1010) ||
                           (I == 'b1011) || (I == 'b1110)
                          )
                 ) || (!Rzero_bar && ((I == 'b1000) || (I == 'b1001))) ||
                      (!fail && ((I == 'b1111) || (I == 'b1101)));


assign stack_sel = (Rzero_bar  && I == 'b1000) ||
                   (!fail && I == 'b1010) ||
                   (fail && I == 'b1101) ||
                   (Rzero_bar && fail && I == 'b1111);

assign R_sel = (fail && ((I == 'b0101) || (I == 'b0111)));

assign push = (!fail && (I == 'b0001)) || (I == 'b0100) || (I == 'b0101);

assign pop = (!fail && ((I == 'b1010) || (I == 'b1011) ||
                        (I == 'b1101) || (I == 'b1111)
                       )
             ) || (!Rzero_bar && ((I == 'b1000) || (I == 'b1111)));

assign load = ((I == 'b1100) || (I == 'b0100 && !fail));

assign decr = (Rzero_bar && ((I == 'b1000) || (I == 'b1001) || (I == 'b1111)));

assign nMAP = (I != 4'b0010);

assign nVECT = (I != 4'b0110);

assign nPL = (I == 4'b0010) || (I == 4'b0110);

assign clear = (I == 4'b0000);

endmodule
