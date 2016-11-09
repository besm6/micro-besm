//
// i8253 - Programmable interval timer
//
// Copyright (C) 2007, Viacheslav Slavinsky
// Copyright (c) 2016, Serge Vakulenko
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

module i8253(
    input  wire         clk,        // clock for time counter
    input  wire         cs,         // chip select
    input  wire         rd,         // data read
    input  wire         wr,         // data write
    input  wire   [1:0] a,          // address bus
    input  wire   [7:0] din,        // data input bus
    output logic  [7:0] dout,       // data output bus
    output logic  [2:0] out         // timer outputs
);
    logic [7:0] q0, q1, q2;
    logic [5:0] cword0, cword1, cword2;
    logic [2:0] cwsel;
    logic [3:0] sel, wren, rden;

    always_comb
        case(a)
            2'b00: sel = 4'b0001;
            2'b01: sel = 4'b0010;
            2'b10: sel = 4'b0100;
            2'b11: sel = 4'b1000;
        endcase

    assign wren = {4{wr & cs}} & sel;
    assign rden = {4{rd & cs}} & sel;

    always_comb
        case (din[7:6])
            2'b00: cwsel = 3'b001;
            2'b01: cwsel = 3'b010;
            2'b10: cwsel = 3'b100;
            2'b11: cwsel = 3'b000;
        endcase

    i8253_counter c0(clk, din[5:0], wren[3] & cwsel[0], din, wren[0], rden[0], q0, out[0]);
    i8253_counter c1(clk, din[5:0], wren[3] & cwsel[1], din, wren[1], rden[1], q1, out[1]);
    i8253_counter c2(clk, din[5:0], wren[3] & cwsel[2], din, wren[2], rden[2], q2, out[2]);

    assign dout = rden[0] ? q0 :
                  rden[1] ? q1 :
                  rden[2] ? q2 : 0;

endmodule

