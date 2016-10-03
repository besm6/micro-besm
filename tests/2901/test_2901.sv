module testbench();

    // Input signals
    logic [8:0] I;
    logic [3:0] Aadd, Badd;
    logic [3:0] D;
    logic       RAM0, RAM3, Q0, Q3;
    logic       clk, C0, OEbar;

    // Output signals
    logic [3:0] Y;
    logic       RAM0out, RAM3out, Q0out, Q3out;
    logic       C4, Gbar, Pbar, OVR, F3, F30;

    // Device under test
    a2901 dut (
        I,
        Aadd, Badd,
        D,
        Y,
        RAM0, RAM3, Q0, Q3,
        RAM0out, RAM3out, Q0out, Q3out,
        clk, C0, OEbar,
        C4, Gbar, Pbar, OVR, F3, F30
    );

initial begin

// ************************
// *                      *
// * TEST VECTORS FOR ALU *
// *                      *
// ************************
// ******** ADDITION  R + S ********
//------------------------

clk <= 1;		// Cycle No: 0
#1;

I <= 'b000000111;
D <= 'b0000;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1
#1;

I <= 'b001000110;
D <= 'b0000;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 0 : < Y !== 'b0000 >");	// Vector No: 0
if (C4 !== 0) $display("Assert 1 : < C4 !== 0 >");
if (Gbar !== 1) $display("Assert 2 : < Gbar !== 1 >");
if (Pbar !== 1) $display("Assert 3 : < Pbar !== 1 >");
if (OVR !== 0) $display("Assert 4 : < OVR !== 0 >");
if (F3 !== 0) $display("Assert 5 : < F3 !== 0 >");
if (F30 !== 1) $display("Assert 6 : < F30 !== 1 >");
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 2
#1;

I <= 'b000000111;
D <= 'b0000;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 3
#1;

I <= 'b001000110;
D <= 'b0000;
C0 <= 1;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0001) $display("Assert 7 : < Y !== 'b0001 >");	// Vector No: 1
if (C4 !== 0) $display("Assert 8 : < C4 !== 0 >");
if (Gbar !== 1) $display("Assert 9 : < Gbar !== 1 >");
if (Pbar !== 1) $display("Assert 10 : < Pbar !== 1 >");
if (OVR !== 0) $display("Assert 11 : < OVR !== 0 >");
if (F3 !== 0) $display("Assert 12 : < F3 !== 0 >");
if (F30 !== 0) $display("Assert 13 : < F30 !== 0 >");
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 4
#1;

I <= 'b000000111;
D <= 'b1111;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 5
#1;

I <= 'b001000110;
D <= 'b0000;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 14 : < Y !== 'b1111 >");	// Vector No: 2
if (C4 !== 0) $display("Assert 15 : < C4 !== 0 >");
if (Gbar !== 1) $display("Assert 16 : < Gbar !== 1 >");
if (Pbar !== 0) $display("Assert 17 : < Pbar !== 0 >");
if (OVR !== 0) $display("Assert 18 : < OVR !== 0 >");
if (F3 !== 1) $display("Assert 19 : < F3 !== 1 >");
if (F30 !== 0) $display("Assert 20 : < F30 !== 0 >");
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 6
#1;

I <= 'b000000111;
D <= 'b1111;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 7
#1;

I <= 'b001000110;
D <= 'b0000;
C0 <= 1;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 21 : < Y !== 'b0000 >");	// Vector No: 3
if (C4 !== 1) $display("Assert 22 : < C4 !== 1 >");
if (Gbar !== 1) $display("Assert 23 : < Gbar !== 1 >");
if (Pbar !== 0) $display("Assert 24 : < Pbar !== 0 >");
if (OVR !== 0) $display("Assert 25 : < OVR !== 0 >");
if (F3 !== 0) $display("Assert 26 : < F3 !== 0 >");
if (F30 !== 1) $display("Assert 27 : < F30 !== 1 >");
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 8
#1;

I <= 'b000000111;
D <= 'b1111;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 9
#1;

I <= 'b001000110;
D <= 'b1111;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1110) $display("Assert 28 : < Y !== 'b1110 >");	// Vector No: 4
if (C4 !== 1) $display("Assert 29 : < C4 !== 1 >");
if (Gbar !== 0) $display("Assert 30 : < Gbar !== 0 >");
if (Pbar !== 0) $display("Assert 31 : < Pbar !== 0 >");
if (OVR !== 0) $display("Assert 32 : < OVR !== 0 >");
if (F3 !== 1) $display("Assert 33 : < F3 !== 1 >");
if (F30 !== 0) $display("Assert 34 : < F30 !== 0 >");
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 10
#1;

I <= 'b000000111;
D <= 'b1111;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 11
#1;

I <= 'b001000110;
D <= 'b1111;
C0 <= 1;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 35 : < Y !== 'b1111 >");	// Vector No: 5
if (C4 !== 1) $display("Assert 36 : < C4 !== 1 >");
if (Gbar !== 0) $display("Assert 37 : < Gbar !== 0 >");
if (Pbar !== 0) $display("Assert 38 : < Pbar !== 0 >");
if (OVR !== 0) $display("Assert 39 : < OVR !== 0 >");
if (F3 !== 1) $display("Assert 40 : < F3 !== 1 >");
if (F30 !== 0) $display("Assert 41 : < F30 !== 0 >");
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 12
#1;

I <= 'b000000111;
D <= 'b0000;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 13
#1;

I <= 'b001000110;
D <= 'b1111;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 42 : < Y !== 'b1111 >");	// Vector No: 6
if (C4 !== 0) $display("Assert 43 : < C4 !== 0 >");
if (Gbar !== 1) $display("Assert 44 : < Gbar !== 1 >");
if (Pbar !== 0) $display("Assert 45 : < Pbar !== 0 >");
if (OVR !== 0) $display("Assert 46 : < OVR !== 0 >");
if (F3 !== 1) $display("Assert 47 : < F3 !== 1 >");
if (F30 !== 0) $display("Assert 48 : < F30 !== 0 >");
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 14
#1;

I <= 'b000000111;
D <= 'b0000;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 15
#1;

I <= 'b001000110;
D <= 'b1111;
C0 <= 1;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 49 : < Y !== 'b0000 >");	// Vector No: 7
if (C4 !== 1) $display("Assert 50 : < C4 !== 1 >");
if (Gbar !== 1) $display("Assert 51 : < Gbar !== 1 >");
if (Pbar !== 0) $display("Assert 52 : < Pbar !== 0 >");
if (OVR !== 0) $display("Assert 53 : < OVR !== 0 >");
if (F3 !== 0) $display("Assert 54 : < F3 !== 0 >");
if (F30 !== 1) $display("Assert 55 : < F30 !== 1 >");
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 16
#1;

I <= 'b000000111;
D <= 'b0001;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 17
#1;

I <= 'b000000110;
D <= 'b0001;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0010) $display("Assert 56 : < Y !== 'b0010 >");	// Vector No: 8
if (C4 !== 0) $display("Assert 57 : < C4 !== 0 >");
if (Gbar !== 1) $display("Assert 58 : < Gbar !== 1 >");
if (Pbar !== 1) $display("Assert 59 : < Pbar !== 1 >");
if (OVR !== 0) $display("Assert 60 : < OVR !== 0 >");
if (F3 !== 0) $display("Assert 61 : < F3 !== 0 >");
if (F30 !== 0) $display("Assert 62 : < F30 !== 0 >");
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 18
#1;

I <= 'b000000111;
D <= 'b0010;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 19
#1;

I <= 'b001000110;
D <= 'b0010;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0100) $display("Assert 63 : < Y !== 'b0100 >");	// Vector No: 9
if (C4 !== 0) $display("Assert 64 : < C4 !== 0 >");
if (Gbar !== 1) $display("Assert 65 : < Gbar !== 1 >");
if (Pbar !== 1) $display("Assert 66 : < Pbar !== 1 >");
if (OVR !== 0) $display("Assert 67 : < OVR !== 0 >");
if (F3 !== 0) $display("Assert 68 : < F3 !== 0 >");
if (F30 !== 0) $display("Assert 69 : < F30 !== 0 >");
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 20
#1;

I <= 'b000000111;
D <= 'b0100;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 21
#1;

I <= 'b001000110;
D <= 'b0100;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1000) $display("Assert 70 : < Y !== 'b1000 >");	// Vector No: 10
if (C4 !== 0) $display("Assert 71 : < C4 !== 0 >");
if (Gbar !== 1) $display("Assert 72 : < Gbar !== 1 >");
if (Pbar !== 1) $display("Assert 73 : < Pbar !== 1 >");
if (OVR !== 1) $display("Assert 74 : < OVR !== 1 >");
if (F3 !== 1) $display("Assert 75 : < F3 !== 1 >");
if (F30 !== 0) $display("Assert 76 : < F30 !== 0 >");
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 22
#1;

I <= 'b000000111;
D <= 'b1000;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 23
#1;

I <= 'b001000110;
D <= 'b1000;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 77 : < Y !== 'b0000 >");	// Vector No: 11
if (C4 !== 1) $display("Assert 78 : < C4 !== 1 >");
if (Gbar !== 0) $display("Assert 79 : < Gbar !== 0 >");
if (Pbar !== 1) $display("Assert 80 : < Pbar !== 1 >");
if (OVR !== 1) $display("Assert 81 : < OVR !== 1 >");
if (F3 !== 0) $display("Assert 82 : < F3 !== 0 >");
if (F30 !== 1) $display("Assert 83 : < F30 !== 1 >");
#1;

// ************************
// ******** SUBTRACTION S - R ********
//------------------------

clk <= 1;		// Cycle No: 24
#1;

I <= 'b000000111;
D <= 'b0000;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 25
#1;

