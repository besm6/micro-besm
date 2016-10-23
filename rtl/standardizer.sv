`default_nettype none

module standardizer(
    input  wire        clk,
    input  wire [64:1] dc,      // ,BB1
    input  wire        pe,      // emulator
    input  wire        tkk,
    output reg   [4:1] air,
    output reg   [7:0] kop,
    output reg         extop,   // extended opcode flag
    output reg  [20:1] addr
);
    wire  [5:1] outA;
    wire  [8:1] outB;
    wire [20:1] outC;
    wire        port;
    wire        inv_outB7;
    wire        inv_outB8;
    wire        eopc_n, eopc;
    wire  [8:1] inv_C;
    wire  [8:1] mux;

    // CKM1 - PAL #1

    assign outA[1] = (!pe & !tkk & dc[61]) | (!pe & tkk & dc[29]) | (pe & !tkk & dc[57]) | (pe & tkk & port);
    assign outA[2] = (!pe & !tkk & dc[62]) | (!pe & tkk & dc[30]) | (pe & !tkk & dc[58]) | (pe & tkk & dc[34]);
    assign outA[3] = (!pe & !tkk & dc[63]) | (!pe & tkk & dc[31]) | (pe & !tkk & dc[59]) | (pe & tkk & dc[35]);
    assign outA[4] = (!pe & !tkk & dc[64]) | (!pe & tkk & port)   | (pe & !tkk & dc[64]) | (pe & tkk & dc[36]);
    assign outA[5] = (!pe & !tkk & dc[61] & dc[62] & dc[63] & dc[64]) | (!pe & tkk & dc[29] & dc[30] & dc[31] & port) |
                     ( pe & !tkk & dc[57] & dc[58] & dc[59] & dc[64]) | ( pe & tkk & port   & dc[34] & dc[35] & dc[36]);

    assign port = (pe & dc[33]) ^ (!pe & dc[32]);

    // CKM2 and CKM3 - PAL #2,#3

    assign outB[1] = (!pe & tkk & dc[21]) | (pe & tkk & dc[25] & !dc[32]) | (!pe & !tkk & dc[53]) | (pe & !tkk & dc[49] & !dc[56]);
    assign outB[2] = (!pe & tkk & dc[22]) | (pe & tkk & dc[26] & !dc[32]) | (!pe & !tkk & dc[54]) | (pe & !tkk & dc[50] & !dc[56]);
    assign outB[3] = (!pe & tkk & dc[23]) | (pe & tkk & dc[27] & !dc[32]) | (!pe & !tkk & dc[55]) | (pe & !tkk & dc[51] & !dc[56]);
    assign outB[4] = (!pe & tkk & dc[24]) | (pe & tkk & dc[28])           | (!pe & !tkk & dc[56]) | (pe & !tkk & dc[52]);
    assign outB[5] = (!pe & tkk & dc[25]) | (pe & tkk & dc[29])           | (!pe & !tkk & dc[57]) | (pe & !tkk & dc[53]);
    assign outB[6] = (!pe & tkk & dc[26]) | (pe & tkk & dc[30])           | (!pe & !tkk & dc[58]) | (pe & !tkk & dc[54]);
    assign outB[7] = (!pe & tkk & dc[27]) | (pe & tkk & dc[31])           | (!pe & !tkk & dc[59]) | (pe & !tkk & dc[55]);
    assign outB[8] = (!pe & tkk & dc[28]) | (pe & tkk & dc[32])           | (!pe & !tkk & dc[60]) | (pe & !tkk & dc[56]);


    // CKM4 and CKM5 and CKM6 - PAL #4,#5,#6

    assign outC[1]  = (!pe & !tkk & dc[33]) | (pe & !tkk & dc[37]) | (!pe & tkk & dc[1])  | (pe & tkk & dc[13]);
    assign outC[2]  = (!pe & !tkk & dc[34]) | (pe & !tkk & dc[38]) | (!pe & tkk & dc[2])  | (pe & tkk & dc[14]);
    assign outC[3]  = (!pe & !tkk & dc[35]) | (pe & !tkk & dc[39]) | (!pe & tkk & dc[3])  | (pe & tkk & dc[15]);
    assign outC[4]  = (!pe & !tkk & dc[36]) | (pe & !tkk & dc[40]) | (!pe & tkk & dc[4])  | (pe & tkk & dc[16]);
    assign outC[5]  = (!pe & !tkk & dc[37]) | (pe & !tkk & dc[41]) | (!pe & tkk & dc[5])  | (pe & tkk & dc[17]);
    assign outC[6]  = (!pe & !tkk & dc[38]) | (pe & !tkk & dc[42]) | (!pe & tkk & dc[6])  | (pe & tkk & dc[18]);
    assign outC[7]  = (!pe & !tkk & dc[39]) | (pe & !tkk & dc[43]) | (!pe & tkk & dc[7])  | (pe & tkk & dc[19]);
    assign outC[8]  = (!pe & !tkk & dc[40]) | (pe & !tkk & dc[44]) | (!pe & tkk & dc[8])  | (pe & tkk & dc[20]);
    assign outC[9]  = (!pe & !tkk & dc[41]) | (pe & !tkk & dc[45]) | (!pe & tkk & dc[9])  | (pe & tkk & dc[21]);
    assign outC[10] = (!pe & !tkk & dc[42]) | (pe & !tkk & dc[46]) | (!pe & tkk & dc[10]) | (pe & tkk & dc[22]);
    assign outC[11] = (!pe & !tkk & dc[43]) | (pe & !tkk & dc[47]) | (!pe & tkk & dc[11]) | (pe & tkk & dc[23]);
    assign outC[12] = (!pe & !tkk & dc[44]) | (pe & !tkk & dc[48]) | (!pe & tkk & dc[12]) | (pe & tkk & dc[24]);
    assign outC[13] = (!pe & !tkk & dc[45]) | (pe & !tkk & dc[49] & dc[56]) | (pe & !tkk & dc[55] & !dc[56]) |
                      (!pe &  tkk & dc[13]) | (pe &  tkk & dc[25] & dc[32]) | (pe &  tkk & dc[31] & !dc[32]);
    assign outC[14] = (!pe & !tkk & dc[46]) | (pe & !tkk & dc[50] & dc[56]) | (pe & !tkk & dc[55] & !dc[56]) |
                      (!pe &  tkk & dc[14]) | (pe &  tkk & dc[26] & dc[32]) | (pe &  tkk & dc[31] & !dc[32]);
    assign outC[15] = (!pe & !tkk & dc[47]) | (pe & !tkk & dc[51] & dc[56]) | (pe & !tkk & dc[55] & !dc[56]) |
                      (!pe &  tkk & dc[15]) | (pe &  tkk & dc[27] & dc[32]) | (pe &  tkk & dc[31] & !dc[32]);
    assign outC[16] = (!pe & !tkk & dc[48]) | (!pe & tkk & dc[16]);

    // CKM7 and CKM8  - PAL #7,#8

    assign outC[17] = (!pe & tkk & dc[17]) | (!pe & !tkk & dc[49]);
    assign outC[18] = (!pe & tkk & dc[18]) | (!pe & !tkk & dc[50]);
    assign outC[19] = (!pe & tkk & dc[19]) | (!pe & !tkk & dc[51]);
    assign outC[20] = (!pe & tkk & dc[20]) | (!pe & !tkk & dc[52]);

    always @(posedge clk) begin                         // K589IR83
        air[4:1] <= outA[4:1];
//      ir15     <= outA[5];
    end

    assign inv_outB7 = !outB[7];
    assign inv_outB8 = !outB[8];
    assign eopc_n = ~(inv_outB8 & inv_outB7 & outB[6] & outB[5] & outB[4] & outB[3] & outB[2] & outB[1]);
    assign eopc   = eopc_n || pe;

    assign inv_C[8:1] = outC[20:13];

    assign mux[8:1] = eopc ? outB[8:1] : inv_C[8:1];    // mux 555KP11

    always @(posedge clk) begin                         // K589IR83
        kop[7:0] <= mux[8:1];
        extop <= !eopc;
    end

    // ,BB1

    always @(posedge clk) begin                         // K589IR83
        addr <= outC;
    end

endmodule
