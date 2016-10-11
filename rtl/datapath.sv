module datapath(
    input         [8:0] I,          // Instruction word
    input         [3:0] A,          // Address input to RAM (for read)
    input         [3:0] B,          // Address input to RAM (for read/write)
    input        [63:0] D,          // Data input to chip
    output logic [63:0] Y,          // Data output from chip
    input               clk,        // Clock
    input               C0,         // Carry input to ALU
    input               nOE         // Tri-state driver for Y output
    //TODO: signals for am2904
    input               nCEM,       // Machine status register enable
    input               nCEN,       // Micro status register enable
);
    // Internal carry signals
    logic C4, C8, C12, C16, C20, C24, C28, C32, C36, C40, C44, C48, C52, C56, C60;
    logic Cx1, Cx2, Cx3;

    // Internal shift signals
    logic R3, R7, R11, R15, R19, R23, R27, R31, R35, R39, R43, R47, R51, R55, R59;
    logic R4, R8, R12, R16, R20, R24, R28, R32, R36, R40, R44, R48, R52, R56, R60;
    logic Q3, Q7, Q11, Q15, Q19, Q23, Q27, Q31, Q35, Q39, Q43, Q47, Q51, Q55, Q59;
    logic Q4, Q8, Q12, Q16, Q20, Q24, Q28, Q32, Q36, Q40, Q44, Q48, Q52, Q56, Q60;

    // Status signals for am2904
    logic C, V, N, Z;

    // Shift signals for am2904
    logic PR0, PQ0, PR63, PQ63, oR0, oR63, oQ0, oQ63;

    // Generate and propagate signals for Am2902
    logic nG0, nG4, nG8, nG12, nG16, nG20, nG24, nG28,
          nG32, nG36, nG40, nG44, nG48, nG52, nG56, nG60;
    logic nP0, nP4, nP8, nP12, nP16, nP20, nP24, nP28,
          nP32, nP36, nP40, nP44, nP48, nP52, nP56, nP60;
    logic nGx0, nGx1, nGx2, nGx3, nPx0, nPx1, nPx2, nPx3;

    // Сигналами I0-I8, А0-А3, В0-В3, /ОЕ, С0 управляет
    // микропрограмма; сигналы D0-D3 поступают с входной шины D ЦП;
    // У0-У3 выходят на шину У ЦП; сигналы С4, F3, OVR, Z, R0, R3,
    // Q0, Q3 передаются на схему управления состоянием и сдвигами
    // К1804ВР2, и далее - на мультиплексор условий; /Р и G
    // используются для формирования ускоренного переноса.
    am2901 p3_0  (I, A, B, D[3:0],   Y[3:0],   PR0, R4,  PQ0, Q4,  oR0, R3,  oQ0, Q3,  clk, C0,  nOE, C4,  nG0,  nP0,  ,  ,  Z3_0);
    am2901 p7_4  (I, A, B, D[7:4],   Y[7:4],   R3,  R8,  Q3,  Q8,  R4,  R7,  Q4,  Q7,  clk, C4,  nOE, C8,  nG4,  nP4,  ,  ,  Z7_4);
    am2901 p11_8 (I, A, B, D[11:8],  Y[11:8],  R7,  R12, Q7,  Q12, R8,  R11, Q8,  Q11, clk, C8,  nOE, C12, nG8,  nP8,  ,  ,  Z11_8);
    am2901 p15_12(I, A, B, D[15:12], Y[15:12], R11, R16, Q11, Q16, R12, R15, Q12, Q15, clk, C12, nOE, C16, nG12, nP12, ,  ,  Z15_12);
    am2901 p19_16(I, A, B, D[19:16], Y[19:16], R15, R20, Q15, Q20, R16, R19, Q16, Q19, clk, C16, nOE, C20, nG16, nP16, ,  ,  Z19_16);
    am2901 p23_20(I, A, B, D[23:20], Y[23:20], R19, R24, Q19, Q24, R20, R23, Q20, Q23, clk, C20, nOE, C24, nG20, nP20, ,  ,  Z23_20);
    am2901 p27_24(I, A, B, D[27:24], Y[27:24], R23, R28, Q23, Q28, R24, R27, Q24, Q27, clk, C24, nOE, C28, nG24, nP24, ,  ,  Z27_24);
    am2901 p31_28(I, A, B, D[31:28], Y[31:28], R27, R32, Q27, Q32, R28, R31, Q28, Q31, clk, C28, nOE, C32, nG28, nP28, ,  ,  Z31_28);
    am2901 p35_32(I, A, B, D[35:32], Y[35:32], R31, R36, Q31, Q36, R32, R35, Q32, Q35, clk, C32, nOE, C36, nG32, nP32, ,  ,  Z35_32);
    am2901 p39_36(I, A, B, D[39:36], Y[39:36], R35, R40, Q35, Q40, R36, R39, Q36, Q39, clk, C36, nOE, C40, nG36, nP36, ,  ,  Z39_36);
    am2901 p43_40(I, A, B, D[43:40], Y[43:40], R39, R44, Q39, Q44, R40, R43, Q40, Q43, clk, C40, nOE, C44, nG40, nP40, ,  ,  Z43_40);
    am2901 p47_44(I, A, B, D[47:44], Y[47:44], R43, R48, Q43, Q48, R44, R47, Q44, Q47, clk, C44, nOE, C48, nG44, nP44, ,  ,  Z47_44);
    am2901 p51_48(I, A, B, D[51:48], Y[51:48], R47, R52, Q47, Q52, R48, R51, Q48, Q51, clk, C48, nOE, C52, nG48, nP48, ,  ,  Z51_48);
    am2901 p55_52(I, A, B, D[55:52], Y[55:52], R51, R56, Q51, Q56, R52, R55, Q52, Q55, clk, C52, nOE, C56, nG52, nP52, ,  ,  Z55_52);
    am2901 p59_56(I, A, B, D[59:56], Y[59:56], R55, R60, Q55, Q60, R56, R59, Q56, Q59, clk, C56, nOE, C60, nG56, nP56, ,  ,  Z59_56);
    am2901 p63_60(I, A, B, D[63:60], Y[63:60], R59, PR63,Q59, PQ63,R60, oR63,Q60, oQ63,clk, C60, nOE, C,   nG60, nP60, V, N, Z63_60);

    // Global zero flag
    assign Z = !Z3_0   & !Z7_4   & !Z11_8  & !Z15_12 &
               !Z19_16 & !Z23_20 & !Z27_24 & !Z31_28 &
               !Z35_32 & !Z39_36 & !Z43_40 & !Z47_44 &
               !Z51_48 & !Z55_52 & !Z59_56 & !Z63_60;

    // Carry lookahead
    am2902 ss0(C0,  nG0,  nP0,  nG4,  nP4,  nG8,  nP8,  nG12, nP12, C4,  C8,  C12, nGx0, nPx0);
    am2902 ss1(Cx1, nG16, nP16, nG20, nP20, nG24, nP24, nG28, nP28, C20, C24, C28, nGx1, nPx1);
    am2902 ss2(Cx2, nG32, nP32, nG36, nP36, nG40, nP40, nG44, nP44, C36, C40, C44, nGx2, nPx2);
    am2902 ss3(Cx3, nG48, nP48, nG52, nP52, nG56, nP56, nG60, nP60, C52, C56, C60, nGx3, nPx3);
    am2902 ssx(C0,  nGx0, nPx0, nGx1, nPx1, nGx2, nPx2, nGx3, nPx3, C16, C32, C48, ,     );

    // Выходы признаков состояния старшей МПС С4, OVR, F3, Z соединены
    // с соответствующими входами признаков состояния СУСС. При этом
    // старшей может считаться МПС, содержащая 32-28 или 64-60 разряды
    // в зависимости от типа операций, производимых в АЛУ.
