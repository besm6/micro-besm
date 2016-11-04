`default_nettype none

//
// Barrel shifter for micro-BESM
//
module shifter(
    input  wire  [63:0] in,     // input data
    input  wire   [6:0] param,  // shift amount
    input  wire   [1:0] op,     // shift mode
    output logic [63:0] out     // output data
);

wire right = param[6];

wire [5:0] n = right ? param[5:0]
                     : (~param[5:0] + 1);

always_comb
    if (right)
        case (op)                           // Right shift
        0: out = {in, in} >> n;             // cyclic shift
        1: out = in >> n;                   // logical shift
        2: out = {{64{in[63]}}, in} >> n;   // arithmetic shift
/*TODO*/3: out = in >> n;                   // conversion to BESM-6 format
        endcase
    else
        case (op)                           // Left shift
        0: out = ({in, in} << n) >> 64;     // cyclic shift
        1: out = in << n;                   // logical shift
        2: out = {in[63], in[62:0] << n};   // arithmetic shift
/*TODO*/3: out = in << n;                   // conversion to BESM-6 format
        endcase

endmodule