module i8253_counter(
    input  wire        clk,     // clock for time counter
    input  wire  [5:0] cword,   // control word from top sans counter select: 6 bits
    input  wire        cwset,   // control word set
    input  wire  [7:0] d,       // data in for load
    input  wire        wren,    // data load enable
    input  wire        rden,    // data read enable
    output logic [7:0] dout,    // read value
    output logic       out      // out pin according to mode
);
    parameter M0 = 3'd0,
              M1 = 3'd1,
              M2 = 3'd2,
              M3 = 3'd3,
              M4 = 3'd4,
              M5 = 3'd5;
    parameter M2X = 3'd6,       // according to OKI datasheet these modes are x10 and x11
              M3X = 3'd7;

    // control word breakdown
    logic [5:0] cwreg;
    wire  [1:0] rl_mode  = cwreg[5:4];
    wire  [2:0] cw_mode  = cwreg[3:1];
    wire        bcd_mode = cwreg[0];

    // counter load value
    logic [15:0] reload_value;

    // current counter value
    logic [15:0] counter;

    logic overwrite_req;
    logic loading;
    logic loaded;
    logic loading_msb;    // for rl=3: 0: next 8-bit value will be lsb, 1: msb
    logic starting;

    //---------------------------------------------------------
    // Down counter with auto-reload.
    //

    // for square wave gen
    wire halfmode = (cw_mode[1:0] == M3);

    // let the counter auto-reload inself in modes M2,M2X,M3,M3X
    wire autoreload = (cw_mode[1:0] == M3 || cw_mode[1:0] == M2);

    // counter overwrite enable (from host)
    wire overwrite = (overwrite_req && cw_mode != M1 && cw_mode != M5);

    wire [15:0] decr = !halfmode ? 1 :
                   counter[0]==0 ? 2 :
                             out ? 1 :
                                   3;

    wire [15:0] next = counter - decr;

    always @(posedge clk) begin
        // Update counter.
        if (overwrite | (autoreload & |next==0))
            counter <= reload_value;
        else
            counter <= next;
    end

    //---------------------------------------------------------
    // Read dispatcher.
    //
    i8253_read rbus(
        .rden       (rden),
        .cwset      (cwset),
        .latch_en   (cword[5:4] == 2'b00),
        .rl_mode    (rl_mode),
        .counter    (counter),
        .q          (dout)
    );

    always_latch begin
        if (cwset && cword[5:4] != 0) begin
            loading_msb <= 0;   // reset the doorstopper
            loaded      <= 0;
            loading     <= 0;
            cwreg       <= cword;

            case (cword[3:1])
            M0:      out <= 0; // interrupt, 1-time, start count on load or gate
            M1:      out <= 1; // programmable one-shot on gate rising edge; NOT IMPLEMENTED
            M2, M2X: out <= 1; // rate generator, start couting on load (or gate rising edge, not supported)
            M3, M3X: out <= 1; // square waveform generator
            M4:      out <= 1; // software trigger strobe
            M5:      out <= 1; // hardware trigger strobe (NOT IMPLEMENTED)
            default: out <= 1;
            endcase
        end

        // load
        if (wren) begin
            case (rl_mode)
            2'b01: begin
                    reload_value[7:0] <= d;
                    starting <= 1;
                    overwrite_req <= 1;
                end
            2'b10: begin
                    reload_value[15:8] <= d;
                    starting <= 1;
                    overwrite_req <= 1;
                end
            2'b11: begin
                    if (loading_msb) begin
                        reload_value[15:8] <= d;
                        starting <= 1;
                        loading <= 0;
                        overwrite_req <= ~loaded;
                    end else begin
                        reload_value[7:0] <= d;
                        loading <= 1;
                        if (cw_mode == M0 || cw_mode == M4)
                            loaded <= 0;
                    end

                    loading_msb <= ~loading_msb;
                end
            2'b00: ; // illegal state
            endcase
        end

        // reset overwrite flag
        if (overwrite & clk)
            overwrite_req <= 0;

        // enable counting
        if (starting & clk) begin
            loaded <= 1;
            starting <= 0;
        end

        // Set output pin.
        case (cw_mode)
        M0: if (counter == 16'd1) begin // 1 locks the counter so the terminal count is 0
                out <= 1;
            end

        M1: ; // NOT IMPLEMENTED: no gate, no reloads

        M2X,
        M2: // technically we should trigger/reload on 1
            // but we need to do this up front to be ready
            // by the next clk
            if (counter == 16'd2)
                out <= 0;
            else
                out <= 1;

        M3X,
        M3: if (counter == 16'd2)
                out <= ~out;

        M4: if (counter == 16'd0)
                out <= 0;
            else
                out <= 1; // reset out on next cycle

        M5: ; // NOT IMPLEMENTED: no gate, just roll

        default: ;
        endcase
    end
endmodule

//
// State-driven read dispatcher.
// Latched value is stored here.
// LSB/MSB read is decided upon here.
//
module i8253_read(
    input  wire        rden,
    input  wire        cwset,
    input  wire        latch_en,    // latching command written: counter value latch enable
    input  wire  [1:0] rl_mode,
    input  wire [15:0] counter,
    output wire  [7:0] q
);
    logic  [2:0] read_state;
    logic [15:0] latched_q;
    logic        read_msb;

    wire [7:0] r_lsb = (rl_mode == 2'b10) ? counter[15:8] : counter[7:0];
    wire [7:0] r_msb = (rl_mode == 2'b01) ? counter[7:0]  : counter[15:8];

    assign q = read_msb ?
        (read_state == 0) ? r_msb : latched_q[15:8] :
        (read_state == 0) ? r_lsb : latched_q[7:0];

    always_latch
        if (cwset && latch_en)
            latched_q <= counter;

    always_latch
        if (cwset) begin
            read_msb <= 0;
            if (latch_en)
                read_state <= 2;
            else
                read_state <= 0;

        end else if (rden) begin
            read_msb <= ~read_msb;
            case (read_state)
                0: read_state <= 0;
                1: read_state <= 0;
                2: read_state <= 1;
            endcase
        end
endmodule
