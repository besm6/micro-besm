//
// Count leading zeroes
//
// Copyright (c) 2016 Serge Vakulenko
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.
//
`default_nettype none

//
// For non-zero input, return 0..63.
// For zero input, return 127.
//
module clz(
    input  wire  [63:0] d,          // input data
    output logic [6:0]  out         // output index
);
timeunit 1ns / 10ps;

assign out = d[63] ? 0 :
             d[62] ? 1 :
             d[61] ? 2 :
             d[60] ? 3 :
             d[59] ? 4 :
             d[58] ? 5 :
             d[57] ? 6 :
             d[56] ? 7 :
             d[55] ? 8 :
             d[54] ? 9 :

             d[53] ? 10 :
             d[52] ? 11 :
             d[51] ? 12 :
             d[50] ? 13 :
             d[49] ? 14 :
             d[48] ? 15 :
             d[47] ? 16 :
             d[46] ? 17 :
             d[45] ? 18 :
             d[44] ? 19 :

             d[43] ? 20 :
             d[42] ? 21 :
             d[41] ? 22 :
             d[40] ? 23 :
             d[39] ? 24 :
             d[38] ? 25 :
             d[37] ? 26 :
             d[36] ? 27 :
             d[35] ? 28 :
             d[34] ? 29 :

             d[33] ? 30 :
             d[32] ? 31 :
             d[31] ? 32 :
             d[30] ? 33 :
             d[29] ? 34 :
             d[28] ? 35 :
             d[27] ? 36 :
             d[26] ? 37 :
             d[25] ? 38 :
             d[24] ? 39 :

             d[23] ? 40 :
             d[22] ? 41 :
             d[21] ? 42 :
             d[20] ? 43 :
             d[19] ? 44 :
             d[18] ? 45 :
             d[17] ? 46 :
             d[16] ? 47 :
             d[15] ? 48 :
             d[14] ? 49 :

             d[13] ? 50 :
             d[12] ? 51 :
             d[11] ? 52 :
             d[10] ? 53 :
             d[9]  ? 54 :
             d[8]  ? 55 :
             d[7]  ? 56 :
             d[6]  ? 57 :
             d[5]  ? 58 :
             d[4]  ? 59 :

             d[3]  ? 60 :
             d[2]  ? 61 :
             d[1]  ? 62 :
             d[0]  ? 63 :
                     127;
endmodule
