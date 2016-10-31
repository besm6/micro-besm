`default_nettype none

//
// External bus arbiter for micro-BESM
//
module arbiter(
    input  wire        clk,
    input  wire  [3:0] request, // input request

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

//
// Sequential state transition
//
always_ff @(posedge clk)
    if (request == 0)
        step <= 0;
    else if (step != MAXSTATE)         // TODO need some action on timeout
        step <= step + 1;

//
// Output assignments
//
always_ff @(posedge clk)
    case (request)
    0:  // Reset everything
        {arx, ecx, wrx, astb, rd, wr, done} = {2'b11, 0, 0, 0, 0, 0, 0};

    1:  // CCRD, чтение кэша команд
        case (step)
              0: //TODO
              1: //TODO
              2: //TODO
        default: {arx, ecx, wrx, astb, rd, wr, done} = {2'b11, 0, 0, 0, 0, 0, 0};
        endcase

    2:  // CCWR, запись в кэш команд
        case (step)
              0: //TODO
              1: //TODO
              2: //TODO
        default: {arx, ecx, wrx, astb, rd, wr, done} = {2'b11, 0, 0, 0, 0, 0, 0};
        endcase

    3:  // DCRD, чтение кэш операндов
        case (step)
              0: //TODO
              1: //TODO
              2: //TODO
        default: {arx, ecx, wrx, astb, rd, wr, done} = {2'b11, 0, 0, 0, 0, 0, 0};
        endcase

    4:  // DCWR, запись в кэш операндов
        case (step)
              0: //TODO
              1: //TODO
              2: //TODO
        default: {arx, ecx, wrx, astb, rd, wr, done} = {2'b11, 0, 0, 0, 0, 0, 0};
        endcase

    8:  // FЕТСН, чтение команды
        case (step)
              0: //TODO
              1: //TODO
              2: //TODO
        default: {arx, ecx, wrx, astb, rd, wr, done} = {2'b11, 0, 0, 0, 0, 0, 0};
        endcase

    9:  // DRD, чтение операнда
        case (step)
              0: //TODO
              1: //TODO
              2: //TODO
        default: {arx, ecx, wrx, astb, rd, wr, done} = {2'b11, 0, 0, 0, 0, 0, 0};
        endcase

    10: // DWR, запись результата
        case (step)
              0: //TODO
              1: //TODO
              2: //TODO
        default: {arx, ecx, wrx, astb, rd, wr, done} = {2'b11, 0, 0, 0, 0, 0, 0};
        endcase

    11: // RDMWR, чтение - модификация - запись (семафорная)
        case (step)
              0: //TODO
              1: //TODO
              2: //TODO
        default: {arx, ecx, wrx, astb, rd, wr, done} = {2'b11, 0, 0, 0, 0, 0, 0};
        endcase

    12: // BTRWR, запись в режиме блочной передачи
        case (step)
              0: //TODO
              1: //TODO
              2: //TODO
        default: {arx, ecx, wrx, astb, rd, wr, done} = {2'b11, 0, 0, 0, 0, 0, 0};
        endcase

    13: // BTRRD, чтение в режиме блочной передачи
        case (step)
              0: //TODO
              1: //TODO
              2: //TODO
        default: {arx, ecx, wrx, astb, rd, wr, done} = {2'b11, 0, 0, 0, 0, 0, 0};
        endcase

    14: // BICLR, сброс прерываний на шине
        case (step)
              0: //TODO
              1: //TODO
              2: //TODO
        default: {arx, ecx, wrx, astb, rd, wr, done} = {2'b11, 0, 0, 0, 0, 0, 0};
        endcase

    15: // BIRD, чтение прерываний с шины
        case (step)
              0: //TODO
              1: //TODO
              2: //TODO
        default: {arx, ecx, wrx, astb, rd, wr, done} = {2'b11, 0, 0, 0, 0, 0, 0};
        endcase

    default: begin
            //TODO: Unknown request
            if (testbench.tracefd)
                $fdisplay(testbench.tracefd, "(%0d) *** Wrong arbiter op=%0d!", $time, request);
            {arx, ecx, wrx, astb, rd, wr, done} = {2'b11, 0, 0, 0, 0, 0, 0};
        end
    endcase

endmodule
