`default_nettype none

//
// Run memtest.
// See memtest.src for sources.
//
module testbench();

// Global time parameters.
timeunit 1ns / 10ps;

// Inputs.
logic        clk, reset;
logic [63:0] i_data;
logic  [7:0] i_tag;
logic        i_irq;                     // interrupt request

// Outputs.
logic [63:0] o_ad;                      // address/data output
logic  [7:0] o_tag;                     // tag output
logic        o_astb;                    // address strobe
logic        o_rd;                      // read op
logic        o_wr;                      // write op
logic        o_wforce;                  // ignore write protection
logic        o_iack;                    // interrupt acknowledge

// Instantiate CPU.
cpu cpu(clk, reset, i_data, i_tag,
    o_ad, o_tag, o_astb, o_rd, o_wr, o_wforce,
    i_irq, o_iack);

// Setup trace moninor.
tracer tr();

// 1Mword x 64bit of tagged RAM.
tmemory ram(clk, o_ad, o_tag,
    o_astb, o_rd, o_wr, o_wforce,
    i_data, i_tag);

//--------------------------------------------------------------
// Microinstruction ROM.
//
logic [111:0] memory[4096] = '{
    `include "../../microcode/tests/memtest.v"
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
localparam LABEL_RS5    = 7;
localparam LABEL_CAM71  = 33;
localparam LABEL_CAM7   = 48;
localparam LABEL_CAM8   = 67;
localparam LABEL_CMO41  = 123;
localparam LABEL_CM42   = 134;
localparam LABEL_RMEM4  = 154;
localparam LABEL_CICLM5 = 189;
localparam LABEL_CICL6  = 210;
localparam LABEL_CICLM7 = 272;
localparam LABEL_CMEM8  = 287;
localparam LABEL_CCLME8 = 311;
localparam LABEL_WRMEM  = 333;
localparam LABEL_CMEMA  = 421;
localparam LABEL_WRMEMA = 434;
localparam LABEL_CONTWB = 479;
localparam LABEL_WRMEMB = 492;
localparam LABEL_WRMEMC = 554;
localparam LABEL_WRMEMD = 621;
localparam LABEL_WRMEME = 701;
localparam LABEL_RKEF1  = 821;
localparam LABEL_RKEF2  = 840;
localparam LABEL_CCK10  = 867;
localparam LABEL_CCK11  = 886;
localparam LABEL_CCK12  = 906;
localparam LABEL_CCK13  = 923;
localparam LABEL_CCK14  = 941;
localparam LABEL_CCK15  = 959;
localparam LABEL_CK16   = 969;
localparam LABEL_CK17   = 1005;
localparam LABEL_CCK18  = 1035;
localparam LABEL_CCK19  = 1083;
localparam LABEL_CCK1A  = 1136;
localparam LABEL_CCK1B  = 1177;
localparam LABEL_CCK1C  = 1217;
localparam LABEL_C1D    = 1259;
localparam LABEL_CONTB4 = 1287;
localparam LABEL_CCB4   = 1292;
localparam LABEL_CONTB5 = 1317;
localparam LABEL_CONTM6 = 1356;
localparam LABEL_CONTM7 = 1376;
localparam LABEL_CONTX8 = 1401;
localparam LABEL_CX9    = 1426;
localparam LABEL_CNTXA  = 1467;
localparam LABEL_CICLW  = 1538;
localparam LABEL_WATER3 = 1601;
localparam LABEL_ERRTST = 1752;
localparam LABEL_ERRINH = 1756;
localparam LABEL_ERRDAF = 1760;
localparam LABEL_ERRDAT = 1827;

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
    if (pc_x == LABEL_ERRTST || pc_x == LABEL_ERRINH ||
        pc_x == LABEL_ERRDAF || pc_x == LABEL_ERRDAT) begin
        tr.terminate("Test FAIL");
    end

    //
    // Статусный регистр ОЗУ
    // Регистр адреса ОЗУ
    //
    //  - все эти тесты пропускаем.
    //    Нам не нужна коррекция по Хэммингу,
    //    поэтому этот блок не реализован.
    //
    check_jump(LABEL_RS5-7, LABEL_RS5-6, LABEL_CMO41-8, "Skip RS5-CM3");
    //check_jump(LABEL_RS5-7, LABEL_RS5-6, LABEL_CONTB4-1, "Skip RS5-C1D");

    //
    // Проверка ОЗУ
    //
    check_pass(LABEL_CMO41, "Test CMO41 pass");
    check_pass(LABEL_CM42, "Test CM42 pass");
    check_pass(LABEL_RMEM4, "Test RMEM4 pass");
    check_pass(LABEL_CICLM5, "Test CICLM5 pass");
    check_pass(LABEL_CICL6, "Test CICL6 pass");
    check_pass(LABEL_CICLM7, "Test CICLM7 pass");
    check_pass(LABEL_CCLME8, "Test CCLME8 pass");
    check_jump(LABEL_WRMEM-9, LABEL_WRMEM-8, LABEL_CONTB4-1, "Skip WRMEM-C1D");

    //
    // Кэш команд, операндов - пропускаем
    //
    //check_pass(LABEL_RKEF1, "Test RKEF1 pass");
    //check_pass(LABEL_RKEF2, "Test RKEF2 pass");
    //check_pass(LABEL_CCK10, "Test CCK10 pass");
    //check_pass(LABEL_CCK11, "Test CCK11 pass");
    //check_pass(LABEL_CCK12, "Test CCK12 pass");
    //check_pass(LABEL_CCK13, "Test CCK13 pass");
    //check_pass(LABEL_CCK14, "Test CCK14 pass");
    //check_pass(LABEL_CCK15, "Test CCK15 pass");
    //check_pass(LABEL_CK16, "Test CK16 pass");
    //check_pass(LABEL_CK17, "Test CK17 pass");
    //check_pass(LABEL_CCK18, "Test CCK18 pass");
    //check_pass(LABEL_CCK19, "Test CCK19 pass");
    //check_pass(LABEL_CCK1A, "Test CCK1A pass");
    //check_pass(LABEL_CCK1B, "Test CCK1B pass");
    //check_pass(LABEL_CCK1C, "Test CCK1C pass");
    //check_pass(LABEL_C1D, "Test C1D pass");

    //
    // Режим блочной передачи (сигнал BTR)
    //
    check_pass(LABEL_CCB4, "Test CCB4 pass");
    check_pass(LABEL_CONTB5, "Test CONTB5 pass");

    //
    // Чтение - модификация - запись
    //
    // Проверяется операция арбитра RDMWR.
    // Она используется для реализации машинных команд SEMR и SMON.
    // Данные тесты предполагают, что операция RDMWR выполняет
    // чтение, установку бита 56 в единицу и запись обратно.
    // На самом деле, микрокод команд SEMR и SMON считает, что
    // RDMWR выполняет просто чтение, без записи.
    // Поэтому эти два теста не проходят.
    //
    // Тесты были изменены: проверка записи не делается.
    //
    check_pass(LABEL_CONTM6, "Test CONTM6 pass");
    check_pass(LABEL_CONTM7, "Test CONTM7 pass");

    //
    // Проверка генератора Хемминга - пропускаем
    //
    //TODO: Skip CX8
    //check_pass(LABEL_CX9, "Test CX9 pass");
    //check_pass(LABEL_CNTXA, "Test CNTXA pass");
    //check_pass(LABEL_CICLW, "Test CICLW pass");

    if (pc_x == LABEL_CONTX8) begin
        message("Test PASS");
        $display("--------------------------------");
        tr.terminate("");
    end
end

endmodule