I <= 'b001001110;
D <= 'b0000;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 84 : < Y !== 'b1111 >");	// Vector No: 12
if (C4 !== 0) $display("Assert 85 : < C4 !== 0 >");
if (Gbar !== 1) $display("Assert 86 : < Gbar !== 1 >");
if (Pbar !== 0) $display("Assert 87 : < Pbar !== 0 >");
if (OVR !== 0) $display("Assert 88 : < OVR !== 0 >");
if (F3 !== 1) $display("Assert 89 : < F3 !== 1 >");
if (F30 !== 0) $display("Assert 90 : < F30 !== 0 >");
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 26
#1;

I <= 'b000000111;
D <= 'b0000;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 27
#1;

I <= 'b001001110;
D <= 'b0000;
C0 <= 1;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 91 : < Y !== 'b0000 >");	// Vector No: 13
if (C4 !== 1) $display("Assert 92 : < C4 !== 1 >");
if (Gbar !== 1) $display("Assert 93 : < Gbar !== 1 >");
if (Pbar !== 0) $display("Assert 94 : < Pbar !== 0 >");
if (OVR !== 0) $display("Assert 95 : < OVR !== 0 >");
if (F3 !== 0) $display("Assert 96 : < F3 !== 0 >");
if (F30 !== 1) $display("Assert 97 : < F30 !== 1 >");
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 28
#1;

I <= 'b000000111;
D <= 'b0000;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 29
#1;

I <= 'b001001110;
D <= 'b1111;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 98 : < Y !== 'b0000 >");	// Vector No: 14
if (C4 !== 0) $display("Assert 99 : < C4 !== 0 >");
if (Gbar !== 1) $display("Assert 100 : < Gbar !== 1 >");
if (Pbar !== 1) $display("Assert 101 : < Pbar !== 1 >");
if (OVR !== 0) $display("Assert 102 : < OVR !== 0 >");
if (F3 !== 0) $display("Assert 103 : < F3 !== 0 >");
if (F30 !== 1) $display("Assert 104 : < F30 !== 1 >");
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 30
#1;

I <= 'b000000111;
D <= 'b0000;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 31
#1;

I <= 'b001001110;
D <= 'b1111;
C0 <= 1;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0001) $display("Assert 105 : < Y !== 'b0001 >");	// Vector No: 15
if (C4 !== 0) $display("Assert 106 : < C4 !== 0 >");
if (Gbar !== 1) $display("Assert 107 : < Gbar !== 1 >");
if (Pbar !== 1) $display("Assert 108 : < Pbar !== 1 >");
if (OVR !== 0) $display("Assert 109 : < OVR !== 0 >");
if (F3 !== 0) $display("Assert 110 : < F3 !== 0 >");
if (F30 !== 0) $display("Assert 111 : < F30 !== 0 >");
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 32
#1;

I <= 'b000000111;
D <= 'b1111;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 33
#1;

I <= 'b001001110;
D <= 'b1111;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 112 : < Y !== 'b1111 >");	// Vector No: 16
if (C4 !== 0) $display("Assert 113 : < C4 !== 0 >");
if (Gbar !== 1) $display("Assert 114 : < Gbar !== 1 >");
if (Pbar !== 0) $display("Assert 115 : < Pbar !== 0 >");
if (OVR !== 0) $display("Assert 116 : < OVR !== 0 >");
if (F3 !== 1) $display("Assert 117 : < F3 !== 1 >");
if (F30 !== 0) $display("Assert 118 : < F30 !== 0 >");
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 34
#1;

I <= 'b000000111;
D <= 'b1111;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 35
#1;

I <= 'b001001110;
D <= 'b1111;
C0 <= 1;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 119 : < Y !== 'b0000 >");	// Vector No: 17
if (C4 !== 1) $display("Assert 120 : < C4 !== 1 >");
if (Gbar !== 1) $display("Assert 121 : < Gbar !== 1 >");
if (Pbar !== 0) $display("Assert 122 : < Pbar !== 0 >");
if (OVR !== 0) $display("Assert 123 : < OVR !== 0 >");
if (F3 !== 0) $display("Assert 124 : < F3 !== 0 >");
if (F30 !== 1) $display("Assert 125 : < F30 !== 1 >");
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 36
#1;

I <= 'b000000111;
D <= 'b1111;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 37
#1;

I <= 'b001001110;
D <= 'b0000;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1110) $display("Assert 126 : < Y !== 'b1110 >");	// Vector No: 18
if (C4 !== 1) $display("Assert 127 : < C4 !== 1 >");
if (Gbar !== 0) $display("Assert 128 : < Gbar !== 0 >");
if (Pbar !== 0) $display("Assert 129 : < Pbar !== 0 >");
if (OVR !== 0) $display("Assert 130 : < OVR !== 0 >");
if (F3 !== 1) $display("Assert 131 : < F3 !== 1 >");
if (F30 !== 0) $display("Assert 132 : < F30 !== 0 >");
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 38
#1;

I <= 'b000000111;
D <= 'b1111;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 39
#1;

I <= 'b001001110;
D <= 'b0000;
C0 <= 1;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 133 : < Y !== 'b1111 >");	// Vector No: 19
if (C4 !== 1) $display("Assert 134 : < C4 !== 1 >");
if (Gbar !== 0) $display("Assert 135 : < Gbar !== 0 >");
if (Pbar !== 0) $display("Assert 136 : < Pbar !== 0 >");
if (OVR !== 0) $display("Assert 137 : < OVR !== 0 >");
if (F3 !== 1) $display("Assert 138 : < F3 !== 1 >");
if (F30 !== 0) $display("Assert 139 : < F30 !== 0 >");
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 40
#1;

I <= 'b000000111;
D <= 'b0001;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 41
#1;

I <= 'b001001110;
D <= 'b0000;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 140 : < Y !== 'b0000 >");	// Vector No: 20
if (C4 !== 1) $display("Assert 141 : < C4 !== 1 >");
if (Gbar !== 0) $display("Assert 142 : < Gbar !== 0 >");
if (Pbar !== 0) $display("Assert 143 : < Pbar !== 0 >");
if (OVR !== 0) $display("Assert 144 : < OVR !== 0 >");
if (F3 !== 0) $display("Assert 145 : < F3 !== 0 >");
if (F30 !== 1) $display("Assert 146 : < F30 !== 1 >");
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 42
#1;

I <= 'b000000111;
D <= 'b0010;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 43
#1;

I <= 'b001001110;
D <= 'b0001;
C0 <= 1;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0001) $display("Assert 147 : < Y !== 'b0001 >");	// Vector No: 21
if (C4 !== 1) $display("Assert 148 : < C4 !== 1 >");
if (Gbar !== 0) $display("Assert 149 : < Gbar !== 0 >");
if (Pbar !== 1) $display("Assert 150 : < Pbar !== 1 >");
if (OVR !== 0) $display("Assert 151 : < OVR !== 0 >");
if (F3 !== 0) $display("Assert 152 : < F3 !== 0 >");
if (F30 !== 0) $display("Assert 153 : < F30 !== 0 >");
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 44
#1;

I <= 'b000000111;
D <= 'b0100;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 45
#1;

I <= 'b001001110;
D <= 'b0010;
C0 <= 1;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0010) $display("Assert 154 : < Y !== 'b0010 >");	// Vector No: 22
if (C4 !== 1) $display("Assert 155 : < C4 !== 1 >");
if (Gbar !== 0) $display("Assert 156 : < Gbar !== 0 >");
if (Pbar !== 1) $display("Assert 157 : < Pbar !== 1 >");
if (OVR !== 0) $display("Assert 158 : < OVR !== 0 >");
if (F3 !== 0) $display("Assert 159 : < F3 !== 0 >");
if (F30 !== 0) $display("Assert 160 : < F30 !== 0 >");
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 46
#1;

I <= 'b000000111;
D <= 'b1000;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 47
#1;

I <= 'b001001110;
D <= 'b0100;
C0 <= 1;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0100) $display("Assert 161 : < Y !== 'b0100 >");	// Vector No: 23
if (C4 !== 1) $display("Assert 162 : < C4 !== 1 >");
if (Gbar !== 0) $display("Assert 163 : < Gbar !== 0 >");
if (Pbar !== 1) $display("Assert 164 : < Pbar !== 1 >");
if (OVR !== 1) $display("Assert 165 : < OVR !== 1 >");
if (F3 !== 0) $display("Assert 166 : < F3 !== 0 >");
if (F30 !== 0) $display("Assert 167 : < F30 !== 0 >");
#1;

// ************************
// ******** SUBTRACTION R - S ********
//------------------------

clk <= 1;		// Cycle No: 48
#1;

I <= 'b000000111;
D <= 'b0000;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 49
#1;

I <= 'b001010110;
D <= 'b0000;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 168 : < Y !== 'b1111 >");	// Vector No: 24
if (C4 !== 0) $display("Assert 169 : < C4 !== 0 >");
if (Gbar !== 1) $display("Assert 170 : < Gbar !== 1 >");
if (Pbar !== 0) $display("Assert 171 : < Pbar !== 0 >");
if (OVR !== 0) $display("Assert 172 : < OVR !== 0 >");
if (F3 !== 1) $display("Assert 173 : < F3 !== 1 >");
if (F30 !== 0) $display("Assert 174 : < F30 !== 0 >");
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 50
#1;

I <= 'b000000111;
D <= 'b0000;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 51
#1;

I <= 'b001010110;
D <= 'b0000;
C0 <= 1;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 175 : < Y !== 'b0000 >");	// Vector No: 25
if (C4 !== 1) $display("Assert 176 : < C4 !== 1 >");
if (Gbar !== 1) $display("Assert 177 : < Gbar !== 1 >");
if (Pbar !== 0) $display("Assert 178 : < Pbar !== 0 >");
if (OVR !== 0) $display("Assert 179 : < OVR !== 0 >");
if (F3 !== 0) $display("Assert 180 : < F3 !== 0 >");
if (F30 !== 1) $display("Assert 181 : < F30 !== 1 >");
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 52
#1;

I <= 'b000000111;
D <= 'b1111;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 53
#1;

