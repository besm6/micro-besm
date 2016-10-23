//
// Generate test vectors.
//
module gen();

    // Inputs.
    logic        clk;
    logic [63:0] word;          // instruction word
    logic        pe;            // besm6 compatibility
    logic        tkk;           // right half

    // Outputs.
    logic  [3:0] ir;            // modifier index
    logic  [7:0] op;            // opcode
    logic        extop;         // extended opcode flag
    logic [19:0] addr;          // address

    decoder dut(clk, word, pe, tkk,
        ir, op, extop, addr);

    logic [63:0] testset[1000];
    int nwords;
    int fd;

    //
    // Return true when the word is already present in testset[].
    //
    function bit in_testset(logic [63:0] data);
        for (int n=0; n<nwords; n+=1)
            if (data == testset[n])
                return 1;
        return 0;
    endfunction

    //
    // Run tests for the given input values.
    //
    task check(logic [63:0] data, logic besm6_mode, logic right_half);
        word = data;
        pe = besm6_mode;
        tkk = right_half;
        #1;
        $fdisplay(fd, "%h:%h:%h:%h:%h:%h:%h:",
            word, pe, tkk, ir, op, extop, addr);
        #1;
    endtask

initial begin
    $display("Generate test vectors for micro-BESM instruction decoder.");

    //
    // Generate test words.
    //
    nwords = 0;
    for (int n=0; n<64; n+=1) begin
        // Running 1
        word = 64'd1 << n;
        testset[nwords] = word;
        nwords += 1;
    end
    for (int n=0; n<64; n+=1) begin
        // Running 0
        word = ~(64'd1 << n);
        testset[nwords] = word;
        nwords += 1;
    end

    // Add bit 31
    for (int n=0; n<64; n+=1) begin
        word = testset[n];
        word[31] = 1;
        if (!in_testset(word)) begin
            testset[nwords] = word;
            nwords += 1;
        end
    end

    // Add bit 55
    for (int n=0; n<64; n+=1) begin
        word = testset[n];
        word[55] = 1;
        if (!in_testset(word)) begin
            testset[nwords] = word;
            nwords += 1;
        end
    end

    // Add 'h3f
    for (int n=0; n<128; n+=1) begin
        word = testset[n];
        word[27:20] = 8'h3f;
        if (!in_testset(word)) begin
            testset[nwords] = word;
            nwords += 1;
        end
        word = testset[n];
        word[59:52] = 8'h3f;
        if (!in_testset(word)) begin
            testset[nwords] = word;
            nwords += 1;
        end
    end

    //
    // Run tests.
    //
    fd = $fopen("test_vectors.bits", "w");
    $fdisplay(fd, "***************************************************");
    $fdisplay(fd, "* Test vectors for micro-BESM instruction decoder *");
    $fdisplay(fd, "***************************************************");
    $fdisplay(fd, "word:pe:tkk:ir:op:extop:addr:");
    $fdisplay(fd, "in:in:in:out:out:out:out:");
    $fdisplay(fd, "h:':':h:h:':h:");

    for (int n=0; n<nwords; n+=1) begin
        check(testset[n], 0, 0);
        check(testset[n], 0, 1);
        check(testset[n], 1, 0);
        check(testset[n], 1, 1);
    end
    $fclose(fd);

    $finish;
end

endmodule
