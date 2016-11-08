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
    input  wire         clk,        // i/o clock
    input  wire   [1:0] a,          // address bus
    input  wire         wr,         // data write
    input  wire         rd,         // data read
    input  wire   [7:0] din,        // data input bus
    output logic  [7:0] dout,       // data output bus
    output logic  [2:0] out         // timer outputs
);
    logic [7:0] q0, q1, q2;
    logic [5:0] cword0, cword1, cword2;
    logic [2:0] cwsel;
    logic [3:0] sel;
    logic [3:0] wren;
    logic [3:0] rden;

    always_comb
        case(a)
            2'b00: sel = 4'b0001;
            2'b01: sel = 4'b0010;
            2'b10: sel = 4'b0100;
            2'b11: sel = 4'b1000;
        endcase

    assign wren = {4{wr}} & sel;
    assign rden = {4{rd}} & sel;

    always_comb
        case (din[7:6])
            2'b00: cwsel = 3'b001;
            2'b01: cwsel = 3'b010;
            2'b10: cwsel = 3'b100;
            2'b11: cwsel = 3'b000;
        endcase

    //assign dout = rden[0] ? q0 : rden[1] ? q1 : rden[2] ? q2 : 0;
    always_comb
        case (rden)
            3'b001:  dout = q0;
            3'b010:  dout = q1;
            3'b100:  dout = q2;
            default: dout = 0;
        endcase

    i8253_counter c0(clk, din, wren[3] & cwsel[0], din, wren[0], rden[0], q0, out[0]);
    i8253_counter c1(clk, din, wren[3] & cwsel[1], din, wren[1], rden[1], q1, out[1]);
    i8253_counter c2(clk, din, wren[3] & cwsel[2], din, wren[2], rden[2], q2, out[2]);

endmodule

module i8253_counter(
    input  wire        clk,     // whatever main clk
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
    logic [15:0] counter_load;

    // counter count
    logic [15:0] counter_q;

    // counter load value overwrite enable (from host)
    logic counter_wren_wr;

    /* study GATE for GATE-d systems, a gatelesss hack */
    wire counter_wren = ((cw_mode != M1 && cw_mode != M5) & counter_wren_wr);

    // let the counter auto-reload inself in modes M2,M2X,M3,M3X
    wire autoreload = (cw_mode[1:0] == M3) || (cw_mode[1:0] == M2);

    logic counter_loading;
    logic counter_loaded;
    logic loading_stopper;
    logic loading_msb;    // for rl=3: 0: next 8-bit value will be lsb, 1: msb
    logic counter_starting;

    // master, total, final grand enable
    wire counter_clock_enable = counter_loaded & !loading_stopper;

    i8253_downcount dctr(clk, counter_clock_enable, cw_mode[1:0] == M3, autoreload, out, counter_load, counter_wren, counter_q);

    // software stop by loading
    always @(counter_loading, cw_mode)
        loading_stopper <= (cw_mode == M0 || cw_mode == M4) & counter_loading;

    // latching command written: counter value latch enable
    wire read_latch_e = (cword[5:4] == 2'b00);

    // readhelper decides what to do with latching read, lsb/msb modes etc
    i8253_read rbus(clk, rden, rl_mode, cwset, read_latch_e, counter_q, dout);

    always @(posedge clk) begin
        if (cwset && cword[5:4] != 0) begin
            loading_msb     <= 0;   // reset the doorstopper
            counter_loaded  <= 0;
            counter_loading <= 0;
            cwreg           <= cword;

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
                    counter_load[7:0] <= d;
                    counter_starting <= 1;
                    counter_wren_wr <= 1;
                end
            2'b10: begin
                    counter_load[15:8] <= d;
                    counter_starting <= 1;
                    counter_wren_wr <= 1;
                end
            2'b11: begin
                    if (loading_msb) begin
                        counter_load[15:8] <= d;
                        counter_starting <= 1;
                        counter_loading <= 0;
                        counter_wren_wr <= ~counter_loaded;
                    end else begin
                        counter_load[7:0] <= d;
                        counter_loaded <= (cw_mode == M1 || // don't stop during reload in M2, M3
                                           cw_mode == M5 ||
                                           cw_mode[1] == 1) ? counter_loaded : 0;
                        counter_loading <= 1;
                    end

                    loading_msb <= ~loading_msb;
                end
            2'b00: ; // illegal state
            endcase
        end

        // reset counter_wren
        if (counter_wren)
            counter_wren_wr <= 0;

        // enable counting
        if (counter_starting) begin
            counter_loaded <= 1;
            counter_starting <= 0;
        end

        case (cw_mode)
        M0: begin
                if (counter_q == 16'd1) begin // 1 locks the counter so the terminal count is 0
                    // counter_loaded <= 0; -- not! the counter continues counting
                    out <= 1;
                end
            end

        M1: ;   // M1 NOT IMPLEMENTED: no gate, no reloads

        M2, M2X: begin
                // technically we should trigger/reload on 1
                // but we need to do this up front to be ready
                // by the next clk
                if (counter_q == 16'd2)
                    out <= 0;
                else
                    out <= 1;
            end

        M3, M3X: begin
                if (counter_q == 16'd2)
                    out <= ~out;
            end

        M4: begin
                if (counter_q == 16'd0)
                    out <= 0;
                else
                    out <= 1; // reset out on next cycle
            end

        M5: ; // M5 NOT IMPLEMENTED: no gate, just roll

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
    input  wire         clk,
    input  wire         rden,
    input  wire         cwset,
    input  wire         latch_e,
    input  wire   [1:0] rl_mode,
    input  wire  [15:0] counter_q,
    output logic  [7:0] q
);
    logic  [2:0] read_state;
    logic [15:0] latched_q;
    logic        read_msb;

    wire [7:0] r_lsb = rl_mode == 2'b10 ? counter_q[15:8] : counter_q[7:0];
    wire [7:0] r_msb = rl_mode == 2'b01 ? counter_q[7:0]  : counter_q[15:8];

    always_comb
        case (read_msb)
            0: q <= read_state == 0 ? r_lsb : latched_q[7:0];
            1: q <= read_state == 0 ? r_msb : latched_q[15:8];
        endcase

    always @(posedge clk)
        if (cwset && latch_e)
            latched_q <= counter_q;

    always @(posedge clk)
        if (cwset) begin
            read_msb <= 0;

            if (latch_e)
                read_state <= 2;
            else
                read_state <= 0;
        end else begin
            if (rden) begin
                case (read_state)
                    0: read_state <= 0;
                    1: read_state <= 0;
                    2: read_state <= 1;
                endcase

                read_msb <= ~read_msb;
            end
        end
endmodule

//
// Down counter with auto-reload.
//
module i8253_downcount(
    input  wire         clk,
    input  wire         halfmode,       // for square wave gen
    input  wire         autoreload,
    input  wire         o,              // current state of out for M3
    input  wire  [15:0] d,
    input  wire         wren,
    output logic [15:0] q
);
    wire decr = !halfmode ? 16'd1 :
                  q[0]==0 ? 16'd2 :
                        o ? 1 :
                            3;

    wire [15:0] next = q - decr;

    always @(posedge clk) begin
        if (wren | (autoreload & |next==0))
            q <= d;
        else
            q <= next;
    end

endmodule