I <= 'b001010110;
D <= 'b0000;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 182 : < Y !== 'b0000 >");	// Vector No: 26
if (C4 !== 0) $display("Assert 183 : < C4 !== 0 >");
if (Gbar !== 1) $display("Assert 184 : < Gbar !== 1 >");
if (Pbar !== 1) $display("Assert 185 : < Pbar !== 1 >");
if (OVR !== 0) $display("Assert 186 : < OVR !== 0 >");
if (F3 !== 0) $display("Assert 187 : < F3 !== 0 >");
if (F30 !== 1) $display("Assert 188 : < F30 !== 1 >");
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 54
#1;

I <= 'b000000111;
D <= 'b1111;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 55
#1;

I <= 'b001010110;
D <= 'b0000;
C0 <= 1;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0001) $display("Assert 189 : < Y !== 'b0001 >");	// Vector No: 27
if (C4 !== 0) $display("Assert 190 : < C4 !== 0 >");
if (Gbar !== 1) $display("Assert 191 : < Gbar !== 1 >");
if (Pbar !== 1) $display("Assert 192 : < Pbar !== 1 >");
if (OVR !== 0) $display("Assert 193 : < OVR !== 0 >");
if (F3 !== 0) $display("Assert 194 : < F3 !== 0 >");
if (F30 !== 0) $display("Assert 195 : < F30 !== 0 >");
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 56
#1;

I <= 'b000000111;
D <= 'b1111;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 57
#1;

I <= 'b001010110;
D <= 'b1111;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 196 : < Y !== 'b1111 >");	// Vector No: 28
if (C4 !== 0) $display("Assert 197 : < C4 !== 0 >");
if (Gbar !== 1) $display("Assert 198 : < Gbar !== 1 >");
if (Pbar !== 0) $display("Assert 199 : < Pbar !== 0 >");
if (OVR !== 0) $display("Assert 200 : < OVR !== 0 >");
if (F3 !== 1) $display("Assert 201 : < F3 !== 1 >");
if (F30 !== 0) $display("Assert 202 : < F30 !== 0 >");
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 58
#1;

I <= 'b000000111;
D <= 'b1111;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 59
#1;

I <= 'b001010110;
D <= 'b1111;
C0 <= 1;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 203 : < Y !== 'b0000 >");	// Vector No: 29
if (C4 !== 1) $display("Assert 204 : < C4 !== 1 >");
if (Gbar !== 1) $display("Assert 205 : < Gbar !== 1 >");
if (Pbar !== 0) $display("Assert 206 : < Pbar !== 0 >");
if (OVR !== 0) $display("Assert 207 : < OVR !== 0 >");
if (F3 !== 0) $display("Assert 208 : < F3 !== 0 >");
if (F30 !== 1) $display("Assert 209 : < F30 !== 1 >");
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 60
#1;

I <= 'b000000111;
D <= 'b0000;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 61
#1;

I <= 'b001010110;
D <= 'b1111;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1110) $display("Assert 210 : < Y !== 'b1110 >");	// Vector No: 30
if (C4 !== 1) $display("Assert 211 : < C4 !== 1 >");
if (Gbar !== 0) $display("Assert 212 : < Gbar !== 0 >");
if (Pbar !== 0) $display("Assert 213 : < Pbar !== 0 >");
if (OVR !== 0) $display("Assert 214 : < OVR !== 0 >");
if (F3 !== 1) $display("Assert 215 : < F3 !== 1 >");
if (F30 !== 0) $display("Assert 216 : < F30 !== 0 >");
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 62
#1;

I <= 'b000000111;
D <= 'b0000;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 63
#1;

I <= 'b001010110;
D <= 'b1111;
C0 <= 1;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 217 : < Y !== 'b1111 >");	// Vector No: 31
if (C4 !== 1) $display("Assert 218 : < C4 !== 1 >");
if (Gbar !== 0) $display("Assert 219 : < Gbar !== 0 >");
if (Pbar !== 0) $display("Assert 220 : < Pbar !== 0 >");
if (OVR !== 0) $display("Assert 221 : < OVR !== 0 >");
if (F3 !== 1) $display("Assert 222 : < F3 !== 1 >");
if (F30 !== 0) $display("Assert 223 : < F30 !== 0 >");
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 64
#1;

I <= 'b000000111;
D <= 'b0000;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 65
#1;

I <= 'b001010110;
D <= 'b0001;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 224 : < Y !== 'b0000 >");	// Vector No: 32
if (C4 !== 1) $display("Assert 225 : < C4 !== 1 >");
if (Gbar !== 0) $display("Assert 226 : < Gbar !== 0 >");
if (Pbar !== 0) $display("Assert 227 : < Pbar !== 0 >");
if (OVR !== 0) $display("Assert 228 : < OVR !== 0 >");
if (F3 !== 0) $display("Assert 229 : < F3 !== 0 >");
if (F30 !== 1) $display("Assert 230 : < F30 !== 1 >");
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 66
#1;

I <= 'b000000111;
D <= 'b0001;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 67
#1;

I <= 'b001010110;
D <= 'b0010;
C0 <= 1;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0001) $display("Assert 231 : < Y !== 'b0001 >");	// Vector No: 33
if (C4 !== 1) $display("Assert 232 : < C4 !== 1 >");
if (Gbar !== 0) $display("Assert 233 : < Gbar !== 0 >");
if (Pbar !== 1) $display("Assert 234 : < Pbar !== 1 >");
if (OVR !== 0) $display("Assert 235 : < OVR !== 0 >");
if (F3 !== 0) $display("Assert 236 : < F3 !== 0 >");
if (F30 !== 0) $display("Assert 237 : < F30 !== 0 >");
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 68
#1;

I <= 'b000000111;
D <= 'b0010;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 69
#1;

I <= 'b001010110;
D <= 'b0100;
C0 <= 1;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0010) $display("Assert 238 : < Y !== 'b0010 >");	// Vector No: 34
if (C4 !== 1) $display("Assert 239 : < C4 !== 1 >");
if (Gbar !== 0) $display("Assert 240 : < Gbar !== 0 >");
if (Pbar !== 1) $display("Assert 241 : < Pbar !== 1 >");
if (OVR !== 0) $display("Assert 242 : < OVR !== 0 >");
if (F3 !== 0) $display("Assert 243 : < F3 !== 0 >");
if (F30 !== 0) $display("Assert 244 : < F30 !== 0 >");
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 70
#1;

I <= 'b000000111;
D <= 'b0100;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 71
#1;

I <= 'b001010110;
D <= 'b1000;
C0 <= 1;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0100) $display("Assert 245 : < Y !== 'b0100 >");	// Vector No: 35
if (C4 !== 1) $display("Assert 246 : < C4 !== 1 >");
if (Gbar !== 0) $display("Assert 247 : < Gbar !== 0 >");
if (Pbar !== 1) $display("Assert 248 : < Pbar !== 1 >");
if (OVR !== 1) $display("Assert 249 : < OVR !== 1 >");
if (F3 !== 0) $display("Assert 250 : < F3 !== 0 >");
if (F30 !== 0) $display("Assert 251 : < F30 !== 0 >");
#1;

// ************************
// ******** OR (R or S) ********
//------------------------

clk <= 1;		// Cycle No: 72
#1;

I <= 'b000000111;
D <= 'b0000;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 73
#1;

I <= 'b001011110;
D <= 'b0000;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 252 : < Y !== 'b0000 >");	// Vector No: 36
if (F3 !== 0) $display("Assert 253 : < F3 !== 0 >");
if (F30 !== 1) $display("Assert 254 : < F30 !== 1 >");
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 74
#1;

I <= 'b000000111;
D <= 'b1111;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 75
#1;

I <= 'b001011110;
D <= 'b0000;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 255 : < Y !== 'b1111 >");	// Vector No: 37
if (F3 !== 1) $display("Assert 256 : < F3 !== 1 >");
if (F30 !== 0) $display("Assert 257 : < F30 !== 0 >");
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 76
#1;

I <= 'b000000111;
D <= 'b1111;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 77
#1;

I <= 'b001011110;
D <= 'b1111;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 258 : < Y !== 'b1111 >");	// Vector No: 38
if (F3 !== 1) $display("Assert 259 : < F3 !== 1 >");
if (F30 !== 0) $display("Assert 260 : < F30 !== 0 >");
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 78
#1;

I <= 'b000000111;
D <= 'b0000;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 79
#1;

I <= 'b001011110;
D <= 'b1111;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 261 : < Y !== 'b1111 >");	// Vector No: 39
if (F3 !== 1) $display("Assert 262 : < F3 !== 1 >");
if (F30 !== 0) $display("Assert 263 : < F30 !== 0 >");
#1;

// ************************
// ******** AND (R and S) ********
//------------------------

clk <= 1;		// Cycle No: 80
#1;

I <= 'b000000111;
D <= 'b0000;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 81
#1;

I <= 'b001100110;
D <= 'b0000;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 264 : < Y !== 'b0000 >");	// Vector No: 40
if (F3 !== 0) $display("Assert 265 : < F3 !== 0 >");
if (F30 !== 1) $display("Assert 266 : < F30 !== 1 >");
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 82
#1;

I <= 'b000000111;
D <= 'b1111;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 83
#1;

I <= 'b001100110;
D <= 'b0000;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 267 : < Y !== 'b0000 >");	// Vector No: 41
if (F3 !== 0) $display("Assert 268 : < F3 !== 0 >");
if (F30 !== 1) $display("Assert 269 : < F30 !== 1 >");
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 84
#1;

I <= 'b000000111;
D <= 'b1111;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 85
#1;

I <= 'b001100110;
D <= 'b1111;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 270 : < Y !== 'b1111 >");	// Vector No: 42
if (F3 !== 1) $display("Assert 271 : < F3 !== 1 >");
if (F30 !== 0) $display("Assert 272 : < F30 !== 0 >");
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 86
#1;

I <= 'b000000111;
D <= 'b0000;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 87
#1;

I <= 'b001100110;
D <= 'b1111;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 273 : < Y !== 'b0000 >");	// Vector No: 43
if (F3 !== 0) $display("Assert 274 : < F3 !== 0 >");
if (F30 !== 1) $display("Assert 275 : < F30 !== 1 >");
#1;

