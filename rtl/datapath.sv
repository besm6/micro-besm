module datapath(
    // Signals for am2901
    input               clk,    // Clock
    input         [8:0] Ialu,   // ALU instruction, from ALUD, FUNC and ALUS
    input         [3:0] A,      // A register address, from RA
    input         [3:0] B,      // B register address, from RB
    input        [63:0] D,      // D bus input
    input               C0,     // Carry input, from CI
    input               mode32  // 32-bit mode flag, from H
    output logic [63:0] oYalu,  // Y bus output from ALU

    // Signals for am2904
    input         [9:0] Iss,    // Status/Shift instruction, from SHMUX and STOPC
    input               nCEM,   // Machine status register enable, from CEM
    input               nCEN,   // Micro status register enable, from CEN
    output logic  [3:0] oYss,   // Y bus output from Status/Shift
    output logic        CT,     // Conditional test output
    output logic        Css     // Carry multiplexer output
);

// Internal carry signals
logic c4, c8, c12, c16, c20, c24, c28, c32, c36, c40, c44, c48, c52, c56, c60;

// Internal shift signals
logic r3, r7, r11, r15, r19, r23, r27, r31, r35, r39, r43, r47, r51, r55, r59;
logic r4, r8, r12, r16, r20, r24, r28, r32, r36, r40, r44, r48, r52, r56, r60;
logic q3, q7, q11, q15, q19, q23, q27, q31, q35, q39, q43, q47, q51, q55, q59;
logic q4, q8, q12, q16, q20, q24, q28, q32, q36, q40, q44, q48, q52, q56, q60;

// Status signals for am2904
logic C, V, N, Z;

// Shift signals for am2904
logic PR0, PQ0, PR63, PQ63, oR0, oR63, oQ0, oQ63;

// Generate and propagate signals for Am2902
logic nG0,  nG4,  nG8,  nG12, nG16, nG20, nG24, nG28,
      nG32, nG36, nG40, nG44, nG48, nG52, nG56, nG60;
logic nP0,  nP4,  nP8,  nP12, nP16, nP20, nP24, nP28,
      nP32, nP36, nP40, nP44, nP48, nP52, nP56, nP60;
logic nGx0, nGx1, nGx2, nGx3, nPx0, nPx1, nPx2, nPx3;

// Instruction for am2904
logic [12:0] Ifull;

// Data signals for am2904
logic Yz, Yn, Yovr, Yc, oYz, oYn, oYovr, oYc;

// Сигналами I0-I8, А0-А3, В0-В3, /ОЕ, С0 управляет
// микропрограмма; сигналы D0-D3 поступают с входной шины D ЦП;
// У0-У3 выходят на шину У ЦП; сигналы С4, F3, OVR, Z, R0, R3,
// Q0, Q3 передаются на схему управления состоянием и сдвигами
// К1804ВР2, и далее - на мультиплексор условий; /Р и G
// используются для формирования ускоренного переноса.
am2901 p3_0  (I, A, B, D[3:0],   oYalu[3:0],   PR0, r4,  PQ0, q4,  oR0, r3,  oQ0, q3,  clk, c0,  0, c4,  nG0,  nP0,  ,    ,    Z3_0);
am2901 p7_4  (I, A, B, D[7:4],   oYalu[7:4],   r3,  r8,  q3,  q8,  r4,  r7,  q4,  q7,  clk, c4,  0, c8,  nG4,  nP4,  ,    ,    Z7_4);
am2901 p11_8 (I, A, B, D[11:8],  oYalu[11:8],  r7,  r12, q7,  q12, r8,  r11, q8,  q11, clk, c8,  0, c12, nG8,  nP8,  ,    ,    Z11_8);
am2901 p15_12(I, A, B, D[15:12], oYalu[15:12], r11, r16, q11, q16, r12, r15, q12, q15, clk, c12, 0, c16, nG12, nP12, ,    ,    Z15_12);
am2901 p19_16(I, A, B, D[19:16], oYalu[19:16], r15, r20, q15, q20, r16, r19, q16, q19, clk, c16, 0, c20, nG16, nP16, ,    ,    Z19_16);
am2901 p23_20(I, A, B, D[23:20], oYalu[23:20], r19, r24, q19, q24, r20, r23, q20, q23, clk, c20, 0, c24, nG20, nP20, ,    ,    Z23_20);
am2901 p27_24(I, A, B, D[27:24], oYalu[27:24], r23, r28, q23, q28, r24, r27, q24, q27, clk, c24, 0, c28, nG24, nP24, ,    ,    Z27_24);
am2901 p31_28(I, A, B, D[31:28], oYalu[31:28], r27, r32, q27, q32, r28, r31, q28, q31, clk, c28, 0, c32, nG28, nP28, v32, n32, Z31_28);
am2901 p35_32(I, A, B, D[35:32], oYalu[35:32], r31, r36, q31, q36, r32, r35, q32, q35, clk, c32, 0, c36, nG32, nP32, ,    ,    Z35_32);
am2901 p39_36(I, A, B, D[39:36], oYalu[39:36], r35, r40, q35, q40, r36, r39, q36, q39, clk, c36, 0, c40, nG36, nP36, ,    ,    Z39_36);
am2901 p43_40(I, A, B, D[43:40], oYalu[43:40], r39, r44, q39, q44, r40, r43, q40, q43, clk, c40, 0, c44, nG40, nP40, ,    ,    Z43_40);
am2901 p47_44(I, A, B, D[47:44], oYalu[47:44], r43, r48, q43, q48, r44, r47, q44, q47, clk, c44, 0, c48, nG44, nP44, ,    ,    Z47_44);
am2901 p51_48(I, A, B, D[51:48], oYalu[51:48], r47, r52, q47, q52, r48, r51, q48, q51, clk, c48, 0, c52, nG48, nP48, ,    ,    Z51_48);
am2901 p55_52(I, A, B, D[55:52], oYalu[55:52], r51, r56, q51, q56, r52, r55, q52, q55, clk, c52, 0, c56, nG52, nP52, ,    ,    Z55_52);
am2901 p59_56(I, A, B, D[59:56], oYalu[59:56], r55, r60, q55, q60, r56, r59, q56, q59, clk, c56, 0, c60, nG56, nP56, ,    ,    Z59_56);
am2901 p63_60(I, A, B, D[63:60], oYalu[63:60], r59, PR63,q59, PQ63,r60, oR63,q60, oQ63,clk, c60, 0, c64, nG60, nP60, v64, n64, Z63_60);

