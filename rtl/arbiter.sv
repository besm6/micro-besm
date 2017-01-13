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
    input  wire        reset,
    input  wire        request, // input request
    input  wire        suspend, // input suspend condition
    input  wire  [3:0] req_op,  // input op

    output logic [1:0] arx,     // busio register index
    output logic       ecx,     // busio port enable
    output logic       wrx,     // busio write enable
    output logic       astb,    // memory address strobe
    output logic       rd,      // memory read
    output logic       wr,      // memory write
    output logic       iack,    // interrupt acknowledge
    output logic       done     // resulting acknowledge
);
timeunit 1ns / 10ps;

logic [2:0] step;               // FSM state index
logic [3:0] opcode;             // latched opcode

parameter MAXSTATE = 'h7;       // FSM state limit

typedef enum bit [1:0] {
    ADDR  = 'b00,               // RG0 - physical address
    CMD   = 'b01,               // RG1 - fetch result from memory
    RDATA = 'b10,               // RG2 - load result from memory
    WDATA = 'b11                // RG3 - store data to memory
} reg_index;

//
// Sequential state transition
//
always_ff @(posedge clk)
    if (reset)
        step <= 0;
    else if (request)
        step <= 0;
    else if (!done & !suspend & step != MAXSTATE)
        step <= step + 1;

//
// Latched opcode
//
always_ff @(posedge clk)
    if (reset | suspend)
        opcode <= 0;
    else if (request)
        opcode <= req_op;

//
// Batch mode flag
//
logic batch_mode;

always_ff @(posedge clk)
    if (reset)
        batch_mode <= 0;
    else if (!request & done)
        // Raise batch mode flag when BTRWR or BTRRD operation finished
        batch_mode <= (opcode == 12 || opcode == 13);

//
// Output assignments
//
`define OUTPUT {arx, ecx, wrx, astb, rd, wr, iack, done}

always_comb begin
    // Initial arx -- ecx wrx astb rd wr iack done
    `OUTPUT = {RDATA, '0, '0, '0, '0, '0, '0, '1};

    if (!request & !suspend) begin
        case (opcode)

         0: // Idle
            ;

         1: // CCRD, чтение кэша команд
            ; // Not used

         2: // CCWR, запись в кэш команд
            ; // Not used

         3: // DCRD, чтение кэш операндов
            ; // Not used

         4: // DCWR, запись в кэш операндов
            ; // Not used

         8: // FЕТСН, чтение команды
            case (step) // arx -- ecx wrx astb rd wr iack done
             0: `OUTPUT = {ADDR,  '1, '0, '1, '0, '0, '0, '0}; // Send address
             1: `OUTPUT = {CMD,   '1, '0, '0, '1, '0, '0, '0}; // Get data
             2: `OUTPUT = {CMD,   '1, '1, '0, '0, '0, '0, '0}; // Read word
            endcase

         9, // DRD, чтение операнда
        11: // RDMWR, чтение - модификация - запись (семафорная)
            // Read a word; set bit 55, write it back.
            // Write part follows as DWR.
            case (step) // arx -- ecx wrx astb rd wr iack done
             0: `OUTPUT = {ADDR,  '1, '0, '1, '0, '0, '0, '0}; // Send address
             1: `OUTPUT = {RDATA, '1, '0, '0, '1, '0, '0, '0}; // Get data
             2: `OUTPUT = {RDATA, '1, '1, '0, '0, '0, '0, '0}; // Read word
            endcase

        10: // DWR, запись результата
            case (step) // arx -- ecx wrx astb rd wr iack done
             0: `OUTPUT = {ADDR,  '1, '0, '1, '0, '0, '0, '0}; // Send address
             1: `OUTPUT = {WDATA, '1, '0, '0, '0, '0, '0, '0}; // Send data
             2: `OUTPUT = {WDATA, '1, '0, '0, '0, '1, '0, '0}; // Write word
            endcase

        12: // BTRWR, запись в режиме блочной передачи
            if (batch_mode)
                case (step) // arx -- ecx wrx astb rd wr iack done
                 0: `OUTPUT = {WDATA, '1, '0, '0, '0, '0, '0, '0}; // Send data
                 1: `OUTPUT = {WDATA, '1, '0, '0, '0, '1, '0, '0}; // Write word
                endcase
            else
                case (step) // arx -- ecx wrx astb rd wr iack done
                 0: `OUTPUT = {ADDR,  '1, '0, '1, '0, '0, '0, '0}; // Send address
                 1: `OUTPUT = {WDATA, '1, '0, '0, '0, '0, '0, '0}; // Get data
                 2: `OUTPUT = {WDATA, '1, '0, '0, '0, '1, '0, '0}; // Write word
                endcase

        13: // BTRRD, чтение в режиме блочной передачи
            if (batch_mode)
                case (step) // arx -- ecx wrx astb rd wr iack done
                 0: `OUTPUT = {RDATA, '1, '0, '0, '1, '0, '0, '0}; // Get data
                 1: `OUTPUT = {RDATA, '1, '1, '0, '0, '0, '0, '0}; // Read word
                endcase
            else
                case (step) // arx -- ecx wrx astb rd wr iack done
                 0: `OUTPUT = {ADDR,  '1, '0, '1, '0, '0, '0, '0}; // Send address
                 1: `OUTPUT = {RDATA, '1, '0, '0, '1, '0, '0, '0}; // Get data
                 2: `OUTPUT = {RDATA, '1, '1, '0, '0, '0, '0, '0}; // Read word
                endcase

        14: // BICLR, сброс прерываний на шине
            ; //TODO

        15: // BIRD, чтение прерываний с шины
            case (step) // arx -- ecx wrx astb rd wr iack done
             0: `OUTPUT = {RDATA, '1, '0, '0, '0, '0, '1, '0}; // Get data
             1: `OUTPUT = {RDATA, '1, '1, '0, '0, '0, '1, '0}; // Read word
            endcase

        endcase
    end
end

endmodule