// ************************
// ******** AND (not(R) and S) ********
//------------------------

clk <= 1;		// Cycle No: 88
#1;

I <= 'b000000111;
D <= 'b0000;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 89
#1;

I <= 'b001101110;
D <= 'b0000;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 276 : < Y !== 'b0000 >");	// Vector No: 44
if (F3 !== 0) $display("Assert 277 : < F3 !== 0 >");
if (F30 !== 1) $display("Assert 278 : < F30 !== 1 >");
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 90
#1;

I <= 'b000000111;
D <= 'b1111;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 91
#1;

I <= 'b001101110;
D <= 'b0000;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 279 : < Y !== 'b1111 >");	// Vector No: 45
if (F3 !== 1) $display("Assert 280 : < F3 !== 1 >");
if (F30 !== 0) $display("Assert 281 : < F30 !== 0 >");
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 92
#1;

I <= 'b000000111;
D <= 'b1111;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 93
#1;

I <= 'b001101110;
D <= 'b1111;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 282 : < Y !== 'b0000 >");	// Vector No: 46
if (F3 !== 0) $display("Assert 283 : < F3 !== 0 >");
if (F30 !== 1) $display("Assert 284 : < F30 !== 1 >");
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 94
#1;

I <= 'b000000111;
D <= 'b0000;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 95
#1;

I <= 'b001101110;
D <= 'b1111;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 285 : < Y !== 'b0000 >");	// Vector No: 47
if (F3 !== 0) $display("Assert 286 : < F3 !== 0 >");
if (F30 !== 1) $display("Assert 287 : < F30 !== 1 >");
#1;

// ************************
// ******** XOR (R xor S) ********
//------------------------

clk <= 1;		// Cycle No: 96
#1;

I <= 'b000000111;
D <= 'b0000;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 97
#1;

I <= 'b001110110;
D <= 'b0000;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 288 : < Y !== 'b0000 >");	// Vector No: 48
if (F3 !== 0) $display("Assert 289 : < F3 !== 0 >");
if (F30 !== 1) $display("Assert 290 : < F30 !== 1 >");
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 98
#1;

I <= 'b000000111;
D <= 'b1111;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 99
#1;

I <= 'b001110110;
D <= 'b0000;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 291 : < Y !== 'b1111 >");	// Vector No: 49
if (F3 !== 1) $display("Assert 292 : < F3 !== 1 >");
if (F30 !== 0) $display("Assert 293 : < F30 !== 0 >");
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 100
#1;

I <= 'b000000111;
D <= 'b1111;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 101
#1;

I <= 'b001110110;
D <= 'b1111;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 294 : < Y !== 'b0000 >");	// Vector No: 50
if (F3 !== 0) $display("Assert 295 : < F3 !== 0 >");
if (F30 !== 1) $display("Assert 296 : < F30 !== 1 >");
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 102
#1;

I <= 'b000000111;
D <= 'b0000;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 103
#1;

I <= 'b001110110;
D <= 'b1111;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 297 : < Y !== 'b1111 >");	// Vector No: 51
if (F3 !== 1) $display("Assert 298 : < F3 !== 1 >");
if (F30 !== 0) $display("Assert 299 : < F30 !== 0 >");
#1;

// ************************
// ******** XNOR (R xnor S) ********
//------------------------

clk <= 1;		// Cycle No: 104
#1;

I <= 'b000000111;
D <= 'b0000;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 105
#1;

I <= 'b001111110;
D <= 'b0000;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 300 : < Y !== 'b1111 >");	// Vector No: 52
if (F3 !== 1) $display("Assert 301 : < F3 !== 1 >");
if (F30 !== 0) $display("Assert 302 : < F30 !== 0 >");
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 106
#1;

I <= 'b000000111;
D <= 'b1111;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 107
#1;

I <= 'b001111110;
D <= 'b0000;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 303 : < Y !== 'b0000 >");	// Vector No: 53
if (F3 !== 0) $display("Assert 304 : < F3 !== 0 >");
if (F30 !== 1) $display("Assert 305 : < F30 !== 1 >");
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 108
#1;

I <= 'b000000111;
D <= 'b1111;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 109
#1;

I <= 'b001111110;
D <= 'b1111;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 306 : < Y !== 'b1111 >");	// Vector No: 54
if (F3 !== 1) $display("Assert 307 : < F3 !== 1 >");
if (F30 !== 0) $display("Assert 308 : < F30 !== 0 >");
#1;

// ************************
// ************************
// *                      *
// * TEST VECTORS FOR RAM *
// *                      *
// ************************
// ******** WRITING 0's AND 1's IN RAM LOCATIONS ********
//------------------------

clk <= 1;		// Cycle No: 110
#1;

I <= 'b010000111;
D <= 'b0000;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 111
#1;

I <= 'b001000100;
Aadd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 309 : < Y !== 'b0000 >");	// Vector No: 55
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 112
#1;

I <= 'b011000111;
D <= 'b0000;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 113
#1;

I <= 'b001000100;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 310 : < Y !== 'b0000 >");	// Vector No: 56
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 114
#1;

I <= 'b010000111;
D <= 'b1111;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 115
#1;

I <= 'b001000100;
Aadd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 311 : < Y !== 'b1111 >");	// Vector No: 57
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 116
#1;

I <= 'b011000111;
D <= 'b1111;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 117
#1;

I <= 'b001000100;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 312 : < Y !== 'b1111 >");	// Vector No: 58
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 118
#1;

I <= 'b010000111;
D <= 'b0000;
Badd <= 1;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 119
#1;

I <= 'b001000100;
Aadd <= 1;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 313 : < Y !== 'b0000 >");	// Vector No: 59
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 120
#1;

I <= 'b011000111;
D <= 'b0000;
Badd <= 1;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 121
#1;

I <= 'b001000100;
Badd <= 1;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 314 : < Y !== 'b0000 >");	// Vector No: 60
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 122
#1;

I <= 'b010000111;
D <= 'b1111;
Badd <= 1;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 123
#1;

I <= 'b001000100;
Aadd <= 1;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 315 : < Y !== 'b1111 >");	// Vector No: 61
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 124
#1;

I <= 'b011000111;
D <= 'b1111;
Badd <= 1;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 125
#1;

I <= 'b001000100;
Badd <= 1;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 316 : < Y !== 'b1111 >");	// Vector No: 62
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 126
#1;

I <= 'b010000111;
D <= 'b0000;
Badd <= 2;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 127
#1;

I <= 'b001000100;
Aadd <= 2;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 317 : < Y !== 'b0000 >");	// Vector No: 63
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 128
#1;

I <= 'b011000111;
D <= 'b0000;
Badd <= 2;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 129
#1;

I <= 'b001000100;
Badd <= 2;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 318 : < Y !== 'b0000 >");	// Vector No: 64
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 130
#1;

I <= 'b010000111;
D <= 'b1111;
Badd <= 2;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 131
#1;

I <= 'b001000100;
Aadd <= 2;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 319 : < Y !== 'b1111 >");	// Vector No: 65
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 132
#1;

I <= 'b011000111;
D <= 'b1111;
Badd <= 2;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 133
#1;

I <= 'b001000100;
Badd <= 2;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 320 : < Y !== 'b1111 >");	// Vector No: 66
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 134
#1;

I <= 'b010000111;
D <= 'b0000;
Badd <= 3;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 135
#1;

I <= 'b001000100;
Aadd <= 3;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 321 : < Y !== 'b0000 >");	// Vector No: 67
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 136
#1;

I <= 'b011000111;
D <= 'b0000;
Badd <= 3;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 137
#1;

I <= 'b001000100;
Badd <= 3;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 322 : < Y !== 'b0000 >");	// Vector No: 68
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 138
#1;

I <= 'b010000111;
D <= 'b1111;
Badd <= 3;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 139
#1;

I <= 'b001000100;
Aadd <= 3;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 323 : < Y !== 'b1111 >");	// Vector No: 69
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 140
#1;

I <= 'b011000111;
D <= 'b1111;
Badd <= 3;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 141
#1;

I <= 'b001000100;
Badd <= 3;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 324 : < Y !== 'b1111 >");	// Vector No: 70
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 142
#1;

I <= 'b010000111;
D <= 'b0000;
Badd <= 4;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 143
#1;

I <= 'b001000100;
Aadd <= 4;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 325 : < Y !== 'b0000 >");	// Vector No: 71
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 144
#1;

I <= 'b011000111;
D <= 'b0000;
Badd <= 4;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 145
#1;

I <= 'b001000100;
Badd <= 4;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 326 : < Y !== 'b0000 >");	// Vector No: 72
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 146
#1;

I <= 'b010000111;
D <= 'b1111;
Badd <= 4;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 147
#1;

I <= 'b001000100;
Aadd <= 4;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 327 : < Y !== 'b1111 >");	// Vector No: 73
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 148
#1;

I <= 'b011000111;
D <= 'b1111;
Badd <= 4;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 149
#1;

I <= 'b001000100;
Badd <= 4;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 328 : < Y !== 'b1111 >");	// Vector No: 74
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 150
#1;

I <= 'b010000111;
D <= 'b0000;
Badd <= 5;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 151
#1;

I <= 'b001000100;
Aadd <= 5;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 329 : < Y !== 'b0000 >");	// Vector No: 75
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 152
#1;

I <= 'b011000111;
D <= 'b0000;
Badd <= 5;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 153
#1;

I <= 'b001000100;
Badd <= 5;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 330 : < Y !== 'b0000 >");	// Vector No: 76
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 154
#1;

I <= 'b010000111;
D <= 'b1111;
Badd <= 5;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 155
#1;

I <= 'b001000100;
Aadd <= 5;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 331 : < Y !== 'b1111 >");	// Vector No: 77
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 156
#1;

I <= 'b011000111;
D <= 'b1111;
Badd <= 5;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 157
#1;

I <= 'b001000100;
Badd <= 5;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 332 : < Y !== 'b1111 >");	// Vector No: 78
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 158
#1;

