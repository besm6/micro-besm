`default_nettype none

//
// External bus interface, based on K1802BB1 four-port 4-bit RAM chip.
//
module extbus(
    input        [71:0] DA,     // A data bus input...
    output logic [71:0] oDA,    // ...and output
    input        [71:0] DB,     // B data bus input...
    output logic [71:0] oDB,    // ...and output
    input        [71:0] DC,     // C data bus input...
    output logic [71:0] oDC,    // ...and output
    input        [71:0] DX,     // X data bus input...
    output logic [71:0] oDX,    // ...and output

    input         [1:0] AA,     // A address input
    input         [1:0] AB,     // B address input
    input         [1:0] AC,     // C address input
    input         [1:0] AX,     // X address input

    input               ECA,    // A port enable
    input               ECB,    // B port enable
    input               ECC,    // C port enable
    input               ECX,    // X port enable

    input               WA,     // A write enable
    input               WB,     // B write enable
    input               WC,     // C write enable
    input               WX      // X write enable
);

//
// Data bus 63:0
//
k1802bb1 b0_3  (~DA[3:0],   ~oDA[3:0],   ~DB[3:0],   ~oDB[3:0],   ~DC[3:0],   ~oDC[3:0],   ~DX[3:0],   ~oDX[3:0],
                AA, AB, AC, AX, ~ECA, ~ECB, ~ECC, ~ECX, ~WA, ~WB, ~WC, ~WX, 0, 0, 0, 0, 0, , );
k1802bb1 b4_7  (~DA[7:4],   ~oDA[7:4],   ~DB[7:4],   ~oDB[7:4],   ~DC[7:4],   ~oDC[7:4],   ~DX[7:4],   ~oDX[7:4],
                AA, AB, AC, AX, ~ECA, ~ECB, ~ECC, ~ECX, ~WA, ~WB, ~WC, ~WX, 0, 0, 0, 0, 0, , );
k1802bb1 b8_11 (~DA[11:8],  ~oDA[11:8],  ~DB[11:8],  ~oDB[11:8],  ~DC[11:8],  ~oDC[11:8],  ~DX[11:8],  ~oDX[11:8],
                AA, AB, AC, AX, ~ECA, ~ECB, ~ECC, ~ECX, ~WA, ~WB, ~WC, ~WX, 0, 0, 0, 0, 0, , );
k1802bb1 b12_15(~DA[15:12], ~oDA[15:12], ~DB[15:12], ~oDB[15:12], ~DC[15:12], ~oDC[15:12], ~DX[15:12], ~oDX[15:12],
                AA, AB, AC, AX, ~ECA, ~ECB, ~ECC, ~ECX, ~WA, ~WB, ~WC, ~WX, 0, 0, 0, 0, 0, , );
k1802bb1 b16_19(~DA[19:16], ~oDA[19:16], ~DB[19:16], ~oDB[19:16], ~DC[19:16], ~oDC[19:16], ~DX[19:16], ~oDX[19:16],
                AA, AB, AC, AX, ~ECA, ~ECB, ~ECC, ~ECX, ~WA, ~WB, ~WC, ~WX, 0, 0, 0, 0, 0, , );
k1802bb1 b20_23(~DA[23:20], ~oDA[23:20], ~DB[23:20], ~oDB[23:20], ~DC[23:20], ~oDC[23:20], ~DX[23:20], ~oDX[23:20],
                AA, AB, AC, AX, ~ECA, ~ECB, ~ECC, ~ECX, ~WA, ~WB, ~WC, ~WX, 0, 0, 0, 0, 0, , );
k1802bb1 b24_27(~DA[27:24], ~oDA[27:24], ~DB[27:24], ~oDB[27:24], ~DC[27:24], ~oDC[27:24], ~DX[27:24], ~oDX[27:24],
                AA, AB, AC, AX, ~ECA, ~ECB, ~ECC, ~ECX, ~WA, ~WB, ~WC, ~WX, 0, 0, 0, 0, 0, , );
k1802bb1 b28_31(~DA[31:28], ~oDA[31:28], ~DB[31:28], ~oDB[31:28], ~DC[31:28], ~oDC[31:28], ~DX[31:28], ~oDX[31:28],
                AA, AB, AC, AX, ~ECA, ~ECB, ~ECC, ~ECX, ~WA, ~WB, ~WC, ~WX, 0, 0, 0, 0, 0, , );
k1802bb1 b32_35(~DA[35:32], ~oDA[35:32], ~DB[35:32], ~oDB[35:32], ~DC[35:32], ~oDC[35:32], ~DX[35:32], ~oDX[35:32],
                AA, AB, AC, AX, ~ECA, ~ECB, ~ECC, ~ECX, ~WA, ~WB, ~WC, ~WX, 0, 0, 0, 0, 0, , );
k1802bb1 b36_39(~DA[39:36], ~oDA[39:36], ~DB[39:36], ~oDB[39:36], ~DC[39:36], ~oDC[39:36], ~DX[39:36], ~oDX[39:36],
                AA, AB, AC, AX, ~ECA, ~ECB, ~ECC, ~ECX, ~WA, ~WB, ~WC, ~WX, 0, 0, 0, 0, 0, , );
k1802bb1 b40_43(~DA[43:40], ~oDA[43:40], ~DB[43:40], ~oDB[43:40], ~DC[43:40], ~oDC[43:40], ~DX[43:40], ~oDX[43:40],
                AA, AB, AC, AX, ~ECA, ~ECB, ~ECC, ~ECX, ~WA, ~WB, ~WC, ~WX, 0, 0, 0, 0, 0, , );
k1802bb1 b44_47(~DA[47:44], ~oDA[47:44], ~DB[47:44], ~oDB[47:44], ~DC[47:44], ~oDC[47:44], ~DX[47:44], ~oDX[47:44],
                AA, AB, AC, AX, ~ECA, ~ECB, ~ECC, ~ECX, ~WA, ~WB, ~WC, ~WX, 0, 0, 0, 0, 0, , );
k1802bb1 b48_51(~DA[51:48], ~oDA[51:48], ~DB[51:48], ~oDB[51:48], ~DC[51:48], ~oDC[51:48], ~DX[51:48], ~oDX[51:48],
                AA, AB, AC, AX, ~ECA, ~ECB, ~ECC, ~ECX, ~WA, ~WB, ~WC, ~WX, 0, 0, 0, 0, 0, , );
k1802bb1 b52_55(~DA[55:52], ~oDA[55:52], ~DB[55:52], ~oDB[55:52], ~DC[55:52], ~oDC[55:52], ~DX[55:52], ~oDX[55:52],
                AA, AB, AC, AX, ~ECA, ~ECB, ~ECC, ~ECX, ~WA, ~WB, ~WC, ~WX, 0, 0, 0, 0, 0, , );
k1802bb1 b56_59(~DA[59:56], ~oDA[59:56], ~DB[59:56], ~oDB[59:56], ~DC[59:56], ~oDC[59:56], ~DX[59:56], ~oDX[59:56],
                AA, AB, AC, AX, ~ECA, ~ECB, ~ECC, ~ECX, ~WA, ~WB, ~WC, ~WX, 0, 0, 0, 0, 0, , );
k1802bb1 b60_63(~DA[63:60], ~oDA[63:60], ~DB[63:60], ~oDB[63:60], ~DC[63:60], ~oDC[63:60], ~DX[63:60], ~oDX[63:60],
                AA, AB, AC, AX, ~ECA, ~ECB, ~ECC, ~ECX, ~WA, ~WB, ~WC, ~WX, 0, 0, 0, 0, 0, , );

//
// Tag 71:64
//
k1802bb1 b64_67(~DA[67:64], ~oDA[67:64], ~DB[67:64], ~oDB[67:64], ~DC[67:64], ~oDC[67:64], ~DX[67:64], ~oDX[67:64],
                AA, AB, AC, AX, ~ECA, ~ECB, ~ECC, ~ECX, ~WA, ~WB, ~WC, ~WX, 0, 0, 0, 0, 0, , );
k1802bb1 b68_71(~DA[71:68], ~oDA[71:68], ~DB[71:68], ~oDB[71:68], ~DC[71:68], ~oDC[71:68], ~DX[71:68], ~oDX[71:68],
                AA, AB, AC, AX, ~ECA, ~ECB, ~ECC, ~ECX, ~WA, ~WB, ~WC, ~WX, 0, 0, 0, 0, 0, , );

endmodule