// Global zero flag
assign z32 = !Z3_0   & !Z7_4   & !Z11_8  & !Z15_12 &
             !Z19_16 & !Z23_20 & !Z27_24 & !Z31_28;
assign z64 = z32 &
             !Z35_32 & !Z39_36 & !Z43_40 & !Z47_44 &
             !Z51_48 & !Z55_52 & !Z59_56 & !Z63_60;

// Carry lookahead
am2902 s0(c0,  nG0,  nP0,  nG4,  nP4,  nG8,  nP8,  nG12, nP12, c4,  c8,  c12, nGx0, nPx0);
am2902 s1(c16, nG16, nP16, nG20, nP20, nG24, nP24, nG28, nP28, c20, c24, c28, nGx1, nPx1);
am2902 s2(c32, nG32, nP32, nG36, nP36, nG40, nP40, nG44, nP44, c36, c40, c44, nGx2, nPx2);
am2902 s3(c48, nG48, nP48, nG52, nP52, nG56, nP56, nG60, nP60, c52, c56, c60, nGx3, nPx3);
am2902 sx(c0,  nGx0, nPx0, nGx1, nPx1, nGx2, nPx2, nGx3, nPx3, c16, c32, c48, ,     );

// Full instruction for am2904
assign Ifull = {1'b1, 1'b1, Ialu[7], Iss};

// Выход кода условия СТ подается
// на мультиплексор условий. Входы /OEy, /EZ, /ЕС, /EN, /EV, СХ,
// /ОЕСТ заземлены. Управление входом /SE осуществляется инверсным
// сигналом I8 МПС, I10 соединяется со входом I7 МПС. Сигналами
// /СЕМ и /CEN управляет микропрограмма.
am2904 status(
    Ifull, clk, nCEM, nCEN, 0,
    C, V, N, Z, 0, 0, 0, 0,
    Yz, Yc, Yn, Yovr, oYz, oYc, oYn, oYovr,
    0, CT,
    0, Co,
    !Ialu[8],
    oR0, oR63, oQ0, oQ63, PR0, PR63, PQ0, PQ63);

// Выходы признаков состояния старшей МПС С4, OVR, F3, Z соединены
// с соответствующими входами признаков состояния СУСС. При этом
// старшей может считаться МПС, содержащая 32-28 или 64-60 разряды
// в зависимости от типа операций, производимых в АЛУ.
assign Z = mode32 ? z32 : z64;
assign N = mode32 ? n32 : n64;
assign V = mode32 ? v32 : v64;
assign C = mode32 ? c32 : c64;

// Двунаправленная шина У (УС, YN, YV, YZ) соединена через ШФ со
// входной шиной D ЦП для выдачи информации из СУСС, и с выходной
// шиной У для чтения информации.
assign Yz =   D[0];
assign Yn =   D[1];
assign Yovr = D[2];
assign Yc =   D[3];

assign oYss[0] = oYz;
assign oYss[1] = oYn;
assign oYss[2] = oYovr;
assign oYss[3] = oYc;

endmodule