I <= 'b010000111;
D <= 'b0000;
Badd <= 6;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 159
#1;

I <= 'b001000100;
Aadd <= 6;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 333 : < Y !== 'b0000 >");	// Vector No: 79
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 160
#1;

I <= 'b011000111;
D <= 'b0000;
Badd <= 6;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 161
#1;

I <= 'b001000100;
Badd <= 6;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 334 : < Y !== 'b0000 >");	// Vector No: 80
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 162
#1;

I <= 'b010000111;
D <= 'b1111;
Badd <= 6;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 163
#1;

I <= 'b001000100;
Aadd <= 6;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 335 : < Y !== 'b1111 >");	// Vector No: 81
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 164
#1;

I <= 'b011000111;
D <= 'b1111;
Badd <= 6;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 165
#1;

I <= 'b001000100;
Badd <= 6;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 336 : < Y !== 'b1111 >");	// Vector No: 82
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 166
#1;

I <= 'b010000111;
D <= 'b0000;
Badd <= 7;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 167
#1;

I <= 'b001000100;
Aadd <= 7;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 337 : < Y !== 'b0000 >");	// Vector No: 83
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 168
#1;

I <= 'b011000111;
D <= 'b0000;
Badd <= 7;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 169
#1;

I <= 'b001000100;
Badd <= 7;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 338 : < Y !== 'b0000 >");	// Vector No: 84
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 170
#1;

I <= 'b010000111;
D <= 'b1111;
Badd <= 7;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 171
#1;

I <= 'b001000100;
Aadd <= 7;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 339 : < Y !== 'b1111 >");	// Vector No: 85
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 172
#1;

I <= 'b011000111;
D <= 'b1111;
Badd <= 7;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 173
#1;

I <= 'b001000100;
Badd <= 7;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 340 : < Y !== 'b1111 >");	// Vector No: 86
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 174
#1;

I <= 'b010000111;
D <= 'b0000;
Badd <= 8;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 175
#1;

I <= 'b001000100;
Aadd <= 8;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 341 : < Y !== 'b0000 >");	// Vector No: 87
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 176
#1;

I <= 'b011000111;
D <= 'b0000;
Badd <= 8;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 177
#1;

I <= 'b001000100;
Badd <= 8;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 342 : < Y !== 'b0000 >");	// Vector No: 88
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 178
#1;

I <= 'b010000111;
D <= 'b1111;
Badd <= 8;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 179
#1;

I <= 'b001000100;
Aadd <= 8;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 343 : < Y !== 'b1111 >");	// Vector No: 89
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 180
#1;

I <= 'b011000111;
D <= 'b1111;
Badd <= 8;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 181
#1;

I <= 'b001000100;
Badd <= 8;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 344 : < Y !== 'b1111 >");	// Vector No: 90
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 182
#1;

I <= 'b010000111;
D <= 'b0000;
Badd <= 9;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 183
#1;

I <= 'b001000100;
Aadd <= 9;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 345 : < Y !== 'b0000 >");	// Vector No: 91
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 184
#1;

I <= 'b011000111;
D <= 'b0000;
Badd <= 9;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 185
#1;

I <= 'b001000100;
Badd <= 9;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 346 : < Y !== 'b0000 >");	// Vector No: 92
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 186
#1;

I <= 'b010000111;
D <= 'b1111;
Badd <= 9;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 187
#1;

I <= 'b001000100;
Aadd <= 9;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 347 : < Y !== 'b1111 >");	// Vector No: 93
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 188
#1;

I <= 'b011000111;
D <= 'b1111;
Badd <= 9;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 189
#1;

I <= 'b001000100;
Badd <= 9;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 348 : < Y !== 'b1111 >");	// Vector No: 94
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 190
#1;

I <= 'b010000111;
D <= 'b0000;
Badd <= 10;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 191
#1;

I <= 'b001000100;
Aadd <= 10;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 349 : < Y !== 'b0000 >");	// Vector No: 95
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 192
#1;

I <= 'b011000111;
D <= 'b0000;
Badd <= 10;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 193
#1;

I <= 'b001000100;
Badd <= 10;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 350 : < Y !== 'b0000 >");	// Vector No: 96
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 194
#1;

I <= 'b010000111;
D <= 'b1111;
Badd <= 10;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 195
#1;

I <= 'b001000100;
Aadd <= 10;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 351 : < Y !== 'b1111 >");	// Vector No: 97
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 196
#1;

I <= 'b011000111;
D <= 'b1111;
Badd <= 10;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 197
#1;

I <= 'b001000100;
Badd <= 10;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 352 : < Y !== 'b1111 >");	// Vector No: 98
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 198
#1;

I <= 'b010000111;
D <= 'b0000;
Badd <= 11;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 199
#1;

I <= 'b001000100;
Aadd <= 11;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 353 : < Y !== 'b0000 >");	// Vector No: 99
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 200
#1;

I <= 'b011000111;
D <= 'b0000;
Badd <= 11;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 201
#1;

I <= 'b001000100;
Badd <= 11;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 354 : < Y !== 'b0000 >");	// Vector No: 100
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 202
#1;

I <= 'b010000111;
D <= 'b1111;
Badd <= 11;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 203
#1;

I <= 'b001000100;
Aadd <= 11;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 355 : < Y !== 'b1111 >");	// Vector No: 101
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 204
#1;

I <= 'b011000111;
D <= 'b1111;
Badd <= 11;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 205
#1;

I <= 'b001000100;
Badd <= 11;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 356 : < Y !== 'b1111 >");	// Vector No: 102
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 206
#1;

I <= 'b010000111;
D <= 'b0000;
Badd <= 12;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 207
#1;

I <= 'b001000100;
Aadd <= 12;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 357 : < Y !== 'b0000 >");	// Vector No: 103
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 208
#1;

I <= 'b011000111;
D <= 'b0000;
Badd <= 12;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 209
#1;

I <= 'b001000100;
Badd <= 12;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 358 : < Y !== 'b0000 >");	// Vector No: 104
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 210
#1;

I <= 'b010000111;
D <= 'b1111;
Badd <= 12;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 211
#1;

I <= 'b001000100;
Aadd <= 12;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 359 : < Y !== 'b1111 >");	// Vector No: 105
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 212
#1;

I <= 'b011000111;
D <= 'b1111;
Badd <= 12;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 213
#1;

I <= 'b001000100;
Badd <= 12;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 360 : < Y !== 'b1111 >");	// Vector No: 106
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 214
#1;

I <= 'b010000111;
D <= 'b0000;
Badd <= 13;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 215
#1;

I <= 'b001000100;
Aadd <= 13;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 361 : < Y !== 'b0000 >");	// Vector No: 107
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 216
#1;

I <= 'b011000111;
D <= 'b0000;
Badd <= 13;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 217
#1;

I <= 'b001000100;
Badd <= 13;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 362 : < Y !== 'b0000 >");	// Vector No: 108
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 218
#1;

I <= 'b010000111;
D <= 'b1111;
Badd <= 13;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 219
#1;

I <= 'b001000100;
Aadd <= 13;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 363 : < Y !== 'b1111 >");	// Vector No: 109
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 220
#1;

I <= 'b011000111;
D <= 'b1111;
Badd <= 13;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 221
#1;

I <= 'b001000100;
Badd <= 13;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 364 : < Y !== 'b1111 >");	// Vector No: 110
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 222
#1;

I <= 'b010000111;
D <= 'b0000;
Badd <= 14;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 223
#1;

I <= 'b001000100;
Aadd <= 14;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 365 : < Y !== 'b0000 >");	// Vector No: 111
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 224
#1;

I <= 'b011000111;
D <= 'b0000;
Badd <= 14;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 225
#1;

I <= 'b001000100;
Badd <= 14;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 366 : < Y !== 'b0000 >");	// Vector No: 112
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 226
#1;

I <= 'b010000111;
D <= 'b1111;
Badd <= 14;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 227
#1;

I <= 'b001000100;
Aadd <= 14;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 367 : < Y !== 'b1111 >");	// Vector No: 113
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 228
#1;

I <= 'b011000111;
D <= 'b1111;
Badd <= 14;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 229
#1;

I <= 'b001000100;
Badd <= 14;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 368 : < Y !== 'b1111 >");	// Vector No: 114
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 230
#1;

I <= 'b010000111;
D <= 'b0000;
Badd <= 15;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 231
#1;

I <= 'b001000100;
Aadd <= 15;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 369 : < Y !== 'b0000 >");	// Vector No: 115
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 232
#1;

I <= 'b011000111;
D <= 'b0000;
Badd <= 15;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 233
#1;

I <= 'b001000100;
Badd <= 15;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 370 : < Y !== 'b0000 >");	// Vector No: 116
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 234
#1;

I <= 'b010000111;
D <= 'b1111;
Badd <= 15;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 235
#1;

I <= 'b001000100;
Aadd <= 15;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 371 : < Y !== 'b1111 >");	// Vector No: 117
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 236
#1;

I <= 'b011000111;
D <= 'b1111;
Badd <= 15;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 237
#1;

I <= 'b001000100;
Badd <= 15;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 372 : < Y !== 'b1111 >");	// Vector No: 118
#1;

// ************************
// ******** TESTING RAM SHIFTERS ********
//------------------------

clk <= 1;		// Cycle No: 238
#1;

I <= 'b100000111;
D <= 'b0000;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
RAM0 <= 'z;
RAM3 <= 1;
#4;

clk <= 0;
#4;

if (RAM0out !== 0) $display("Assert 373 : < RAM0out !== 0 >");	// Vector No: 119
#1;

//------------------------

clk <= 1;		// Cycle No: 239
#1;

I <= 'b001000100;
Aadd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1000) $display("Assert 374 : < Y !== 'b1000 >");	// Vector No: 120
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 240
#1;

I <= 'b100000111;
D <= 'b1111;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
RAM0 <= 'z;
RAM3 <= 0;
#4;

clk <= 0;
#4;

