//
// Am2910 - Microprogram Controller
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

module am2910(
    input  wire         clk,        // Clock
    input  wire   [3:0] I,          // Four-bit instruction
    input  wire         nCCEN,      // Conditional Code Enable bit
    input  wire         nCC,        // Conditional Code Bit
    input  wire         nRLD,       // Unconditional load bit for register/counter
    input  wire         CI,         // Carry-in bit for microprogram counter
    input  wire  [11:0] D,          // 12-bit data input to chip
    output logic [11:0] Y,          // 12-bit data output from chip
    output logic        nPL,        // Pipeline register output enable
    output logic        nVECT,      // Vector output enable
    output logic        nMAP,       // Mapping PROM output enable
    output logic        nFULL       // Stack full flag
);
timeunit 1ns / 10ps;

enum bit [3:0] {
    JZ,     // 0 - Jump to Zero
    CJS,    // 1 - Conditional jump to subroutine using pipeline register address
    JMAP,   // 2 - Jump to Map (mapping PROM input)
    CJP,    // 3 - Conditional jump to address in pipeline register
    PUSH,   // 4 - PUSH stack; conditional load counter
    JSRP,   // 5 - Conditional jump to subroutine from piepline register address
    CJV,    // 6 - Conditional jump to vector mappin PROM address
    JRP,    // 7 - Conditional jump to register or pipeline
    RFCT,   // 8 - Repeat loop stack address until counter not 0
    RPCT,   // 9 - Repeat loop pipeline address until counter not 0
    CRTN,   // 10 - Conditional Return
    CJPP,   // 11 - Conditional jump to Subroutine and POP stack
    LDCT,   // 12 - Load counter and continue
    LOOP,   // 13 - Test for end of loop. If fails, repeat loop
    CONT,   // 14 - Continue
    TWB     // 15 - Three-way branch
} opcode_t;

reg   [2:0] SP;                 // Stack pointer
reg  [11:0] stack[5:0];         // Stack: six words
reg  [11:0] uPC;                // Microprogram PC
reg  [11:0] Cnt;                // Loop counter

wire R_sel, D_sel, uPC_sel, stack_sel, decr, load, nonzero, clear, push, pop;

assign Y = R_sel ? Cnt :
           D_sel ? D :
         uPC_sel ? uPC :
       stack_sel ? stack[SP] :
                   '0;

always @(posedge clk) begin
    if (load | !nRLD)
        Cnt <= D;
    else if (decr & nRLD)
        Cnt <= Cnt - 1;
end

assign nonzero = (Cnt != 0);

always @(posedge clk) begin
    if (clear)
        uPC <= 0;
    else
        uPC <= Y + CI;
end

logic [2:0] write_address;

always @(posedge clk) begin
    if (pop && SP != 0)
        SP <= SP - 1;
    else if (push && SP != 5)
        SP <= SP + 1;
    else if (clear)
        SP <= 0;

    if (push)
        stack[write_address] <= uPC;
end

assign write_address = (SP == 5) ? SP : SP+1;

assign nFULL = (SP != 5);

logic fail;

assign fail = (nCC & !nCCEN);

assign D_sel = (I == JMAP) ||
               (nonzero &&
                    I == RPCT) ||
               (!nonzero && fail &&
                    I == TWB) ||
               (!fail &&
                    (I == CJS ||
                     I == CJP ||
                     I == JSRP ||
                     I == CJV ||
                     I == JRP ||
                     I == CJPP));

assign uPC_sel = (I == PUSH) ||
                 (I == LDCT) ||
                 (I == CONT) ||
                 (fail &&
                    (I == CJS ||
                     I == CJP ||
                     I == CJV ||
                     I == CRTN ||
                     I == CJPP ||
                     I == CONT)) ||
                (!nonzero &&
                    (I == RFCT ||
                     I == RPCT)) ||
                (!fail &&
                    (I == TWB ||
                     I == LOOP));

assign stack_sel = (nonzero &&
                        I == RFCT) ||
                   (!fail &&
                        I == CRTN) ||
                   (fail &&
                        I == LOOP) ||
                   (nonzero && fail &&
                        I == TWB);

assign R_sel = (fail &&
                    (I == JSRP ||
                     I == JRP));

assign push = (I == PUSH) ||
              (I == JSRP) ||
              (!fail &&
                    I == CJS);

assign pop = (!fail &&
                (I == CRTN ||
                 I == CJPP ||
                 I == LOOP ||
                 I == TWB)) ||
             (!nonzero &&
                (I == RFCT ||
                 I == TWB));

assign load = (I == LDCT) ||
              (!fail &&
                    I == PUSH);

assign decr = (nonzero &&
                    (I == RFCT ||
                     I == RPCT ||
                     I == TWB));

assign nMAP = (I != JMAP);

assign nVECT = (I != CJV);

assign nPL = (I == JMAP) ||
             (I == CJV);

assign clear = (I == JZ);

endmodule
