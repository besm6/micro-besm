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
    input  wire       clk,      // system clock
    input  wire       cs,       // chip select
    input  wire       rd,       // data read
    input  wire       wr,       // data write
    input  wire [1:0] a,        // address bus
    input  wire [7:0] idata,    // data input bus
    output wire [7:0] odata,    // data output bus
    input  wire       tclock0,  // clock for timer 0
    input  wire       tclock1,  // clock for timer 1
    input  wire       tclock2,  // clock for timer 2
    output wire       out0,     // timer 0 output
    output wire       out1,     // timer 1 output
    output wire       out2      // timer 2 output
);
    wire [7:0] q0, q1, q2;

    wire [3:0] sel = (a == 2'b00) ? 4'b0001 :
                     (a == 2'b01) ? 4'b0010 :
                     (a == 2'b10) ? 4'b0100 :
                                    4'b1000;

    wire [3:0] wren = {4{wr & cs}} & sel;
    wire [3:0] rden = {4{rd & cs}} & sel;

    wire [2:0] cwsel = (idata[7:6] == 2'b00) ? 3'b001 :
                       (idata[7:6] == 2'b01) ? 3'b010 :
                       (idata[7:6] == 2'b10) ? 3'b100 :
                                               3'b000;

    i8253_counter c0(clk, tclock0, wren[3] & cwsel[0], wren[0], rden[0], idata, q0, out0);
    i8253_counter c1(clk, tclock1, wren[3] & cwsel[1], wren[1], rden[1], idata, q1, out1);
    i8253_counter c2(clk, tclock2, wren[3] & cwsel[2], wren[2], rden[2], idata, q2, out2);

    assign odata = rden[0] ? q0 :
                   rden[1] ? q1 :
                   rden[2] ? q2 : 0;

endmodule

module i8253_counter(
    input  wire        clk,     // system clock
    input  wire        tclock,  // clock for time counter, slow
    input  wire        cwset,   // control word set
    input  wire        wren,    // data load enable
    input  wire        rden,    // data read enable
    input  wire  [7:0] idata,   // data in for load
    output logic [7:0] odata,   // read value
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

    // BCD decrement
    function [15:0] bcd_decr(input [15:0] v, input [1:0] decr);

        logic [15:0] r;
        logic        borrow;

        // First digit, least significant
        {borrow, r[3:0]} = {1'b0, v[3:0]} - decr;
        if (borrow)
            r[3:0] -= 6;

        // Second digit
        {borrow, r[7:4]} = {1'b0, v[7:4]} - borrow;
        if (borrow)
            r[7:4] = 9;

        // Third digit
        {borrow, r[11:8]} = {1'b0, v[11:8]} - borrow;
        if (borrow)
            r[11:8] = 9;

        // Fourth digit
        {borrow, r[15:12]} = {1'b0, v[15:12]} - borrow;
        if (borrow)
            r[15:12] = 9;

        return r;
    endfunction

    // control word breakdown
    logic [5:0] control_word;
    wire  [1:0] rl_mode  = control_word[5:4];
    wire  [2:0] cw_mode  = control_word[3:1];
    wire        bcd_mode = control_word[0];

    // counter load value
    logic [15:0] reload_value;

    // current counter value
    logic [15:0] counter;

    logic loading_msb;    // for rl=3: 0: next 8-bit value will be lsb, 1: msb
    logic overwrite_req;
    logic counting;

    //---------------------------------------------------------
    // Down counter with auto-reload.
    //

    // for square wave gen
    wire halfmode = (cw_mode[1:0] == M3);

    // let the counter auto-reload inself in modes M2,M2X,M3,M3X
    wire autoreload = (cw_mode[1:0] == M3 || cw_mode[1:0] == M2);

    // counter overwrite enable (from host)
    wire overwrite = (overwrite_req && cw_mode != M1 && cw_mode != M5);

    wire [15:0] decr = !halfmode ? 1 :  // all modes except M3
                   counter[0]==0 ? 2 :  // M3 even: step 2
                             out ? 1 :  // M3 odd, output 1: first step 1
                                   3;   // M3 odd, output 0: first step 3

    wire [15:0] next = bcd_mode ?
                       bcd_decr(counter, decr) :
                       counter - decr;

    always @(posedge tclock) begin
        // Update counter.
        if (overwrite | (autoreload & next==0)) begin
            counter <= reload_value;
            counting <= 1;
        end else if (counting)
            counter <= next;

        // Set output pin.
        if (overwrite)
            case (cw_mode)
            M0:      out <= 0; // interrupt, 1-time, start count on load or gate
            M1:      out <= 1; // programmable one-shot on gate rising edge; NOT IMPLEMENTED
            M2, M2X: out <= 1; // rate generator, start couting on load (or gate rising edge, not supported)
            M3, M3X: out <= 1; // square waveform generator
            M4:      out <= 1; // software trigger strobe
            M5:      out <= 1; // hardware trigger strobe (NOT IMPLEMENTED)
            default: out <= 1;
            endcase
        else
            case (cw_mode)
            M0: if (counter == 0)
                    out <= 1;

            M1: ; // NOT IMPLEMENTED: no gate, no reloads

            M2X,
            M2: // technically we should trigger/reload on 1
                // but we need to do this up front to be ready
                // by the next tclock
                if (counter == 1)
                    out <= 0;
                else
                    out <= 1;

            M3X,
            M3: if (counter == 2)
                    out <= ~out;

            M4: if (counter == 0)
                    out <= 0;
                else
                    out <= 1; // reset out on next cycle

            M5: ; // NOT IMPLEMENTED: no gate, just roll

            default: ;
            endcase

        // reset overwrite flag
        if (overwrite_req)
            overwrite_req <= 0;
    end

    //---------------------------------------------------------
    // Read dispatcher.
    //
    i8253_read rd(
        .clk        (clk),
        .rden       (rden),
        .cwset      (cwset),
        .latch_en   (idata[5:4] == 2'b00),
        .rl_mode    (rl_mode),
        .counter    (counter),
        .q          (odata)
    );

    always @(posedge clk) begin
        if (cwset && idata[5:4] != 0) begin
            control_word <= idata;
            loading_msb <= 0;
            counting <= 0;
        end

        // load
        if (wren) begin
            case (rl_mode)
            2'b01: begin
                    reload_value[7:0] <= idata;
                    overwrite_req <= 1;
                end
            2'b10: begin
                    reload_value[15:8] <= idata;
                    overwrite_req <= 1;
                end
            2'b11: begin
                    if (loading_msb) begin
                        loading_msb <= 0;
                        reload_value[15:8] <= idata;
                        overwrite_req <= ~counting;
                    end else begin
                        loading_msb <= 1;
                        reload_value[7:0] <= idata;
                        if (cw_mode == M0 || cw_mode == M4)
                            counting <= 0;
                    end
                end
            2'b00: ; // illegal state
            endcase
        end
    end
endmodule

//
// State-driven read dispatcher.
// Latched value is stored here.
// LSB/MSB read is decided upon here.
//
module i8253_read(
    input  wire        clk,         // system clock
    input  wire        rden,
    input  wire        cwset,
    input  wire        latch_en,    // latching command written: counter value latch enable
    input  wire  [1:0] rl_mode,
    input  wire [15:0] counter,
    output wire  [7:0] q
);
    logic  [2:0] read_state;
    logic [15:0] latch;
    logic        read_msb;
    logic        read_done;

    wire [7:0] r_lsb = (rl_mode == 2'b10) ? counter[15:8] : counter[7:0];
    wire [7:0] r_msb = (rl_mode == 2'b01) ? counter[7:0]  : counter[15:8];

    assign q = read_msb ?
        (read_state == 0) ? r_msb : latch[15:8] :
        (read_state == 0) ? r_lsb : latch[7:0];

    always @(posedge clk) begin
        if (cwset) begin
            if (latch_en)
                latch <= counter;

            read_msb <= 1;
            if (latch_en)
                read_state <= 2;
            else
                read_state <= 0;

        end else if (rden) begin
            if (!read_done) begin
                read_done <= 1;
                read_msb <= ~read_msb;

                case (read_state)
                    0: read_state <= 0;
                    1: read_state <= 0;
                    2: read_state <= 1;
                endcase
            end
        end else

        if (!rden)
            read_done <= 0;
    end
endmodule
