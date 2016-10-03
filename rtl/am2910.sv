module a2910(
	input  logic  [3:0] I,          // 2910 instruction
        input  logic        CCENbar,    // condition code enable input bit
        input  logic        CCbar,      // condition code input bit
        input  logic        RLDbar,     // R register load
        input  logic        CI,         // carry in
        input  logic        OEbar,      // tri-state driver
        input  logic        clk,        // clock
	input  logic [11:0] D,          // direct inputs
        output logic [11:0] Y,          // output instruction word
        output logic        PLbar,      //
        output logic        VECTbar,    //
        output logic        MAPbar,     //
        output logic        FULLbar     // stack full flag
);

//TODO

endmodule
