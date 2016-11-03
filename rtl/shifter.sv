`default_nettype none

module shifter(
    input  wire  [63:0] in,
    input  wire   [6:0] param,
    output logic [63:0] out
);

wire right = param[6];

wire [5:0] n = right ? param[5:0]
                     : (~param[5:0] + 1);

always_comb
    if (right)
        out = in >> n;
    else
        out = in << n;

endmodule