if (RAM0out !== 1) $display("Assert 375 : < RAM0out !== 1 >");	// Vector No: 121
#1;

//------------------------

clk <= 1;		// Cycle No: 241
#1;

I <= 'b001000100;
Aadd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0111) $display("Assert 376 : < Y !== 'b0111 >");	// Vector No: 122
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 242
#1;

I <= 'b101000111;
D <= 'b0000;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
RAM0 <= 'z;
RAM3 <= 1;
#4;

clk <= 0;
#4;

if (RAM0out !== 0) $display("Assert 377 : < RAM0out !== 0 >");	// Vector No: 123
#1;

//------------------------

clk <= 1;		// Cycle No: 243
#1;

I <= 'b001000100;
Aadd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1000) $display("Assert 378 : < Y !== 'b1000 >");	// Vector No: 124
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 244
#1;

I <= 'b101000111;
D <= 'b1111;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
RAM0 <= 'z;
RAM3 <= 0;
#4;

clk <= 0;
#4;

if (RAM0out !== 1) $display("Assert 379 : < RAM0out !== 1 >");	// Vector No: 125
#1;

//------------------------

clk <= 1;		// Cycle No: 245
#1;

I <= 'b001000100;
Aadd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0111) $display("Assert 380 : < Y !== 'b0111 >");	// Vector No: 126
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 246
#1;

I <= 'b110000111;
D <= 'b0000;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
RAM0 <= 1;
RAM3 <= 'z;
#4;

clk <= 0;
#4;

if (RAM3out !== 0) $display("Assert 381 : < RAM3out !== 0 >");	// Vector No: 127
#1;

//------------------------

clk <= 1;		// Cycle No: 247
#1;

I <= 'b001000100;
Aadd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0001) $display("Assert 382 : < Y !== 'b0001 >");	// Vector No: 128
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 248
#1;

I <= 'b110000111;
D <= 'b1111;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
RAM0 <= 0;
RAM3 <= 'z;
#4;

clk <= 0;
#4;

if (RAM3out !== 1) $display("Assert 383 : < RAM3out !== 1 >");	// Vector No: 129
#1;

//------------------------

clk <= 1;		// Cycle No: 249
#1;

I <= 'b001000100;
Aadd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1110) $display("Assert 384 : < Y !== 'b1110 >");	// Vector No: 130
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 250
#1;

I <= 'b111000111;
D <= 'b0000;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
RAM0 <= 1;
RAM3 <= 'z;
#4;

clk <= 0;
#4;

if (RAM3out !== 0) $display("Assert 385 : < RAM3out !== 0 >");	// Vector No: 131
#1;

//------------------------

clk <= 1;		// Cycle No: 251
#1;

I <= 'b001000100;
Aadd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0001) $display("Assert 386 : < Y !== 'b0001 >");	// Vector No: 132
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 252
#1;

I <= 'b111000111;
D <= 'b1111;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
RAM0 <= 0;
RAM3 <= 'z;
#4;

clk <= 0;
#4;

if (RAM3out !== 1) $display("Assert 387 : < RAM3out !== 1 >");	// Vector No: 133
#1;

//------------------------

clk <= 1;		// Cycle No: 253
#1;

I <= 'b001000100;
Aadd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1110) $display("Assert 388 : < Y !== 'b1110 >");	// Vector No: 134
#1;

// ************************
// *******************************
// *                             *
// * TEST VECTORS FOR Q-REGISTER *
// *                             *
// *******************************
// ******** WRITING 0's AND 1's ********
//------------------------

clk <= 1;		// Cycle No: 254
#1;

I <= 'b000000111;
D <= 'b1111;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 255
#1;

I <= 'b001000010;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 389 : < Y !== 'b1111 >");	// Vector No: 135
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 256
#1;

I <= 'b000000111;
D <= 'b0000;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 257
#1;

I <= 'b001000010;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 390 : < Y !== 'b0000 >");	// Vector No: 136
#1;

// ************************
// ******** TESTING Q-REGISTER SHIFTERS ********
//------------------------

clk <= 1;		// Cycle No: 258
#1;

I <= 'b000000111;
D <= 'b0000;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 259
#1;

I <= 'b100000111;
C0 <= 0;
OEbar <= 0;
Q0 <= 'z;
Q3 <= 1;
#4;

clk <= 0;
#4;

if (Q0out !== 0) $display("Assert 391 : < Q0out !== 0 >");	// Vector No: 137
#1;

//------------------------

clk <= 1;		// Cycle No: 260
#1;

I <= 'b001000010;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1000) $display("Assert 392 : < Y !== 'b1000 >");	// Vector No: 138
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 261
#1;

I <= 'b000000111;
D <= 'b1111;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 262
#1;

I <= 'b100000111;
C0 <= 0;
OEbar <= 0;
Q0 <= 'z;
Q3 <= 0;
#4;

clk <= 0;
#4;

if (Q0out !== 1) $display("Assert 393 : < Q0out !== 1 >");	// Vector No: 139
#1;

//------------------------

clk <= 1;		// Cycle No: 263
#1;

I <= 'b001000010;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0111) $display("Assert 394 : < Y !== 'b0111 >");	// Vector No: 140
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 264
#1;

I <= 'b000000111;
D <= 'b0000;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 265
#1;

I <= 'b110000111;
C0 <= 0;
OEbar <= 0;
Q0 <= 1;
Q3 <= 'z;
#4;

clk <= 0;
#4;

if (Q3out !== 0) $display("Assert 395 : < Q3out !== 0 >");	// Vector No: 141
#1;

//------------------------

clk <= 1;		// Cycle No: 266
#1;

I <= 'b001000010;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0001) $display("Assert 396 : < Y !== 'b0001 >");	// Vector No: 142
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 267
#1;

I <= 'b000000111;
D <= 'b1111;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 268
#1;

I <= 'b110000111;
C0 <= 0;
OEbar <= 0;
Q0 <= 0;
Q3 <= 'z;
#4;

clk <= 0;
#4;

if (Q3out !== 1) $display("Assert 397 : < Q3out !== 1 >");	// Vector No: 143
#1;

//------------------------

clk <= 1;		// Cycle No: 269
#1;

I <= 'b001000010;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1110) $display("Assert 398 : < Y !== 'b1110 >");	// Vector No: 144
#1;

// ************************
// ****************************************
// *                                      *
// * TEST VECTORS FOR ALU SOURCE-SELECTOR *
// *                                      *
// ****************************************
// ******** TESTING FOR ALU SOURCE-SELECT ( R = A, S = Q) ********
//------------------------

clk <= 1;		// Cycle No: 270
#1;

I <= 'b000000111;
D <= 'b0000;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 271
#1;

I <= 'b011000111;
D <= 'b1111;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 272
#1;

I <= 'b001000000;
Aadd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 399 : < Y !== 'b1111 >");	// Vector No: 145
if (C4 !== 0) $display("Assert 400 : < C4 !== 0 >");
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 273
#1;

I <= 'b000000111;
D <= 'b1111;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 274
#1;

I <= 'b011000111;
D <= 'b0000;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 275
#1;

I <= 'b001000000;
Aadd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 401 : < Y !== 'b1111 >");	// Vector No: 146
if (C4 !== 0) $display("Assert 402 : < C4 !== 0 >");
#1;

// ************************
// ******** TESTING FOR ALU SOURCE-SELECT ( R = A, S = B) ********
//------------------------

clk <= 1;		// Cycle No: 276
#1;

I <= 'b011000111;
D <= 'b0000;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 277
#1;

I <= 'b011000111;
D <= 'b1111;
Badd <= 1;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 278
#1;

I <= 'b001000001;
Aadd <= 0;
Badd <= 1;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 403 : < Y !== 'b1111 >");	// Vector No: 147
if (C4 !== 0) $display("Assert 404 : < C4 !== 0 >");
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 279
#1;

I <= 'b011000111;
D <= 'b1111;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 280
#1;

I <= 'b011000111;
D <= 'b0000;
Badd <= 1;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 281
#1;

I <= 'b001000001;
Aadd <= 0;
Badd <= 1;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 405 : < Y !== 'b1111 >");	// Vector No: 148
if (C4 !== 0) $display("Assert 406 : < C4 !== 0 >");
#1;

// ************************
// ******** TESTING FOR ALU SOURCE-SELECT ( R = 0, S = Q) ********
//------------------------

clk <= 1;		// Cycle No: 282
#1;

I <= 'b000000111;
D <= 'b0000;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 283
#1;

I <= 'b001000010;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 407 : < Y !== 'b0000 >");	// Vector No: 149
if (C4 !== 0) $display("Assert 408 : < C4 !== 0 >");
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 284
#1;

I <= 'b000000111;
D <= 'b1111;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 285
#1;

I <= 'b001000010;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 409 : < Y !== 'b1111 >");	// Vector No: 150
if (C4 !== 0) $display("Assert 410 : < C4 !== 0 >");
#1;

// ************************
// ******** TESTING FOR ALU SOURCE-SELECT ( R = 0, S = B) ********
//------------------------

clk <= 1;		// Cycle No: 286
#1;

I <= 'b011000111;
D <= 'b0000;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 287
#1;

I <= 'b001000011;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 411 : < Y !== 'b0000 >");	// Vector No: 151
if (C4 !== 0) $display("Assert 412 : < C4 !== 0 >");
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 288
#1;

I <= 'b011000111;
D <= 'b1111;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 289
#1;

I <= 'b001000011;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 413 : < Y !== 'b1111 >");	// Vector No: 152
if (C4 !== 0) $display("Assert 414 : < C4 !== 0 >");
#1;

// ************************
// ******** TESTING FOR ALU SOURCE-SELECT ( R = 0, S = A) ********
//------------------------

clk <= 1;		// Cycle No: 290
#1;

I <= 'b011000111;
D <= 'b0000;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 291
#1;

I <= 'b001000100;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 415 : < Y !== 'b0000 >");	// Vector No: 153
if (C4 !== 0) $display("Assert 416 : < C4 !== 0 >");
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 292
#1;

