//
// K1802BB1 - Multiport RAM 4x4
//
module k1802bb1(
    input        [3:0] DA,      // A data bus input...
    output logic [3:0] oDA,     // ...and output
    input        [3:0] DB,      // B data bus input...
    output logic [3:0] oDB,     // ...and output
    input        [3:0] DC,      // C data bus input...
    output logic [3:0] oDC,     // ...and output
    input        [3:0] DX,      // X data bus input...
    output logic [3:0] oDX,     // ...and output

    input        [1:0] AA,      // A address input
    input        [1:0] AB,      // B address input
    input        [1:0] AC,      // C address input
    input        [1:0] AX,      // X address input

    input              nECA,    // A port enable
    input              nECB,    // B port enable
    input              nECC,    // C port enable
    input              nECX,    // X port enable

    input              nWA,     // A write enable
    input              nWB,     // B write enable
    input              nWC,     // C write enable
    input              nWX,     // X write enable

    input              nRA,     // A read enable
    input              nRB,     // B read enable
    input              nRC,     // C read enable
    input              nRX,     // X read enable

    input              CI,      // counter input
    output logic       CO,      // counter overflow
    output logic       E        // counter equal flag RG0==RG3
);

// Internal RAM.
logic [3:0] RG[4];
logic clk0, sel1, sel2, sel3;

// Read RGi.
assign oDA = (!nRA & !nECA) ? RG[AA] : 'z;
assign oDB = (!nRB & !nECB) ? RG[AB] : 'z;
assign oDC = (!nRC & !nECC) ? RG[AC] : 'z;
assign oDX = (!nRX & !nECX) ? RG[AX] : 'z;

// RG0 is edge-sensitive, RG1-RG3 level sensitive.
assign clk0 = ((AA == 0) & !nECA & !nWA) |
              ((AB == 0) & !nECB & !nWB) |
              ((AC == 0) & !nECC & !nWC) |
              ((AX == 0) & !nECX & !nWX) | CI;
assign sel1 = ((AA == 1) & !nECA) |
              ((AB == 1) & !nECB) |
              ((AC == 1) & !nECC) |
              ((AX == 1) & !nECX);
assign sel2 = ((AA == 2) & !nECA) |
              ((AB == 2) & !nECB) |
              ((AC == 2) & !nECC) |
              ((AX == 2) & !nECX);
assign sel3 = ((AA == 3) & !nECA) |
              ((AB == 3) & !nECB) |
              ((AC == 3) & !nECC) |
              ((AX == 3) & !nECX);

// Flip-flop RG0
always @(posedge clk0)
    if (CI)
        {CO, RG[0]} <= RG[0] + 1;
    else begin
        RG[0] <= ((AA == 0) & !nWA) ? DA :
                 ((AB == 0) & !nWB) ? DB :
                 ((AC == 0) & !nWC) ? DC :
                 ((AX == 0) & !nWX) ? DX : RG[0];
        CO <= 0;
    end

// Latch RG1
always @(*)
    if (sel1)
        RG[1] <= ((AA == 1) & !nWA) ? DA :
                 ((AB == 1) & !nWB) ? DB :
                 ((AC == 1) & !nWC) ? DC :
                 ((AX == 1) & !nWX) ? DX : RG[1];
// Latch RG2
always @(*)
    if (sel2)
        RG[2] <= ((AA == 2) & !nWA) ? DA :
                 ((AB == 2) & !nWB) ? DB :
                 ((AC == 2) & !nWC) ? DC :
                 ((AX == 2) & !nWX) ? DX : RG[2];
// Latch RG3
always @(*)
    if (sel3)
        RG[3] <= ((AA == 3) & !nWA) ? DA :
                 ((AB == 3) & !nWB) ? DB :
                 ((AC == 3) & !nWC) ? DC :
                 ((AX == 3) & !nWX) ? DX : RG[3];

// TODO: something is wrong with the above.
// We have five asynchronous processes accessing the same memory.
// Need at least an arbiter here.

// Compare RG0 and RG3.
assign E = (RG[0] == RG[3]);

endmodule