//TODO: switch C/V/N/Z depending on 32/64 mode
    // Двунаправленная шина У (УС, YN, YV, YZ) соединена через ШФ со
    // входной шиной D ЦП для выдачи информации из СУСС, и с выходной
    // шиной У для чтения информации.
//TODO: connect uY* to D and Y
    // Выход кода условия СТ подается
    // на мультиплексор условий. Входы /СЕМ?, /EZ, /ЕС, /EN, /EV, СХ,
    // /ОЕСТ заземлены. Управление входом /SE осуществляется инверсным
    // сигналом I8 МПС, I10 соединяется со входом I7 МПС. Сигналами
    // /СЕМ и /CEN управляет микропрограмма.
    am2904 status(
        I,         // input [12:0] Instruction

        clk,       //+ input  Clock
        nCEM,      //+ input  Machine status register enable
        nCEN,      //+ input  Micro status register enable
        nOEy,      // input  Y output enable
        C,         //+ input  Carry status from ALU
        V,         //+ input  Overflow status from ALU
        N,         //+ input  Sign status from ALU
        Z,         //+ input  Zero status from ALU
        0,         //+ input  Zero status enable
        0,         //+ input  Carry status enable
        0,         //+ input  Sign status enable
        0,         //+ input  Overflow status enable
        Yz,        // input  Zero status bus input
        Yc,        // input  Carry status bus input
        Yn,        // input  Sign status bus input
        Yovr,      // input  Overflow status bus input
        oYz,       // output Output direction of the above signals
        oYc,       // output --//--
        oYn,       // output --//--
        oYovr,     // output --//--

        0,         //+ input  CT output enable
        CT,        // output Conditional test

        0,         //+ input  Carry multiplexer in
        Co,        // output Carry multiplexer out

        nSE,       // input  Shift enable
        oR0,       //+ input  Serial shift, RAM0 of least significant slice
        oR63,      //+ input  Serial shift, RAM3 of most significant slice
        oQ0,       //+ input  Serial shift, QIO0 of least significant slice
        oQ63,      //+ input  Serial shift, QIO3 of most significant slice
        PR0,       //+ output Output direction of the above signals
        PR63,      //+ output --//--
        PQ0,       //+ output --//--
        PQ63       //+ output --//--
    );

    //TODO
endmodule
