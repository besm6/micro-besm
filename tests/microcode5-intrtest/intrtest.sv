`default_nettype none

//
// Run intrtest.
// See intrtest.mak.src for sources.
//
module testbench();

// Global time parameters.
timeunit 1ns / 10ps;

// Inputs.
logic        clk, reset;
logic [63:0] i_data;
logic  [7:0] i_tag;

// Outputs.
logic [63:0] o_ad;                      // address/data output
logic  [7:0] o_tag;                     // tag output
logic        o_astb;                    // address strobe
logic        o_atomic;                  // read-modify-write flag
logic        o_rd;                      // read op
logic        o_wr;                      // write op

// Instantiate CPU.
cpu cpu(clk, reset, i_data, i_tag,
    o_ad, o_tag, o_astb, o_atomic, o_rd, o_wr);

// Setup trace moninor.
tracer tr();

// 1Mword x 64bit of tagged RAM.
tmemory ram(clk, o_ad, o_tag,
    o_astb, o_atomic, o_rd, o_wr,
    i_data, i_tag);

//--------------------------------------------------------------
// Microinstruction ROM.
//
logic [111:0] memory[4096] = '{
    `include "../../microcode/tests/intrtest.v"
    default: '0
};

string tracefile = "output.trace";
int limit;
int trace;                              // Trace level
int tracefd;                            // Trace file descriptor
time ctime;                             // Current time
logic [11:0] pc_x;                      // Current PC address at execution stage
logic [112:1] opcode_x;                 // Current opcode at execution stage

//
// Generate clock 500MHz.
//
always #1 clk = ~clk;

//
// Main loop.
//
initial begin
    $display("");
    $display("--------------------------------");

    // Dump waveforms.
    if ($test$plusargs("dump")) begin
        $dumpfile("output.vcd");
        $dumpvars();
    end

    // Enable detailed instruction trace to file.
    trace = 2;
    $display("Generate trace file %0S", tracefile);
    tracefd = $fopen(tracefile, "w");

    // Limit the simulation by specified number of cycles.
    if (! $value$plusargs("limit=%d", limit)) begin
        // Default limit value.
        limit = 100000;
        $display("Limit: %0d", limit);
        $fdisplay(tracefd, "Limit: %0d", limit);
    end

    cpu.memory = memory;

    // Start with reset active
    clk = 1;
    reset = 1;

    // Hold reset for a while.
    #2 reset = 0;

    // Run until limit.
    tr.start();
    #limit tr.terminate("Time Limit Exceeded");
end

//
// Latch phys addresses for tracer
//
logic [19:0] fetch_paddr;               // physical address of last fetch
logic [19:0] mem_paddr;                 // physical address of last load/store
logic [19:0] mem_vaddr;                 // virtual address of last load/store

always @(cpu.o_rd, cpu.o_wr)
    if (cpu.o_wr)
        mem_paddr = ram.waddr;
    else if (cpu.o_rd) begin
        if (cpu.arb_opc == 8)
            fetch_paddr = ram.waddr;
        else
            mem_paddr = ram.waddr;
    end

assign mem_vaddr = cpu.vaddr[19:0];

//
// Print a message to stdout and trace file
//
task message(input string msg);
    $display("*** %s", msg);
    $fdisplay(tracefd, "(%0d) *** %s", ctime, msg);
endtask

//
// Print message when test passes the label.
//
task check_pass(input int label, input string msg);
    // Look for CONT operation with given address
    if (opcode_x[112:109] == 14 &&      // sqi: CONT
        opcode_x[96:95]   == 0 &&       // map: PE
        opcode_x[108:97]  == label)     // a: target address
        message(msg);
endtask

//
// Jump to a specified address.
//
task jump(input int target);
    tr.pc_x = target;
    cpu.control.uPC = target;
    cpu.opcode = cpu.memory[target];
    tr.opcode_x = cpu.opcode;
endtask

//
// Check for a jump from label `from' to label `to'.
// When jump detected, consider the test passed and
// go instead to the target address.
//
task check_jump(
    input int label_from,
    input int label_to,
    input int target,
    input string msg
);
    if (pc_x == label_from && tr.pc_f == label_to) begin
        message(msg);
        jump(target);
    end
endtask

//
// Loop a test for a while
//
task loop(
    input int maxcount,
    input int label,
    input string msg
);
    static int count = 0;

    if (opcode_x[112:109] == 14 &&      // sqi: CONT
        opcode_x[96:95]   == 0 &&       // map: PE
        opcode_x[108:97]  == label)     // a: target address
    begin
        count += 1;
        if (count < maxcount)
            jump(label);                // continue the test
        else begin
            message(msg);               // the test finished
            count = 0;
        end
    end
