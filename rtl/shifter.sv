`default_nettype none

//
// Barrel shifter for micro-BESM
//
module shifter(
    input  wire  [63:0] in,         // input data
    input  wire   [6:0] param,      // shift amount
    input  wire  [10:0] wide_param, // shift parameter, wide
    input  wire   [1:0] op,         // shift mode
    output logic [63:0] out         // output data
);

wire right =
    (param == 64) ? wide_param[10]
                  : param[6];

wire [6:0] n =
    (param == 64) ? (right ? wide_param[6:0]
                           : -wide_param[6:0])
                  : (right ? {1'b0, param[5:0]}
                           : {1'b0, -param[5:0]});

always_comb
    if (right)
        case (op)                           // Right shift

        0: out = {in, in} >> n[5:0];        // cyclic shift

        1: out = in >> n;                   // logical shift

        2: out = n < 64 ?                   // arithmetic shift
                    {{64{in[63]}}, in} >> n :
                    {64{in[63]}};

/*TODO*/3: out = in >> n;                   // conversion to BESM-6 format

        endcase
    else
        case (op)                           // Left shift

        0: out = {in, in} << n[5:0] >> 64;  // cyclic shift

        1: out = in << n;                   // logical shift

        2: out = {in[63], in[62:0] << n};   // arithmetic shift

/*TODO*/3: out = in << n;                   // conversion to BESM-6 format

        endcase
endmodule