I <= 'b011000111;
D <= 'b1111;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 293
#1;

I <= 'b001000100;
Aadd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 417 : < Y !== 'b1111 >");	// Vector No: 154
if (C4 !== 0) $display("Assert 418 : < C4 !== 0 >");
#1;

// ************************
// ******** TESTING FOR ALU SOURCE-SELECT ( R = D, S = A) ********
//------------------------

clk <= 1;		// Cycle No: 294
#1;

I <= 'b011000111;
D <= 'b0000;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 295
#1;

I <= 'b001000101;
D <= 'b1111;
Aadd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 419 : < Y !== 'b1111 >");	// Vector No: 155
if (C4 !== 0) $display("Assert 420 : < C4 !== 0 >");
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 296
#1;

I <= 'b011000111;
D <= 'b1111;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 297
#1;

I <= 'b001000101;
D <= 'b0000;
Aadd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 421 : < Y !== 'b1111 >");	// Vector No: 156
if (C4 !== 0) $display("Assert 422 : < C4 !== 0 >");
#1;

// ************************
// ******** TESTING FOR ALU SOURCE-SELECT ( R = D, S = Q) ********
//------------------------

clk <= 1;		// Cycle No: 298
#1;

I <= 'b000000111;
D <= 'b1111;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 299
#1;

I <= 'b001000110;
D <= 'b0000;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 423 : < Y !== 'b1111 >");	// Vector No: 157
if (C4 !== 0) $display("Assert 424 : < C4 !== 0 >");
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 300
#1;

I <= 'b000000111;
D <= 'b0000;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 301
#1;

I <= 'b001000110;
D <= 'b1111;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 425 : < Y !== 'b1111 >");	// Vector No: 158
if (C4 !== 0) $display("Assert 426 : < C4 !== 0 >");
#1;

// ************************
// ******** TESTING FOR ALU SOURCE-SELECT ( R = D, S = 0) ********
//------------------------

clk <= 1;		// Cycle No: 302
#1;

I <= 'b001000111;
D <= 'b0000;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 427 : < Y !== 'b0000 >");	// Vector No: 159
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 303
#1;

I <= 'b001000111;
D <= 'b1111;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 428 : < Y !== 'b1111 >");	// Vector No: 160
#1;

// ************************
// ************************************
// *                                  *
// * TEST VECTORS FOR OUTPUT-SELECTOR *
// *                                  *
// ************************************
// ******** TESTING OUTPUT FOR (I8 I7 I6 = 000) ********
//------------------------

clk <= 1;		// Cycle No: 304
#1;

I <= 'b000000111;
D <= 'b0000;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 429 : < Y !== 'b0000 >");	// Vector No: 161
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 305
#1;

I <= 'b000000111;
D <= 'b1111;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 430 : < Y !== 'b1111 >");	// Vector No: 162
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 306
#1;

I <= 'b000000111;
D <= 'b1111;
C0 <= 0;
OEbar <= 1;
#4;

clk <= 0;
#4;