endtask

//
// Addresses of memtest.
//
localparam LABEL_CMEM1  = 1;
localparam LABEL_CONT1  = 110;
localparam LABEL_CC1    = 113;
localparam LABEL_BEGINT = 121;
localparam LABEL_ERRINT = 129;
localparam LABEL_CONT2  = 226;
localparam LABEL_CKL2   = 228;
localparam LABEL_CONT3  = 250;
localparam LABEL_CKL3   = 252;
localparam LABEL_CONT4  = 262;
localparam LABEL_CC4    = 265;
localparam LABEL_CONT5  = 277;
localparam LABEL_CC5    = 280;
localparam LABEL_CONT6  = 292;
localparam LABEL_CC6    = 294;
localparam LABEL_CONT7  = 304;
localparam LABEL_CC7    = 306;
localparam LABEL_CONT8  = 314;
localparam LABEL_CC8    = 316;
localparam LABEL_CONT9  = 324;
localparam LABEL_CC9    = 326;
localparam LABEL_CONT10 = 340;
localparam LABEL_CC10   = 342;
localparam LABEL_CONT11 = 352;
localparam LABEL_CC11   = 354;
localparam LABEL_CONT12 = 368;
localparam LABEL_CC12   = 370;
localparam LABEL_CONT14 = 380;
localparam LABEL_CC14   = 382;
localparam LABEL_CONT15 = 398;
localparam LABEL_CC15   = 400;
localparam LABEL_CONT16 = 431;
localparam LABEL_CC16   = 433;
localparam LABEL_CONT17 = 463;
localparam LABEL_CC17   = 465;
localparam LABEL_CONT18 = 493;
localparam LABEL_CC18   = 495;
localparam LABEL_CONT19 = 517;
localparam LABEL_CC19   = 519;
localparam LABEL_CONT20 = 543;
localparam LABEL_CC20   = 545;
localparam LABEL_CONT22 = 569;
localparam LABEL_CC22   = 571;
localparam LABEL_CONT24 = 595;
localparam LABEL_CC24   = 597;
localparam LABEL_CONT26 = 623;
localparam LABEL_CC26   = 625;
localparam LABEL_CONT27 = 645;
localparam LABEL_CC27   = 647;
localparam LABEL_CONT28 = 664;
localparam LABEL_CC28   = 667;
localparam LABEL_CONT29 = 691;
localparam LABEL_CC29   = 693;
localparam LABEL_CONT30 = 699;
localparam LABEL_CC30   = 701;
localparam LABEL_CONT31 = 720;
localparam LABEL_CC31   = 722;
localparam LABEL_CONT32 = 736;
localparam LABEL_CC32   = 738;
localparam LABEL_CLR12  = 863;
localparam LABEL_ERRTST = 869;
localparam LABEL_CTTSTP = 1085;

// Get time at the rising edge of the clock.
always @(posedge clk) begin
    ctime = $time;
    pc_x = tr.pc_x;
    opcode_x = tr.opcode_x;
end

