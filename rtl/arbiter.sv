//
// External bus arbiter for micro-BESM
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

module arbiter(
    input  wire        clk,
    input  wire        request, // input request
    input  wire  [3:0] opcode,  // input opcode

    output logic [1:0] arx,     // busio register index
    output logic       ecx,     // busio port enable
    output logic       wrx,     // busio write enable
    output logic       astb,    // memory address strobe
    output logic       rd,      // memory read
    output logic       wr,      // memory write
    output logic       done     // resulting acknowledge
);
timeunit 1ns / 10ps;

logic [6:0] step;

parameter MAXSTATE = 'h7f;

typedef enum bit [1:0] {
    ADDR  = 'b00,   // RG0 - физический адрес
    CMD   = 'b01,   // RG1 - регистр левой, правой команды
    WDATA = 'b10,   // RG2 - регистр операнда
    RDATA = 'b11    // RG3 - регистр результата
} reg_index;

//
// Sequential state transition
//
always_ff @(posedge clk)
    if (request)
        step <= 0;
    else if (!done & step != MAXSTATE)  // TODO need some action on timeout
        step <= step + 1;

//
// Output assignments
//
always_comb begin
    case (opcode)
    0:  // Reset everything
        {arx, ecx, wrx, astb, rd, wr, done} = {RDATA, '0, '0, '0, '0, '0, '1};

    1:  // CCRD, чтение кэша команд
        case (step)
              //0: //TODO
              //1: //TODO
              //2: //TODO
        default: begin
                if (testbench.tracefd)
                    $fdisplay(testbench.tracefd, "(%0d) *** Arbiter op=CCRD not implemented yet!", $time);
                {arx, ecx, wrx, astb, rd, wr, done} = {RDATA, '0, '0, '0, '0, '0, '1};
            end
        endcase

    2:  // CCWR, запись в кэш команд
        case (step)
              //0: //TODO
              //1: //TODO
              //2: //TODO
        default: begin
                if (testbench.tracefd)
                    $fdisplay(testbench.tracefd, "(%0d) *** Arbiter op=CCWR not implemented yet!", $time);
                {arx, ecx, wrx, astb, rd, wr, done} = {RDATA, '0, '0, '0, '0, '0, '1};
            end
        endcase

    3:  // DCRD, чтение кэш операндов
        case (step)
              //0: //TODO
              //1: //TODO
              //2: //TODO
        default: begin
                if (testbench.tracefd)
                    $fdisplay(testbench.tracefd, "(%0d) *** Arbiter op=DCRD not implemented yet!", $time);
                {arx, ecx, wrx, astb, rd, wr, done} = {RDATA, '0, '0, '0, '0, '0, '1};
            end
        endcase

    4:  // DCWR, запись в кэш операндов
        case (step)
              //0: //TODO
              //1: //TODO
              //2: //TODO
        default: begin
                if (testbench.tracefd)
                    $fdisplay(testbench.tracefd, "(%0d) *** Arbiter op=DCWR not implemented yet!", $time);
                {arx, ecx, wrx, astb, rd, wr, done} = {RDATA, '0, '0, '0, '0, '0, '1};
            end
        endcase

    8:  // FЕТСН, чтение команды
        case (step)
              //0: //TODO
              //1: //TODO
              //2: //TODO
        default: begin
                if (testbench.tracefd)
                    $fdisplay(testbench.tracefd, "(%0d) *** Arbiter op=FETCH not implemented yet!", $time);
                {arx, ecx, wrx, astb, rd, wr, done} = {RDATA, '0, '0, '0, '0, '0, '1};
            end
        endcase

    9:  // DRD, чтение операнда
        case (step)
                0:  // Send address
                    {arx, ecx, wrx, astb, rd, wr, done} = {ADDR,  '1, '0, '1, '0, '0, '0};
                1:  // Read word
                    {arx, ecx, wrx, astb, rd, wr, done} = {RDATA, '1, '1, '0, '1, '0, '0};
                2:  // Done
                    {arx, ecx, wrx, astb, rd, wr, done} = {RDATA, '0, '0, '0, '0, '0, '1};
        default: begin
                if (testbench.tracefd)
                    $fdisplay(testbench.tracefd, "(%0d) *** Arbiter op=DRD not implemented yet!", $time);
                {arx, ecx, wrx, astb, rd, wr, done} = {RDATA, '0, '0, '0, '0, '0, '1};
            end
        endcase

    10: // DWR, запись результата
        case (step)
              //0: //TODO
              //1: //TODO
              //2: //TODO
        default: begin
                if (testbench.tracefd)
                    $fdisplay(testbench.tracefd, "(%0d) *** Arbiter op=DWR not implemented yet!", $time);
                {arx, ecx, wrx, astb, rd, wr, done} = {RDATA, '0, '0, '0, '0, '0, '1};
            end
        endcase

    11: // RDMWR, чтение - модификация - запись (семафорная)
        case (step)
              //0: //TODO
              //1: //TODO
              //2: //TODO
        default: begin
                if (testbench.tracefd)
                    $fdisplay(testbench.tracefd, "(%0d) *** Arbiter op=RDMWR not implemented yet!", $time);
                {arx, ecx, wrx, astb, rd, wr, done} = {RDATA, '0, '0, '0, '0, '0, '1};
            end
        endcase

    12: // BTRWR, запись в режиме блочной передачи
        case (step)
              //0: //TODO
              //1: //TODO
              //2: //TODO
        default: begin
                if (testbench.tracefd)
                    $fdisplay(testbench.tracefd, "(%0d) *** Arbiter op=BTRWR not implemented yet!", $time);
                {arx, ecx, wrx, astb, rd, wr, done} = {RDATA, '0, '0, '0, '0, '0, '1};
            end
        endcase

    13: // BTRRD, чтение в режиме блочной передачи
        case (step)
              //0: //TODO
              //1: //TODO
              //2: //TODO
        default: begin
                if (testbench.tracefd)
                    $fdisplay(testbench.tracefd, "(%0d) *** Arbiter op=BTRRD not implemented yet!", $time);
                {arx, ecx, wrx, astb, rd, wr, done} = {RDATA, '0, '0, '0, '0, '0, '1};
            end
        endcase

    14: // BICLR, сброс прерываний на шине
        case (step)
              //0: //TODO
              //1: //TODO
              //2: //TODO
        default: begin
                if (testbench.tracefd)
                    $fdisplay(testbench.tracefd, "(%0d) *** Arbiter op=BICLR not implemented yet!", $time);
                {arx, ecx, wrx, astb, rd, wr, done} = {RDATA, '0, '0, '0, '0, '0, '1};
            end
        endcase

    15: // BIRD, чтение прерываний с шины
        case (step)
              //0: //TODO
              //1: //TODO
              //2: //TODO
        default: begin
                if (testbench.tracefd)
                    $fdisplay(testbench.tracefd, "(%0d) *** Arbiter op=BIRD not implemented yet!", $time);
                {arx, ecx, wrx, astb, rd, wr, done} = {RDATA, '0, '0, '0, '0, '0, '1};
            end
        endcase

    default: begin
            // Unknown request
            if (request & testbench.tracefd)
                $fdisplay(testbench.tracefd, "(%0d) *** Wrong arbiter op=%0d!", $time, opcode);
            {arx, ecx, wrx, astb, rd, wr, done} = {RDATA, '0, '0, '0, '0, '0, '1};
        end
    endcase
end

endmodule