if (Y !== 'z) $display("Assert 431 : < Y !== 'z >");	// Vector No: 163
#1;

// ************************
// ******** TESTING OUTPUT FOR (I8 I7 I6 = 001) ********
//------------------------

clk <= 1;		// Cycle No: 307
#1;

I <= 'b001000111;
D <= 'b0000;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 432 : < Y !== 'b0000 >");	// Vector No: 164
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 308
#1;

I <= 'b001000111;
D <= 'b1111;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 433 : < Y !== 'b1111 >");	// Vector No: 165
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 309
#1;

I <= 'b001000111;
D <= 'b1111;
C0 <= 0;
OEbar <= 1;
#4;

clk <= 0;
#4;

if (Y !== 'z) $display("Assert 434 : < Y !== 'z >");	// Vector No: 166
#1;

// ************************
// ******** TESTING OUTPUT FOR (I8 I7 I6 = 010) ********
//------------------------

clk <= 1;		// Cycle No: 310
#1;

I <= 'b011000111;
D <= 'b0000;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 311
#1;

I <= 'b010000111;
Aadd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 435 : < Y !== 'b0000 >");	// Vector No: 167
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 312
#1;

I <= 'b011000111;
D <= 'b1111;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 313
#1;

I <= 'b010000111;
Aadd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 436 : < Y !== 'b1111 >");	// Vector No: 168
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 314
#1;

I <= 'b011000111;
D <= 'b1111;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 315
#1;

I <= 'b010000111;
Aadd <= 0;
C0 <= 0;
OEbar <= 1;
#4;

clk <= 0;
#4;

if (Y !== 'z) $display("Assert 437 : < Y !== 'z >");	// Vector No: 169
#1;

// ************************
// ******** TESTING OUTPUT FOR (I8 I7 I6 = 011) ********
//------------------------

clk <= 1;		// Cycle No: 316
#1;

I <= 'b011000111;
D <= 'b0000;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 438 : < Y !== 'b0000 >");	// Vector No: 170
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 317
#1;

I <= 'b011000111;
D <= 'b1111;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 439 : < Y !== 'b1111 >");	// Vector No: 171
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 318
#1;

I <= 'b011000111;
D <= 'b1111;
C0 <= 0;
OEbar <= 1;
#4;

clk <= 0;
#4;

if (Y !== 'z) $display("Assert 440 : < Y !== 'z >");	// Vector No: 172
#1;

// ************************
// ******** TESTING OUTPUT FOR (I8 I7 I6 = 100) ********
//------------------------

clk <= 1;		// Cycle No: 319
#1;

I <= 'b100000111;
D <= 'b0000;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 441 : < Y !== 'b0000 >");	// Vector No: 173
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 320
#1;

I <= 'b100000111;
D <= 'b1111;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 442 : < Y !== 'b1111 >");	// Vector No: 174
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 321
#1;

I <= 'b100000111;
D <= 'b1111;
C0 <= 0;
OEbar <= 1;
#4;

clk <= 0;
#4;

if (Y !== 'z) $display("Assert 443 : < Y !== 'z >");	// Vector No: 175
#1;

// ************************
// ******** TESTING OUTPUT FOR (I8 I7 I6 = 101) ********
//------------------------

clk <= 1;		// Cycle No: 322
#1;

I <= 'b101000111;
D <= 'b0000;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 444 : < Y !== 'b0000 >");	// Vector No: 176
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 323
#1;

I <= 'b101000111;
D <= 'b1111;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 445 : < Y !== 'b1111 >");	// Vector No: 177
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 324
#1;

I <= 'b101000111;
D <= 'b1111;
C0 <= 0;
OEbar <= 1;
#4;

clk <= 0;
#4;

if (Y !== 'z) $display("Assert 446 : < Y !== 'z >");	// Vector No: 178
#1;

// ************************
// ******** TESTING OUTPUT FOR (I8 I7 I6 = 110) ********
//------------------------

clk <= 1;		// Cycle No: 325
#1;

I <= 'b110000111;
D <= 'b0000;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 447 : < Y !== 'b0000 >");	// Vector No: 179
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 326
#1;

I <= 'b110000111;
D <= 'b1111;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 448 : < Y !== 'b1111 >");	// Vector No: 180
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 327
#1;

I <= 'b110000111;
D <= 'b1111;
C0 <= 0;
OEbar <= 1;
#4;

clk <= 0;
#4;

if (Y !== 'z) $display("Assert 449 : < Y !== 'z >");	// Vector No: 181
#1;

// ************************
// ******** TESTING OUTPUT FOR (I8 I7 I6 = 111) ********
//------------------------

clk <= 1;		// Cycle No: 328
#1;

I <= 'b111000111;
D <= 'b0000;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 450 : < Y !== 'b0000 >");	// Vector No: 182
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 329
#1;

I <= 'b111000111;
D <= 'b1111;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 451 : < Y !== 'b1111 >");	// Vector No: 183
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 330
#1;

I <= 'b111000111;
D <= 'b1111;
C0 <= 0;
OEbar <= 1;
#4;

clk <= 0;
#4;

if (Y !== 'z) $display("Assert 452 : < Y !== 'z >");	// Vector No: 184
#1;

// ************************
// **************************
// *                        *
// * TEST VECTORS FOR PATHS *
// *                        *
// **************************
// ******** TESTING PATHS ( "ALU-SOURCES" --> F --> Q ) ********
// * * * * PATH TEST WITH ALU-SOURCE ( R = A , S = Q ) * * * *
//------------------------

clk <= 1;		// Cycle No: 331
#1;

I <= 'b011000111;
D <= 'b0000;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 332
#1;

I <= 'b000000111;
D <= 'b0000;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 333
#1;

I <= 'b000011000;
Aadd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 334
#1;

I <= 'b001000010;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 453 : < Y !== 'b0000 >");	// Vector No: 185
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 335
#1;

I <= 'b011000111;
D <= 'b1111;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 336
#1;

I <= 'b000000111;
D <= 'b1111;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 337
#1;

I <= 'b000100000;
Aadd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 338
#1;

I <= 'b001000010;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 454 : < Y !== 'b1111 >");	// Vector No: 186
#1;

// ************************
// * * * * PATH TEST WITH ALU-SOURCE ( R = A , S = B ) * * * *
//------------------------

clk <= 1;		// Cycle No: 339
#1;

I <= 'b011000111;
D <= 'b0000;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 340
#1;

I <= 'b011000111;
D <= 'b0000;
Badd <= 1;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 341
#1;

I <= 'b000011001;
Aadd <= 0;
Badd <= 1;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 342
#1;

I <= 'b001000010;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 455 : < Y !== 'b0000 >");	// Vector No: 187
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 343
#1;

I <= 'b011000111;
D <= 'b1111;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 344
#1;

I <= 'b011000111;
D <= 'b1111;
Badd <= 1;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 345
#1;

I <= 'b000100001;
Aadd <= 0;
Badd <= 1;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 346
#1;

I <= 'b001000010;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 456 : < Y !== 'b1111 >");	// Vector No: 188
#1;

// ************************
// * * * * PATH TEST WITH ALU-SOURCE ( R = 0 , S = Q ) * * * *
//------------------------

clk <= 1;		// Cycle No: 347
#1;

I <= 'b000000111;
D <= 'b0000;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 348
#1;

I <= 'b000011010;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 349
#1;

I <= 'b001000010;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 457 : < Y !== 'b0000 >");	// Vector No: 189
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 350
#1;

I <= 'b000000111;
D <= 'b1111;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 351
#1;

I <= 'b000011010;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 352
#1;

I <= 'b001000010;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 458 : < Y !== 'b1111 >");	// Vector No: 190
#1;

// ************************
// * * * * PATH TEST WITH ALU-SOURCE ( R = 0 , S = B ) * * * *
//------------------------

clk <= 1;		// Cycle No: 353
#1;

I <= 'b011000111;
D <= 'b0000;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 354
#1;

I <= 'b000011011;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 355
#1;

I <= 'b001000010;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 459 : < Y !== 'b0000 >");	// Vector No: 191
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 356
#1;

I <= 'b011000111;
D <= 'b1111;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 357
#1;

I <= 'b000011011;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 358
#1;

I <= 'b001000010;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 460 : < Y !== 'b1111 >");	// Vector No: 192
#1;

// ************************
// * * * * PATH TEST WITH ALU-SOURCE ( R = 0 , S = A ) * * * *
//------------------------

clk <= 1;		// Cycle No: 359
#1;

I <= 'b011000111;
D <= 'b0000;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 360
#1;

I <= 'b000011100;
Aadd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 361
#1;

I <= 'b001000010;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 461 : < Y !== 'b0000 >");	// Vector No: 193
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 362
#1;

I <= 'b011000111;
D <= 'b1111;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 363
#1;

I <= 'b000011100;
Aadd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 364
#1;

I <= 'b001000010;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 462 : < Y !== 'b1111 >");	// Vector No: 194
#1;

// ************************
// * * * * PATH TEST WITH ALU-SOURCE ( R = D , S = A ) * * * *
//------------------------

clk <= 1;		// Cycle No: 365
#1;

I <= 'b011000111;
D <= 'b0000;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 366
#1;

I <= 'b000011101;
D <= 'b0000;
Aadd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 367
#1;

I <= 'b001000010;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 463 : < Y !== 'b0000 >");	// Vector No: 195
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 368
#1;

I <= 'b011000111;
D <= 'b1111;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 369
#1;

I <= 'b000100101;
D <= 'b1111;
Aadd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 370
#1;

I <= 'b001000010;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 464 : < Y !== 'b1111 >");	// Vector No: 196
#1;

// ************************
// * * * * PATH TEST WITH ALU-SOURCE ( R = D , S = Q ) * * * *
//------------------------

clk <= 1;		// Cycle No: 371
#1;

I <= 'b000000111;
D <= 'b0000;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 372
#1;

I <= 'b000011110;
D <= 'b0000;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 373
#1;

I <= 'b001000010;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 465 : < Y !== 'b0000 >");	// Vector No: 197
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 374
#1;

I <= 'b000000111;
D <= 'b1111;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 375
#1;

I <= 'b000100110;
D <= 'b1111;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 376
#1;

I <= 'b001000010;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 466 : < Y !== 'b1111 >");	// Vector No: 198
#1;

// ************************
// * * * * PATH TEST WITH ALU-SOURCE ( R = D , S = 0 ) * * * *
//------------------------

clk <= 1;		// Cycle No: 377
#1;

I <= 'b000011111;
D <= 'b0000;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 378
#1;

I <= 'b001000010;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 467 : < Y !== 'b0000 >");	// Vector No: 199
#1;

// ************************
// * * * * PATH TEST WITH ALU-SOURCE ( R = D , S = 0 ) * * * *
//------------------------

clk <= 1;		// Cycle No: 379
#1;

I <= 'b000011111;
D <= 'b1111;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 380
#1;

I <= 'b001000010;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 468 : < Y !== 'b1111 >");	// Vector No: 200
#1;

// ************************
// ******** TESTING PATHS ( "ALU-SOURCES" --> F --> B ) ********
// * * * * PATH TEST WITH ALU-SOURCE ( R = A , S = Q ) * * * *
//------------------------

clk <= 1;		// Cycle No: 381
#1;

I <= 'b011000111;
D <= 'b0000;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 382
#1;

I <= 'b000000111;
D <= 'b0000;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 383
#1;

I <= 'b011011000;
Aadd <= 0;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 384
#1;

I <= 'b001000100;
Aadd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 469 : < Y !== 'b0000 >");	// Vector No: 201
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 385
#1;

I <= 'b011000111;
D <= 'b1111;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 386
#1;

I <= 'b000000111;
D <= 'b1111;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 387
#1;

I <= 'b011100000;
Aadd <= 0;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 388
#1;

I <= 'b001000100;
Aadd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 470 : < Y !== 'b1111 >");	// Vector No: 202
#1;

// ************************
// * * * * PATH TEST WITH ALU-SOURCE ( R = A , S = B ) * * * *
//------------------------

clk <= 1;		// Cycle No: 389
#1;

I <= 'b011000111;
D <= 'b0000;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 390
#1;

I <= 'b011000111;
D <= 'b0000;
Badd <= 1;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 391
#1;

I <= 'b011011001;
Aadd <= 1;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 392
#1;

I <= 'b001000100;
Aadd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 471 : < Y !== 'b0000 >");	// Vector No: 203
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 393
#1;

I <= 'b011000111;
D <= 'b1111;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 394
#1;

I <= 'b011000111;
D <= 'b1111;
Badd <= 1;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 395
#1;

I <= 'b011100001;
Aadd <= 1;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 396
#1;

I <= 'b001000100;
Aadd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 472 : < Y !== 'b1111 >");	// Vector No: 204
#1;

// ************************
// * * * * PATH TEST WITH ALU-SOURCE ( R = 0 , S = Q ) * * * *
//------------------------

clk <= 1;		// Cycle No: 397
#1;

I <= 'b000000111;
D <= 'b0000;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 398
#1;

I <= 'b011011010;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 399
#1;

I <= 'b001000100;
Aadd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 473 : < Y !== 'b0000 >");	// Vector No: 205
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 400
#1;

I <= 'b000000111;
D <= 'b1111;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 401
#1;

I <= 'b011011010;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 402
#1;

I <= 'b001000100;
Aadd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 474 : < Y !== 'b1111 >");	// Vector No: 206
#1;

// ************************
// * * * * PATH TEST WITH ALU-SOURCE ( R = 0 , S = B ) * * * *
//------------------------

clk <= 1;		// Cycle No: 403
#1;

I <= 'b011000111;
D <= 'b0000;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 404
#1;

I <= 'b011011011;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 405
#1;

I <= 'b001000100;
Aadd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 475 : < Y !== 'b0000 >");	// Vector No: 207
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 406
#1;

I <= 'b011000111;
D <= 'b1111;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 407
#1;

I <= 'b011011011;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 408
#1;

I <= 'b001000100;
Aadd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 476 : < Y !== 'b1111 >");	// Vector No: 208
#1;

// ************************
// * * * * PATH TEST WITH ALU-SOURCE ( R = 0 , S = A ) * * * *
//------------------------

clk <= 1;		// Cycle No: 409
#1;

I <= 'b011000111;
D <= 'b0000;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 410
#1;

I <= 'b011011100;
Aadd <= 0;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 411
#1;

I <= 'b001000100;
Aadd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 477 : < Y !== 'b0000 >");	// Vector No: 209
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 412
#1;

I <= 'b011000111;
D <= 'b1111;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 413
#1;

I <= 'b011011100;
Aadd <= 0;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 414
#1;

I <= 'b001000100;
Aadd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 478 : < Y !== 'b1111 >");	// Vector No: 210
#1;

// ************************
// * * * * PATH TEST WITH ALU-SOURCE ( R = D , S = A ) * * * *
//------------------------

clk <= 1;		// Cycle No: 415
#1;

I <= 'b011000111;
D <= 'b0000;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 416
#1;

I <= 'b011011101;
D <= 'b0000;
Aadd <= 0;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 417
#1;

I <= 'b001000100;
Aadd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 479 : < Y !== 'b0000 >");	// Vector No: 211
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 418
#1;

I <= 'b011000111;
D <= 'b1111;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 419
#1;

I <= 'b011100101;
D <= 'b1111;
Aadd <= 0;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 420
#1;

I <= 'b001000100;
Aadd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 480 : < Y !== 'b1111 >");	// Vector No: 212
#1;

// ************************
// * * * * PATH TEST WITH ALU-SOURCE ( R = D , S = Q ) * * * *
//------------------------

clk <= 1;		// Cycle No: 421
#1;

I <= 'b000000111;
D <= 'b0000;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 422
#1;

I <= 'b011011110;
D <= 'b0000;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 423
#1;

I <= 'b001000100;
Aadd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 481 : < Y !== 'b0000 >");	// Vector No: 213
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 424
#1;

I <= 'b000000111;
D <= 'b1111;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 425
#1;

I <= 'b011100110;
D <= 'b1111;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 426
#1;

I <= 'b001000100;
Aadd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 482 : < Y !== 'b1111 >");	// Vector No: 214
#1;

// ************************
// * * * * PATH TEST WITH ALU-SOURCE ( R = D , S = 0 ) * * * *
//------------------------

clk <= 1;		// Cycle No: 427
#1;

I <= 'b011011111;
D <= 'b0000;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 428
#1;

I <= 'b001000100;
Aadd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b0000) $display("Assert 483 : < Y !== 'b0000 >");	// Vector No: 215
#1;

// ************************
//------------------------

clk <= 1;		// Cycle No: 429
#1;

I <= 'b011011111;
D <= 'b1111;
Badd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 430
#1;

I <= 'b001000100;
Aadd <= 0;
C0 <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

if (Y !== 'b1111) $display("Assert 484 : < Y !== 'b1111 >");	// Vector No: 216
#1;

// ************************
//------------------------

$display("Test PASS");
$finish;

end

endmodule