// At negative clock edge, when all the signals are quiet,
// analyze the state of the processor.
always @(tr.instruction_retired) begin
    // In case of failure, the tests stop at label ERR*
    if (pc_x == LABEL_ERRTST || pc_x == LABEL_ERRINT) begin
        tr.terminate("Test FAIL");
    end

    check_jump(LABEL_CMEM1-1, LABEL_CMEM1, LABEL_CONT1, "Skip STPM1-STPM6");

    //
    // Прерывания
    //

    // int1 - "отсутствующий блок памяти"
    // Пишем число по адресу 0x40000, где в оригинальной МКБ-8601 память
    // отсутствовала. Должны получить прерывание.
    // Пропускаем этот тест, так как у нас все 8 мегабайт памяти присутствуют.
    //check_jump(LABEL_BEGINT-1, LABEL_CC1, LABEL_CONT2, "Test INT1 pass");
    check_jump(LABEL_CONT1+2, LABEL_CTTSTP, LABEL_CONT2, "Skip INT1");

    // int2 - "многократная ошибка"
    // Пишем число в память с неправильным кодом Хэмминга, потом читаем.
    // Должны получить прерывание.
    // Пропускаем этот тест, так как у нас код Хэмминга не используется.
    //check_jump(LABEL_CONT3-2, LABEL_CKL2, LABEL_CONT3, "Test INT2 pass");
    check_jump(LABEL_CONT2+2, LABEL_BEGINT, LABEL_CONT3, "Skip INT2");

    // int3 - "программная интерпретация тега операнда"
    check_jump(LABEL_CONT4-2, LABEL_CKL3, LABEL_CONT4, "Test INT3 pass");

    // int4 - "чужой сумматор": 2р.тега команды не равен 2р.тега сумматора (rg3)
    check_jump(LABEL_CONT5-2, LABEL_CC4, LABEL_CONT5, "Test INT4 pass");

    // int5 - "чужой операнд": 2р.тега операнда не равен 2р.тега сумматора (rg3)
    check_jump(LABEL_CONT6-2, LABEL_CC5, LABEL_CONT6, "Test INT5 pass");

    // int6 - "защита адреса при чтении"
    check_jump(LABEL_CONT7-2, LABEL_CC6, LABEL_CONT7, "Test INT6 pass");

    // int7 - "контроль команды": "0" в 1 разряде тега
    check_jump(LABEL_CONT8-2, LABEL_CC7, LABEL_CONT8, "Test INT7 pass");

    // int8 - "защита выборки команды": "1" в 5 разряде тега команды
    check_jump(LABEL_CONT9-2, LABEL_CC8, LABEL_CONT9, "Test INT8 pass");

    // int9 - "защита передачи управления": "1" в 6 разряде тега команды + ППУ
    check_jump(LABEL_CONT10-2, LABEL_CC9, LABEL_CONT10, "Test INT9 pass");

    // int10 - "программная интерпретация тега команды"
    check_jump(LABEL_CONT11-2, LABEL_CC10, LABEL_CONT11, "Test INT10 pass");

    // int11 - "защита адреса при записи"
    check_jump(LABEL_CONT12-2, LABEL_CC11, LABEL_CONT12, "Test INT11 pass");

    // int12,13 - "time-out" при обращении к ОЗУ и шине
    check_jump(LABEL_CONT14-2, LABEL_CC12, LABEL_CONT14, "Test INT12,13 pass");

    // int14 - "мат.адрес равен 0"
    check_jump(LABEL_CONT15-2, LABEL_CC14, LABEL_CONT15, "Test INT14 pass");

    // int15 - "чужой РП при чтении/записи операнда"
    check_jump(LABEL_CONT16-2, LABEL_CC15, LABEL_CONT16, "Test INT15 pass");

    // int16 - "чужой РП при выборке команды"
    check_jump(LABEL_CONT17-2, LABEL_CC16, LABEL_CONT17, "Test INT16 pass");

    // int17 - "защита страницы при обращении"
    check_jump(LABEL_CONT18-2, LABEL_CC17, LABEL_CONT18, "Test INT17 pass");

    // int18 - "защита страницы при записи"
    check_jump(LABEL_CONT19-2, LABEL_CC18, LABEL_CONT19, "Test INT18 pass");

    // int19 - "отрицательный номер страницы у команды"
    check_jump(LABEL_CONT20-2, LABEL_CC19, LABEL_CONT20, "Test INT19 pass");

    // int20 - "отрицательный номер страницы у операнда"
    check_jump(LABEL_CONT22-2, LABEL_CC20, LABEL_CONT22, "Test INT20 pass");

    // int22 - "отсутствующий адрес памяти в новом режиме"
    check_jump(LABEL_CONT24-2, LABEL_CC22, LABEL_CONT24, "Test INT22 pass");

    // int24 - "запрос модификации приоритетов страниц"
    check_jump(LABEL_CONT26-2, LABEL_CC24, LABEL_CONT26, "Test INT24 pass");

    // int26 - прерывания от таймера счетного времени
    check_jump(LABEL_CONT27-2, LABEL_CC26, LABEL_CONT27, "Test INT26 pass");

    // int27 - "time-out при блокировке внешних прерываний"
    check_jump(LABEL_CONT28-2, LABEL_CC27, LABEL_CONT28, "Test INT27 pass");

    // int28  - "обращение ПП на чт/зп регистров"
    check_jump(LABEL_CONT29-2, LABEL_CC28, LABEL_CONT29, "Test INT28 pass");

    // int29 - "шаговое прерывание"
    check_jump(LABEL_CONT30-2, LABEL_CC29, LABEL_CONT30, "Test INT29 pass");

    // int30 - "внешние прерывания"
    check_jump(LABEL_CONT31-2, LABEL_CC30, LABEL_CONT31, "Test INT30 pass");

    // int31 - "программное прерывание"
    check_jump(LABEL_CONT32-2, LABEL_CC31, LABEL_CONT32, "Test INT31 pass");

    // int32 - "программная интерпретация тега операнда"
    check_jump(LABEL_CLR12+1, LABEL_CC32, LABEL_CC32, "Test INT32 pass");

    if (pc_x == LABEL_CLR12+1) begin
        message("Test PASS");
        $display("--------------------------------");
        tr.terminate("");
    end
end

endmodule
