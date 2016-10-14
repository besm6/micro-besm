module testbench();

    // Input signals
    logic  [3:0] I;
    logic [11:0] D;
    logic        CCENbar, CCbar, RLDbar, CI, OEbar, clk;

    // Output signals
    logic [11:0] Y;
    logic        PLbar, VECTbar,  MAPbar, FULLbar;

    // Device under test
    am2910 dut (
        clk, I, CCENbar, CCbar, RLDbar, CI, OEbar, D,
        Y, PLbar, VECTbar, MAPbar, FULLbar
    );

    // Status
    bit fail;

    // Read value from the variable.
    task verify(input check, input string message);
        if (!check) begin
            $display ("%s", message);
            fail = 1;
        end
    endtask

initial begin
$display("------------------------");
fail = 0;

// **************************
// *                        *
// * TEST VECTORS FOR STACK *
// *                        *
// **************************
// *********** PAIRS TESTING PUSH AND POP ************
// ******* PUSH ( I = 1) & POP ( I = 8 ) & OTHER CONDITIONS ***********
// ** LOAD R **
//------------------------

clk <= 1;		// Cycle No: 0
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ** Y = D **
//------------------------

clk <= 1;		// Cycle No: 1
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ** PUSH **
//------------------------

clk <= 1;		// Cycle No: 2
#1;

I <= 'b0001;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK **
//------------------------

clk <= 1;		// Cycle No: 3
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 0 : < Y !== 'b000000000000 >");	// Vector No: 0
verify(FULLbar === 1, "Assert 1 : < FULLbar !== 1 >");
#1;

// ** Y = D **
//------------------------

clk <= 1;		// Cycle No: 4
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** PUSH **
//------------------------

clk <= 1;		// Cycle No: 5
#1;

I <= 'b0001;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK **
//------------------------

clk <= 1;		// Cycle No: 6
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 2 : < Y !== 'b111111111111 >");	// Vector No: 1
verify(FULLbar === 1, "Assert 3 : < FULLbar !== 1 >");
#1;

// **************************************************
// ** LOAD R **
//------------------------

clk <= 1;		// Cycle No: 7
#1;

I <= 'b1110;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK
//------------------------

clk <= 1;		// Cycle No: 8
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 4 : < Y !== 'b111111111111 >");	// Vector No: 2
verify(FULLbar === 1, "Assert 5 : < FULLbar !== 1 >");
#1;

// ** POP **
//------------------------

clk <= 1;		// Cycle No: 9
#1;

I <= 'b1000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(FULLbar === 1, "Assert 6 : < FULLbar !== 1 >");	// Vector No: 3
#1;

// ** Y = TOP OF STACK
//------------------------

clk <= 1;		// Cycle No: 10
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 7 : < Y !== 'b000000000000 >");	// Vector No: 4
verify(FULLbar === 1, "Assert 8 : < FULLbar !== 1 >");
#1;

// **************************************************
// **************************************************
// ******* PUSH ( I = 1) & POP ( I = 8 ) & OTHER CONDITIONS ***********
// ** LOAD R **
//------------------------

clk <= 1;		// Cycle No: 11
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** Y = D **
//------------------------

clk <= 1;		// Cycle No: 12
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ** PUSH **
//------------------------

clk <= 1;		// Cycle No: 13
#1;

I <= 'b0001;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK **
//------------------------

clk <= 1;		// Cycle No: 14
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 9 : < Y !== 'b000000000000 >");	// Vector No: 5
verify(FULLbar === 1, "Assert 10 : < FULLbar !== 1 >");
#1;

// ** Y = D **
//------------------------

clk <= 1;		// Cycle No: 15
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** PUSH **
//------------------------

clk <= 1;		// Cycle No: 16
#1;

I <= 'b0001;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK **
//------------------------

clk <= 1;		// Cycle No: 17
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 11 : < Y !== 'b111111111111 >");	// Vector No: 6
verify(FULLbar === 1, "Assert 12 : < FULLbar !== 1 >");
#1;

// **************************************************
// ** LOAD R **
//------------------------

clk <= 1;		// Cycle No: 18
#1;

I <= 'b1110;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK
//------------------------

clk <= 1;		// Cycle No: 19
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 13 : < Y !== 'b111111111111 >");	// Vector No: 7
verify(FULLbar === 1, "Assert 14 : < FULLbar !== 1 >");
#1;

// ** POP **
//------------------------

clk <= 1;		// Cycle No: 20
#1;

I <= 'b1000;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(FULLbar === 1, "Assert 15 : < FULLbar !== 1 >");	// Vector No: 8
#1;

// ** Y = TOP OF STACK
//------------------------

clk <= 1;		// Cycle No: 21
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 16 : < Y !== 'b000000000000 >");	// Vector No: 9
verify(FULLbar === 1, "Assert 17 : < FULLbar !== 1 >");
#1;

// **************************************************
// **************************************************
// ******* PUSH ( I = 1) & POP ( I = 8 ) & OTHER CONDITIONS ***********
// ** LOAD R **
//------------------------

clk <= 1;		// Cycle No: 22
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ** Y = D **
//------------------------

clk <= 1;		// Cycle No: 23
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ** PUSH **
//------------------------

clk <= 1;		// Cycle No: 24
#1;

I <= 'b0001;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK **
//------------------------

clk <= 1;		// Cycle No: 25
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 18 : < Y !== 'b000000000000 >");	// Vector No: 10
verify(FULLbar === 1, "Assert 19 : < FULLbar !== 1 >");
#1;

// ** Y = D **
//------------------------

clk <= 1;		// Cycle No: 26
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** PUSH **
//------------------------

clk <= 1;		// Cycle No: 27
#1;

I <= 'b0001;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK **
//------------------------

clk <= 1;		// Cycle No: 28
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 20 : < Y !== 'b111111111111 >");	// Vector No: 11
verify(FULLbar === 1, "Assert 21 : < FULLbar !== 1 >");
#1;

// **************************************************
// ** LOAD R **
//------------------------

clk <= 1;		// Cycle No: 29
#1;

I <= 'b1110;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK
//------------------------

clk <= 1;		// Cycle No: 30
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 22 : < Y !== 'b111111111111 >");	// Vector No: 12
verify(FULLbar === 1, "Assert 23 : < FULLbar !== 1 >");
#1;

// ** POP **
//------------------------

clk <= 1;		// Cycle No: 31
#1;

I <= 'b1000;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(FULLbar === 1, "Assert 24 : < FULLbar !== 1 >");	// Vector No: 13
#1;

// ** Y = TOP OF STACK
//------------------------

clk <= 1;		// Cycle No: 32
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 25 : < Y !== 'b000000000000 >");	// Vector No: 14
verify(FULLbar === 1, "Assert 26 : < FULLbar !== 1 >");
#1;

// **************************************************
// **************************************************
// ******* PUSH ( I = 1) & POP ( I = 8 ) & OTHER CONDITIONS ***********
// ** LOAD R **
//------------------------

clk <= 1;		// Cycle No: 33
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** Y = D **
//------------------------

clk <= 1;		// Cycle No: 34
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ** PUSH **
//------------------------

clk <= 1;		// Cycle No: 35
#1;

I <= 'b0001;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK **
//------------------------

clk <= 1;		// Cycle No: 36
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 27 : < Y !== 'b000000000000 >");	// Vector No: 15
verify(FULLbar === 1, "Assert 28 : < FULLbar !== 1 >");
#1;

// ** Y = D **
//------------------------

clk <= 1;		// Cycle No: 37
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** PUSH **
//------------------------

clk <= 1;		// Cycle No: 38
#1;

I <= 'b0001;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK **
//------------------------

clk <= 1;		// Cycle No: 39
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 29 : < Y !== 'b111111111111 >");	// Vector No: 16
verify(FULLbar === 1, "Assert 30 : < FULLbar !== 1 >");
#1;

// **************************************************
// ** LOAD R **
//------------------------

clk <= 1;		// Cycle No: 40
#1;

I <= 'b1110;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK
//------------------------

clk <= 1;		// Cycle No: 41
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 31 : < Y !== 'b111111111111 >");	// Vector No: 17
verify(FULLbar === 1, "Assert 32 : < FULLbar !== 1 >");
#1;

// ** POP **
//------------------------

clk <= 1;		// Cycle No: 42
#1;

I <= 'b1000;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(FULLbar === 1, "Assert 33 : < FULLbar !== 1 >");	// Vector No: 18
#1;

// ** Y = TOP OF STACK
//------------------------

clk <= 1;		// Cycle No: 43
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 34 : < Y !== 'b000000000000 >");	// Vector No: 19
verify(FULLbar === 1, "Assert 35 : < FULLbar !== 1 >");
#1;

// **************************************************
// **************************************************
// ******* PUSH ( I = 1) & POP ( I = 10 ) & OTHER CONDITIONS ***********
// ** LOAD R **
//------------------------

clk <= 1;		// Cycle No: 44
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ** Y = D **
//------------------------

clk <= 1;		// Cycle No: 45
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ** PUSH **
//------------------------

clk <= 1;		// Cycle No: 46
#1;

I <= 'b0001;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK **
//------------------------

clk <= 1;		// Cycle No: 47
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 36 : < Y !== 'b000000000000 >");	// Vector No: 20
verify(FULLbar === 1, "Assert 37 : < FULLbar !== 1 >");
#1;

// ** Y = D **
//------------------------

clk <= 1;		// Cycle No: 48
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** PUSH **
//------------------------

clk <= 1;		// Cycle No: 49
#1;

I <= 'b0001;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK **
//------------------------

clk <= 1;		// Cycle No: 50
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 38 : < Y !== 'b111111111111 >");	// Vector No: 21
verify(FULLbar === 1, "Assert 39 : < FULLbar !== 1 >");
#1;

// **************************************************
// ** LOAD R **
//------------------------

clk <= 1;		// Cycle No: 51
#1;

I <= 'b1110;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK
//------------------------

clk <= 1;		// Cycle No: 52
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 40 : < Y !== 'b111111111111 >");	// Vector No: 22
verify(FULLbar === 1, "Assert 41 : < FULLbar !== 1 >");
#1;

// ** POP **
//------------------------

clk <= 1;		// Cycle No: 53
#1;

I <= 'b1010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(FULLbar === 1, "Assert 42 : < FULLbar !== 1 >");	// Vector No: 23
#1;

// ** Y = TOP OF STACK
//------------------------

clk <= 1;		// Cycle No: 54
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 43 : < Y !== 'b000000000000 >");	// Vector No: 24
verify(FULLbar === 1, "Assert 44 : < FULLbar !== 1 >");
#1;

// **************************************************
// **************************************************
// ******* PUSH ( I = 1) & POP ( I = 10 ) & OTHER CONDITIONS ***********
// ** LOAD R **
//------------------------

clk <= 1;		// Cycle No: 55
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** Y = D **
//------------------------

clk <= 1;		// Cycle No: 56
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ** PUSH **
//------------------------

clk <= 1;		// Cycle No: 57
#1;

I <= 'b0001;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK **
//------------------------

clk <= 1;		// Cycle No: 58
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 45 : < Y !== 'b000000000000 >");	// Vector No: 25
verify(FULLbar === 1, "Assert 46 : < FULLbar !== 1 >");
#1;

// ** Y = D **
//------------------------

clk <= 1;		// Cycle No: 59
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** PUSH **
//------------------------

clk <= 1;		// Cycle No: 60
#1;

I <= 'b0001;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK **
//------------------------

clk <= 1;		// Cycle No: 61
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 47 : < Y !== 'b111111111111 >");	// Vector No: 26
verify(FULLbar === 1, "Assert 48 : < FULLbar !== 1 >");
#1;

// **************************************************
// ** LOAD R **
//------------------------

clk <= 1;		// Cycle No: 62
#1;

I <= 'b1110;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK
//------------------------

clk <= 1;		// Cycle No: 63
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 49 : < Y !== 'b111111111111 >");	// Vector No: 27
verify(FULLbar === 1, "Assert 50 : < FULLbar !== 1 >");
#1;

// ** POP **
//------------------------

clk <= 1;		// Cycle No: 64
#1;

I <= 'b1010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(FULLbar === 1, "Assert 51 : < FULLbar !== 1 >");	// Vector No: 28
#1;

// ** Y = TOP OF STACK
//------------------------

clk <= 1;		// Cycle No: 65
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 52 : < Y !== 'b000000000000 >");	// Vector No: 29
verify(FULLbar === 1, "Assert 53 : < FULLbar !== 1 >");
#1;

// **************************************************
// **************************************************
// ******* PUSH ( I = 4) & POP ( I = 10 ) & OTHER CONDITIONS ***********
// ** LOAD R **
//------------------------

clk <= 1;		// Cycle No: 66
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ** Y = D **
//------------------------

clk <= 1;		// Cycle No: 67
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ** PUSH **
//------------------------

clk <= 1;		// Cycle No: 68
#1;

I <= 'b0100;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK **
//------------------------

clk <= 1;		// Cycle No: 69
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 54 : < Y !== 'b000000000000 >");	// Vector No: 30
verify(FULLbar === 1, "Assert 55 : < FULLbar !== 1 >");
#1;

// ** Y = D **
//------------------------

clk <= 1;		// Cycle No: 70
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** PUSH **
//------------------------

clk <= 1;		// Cycle No: 71
#1;

I <= 'b0100;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK **
//------------------------

clk <= 1;		// Cycle No: 72
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 56 : < Y !== 'b111111111111 >");	// Vector No: 31
verify(FULLbar === 1, "Assert 57 : < FULLbar !== 1 >");
#1;

// **************************************************
// ** LOAD R **
//------------------------

clk <= 1;		// Cycle No: 73
#1;

I <= 'b1110;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK
//------------------------

clk <= 1;		// Cycle No: 74
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 58 : < Y !== 'b111111111111 >");	// Vector No: 32
verify(FULLbar === 1, "Assert 59 : < FULLbar !== 1 >");
#1;

// ** POP **
//------------------------

clk <= 1;		// Cycle No: 75
#1;

I <= 'b1010;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(FULLbar === 1, "Assert 60 : < FULLbar !== 1 >");	// Vector No: 33
#1;

// ** Y = TOP OF STACK
//------------------------

clk <= 1;		// Cycle No: 76
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 61 : < Y !== 'b000000000000 >");	// Vector No: 34
verify(FULLbar === 1, "Assert 62 : < FULLbar !== 1 >");
#1;

// **************************************************
// **************************************************
// ******* PUSH ( I = 4) & POP ( I = 10 ) & OTHER CONDITIONS ***********
// ** LOAD R **
//------------------------

clk <= 1;		// Cycle No: 77
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** Y = D **
//------------------------

clk <= 1;		// Cycle No: 78
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ** PUSH **
//------------------------

clk <= 1;		// Cycle No: 79
#1;

I <= 'b0100;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK **
//------------------------

clk <= 1;		// Cycle No: 80
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 63 : < Y !== 'b000000000000 >");	// Vector No: 35
verify(FULLbar === 1, "Assert 64 : < FULLbar !== 1 >");
#1;

// ** Y = D **
//------------------------

clk <= 1;		// Cycle No: 81
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** PUSH **
//------------------------

clk <= 1;		// Cycle No: 82
#1;

I <= 'b0100;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK **
//------------------------

clk <= 1;		// Cycle No: 83
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 65 : < Y !== 'b111111111111 >");	// Vector No: 36
verify(FULLbar === 1, "Assert 66 : < FULLbar !== 1 >");
#1;

// **************************************************
// ** LOAD R **
//------------------------

clk <= 1;		// Cycle No: 84
#1;

I <= 'b1110;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK
//------------------------

clk <= 1;		// Cycle No: 85
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 67 : < Y !== 'b111111111111 >");	// Vector No: 37
verify(FULLbar === 1, "Assert 68 : < FULLbar !== 1 >");
#1;

// ** POP **
//------------------------

clk <= 1;		// Cycle No: 86
#1;

I <= 'b1010;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(FULLbar === 1, "Assert 69 : < FULLbar !== 1 >");	// Vector No: 38
#1;

// ** Y = TOP OF STACK
//------------------------

clk <= 1;		// Cycle No: 87
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 70 : < Y !== 'b000000000000 >");	// Vector No: 39
verify(FULLbar === 1, "Assert 71 : < FULLbar !== 1 >");
#1;

// **************************************************
// **************************************************
// ******* PUSH ( I = 4) & POP ( I = 10 ) & OTHER CONDITIONS ***********
// ** LOAD R **
//------------------------

clk <= 1;		// Cycle No: 88
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ** Y = D **
//------------------------

clk <= 1;		// Cycle No: 89
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ** PUSH **
//------------------------

clk <= 1;		// Cycle No: 90
#1;

I <= 'b0100;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK **
//------------------------

clk <= 1;		// Cycle No: 91
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 72 : < Y !== 'b000000000000 >");	// Vector No: 40
verify(FULLbar === 1, "Assert 73 : < FULLbar !== 1 >");
#1;

// ** Y = D **
//------------------------

clk <= 1;		// Cycle No: 92
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** PUSH **
//------------------------

clk <= 1;		// Cycle No: 93
#1;

I <= 'b0100;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK **
//------------------------

clk <= 1;		// Cycle No: 94
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 74 : < Y !== 'b111111111111 >");	// Vector No: 41
verify(FULLbar === 1, "Assert 75 : < FULLbar !== 1 >");
#1;

// **************************************************
// ** LOAD R **
//------------------------

clk <= 1;		// Cycle No: 95
#1;

I <= 'b1110;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK
//------------------------

clk <= 1;		// Cycle No: 96
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 76 : < Y !== 'b111111111111 >");	// Vector No: 42
verify(FULLbar === 1, "Assert 77 : < FULLbar !== 1 >");
#1;

// ** POP **
//------------------------

clk <= 1;		// Cycle No: 97
#1;

I <= 'b1010;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(FULLbar === 1, "Assert 78 : < FULLbar !== 1 >");	// Vector No: 43
#1;

// ** Y = TOP OF STACK
//------------------------

clk <= 1;		// Cycle No: 98
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 79 : < Y !== 'b000000000000 >");	// Vector No: 44
verify(FULLbar === 1, "Assert 80 : < FULLbar !== 1 >");
#1;

// **************************************************
// **************************************************
// ******* PUSH ( I = 4) & POP ( I = 10 ) & OTHER CONDITIONS ***********
// ** LOAD R **
//------------------------

clk <= 1;		// Cycle No: 99
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** Y = D **
//------------------------

clk <= 1;		// Cycle No: 100
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ** PUSH **
//------------------------

clk <= 1;		// Cycle No: 101
#1;

I <= 'b0100;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK **
//------------------------

clk <= 1;		// Cycle No: 102
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 81 : < Y !== 'b000000000000 >");	// Vector No: 45
verify(FULLbar === 1, "Assert 82 : < FULLbar !== 1 >");
#1;

// ** Y = D **
//------------------------

clk <= 1;		// Cycle No: 103
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** PUSH **
//------------------------

clk <= 1;		// Cycle No: 104
#1;

I <= 'b0100;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK **
//------------------------

clk <= 1;		// Cycle No: 105
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 83 : < Y !== 'b111111111111 >");	// Vector No: 46
verify(FULLbar === 1, "Assert 84 : < FULLbar !== 1 >");
#1;

// **************************************************
// ** LOAD R **
//------------------------

clk <= 1;		// Cycle No: 106
#1;

I <= 'b1110;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK
//------------------------

clk <= 1;		// Cycle No: 107
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 85 : < Y !== 'b111111111111 >");	// Vector No: 47
verify(FULLbar === 1, "Assert 86 : < FULLbar !== 1 >");
#1;

// ** POP **
//------------------------

clk <= 1;		// Cycle No: 108
#1;

I <= 'b1010;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(FULLbar === 1, "Assert 87 : < FULLbar !== 1 >");	// Vector No: 48
#1;

// ** Y = TOP OF STACK
//------------------------

clk <= 1;		// Cycle No: 109
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 88 : < Y !== 'b000000000000 >");	// Vector No: 49
verify(FULLbar === 1, "Assert 89 : < FULLbar !== 1 >");
#1;

// **************************************************
// **************************************************
// ******* PUSH ( I = 4) & POP ( I = 11 ) & OTHER CONDITIONS ***********
// ** LOAD R **
//------------------------

clk <= 1;		// Cycle No: 110
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ** Y = D **
//------------------------

clk <= 1;		// Cycle No: 111
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ** PUSH **
//------------------------

clk <= 1;		// Cycle No: 112
#1;

I <= 'b0100;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK **
//------------------------

clk <= 1;		// Cycle No: 113
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 90 : < Y !== 'b000000000000 >");	// Vector No: 50
verify(FULLbar === 1, "Assert 91 : < FULLbar !== 1 >");
#1;

// ** Y = D **
//------------------------

clk <= 1;		// Cycle No: 114
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** PUSH **
//------------------------

clk <= 1;		// Cycle No: 115
#1;

I <= 'b0100;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK **
//------------------------

clk <= 1;		// Cycle No: 116
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 92 : < Y !== 'b111111111111 >");	// Vector No: 51
verify(FULLbar === 1, "Assert 93 : < FULLbar !== 1 >");
#1;

// **************************************************
// ** LOAD R **
//------------------------

clk <= 1;		// Cycle No: 117
#1;

I <= 'b1110;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK
//------------------------

clk <= 1;		// Cycle No: 118
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 94 : < Y !== 'b111111111111 >");	// Vector No: 52
verify(FULLbar === 1, "Assert 95 : < FULLbar !== 1 >");
#1;

// ** POP **
//------------------------

clk <= 1;		// Cycle No: 119
#1;

I <= 'b1011;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(FULLbar === 1, "Assert 96 : < FULLbar !== 1 >");	// Vector No: 53
#1;

// ** Y = TOP OF STACK
//------------------------

clk <= 1;		// Cycle No: 120
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 97 : < Y !== 'b000000000000 >");	// Vector No: 54
verify(FULLbar === 1, "Assert 98 : < FULLbar !== 1 >");
#1;

// **************************************************
// **************************************************
// ******* PUSH ( I = 4) & POP ( I = 11 ) & OTHER CONDITIONS ***********
// ** LOAD R **
//------------------------

clk <= 1;		// Cycle No: 121
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** Y = D **
//------------------------

clk <= 1;		// Cycle No: 122
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ** PUSH **
//------------------------

clk <= 1;		// Cycle No: 123
#1;

I <= 'b0100;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK **
//------------------------

clk <= 1;		// Cycle No: 124
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 99 : < Y !== 'b000000000000 >");	// Vector No: 55
verify(FULLbar === 1, "Assert 100 : < FULLbar !== 1 >");
#1;

// ** Y = D **
//------------------------

clk <= 1;		// Cycle No: 125
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** PUSH **
//------------------------

clk <= 1;		// Cycle No: 126
#1;

I <= 'b0100;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK **
//------------------------

clk <= 1;		// Cycle No: 127
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 101 : < Y !== 'b111111111111 >");	// Vector No: 56
verify(FULLbar === 1, "Assert 102 : < FULLbar !== 1 >");
#1;

// **************************************************
// ** LOAD R **
//------------------------

clk <= 1;		// Cycle No: 128
#1;

I <= 'b1110;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK
//------------------------

clk <= 1;		// Cycle No: 129
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 103 : < Y !== 'b111111111111 >");	// Vector No: 57
verify(FULLbar === 1, "Assert 104 : < FULLbar !== 1 >");
#1;

// ** POP **
//------------------------

clk <= 1;		// Cycle No: 130
#1;

I <= 'b1011;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(FULLbar === 1, "Assert 105 : < FULLbar !== 1 >");	// Vector No: 58
#1;

// ** Y = TOP OF STACK
//------------------------

clk <= 1;		// Cycle No: 131
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 106 : < Y !== 'b000000000000 >");	// Vector No: 59
verify(FULLbar === 1, "Assert 107 : < FULLbar !== 1 >");
#1;

// **************************************************
// **************************************************
// ******* PUSH ( I = 4) & POP ( I = 11 ) & OTHER CONDITIONS ***********
// ** LOAD R **
//------------------------

clk <= 1;		// Cycle No: 132
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ** Y = D **
//------------------------

clk <= 1;		// Cycle No: 133
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ** PUSH **
//------------------------

clk <= 1;		// Cycle No: 134
#1;

I <= 'b0100;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK **
//------------------------

clk <= 1;		// Cycle No: 135
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 108 : < Y !== 'b000000000000 >");	// Vector No: 60
verify(FULLbar === 1, "Assert 109 : < FULLbar !== 1 >");
#1;

// ** Y = D **
//------------------------

clk <= 1;		// Cycle No: 136
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** PUSH **
//------------------------

clk <= 1;		// Cycle No: 137
#1;

I <= 'b0100;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK **
//------------------------

clk <= 1;		// Cycle No: 138
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 110 : < Y !== 'b111111111111 >");	// Vector No: 61
verify(FULLbar === 1, "Assert 111 : < FULLbar !== 1 >");
#1;

// **************************************************
// ** LOAD R **
//------------------------

clk <= 1;		// Cycle No: 139
#1;

I <= 'b1110;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK
//------------------------

clk <= 1;		// Cycle No: 140
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 112 : < Y !== 'b111111111111 >");	// Vector No: 62
verify(FULLbar === 1, "Assert 113 : < FULLbar !== 1 >");
#1;

// ** POP **
//------------------------

clk <= 1;		// Cycle No: 141
#1;

I <= 'b1011;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(FULLbar === 1, "Assert 114 : < FULLbar !== 1 >");	// Vector No: 63
#1;

// ** Y = TOP OF STACK
//------------------------

clk <= 1;		// Cycle No: 142
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 115 : < Y !== 'b000000000000 >");	// Vector No: 64
verify(FULLbar === 1, "Assert 116 : < FULLbar !== 1 >");
#1;

// **************************************************
// **************************************************
// ******* PUSH ( I = 4) & POP ( I = 11 ) & OTHER CONDITIONS ***********
// ** LOAD R **
//------------------------

clk <= 1;		// Cycle No: 143
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** Y = D **
//------------------------

clk <= 1;		// Cycle No: 144
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ** PUSH **
//------------------------

clk <= 1;		// Cycle No: 145
#1;

I <= 'b0100;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK **
//------------------------

clk <= 1;		// Cycle No: 146
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 117 : < Y !== 'b000000000000 >");	// Vector No: 65
verify(FULLbar === 1, "Assert 118 : < FULLbar !== 1 >");
#1;

// ** Y = D **
//------------------------

clk <= 1;		// Cycle No: 147
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** PUSH **
//------------------------

clk <= 1;		// Cycle No: 148
#1;

I <= 'b0100;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK **
//------------------------

clk <= 1;		// Cycle No: 149
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 119 : < Y !== 'b111111111111 >");	// Vector No: 66
verify(FULLbar === 1, "Assert 120 : < FULLbar !== 1 >");
#1;

// **************************************************
// ** LOAD R **
//------------------------

clk <= 1;		// Cycle No: 150
#1;

I <= 'b1110;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK
//------------------------

clk <= 1;		// Cycle No: 151
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 121 : < Y !== 'b111111111111 >");	// Vector No: 67
verify(FULLbar === 1, "Assert 122 : < FULLbar !== 1 >");
#1;

// ** POP **
//------------------------

clk <= 1;		// Cycle No: 152
#1;

I <= 'b1011;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(FULLbar === 1, "Assert 123 : < FULLbar !== 1 >");	// Vector No: 68
#1;

// ** Y = TOP OF STACK
//------------------------

clk <= 1;		// Cycle No: 153
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 124 : < Y !== 'b000000000000 >");	// Vector No: 69
verify(FULLbar === 1, "Assert 125 : < FULLbar !== 1 >");
#1;

// **************************************************
// **************************************************
// ******* PUSH ( I = 5) & POP ( I = 11 ) & OTHER CONDITIONS ***********
// ** LOAD R **
//------------------------

clk <= 1;		// Cycle No: 154
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ** Y = D **
//------------------------

clk <= 1;		// Cycle No: 155
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ** PUSH **
//------------------------

clk <= 1;		// Cycle No: 156
#1;

I <= 'b0101;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK **
//------------------------

clk <= 1;		// Cycle No: 157
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 126 : < Y !== 'b000000000000 >");	// Vector No: 70
verify(FULLbar === 1, "Assert 127 : < FULLbar !== 1 >");
#1;

// ** Y = D **
//------------------------

clk <= 1;		// Cycle No: 158
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** PUSH **
//------------------------

clk <= 1;		// Cycle No: 159
#1;

I <= 'b0101;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK **
//------------------------

clk <= 1;		// Cycle No: 160
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 128 : < Y !== 'b111111111111 >");	// Vector No: 71
verify(FULLbar === 1, "Assert 129 : < FULLbar !== 1 >");
#1;

// **************************************************
// ** LOAD R **
//------------------------

clk <= 1;		// Cycle No: 161
#1;

I <= 'b1110;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK
//------------------------

clk <= 1;		// Cycle No: 162
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 130 : < Y !== 'b111111111111 >");	// Vector No: 72
verify(FULLbar === 1, "Assert 131 : < FULLbar !== 1 >");
#1;

// ** POP **
//------------------------

clk <= 1;		// Cycle No: 163
#1;

I <= 'b1011;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(FULLbar === 1, "Assert 132 : < FULLbar !== 1 >");	// Vector No: 73
#1;

// ** Y = TOP OF STACK
//------------------------

clk <= 1;		// Cycle No: 164
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 133 : < Y !== 'b000000000000 >");	// Vector No: 74
verify(FULLbar === 1, "Assert 134 : < FULLbar !== 1 >");
#1;

// **************************************************
// **************************************************
// ******* PUSH ( I = 5) & POP ( I = 11 ) & OTHER CONDITIONS ***********
// ** LOAD R **
//------------------------

clk <= 1;		// Cycle No: 165
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** Y = D **
//------------------------

clk <= 1;		// Cycle No: 166
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ** PUSH **
//------------------------

clk <= 1;		// Cycle No: 167
#1;

I <= 'b0101;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK **
//------------------------

clk <= 1;		// Cycle No: 168
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 135 : < Y !== 'b000000000000 >");	// Vector No: 75
verify(FULLbar === 1, "Assert 136 : < FULLbar !== 1 >");
#1;

// ** Y = D **
//------------------------

clk <= 1;		// Cycle No: 169
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** PUSH **
//------------------------

clk <= 1;		// Cycle No: 170
#1;

I <= 'b0101;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK **
//------------------------

clk <= 1;		// Cycle No: 171
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 137 : < Y !== 'b111111111111 >");	// Vector No: 76
verify(FULLbar === 1, "Assert 138 : < FULLbar !== 1 >");
#1;

// **************************************************
// ** LOAD R **
//------------------------

clk <= 1;		// Cycle No: 172
#1;

I <= 'b1110;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK
//------------------------

clk <= 1;		// Cycle No: 173
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 139 : < Y !== 'b111111111111 >");	// Vector No: 77
verify(FULLbar === 1, "Assert 140 : < FULLbar !== 1 >");
#1;

// ** POP **
//------------------------

clk <= 1;		// Cycle No: 174
#1;

I <= 'b1011;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(FULLbar === 1, "Assert 141 : < FULLbar !== 1 >");	// Vector No: 78
#1;

// ** Y = TOP OF STACK
//------------------------

clk <= 1;		// Cycle No: 175
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 142 : < Y !== 'b000000000000 >");	// Vector No: 79
verify(FULLbar === 1, "Assert 143 : < FULLbar !== 1 >");
#1;

// **************************************************
// **************************************************
// ******* PUSH ( I = 5) & POP ( I = 13 ) & OTHER CONDITIONS ***********
// ** LOAD R **
//------------------------

clk <= 1;		// Cycle No: 176
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ** Y = D **
//------------------------

clk <= 1;		// Cycle No: 177
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ** PUSH **
//------------------------

clk <= 1;		// Cycle No: 178
#1;

I <= 'b0101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK **
//------------------------

clk <= 1;		// Cycle No: 179
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 144 : < Y !== 'b000000000000 >");	// Vector No: 80
verify(FULLbar === 1, "Assert 145 : < FULLbar !== 1 >");
#1;

// ** Y = D **
//------------------------

clk <= 1;		// Cycle No: 180
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** PUSH **
//------------------------

clk <= 1;		// Cycle No: 181
#1;

I <= 'b0101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK **
//------------------------

clk <= 1;		// Cycle No: 182
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 146 : < Y !== 'b111111111111 >");	// Vector No: 81
verify(FULLbar === 1, "Assert 147 : < FULLbar !== 1 >");
#1;

// **************************************************
// ** LOAD R **
//------------------------

clk <= 1;		// Cycle No: 183
#1;

I <= 'b1110;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK
//------------------------

clk <= 1;		// Cycle No: 184
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 148 : < Y !== 'b111111111111 >");	// Vector No: 82
verify(FULLbar === 1, "Assert 149 : < FULLbar !== 1 >");
#1;

// ** POP **
//------------------------

clk <= 1;		// Cycle No: 185
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(FULLbar === 1, "Assert 150 : < FULLbar !== 1 >");	// Vector No: 83
#1;

// ** Y = TOP OF STACK
//------------------------

clk <= 1;		// Cycle No: 186
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 151 : < Y !== 'b000000000000 >");	// Vector No: 84
verify(FULLbar === 1, "Assert 152 : < FULLbar !== 1 >");
#1;

// **************************************************
// **************************************************
// ******* PUSH ( I = 5) & POP ( I = 13 ) & OTHER CONDITIONS ***********
// ** LOAD R **
//------------------------

clk <= 1;		// Cycle No: 187
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** Y = D **
//------------------------

clk <= 1;		// Cycle No: 188
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ** PUSH **
//------------------------

clk <= 1;		// Cycle No: 189
#1;

I <= 'b0101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK **
//------------------------

clk <= 1;		// Cycle No: 190
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 153 : < Y !== 'b000000000000 >");	// Vector No: 85
verify(FULLbar === 1, "Assert 154 : < FULLbar !== 1 >");
#1;

// ** Y = D **
//------------------------

clk <= 1;		// Cycle No: 191
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** PUSH **
//------------------------

clk <= 1;		// Cycle No: 192
#1;

I <= 'b0101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK **
//------------------------

clk <= 1;		// Cycle No: 193
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 155 : < Y !== 'b111111111111 >");	// Vector No: 86
verify(FULLbar === 1, "Assert 156 : < FULLbar !== 1 >");
#1;

// **************************************************
// ** LOAD R **
//------------------------

clk <= 1;		// Cycle No: 194
#1;

I <= 'b1110;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK
//------------------------

clk <= 1;		// Cycle No: 195
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 157 : < Y !== 'b111111111111 >");	// Vector No: 87
verify(FULLbar === 1, "Assert 158 : < FULLbar !== 1 >");
#1;

// ** POP **
//------------------------

clk <= 1;		// Cycle No: 196
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(FULLbar === 1, "Assert 159 : < FULLbar !== 1 >");	// Vector No: 88
#1;

// ** Y = TOP OF STACK
//------------------------

clk <= 1;		// Cycle No: 197
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 160 : < Y !== 'b000000000000 >");	// Vector No: 89
verify(FULLbar === 1, "Assert 161 : < FULLbar !== 1 >");
#1;

// **************************************************
// **************************************************
// ******* PUSH ( I = 5) & POP ( I = 13 ) & OTHER CONDITIONS ***********
// ** LOAD R **
//------------------------

clk <= 1;		// Cycle No: 198
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ** Y = D **
//------------------------

clk <= 1;		// Cycle No: 199
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ** PUSH **
//------------------------

clk <= 1;		// Cycle No: 200
#1;

I <= 'b0101;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK **
//------------------------

clk <= 1;		// Cycle No: 201
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 162 : < Y !== 'b000000000000 >");	// Vector No: 90
verify(FULLbar === 1, "Assert 163 : < FULLbar !== 1 >");
#1;

// ** Y = D **
//------------------------

clk <= 1;		// Cycle No: 202
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** PUSH **
//------------------------

clk <= 1;		// Cycle No: 203
#1;

I <= 'b0101;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK **
//------------------------

clk <= 1;		// Cycle No: 204
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 164 : < Y !== 'b111111111111 >");	// Vector No: 91
verify(FULLbar === 1, "Assert 165 : < FULLbar !== 1 >");
#1;

// **************************************************
// ** LOAD R **
//------------------------

clk <= 1;		// Cycle No: 205
#1;

I <= 'b1110;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK
//------------------------

clk <= 1;		// Cycle No: 206
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 166 : < Y !== 'b111111111111 >");	// Vector No: 92
verify(FULLbar === 1, "Assert 167 : < FULLbar !== 1 >");
#1;

// ** POP **
//------------------------

clk <= 1;		// Cycle No: 207
#1;

I <= 'b1101;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(FULLbar === 1, "Assert 168 : < FULLbar !== 1 >");	// Vector No: 93
#1;

// ** Y = TOP OF STACK
//------------------------

clk <= 1;		// Cycle No: 208
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 169 : < Y !== 'b000000000000 >");	// Vector No: 94
verify(FULLbar === 1, "Assert 170 : < FULLbar !== 1 >");
#1;

// **************************************************
// **************************************************
// ******* PUSH ( I = 5) & POP ( I = 13 ) & OTHER CONDITIONS ***********
// ** LOAD R **
//------------------------

clk <= 1;		// Cycle No: 209
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** Y = D **
//------------------------

clk <= 1;		// Cycle No: 210
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ** PUSH **
//------------------------

clk <= 1;		// Cycle No: 211
#1;

I <= 'b0101;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK **
//------------------------

clk <= 1;		// Cycle No: 212
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 171 : < Y !== 'b000000000000 >");	// Vector No: 95
verify(FULLbar === 1, "Assert 172 : < FULLbar !== 1 >");
#1;

// ** Y = D **
//------------------------

clk <= 1;		// Cycle No: 213
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** PUSH **
//------------------------

clk <= 1;		// Cycle No: 214
#1;

I <= 'b0101;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK **
//------------------------

clk <= 1;		// Cycle No: 215
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 173 : < Y !== 'b111111111111 >");	// Vector No: 96
verify(FULLbar === 1, "Assert 174 : < FULLbar !== 1 >");
#1;

// **************************************************
// ** LOAD R **
//------------------------

clk <= 1;		// Cycle No: 216
#1;

I <= 'b1110;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK
//------------------------

clk <= 1;		// Cycle No: 217
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 175 : < Y !== 'b111111111111 >");	// Vector No: 97
verify(FULLbar === 1, "Assert 176 : < FULLbar !== 1 >");
#1;

// ** POP **
//------------------------

clk <= 1;		// Cycle No: 218
#1;

I <= 'b1101;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(FULLbar === 1, "Assert 177 : < FULLbar !== 1 >");	// Vector No: 98
#1;

// ** Y = TOP OF STACK
//------------------------

clk <= 1;		// Cycle No: 219
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 178 : < Y !== 'b000000000000 >");	// Vector No: 99
verify(FULLbar === 1, "Assert 179 : < FULLbar !== 1 >");
#1;

// **************************************************
// **************************************************
// ******* PUSH ( I = 5) & POP ( I = 13 ) & OTHER CONDITIONS ***********
// ** LOAD R **
//------------------------

clk <= 1;		// Cycle No: 220
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ** Y = D **
//------------------------

clk <= 1;		// Cycle No: 221
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ** PUSH **
//------------------------

clk <= 1;		// Cycle No: 222
#1;

I <= 'b0101;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK **
//------------------------

clk <= 1;		// Cycle No: 223
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 180 : < Y !== 'b000000000000 >");	// Vector No: 100
verify(FULLbar === 1, "Assert 181 : < FULLbar !== 1 >");
#1;

// ** Y = D **
//------------------------

clk <= 1;		// Cycle No: 224
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** PUSH **
//------------------------

clk <= 1;		// Cycle No: 225
#1;

I <= 'b0101;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK **
//------------------------

clk <= 1;		// Cycle No: 226
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 182 : < Y !== 'b111111111111 >");	// Vector No: 101
verify(FULLbar === 1, "Assert 183 : < FULLbar !== 1 >");
#1;

// **************************************************
// ** LOAD R **
//------------------------

clk <= 1;		// Cycle No: 227
#1;

I <= 'b1110;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK
//------------------------

clk <= 1;		// Cycle No: 228
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 184 : < Y !== 'b111111111111 >");	// Vector No: 102
verify(FULLbar === 1, "Assert 185 : < FULLbar !== 1 >");
#1;

// ** POP **
//------------------------

clk <= 1;		// Cycle No: 229
#1;

I <= 'b1101;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(FULLbar === 1, "Assert 186 : < FULLbar !== 1 >");	// Vector No: 103
#1;

// ** Y = TOP OF STACK
//------------------------

clk <= 1;		// Cycle No: 230
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 187 : < Y !== 'b000000000000 >");	// Vector No: 104
verify(FULLbar === 1, "Assert 188 : < FULLbar !== 1 >");
#1;

// **************************************************
// **************************************************
// ******* PUSH ( I = 5) & POP ( I = 13 ) & OTHER CONDITIONS ***********
// ** LOAD R **
//------------------------

clk <= 1;		// Cycle No: 231
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** Y = D **
//------------------------

clk <= 1;		// Cycle No: 232
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ** PUSH **
//------------------------

clk <= 1;		// Cycle No: 233
#1;

I <= 'b0101;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK **
//------------------------

clk <= 1;		// Cycle No: 234
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 189 : < Y !== 'b000000000000 >");	// Vector No: 105
verify(FULLbar === 1, "Assert 190 : < FULLbar !== 1 >");
#1;

// ** Y = D **
//------------------------

clk <= 1;		// Cycle No: 235
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** PUSH **
//------------------------

clk <= 1;		// Cycle No: 236
#1;

I <= 'b0101;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK **
//------------------------

clk <= 1;		// Cycle No: 237
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 191 : < Y !== 'b111111111111 >");	// Vector No: 106
verify(FULLbar === 1, "Assert 192 : < FULLbar !== 1 >");
#1;

// **************************************************
// ** LOAD R **
//------------------------

clk <= 1;		// Cycle No: 238
#1;

I <= 'b1110;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK
//------------------------

clk <= 1;		// Cycle No: 239
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 193 : < Y !== 'b111111111111 >");	// Vector No: 107
verify(FULLbar === 1, "Assert 194 : < FULLbar !== 1 >");
#1;

// ** POP **
//------------------------

clk <= 1;		// Cycle No: 240
#1;

I <= 'b1101;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(FULLbar === 1, "Assert 195 : < FULLbar !== 1 >");	// Vector No: 108
#1;

// ** Y = TOP OF STACK
//------------------------

clk <= 1;		// Cycle No: 241
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 196 : < Y !== 'b000000000000 >");	// Vector No: 109
verify(FULLbar === 1, "Assert 197 : < FULLbar !== 1 >");
#1;

// **************************************************
// **************************************************
// ******* PUSH ( I = 5) & POP ( I = 15 ) & OTHER CONDITIONS ***********
// ** LOAD R **
//------------------------

clk <= 1;		// Cycle No: 242
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** Y = D **
//------------------------

clk <= 1;		// Cycle No: 243
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ** PUSH **
//------------------------

clk <= 1;		// Cycle No: 244
#1;

I <= 'b0101;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK **
//------------------------

clk <= 1;		// Cycle No: 245
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 198 : < Y !== 'b000000000000 >");	// Vector No: 110
verify(FULLbar === 1, "Assert 199 : < FULLbar !== 1 >");
#1;

// ** Y = D **
//------------------------

clk <= 1;		// Cycle No: 246
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** PUSH **
//------------------------

clk <= 1;		// Cycle No: 247
#1;

I <= 'b0101;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK **
//------------------------

clk <= 1;		// Cycle No: 248
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 200 : < Y !== 'b111111111111 >");	// Vector No: 111
verify(FULLbar === 1, "Assert 201 : < FULLbar !== 1 >");
#1;

// **************************************************
// ** LOAD R **
//------------------------

clk <= 1;		// Cycle No: 249
#1;

I <= 'b1110;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK
//------------------------

clk <= 1;		// Cycle No: 250
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 202 : < Y !== 'b111111111111 >");	// Vector No: 112
verify(FULLbar === 1, "Assert 203 : < FULLbar !== 1 >");
#1;

// ** POP **
//------------------------

clk <= 1;		// Cycle No: 251
#1;

I <= 'b1111;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(FULLbar === 1, "Assert 204 : < FULLbar !== 1 >");	// Vector No: 113
#1;

// ** Y = TOP OF STACK
//------------------------

clk <= 1;		// Cycle No: 252
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 205 : < Y !== 'b000000000000 >");	// Vector No: 114
verify(FULLbar === 1, "Assert 206 : < FULLbar !== 1 >");
#1;

// **************************************************
// **************************************************
// ******* PUSH ( I = 5) & POP ( I = 15 ) & OTHER CONDITIONS ***********
// ** LOAD R **
//------------------------

clk <= 1;		// Cycle No: 253
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** Y = D **
//------------------------

clk <= 1;		// Cycle No: 254
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ** PUSH **
//------------------------

clk <= 1;		// Cycle No: 255
#1;

I <= 'b0101;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK **
//------------------------

clk <= 1;		// Cycle No: 256
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 207 : < Y !== 'b000000000000 >");	// Vector No: 115
verify(FULLbar === 1, "Assert 208 : < FULLbar !== 1 >");
#1;

// ** Y = D **
//------------------------

clk <= 1;		// Cycle No: 257
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** PUSH **
//------------------------

clk <= 1;		// Cycle No: 258
#1;

I <= 'b0101;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK **
//------------------------

clk <= 1;		// Cycle No: 259
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 209 : < Y !== 'b111111111111 >");	// Vector No: 116
verify(FULLbar === 1, "Assert 210 : < FULLbar !== 1 >");
#1;

// **************************************************
// ** LOAD R **
//------------------------

clk <= 1;		// Cycle No: 260
#1;

I <= 'b1110;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK
//------------------------

clk <= 1;		// Cycle No: 261
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 211 : < Y !== 'b111111111111 >");	// Vector No: 117
verify(FULLbar === 1, "Assert 212 : < FULLbar !== 1 >");
#1;

// ** POP **
//------------------------

clk <= 1;		// Cycle No: 262
#1;

I <= 'b1111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(FULLbar === 1, "Assert 213 : < FULLbar !== 1 >");	// Vector No: 118
#1;

// ** Y = TOP OF STACK
//------------------------

clk <= 1;		// Cycle No: 263
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 214 : < Y !== 'b000000000000 >");	// Vector No: 119
verify(FULLbar === 1, "Assert 215 : < FULLbar !== 1 >");
#1;

// **************************************************
// **************************************************
// ******* PUSH ( I = 5) & POP ( I = 15 ) & OTHER CONDITIONS ***********
// ** LOAD R **
//------------------------

clk <= 1;		// Cycle No: 264
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** Y = D **
//------------------------

clk <= 1;		// Cycle No: 265
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ** PUSH **
//------------------------

clk <= 1;		// Cycle No: 266
#1;

I <= 'b0101;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK **
//------------------------

clk <= 1;		// Cycle No: 267
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 216 : < Y !== 'b000000000000 >");	// Vector No: 120
verify(FULLbar === 1, "Assert 217 : < FULLbar !== 1 >");
#1;

// ** Y = D **
//------------------------

clk <= 1;		// Cycle No: 268
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** PUSH **
//------------------------

clk <= 1;		// Cycle No: 269
#1;

I <= 'b0101;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK **
//------------------------

clk <= 1;		// Cycle No: 270
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 218 : < Y !== 'b111111111111 >");	// Vector No: 121
verify(FULLbar === 1, "Assert 219 : < FULLbar !== 1 >");
#1;

// **************************************************
// ** LOAD R **
//------------------------

clk <= 1;		// Cycle No: 271
#1;

I <= 'b1110;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK
//------------------------

clk <= 1;		// Cycle No: 272
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 220 : < Y !== 'b111111111111 >");	// Vector No: 122
verify(FULLbar === 1, "Assert 221 : < FULLbar !== 1 >");
#1;

// ** POP **
//------------------------

clk <= 1;		// Cycle No: 273
#1;

I <= 'b1111;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(FULLbar === 1, "Assert 222 : < FULLbar !== 1 >");	// Vector No: 123
#1;

// ** Y = TOP OF STACK
//------------------------

clk <= 1;		// Cycle No: 274
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 223 : < Y !== 'b000000000000 >");	// Vector No: 124
verify(FULLbar === 1, "Assert 224 : < FULLbar !== 1 >");
#1;

// **************************************************
// **************************************************
// ******* PUSH ( I = 5) & POP ( I = 15 ) & OTHER CONDITIONS ***********
// ** LOAD R **
//------------------------

clk <= 1;		// Cycle No: 275
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** Y = D **
//------------------------

clk <= 1;		// Cycle No: 276
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ** PUSH **
//------------------------

clk <= 1;		// Cycle No: 277
#1;

I <= 'b0101;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK **
//------------------------

clk <= 1;		// Cycle No: 278
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 225 : < Y !== 'b000000000000 >");	// Vector No: 125
verify(FULLbar === 1, "Assert 226 : < FULLbar !== 1 >");
#1;

// ** Y = D **
//------------------------

clk <= 1;		// Cycle No: 279
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** PUSH **
//------------------------

clk <= 1;		// Cycle No: 280
#1;

I <= 'b0101;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK **
//------------------------

clk <= 1;		// Cycle No: 281
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 227 : < Y !== 'b111111111111 >");	// Vector No: 126
verify(FULLbar === 1, "Assert 228 : < FULLbar !== 1 >");
#1;

// **************************************************
// ** LOAD R **
//------------------------

clk <= 1;		// Cycle No: 282
#1;

I <= 'b1110;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK
//------------------------

clk <= 1;		// Cycle No: 283
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 229 : < Y !== 'b111111111111 >");	// Vector No: 127
verify(FULLbar === 1, "Assert 230 : < FULLbar !== 1 >");
#1;

// ** POP **
//------------------------

clk <= 1;		// Cycle No: 284
#1;

I <= 'b1111;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(FULLbar === 1, "Assert 231 : < FULLbar !== 1 >");	// Vector No: 128
#1;

// ** Y = TOP OF STACK
//------------------------

clk <= 1;		// Cycle No: 285
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 232 : < Y !== 'b000000000000 >");	// Vector No: 129
verify(FULLbar === 1, "Assert 233 : < FULLbar !== 1 >");
#1;

// **************************************************
// **************************************************
// ******* PUSH ( I = 5) & POP ( I = 15 ) & OTHER CONDITIONS ***********
// ** LOAD R **
//------------------------

clk <= 1;		// Cycle No: 286
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** Y = D **
//------------------------

clk <= 1;		// Cycle No: 287
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ** PUSH **
//------------------------

clk <= 1;		// Cycle No: 288
#1;

I <= 'b0101;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK **
//------------------------

clk <= 1;		// Cycle No: 289
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 234 : < Y !== 'b000000000000 >");	// Vector No: 130
verify(FULLbar === 1, "Assert 235 : < FULLbar !== 1 >");
#1;

// ** Y = D **
//------------------------

clk <= 1;		// Cycle No: 290
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** PUSH **
//------------------------

clk <= 1;		// Cycle No: 291
#1;

I <= 'b0101;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK **
//------------------------

clk <= 1;		// Cycle No: 292
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 236 : < Y !== 'b111111111111 >");	// Vector No: 131
verify(FULLbar === 1, "Assert 237 : < FULLbar !== 1 >");
#1;

// **************************************************
// ** LOAD R **
//------------------------

clk <= 1;		// Cycle No: 293
#1;

I <= 'b1110;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK
//------------------------

clk <= 1;		// Cycle No: 294
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 238 : < Y !== 'b111111111111 >");	// Vector No: 132
verify(FULLbar === 1, "Assert 239 : < FULLbar !== 1 >");
#1;

// ** POP **
//------------------------

clk <= 1;		// Cycle No: 295
#1;

I <= 'b1111;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(FULLbar === 1, "Assert 240 : < FULLbar !== 1 >");	// Vector No: 133
#1;

// ** Y = TOP OF STACK
//------------------------

clk <= 1;		// Cycle No: 296
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 241 : < Y !== 'b000000000000 >");	// Vector No: 134
verify(FULLbar === 1, "Assert 242 : < FULLbar !== 1 >");
#1;

// **************************************************
// **************************************************
// ******* PUSH ( I = 5) & POP ( I = 15 ) & OTHER CONDITIONS ***********
// ** LOAD R **
//------------------------

clk <= 1;		// Cycle No: 297
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** Y = D **
//------------------------

clk <= 1;		// Cycle No: 298
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ** PUSH **
//------------------------

clk <= 1;		// Cycle No: 299
#1;

I <= 'b0101;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK **
//------------------------

clk <= 1;		// Cycle No: 300
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 243 : < Y !== 'b000000000000 >");	// Vector No: 135
verify(FULLbar === 1, "Assert 244 : < FULLbar !== 1 >");
#1;

// ** Y = D **
//------------------------

clk <= 1;		// Cycle No: 301
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** PUSH **
//------------------------

clk <= 1;		// Cycle No: 302
#1;

I <= 'b0101;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK **
//------------------------

clk <= 1;		// Cycle No: 303
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 245 : < Y !== 'b111111111111 >");	// Vector No: 136
verify(FULLbar === 1, "Assert 246 : < FULLbar !== 1 >");
#1;

// **************************************************
// ** LOAD R **
//------------------------

clk <= 1;		// Cycle No: 304
#1;

I <= 'b1110;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK
//------------------------

clk <= 1;		// Cycle No: 305
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 247 : < Y !== 'b111111111111 >");	// Vector No: 137
verify(FULLbar === 1, "Assert 248 : < FULLbar !== 1 >");
#1;

// ** POP **
//------------------------

clk <= 1;		// Cycle No: 306
#1;

I <= 'b1111;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(FULLbar === 1, "Assert 249 : < FULLbar !== 1 >");	// Vector No: 138
#1;

// ** Y = TOP OF STACK
//------------------------

clk <= 1;		// Cycle No: 307
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 250 : < Y !== 'b000000000000 >");	// Vector No: 139
verify(FULLbar === 1, "Assert 251 : < FULLbar !== 1 >");
#1;

// **************************************************
// **************************************************
// ******* PUSH ( I = 5) & POP ( I = 15 ) & OTHER CONDITIONS ***********
// ** LOAD R **
//------------------------

clk <= 1;		// Cycle No: 308
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** Y = D **
//------------------------

clk <= 1;		// Cycle No: 309
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ** PUSH **
//------------------------

clk <= 1;		// Cycle No: 310
#1;

I <= 'b0101;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK **
//------------------------

clk <= 1;		// Cycle No: 311
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 252 : < Y !== 'b000000000000 >");	// Vector No: 140
verify(FULLbar === 1, "Assert 253 : < FULLbar !== 1 >");
#1;

// ** Y = D **
//------------------------

clk <= 1;		// Cycle No: 312
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** PUSH **
//------------------------

clk <= 1;		// Cycle No: 313
#1;

I <= 'b0101;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK **
//------------------------

clk <= 1;		// Cycle No: 314
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 254 : < Y !== 'b111111111111 >");	// Vector No: 141
verify(FULLbar === 1, "Assert 255 : < FULLbar !== 1 >");
#1;

// **************************************************
// ** LOAD R **
//------------------------

clk <= 1;		// Cycle No: 315
#1;

I <= 'b1110;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

// ** Y = TOP OF STACK
//------------------------

clk <= 1;		// Cycle No: 316
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 256 : < Y !== 'b111111111111 >");	// Vector No: 142
verify(FULLbar === 1, "Assert 257 : < FULLbar !== 1 >");
#1;

// ** POP **
//------------------------

clk <= 1;		// Cycle No: 317
#1;

I <= 'b1111;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(FULLbar === 1, "Assert 258 : < FULLbar !== 1 >");	// Vector No: 143
#1;

// ** Y = TOP OF STACK
//------------------------

clk <= 1;		// Cycle No: 318
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 259 : < Y !== 'b000000000000 >");	// Vector No: 144
verify(FULLbar === 1, "Assert 260 : < FULLbar !== 1 >");
#1;

// **************************************************
// **************************************************
// *******************************************
// ************* TEST ALL STACK **************
// *************  POSITIONS     **************
// *******************************************
// ************* FIRST SET OF STUCK-AT FAULTS *************
// ***** RESET CHIP AND LOAD R = 0 *****
//------------------------

clk <= 1;		// Cycle No: 319
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ************* 6 PUSHES *************
// ***** START PUSHES *****
// ** PUSH  1 **
//------------------------

clk <= 1;		// Cycle No: 320
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 321
#1;

I <= 'b0001;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 322
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 261 : < Y !== 'b000000000000 >");	// Vector No: 145
verify(FULLbar === 1, "Assert 262 : < FULLbar !== 1 >");
#1;

// **************************************************
// ** PUSH  2 **
//------------------------

clk <= 1;		// Cycle No: 323
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000001;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 324
#1;

I <= 'b0001;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 325
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000001, "Assert 263 : < Y !== 'b000000000001 >");	// Vector No: 146
verify(FULLbar === 1, "Assert 264 : < FULLbar !== 1 >");
#1;

// **************************************************
// ** PUSH  3 **
//------------------------

clk <= 1;		// Cycle No: 326
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000010;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 327
#1;

I <= 'b0001;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 328
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000010, "Assert 265 : < Y !== 'b000000000010 >");	// Vector No: 147
verify(FULLbar === 1, "Assert 266 : < FULLbar !== 1 >");
#1;

// **************************************************
// ** PUSH  4 **
//------------------------

clk <= 1;		// Cycle No: 329
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000100;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 330
#1;

I <= 'b0001;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 331
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000100, "Assert 267 : < Y !== 'b000000000100 >");	// Vector No: 148
verify(FULLbar === 1, "Assert 268 : < FULLbar !== 1 >");
#1;

// **************************************************
// ** PUSH  5 **
//------------------------

clk <= 1;		// Cycle No: 332
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111110111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 333
#1;

I <= 'b0001;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 334
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111110111, "Assert 269 : < Y !== 'b111111110111 >");	// Vector No: 149
verify(FULLbar === 0, "Assert 270 : < FULLbar !== 0 >");
#1;

// **************************************************
// ** PUSH  6 (OVER-WRITE TOP OF STACK) **
//------------------------

clk <= 1;		// Cycle No: 335
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000001000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 336
#1;

I <= 'b0001;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 337
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000001000, "Assert 271 : < Y !== 'b000000001000 >");	// Vector No: 150
verify(FULLbar === 0, "Assert 272 : < FULLbar !== 0 >");
#1;

// **************************************************
// ************* 6 POPS *************
// **** LOAD REG-CTR WITH ZERO ****
//------------------------

clk <= 1;		// Cycle No: 338
#1;

I <= 'b1110;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// **************************************************
// ** POP  1 **
//------------------------

clk <= 1;		// Cycle No: 339
#1;

I <= 'b1000;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000001000, "Assert 273 : < Y !== 'b000000001000 >");	// Vector No: 151
verify(FULLbar === 0, "Assert 274 : < FULLbar !== 0 >");
#1;

//------------------------

clk <= 1;		// Cycle No: 340
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000100, "Assert 275 : < Y !== 'b000000000100 >");	// Vector No: 152
verify(FULLbar === 1, "Assert 276 : < FULLbar !== 1 >");
#1;

// **************************************************
// ** POP  2 **
//------------------------

clk <= 1;		// Cycle No: 341
#1;

I <= 'b1000;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000100, "Assert 277 : < Y !== 'b000000000100 >");	// Vector No: 153
verify(FULLbar === 1, "Assert 278 : < FULLbar !== 1 >");
#1;

//------------------------

clk <= 1;		// Cycle No: 342
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000010, "Assert 279 : < Y !== 'b000000000010 >");	// Vector No: 154
verify(FULLbar === 1, "Assert 280 : < FULLbar !== 1 >");
#1;

// **************************************************
// ** POP  3 **
//------------------------

clk <= 1;		// Cycle No: 343
#1;

I <= 'b1000;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000010, "Assert 281 : < Y !== 'b000000000010 >");	// Vector No: 155
verify(FULLbar === 1, "Assert 282 : < FULLbar !== 1 >");
#1;

//------------------------

clk <= 1;		// Cycle No: 344
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000001, "Assert 283 : < Y !== 'b000000000001 >");	// Vector No: 156
verify(FULLbar === 1, "Assert 284 : < FULLbar !== 1 >");
#1;

// **************************************************
// ** POP  4 **
//------------------------

clk <= 1;		// Cycle No: 345
#1;

I <= 'b1000;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000001, "Assert 285 : < Y !== 'b000000000001 >");	// Vector No: 157
verify(FULLbar === 1, "Assert 286 : < FULLbar !== 1 >");
#1;

//------------------------

clk <= 1;		// Cycle No: 346
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 287 : < Y !== 'b000000000000 >");	// Vector No: 158
verify(FULLbar === 1, "Assert 288 : < FULLbar !== 1 >");
#1;

// **************************************************
// ** POP  5 **
//------------------------

clk <= 1;		// Cycle No: 347
#1;

I <= 'b1000;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 289 : < Y !== 'b000000000000 >");	// Vector No: 159
verify(FULLbar === 1, "Assert 290 : < FULLbar !== 1 >");
#1;

//------------------------

clk <= 1;		// Cycle No: 348
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(FULLbar === 1, "Assert 291 : < FULLbar !== 1 >");	// Vector No: 160
#1;

// **************************************************
// ** POP  6 (POP EMPTY STACK) **
//------------------------

clk <= 1;		// Cycle No: 349
#1;

I <= 'b1000;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(FULLbar === 1, "Assert 292 : < FULLbar !== 1 >");	// Vector No: 161
#1;

//------------------------

clk <= 1;		// Cycle No: 350
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(FULLbar === 1, "Assert 293 : < FULLbar !== 1 >");	// Vector No: 162
#1;

// **************************************************
// ************* SECOND SET OF STUCK-AT FAULTS *************
// ***** RESET CHIP AND LOAD R = 0 *****
//------------------------

clk <= 1;		// Cycle No: 351
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 1;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// ************* 6 PUSHES *************
// ***** START PUSHES *****
// ** PUSH  1 **
//------------------------

clk <= 1;		// Cycle No: 352
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 353
#1;

I <= 'b0001;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 354
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 294 : < Y !== 'b111111111111 >");	// Vector No: 163
verify(FULLbar === 1, "Assert 295 : < FULLbar !== 1 >");
#1;

// **************************************************
// ** PUSH  2 **
//------------------------

clk <= 1;		// Cycle No: 355
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111110;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 356
#1;

I <= 'b0001;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 357
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111110, "Assert 296 : < Y !== 'b111111111110 >");	// Vector No: 164
verify(FULLbar === 1, "Assert 297 : < FULLbar !== 1 >");
#1;

// **************************************************
// ** PUSH  3 **
//------------------------

clk <= 1;		// Cycle No: 358
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111101;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 359
#1;

I <= 'b0001;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 360
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111101, "Assert 298 : < Y !== 'b111111111101 >");	// Vector No: 165
verify(FULLbar === 1, "Assert 299 : < FULLbar !== 1 >");
#1;

// **************************************************
// ** PUSH  4 **
//------------------------

clk <= 1;		// Cycle No: 361
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111011;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 362
#1;

I <= 'b0001;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 363
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111011, "Assert 300 : < Y !== 'b111111111011 >");	// Vector No: 166
verify(FULLbar === 1, "Assert 301 : < FULLbar !== 1 >");
#1;

// **************************************************
// ** PUSH  5 **
//------------------------

clk <= 1;		// Cycle No: 364
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000001000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 365
#1;

I <= 'b0001;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 366
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000001000, "Assert 302 : < Y !== 'b000000001000 >");	// Vector No: 167
verify(FULLbar === 0, "Assert 303 : < FULLbar !== 0 >");
#1;

// **************************************************
// ** PUSH  6 (OVER-WRITE TOP OF STACK) **
//------------------------

clk <= 1;		// Cycle No: 367
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111110111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 368
#1;

I <= 'b0001;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 369
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111110111, "Assert 304 : < Y !== 'b111111110111 >");	// Vector No: 168
verify(FULLbar === 0, "Assert 305 : < FULLbar !== 0 >");
#1;

// **************************************************
// ************* 6 POPS *************
// **** LOAD REG-CTR WITH ZERO ****
//------------------------

clk <= 1;		// Cycle No: 370
#1;

I <= 'b1110;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

// **************************************************
// ** POP  1 **
//------------------------

clk <= 1;		// Cycle No: 371
#1;

I <= 'b1000;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111110111, "Assert 306 : < Y !== 'b111111110111 >");	// Vector No: 169
verify(FULLbar === 0, "Assert 307 : < FULLbar !== 0 >");
#1;

//------------------------

clk <= 1;		// Cycle No: 372
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111011, "Assert 308 : < Y !== 'b111111111011 >");	// Vector No: 170
verify(FULLbar === 1, "Assert 309 : < FULLbar !== 1 >");
#1;

// **************************************************
// ** POP  2 **
//------------------------

clk <= 1;		// Cycle No: 373
#1;

I <= 'b1000;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111011, "Assert 310 : < Y !== 'b111111111011 >");	// Vector No: 171
verify(FULLbar === 1, "Assert 311 : < FULLbar !== 1 >");
#1;

//------------------------

clk <= 1;		// Cycle No: 374
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111101, "Assert 312 : < Y !== 'b111111111101 >");	// Vector No: 172
verify(FULLbar === 1, "Assert 313 : < FULLbar !== 1 >");
#1;

// **************************************************
// ** POP  3 **
//------------------------

clk <= 1;		// Cycle No: 375
#1;

I <= 'b1000;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111101, "Assert 314 : < Y !== 'b111111111101 >");	// Vector No: 173
verify(FULLbar === 1, "Assert 315 : < FULLbar !== 1 >");
#1;

//------------------------

clk <= 1;		// Cycle No: 376
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111110, "Assert 316 : < Y !== 'b111111111110 >");	// Vector No: 174
verify(FULLbar === 1, "Assert 317 : < FULLbar !== 1 >");
#1;

// **************************************************
// ** POP  4 **
//------------------------

clk <= 1;		// Cycle No: 377
#1;

I <= 'b1000;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111110, "Assert 318 : < Y !== 'b111111111110 >");	// Vector No: 175
verify(FULLbar === 1, "Assert 319 : < FULLbar !== 1 >");
#1;

//------------------------

clk <= 1;		// Cycle No: 378
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 320 : < Y !== 'b111111111111 >");	// Vector No: 176
verify(FULLbar === 1, "Assert 321 : < FULLbar !== 1 >");
#1;

// **************************************************
// ** POP  5 **
//------------------------

clk <= 1;		// Cycle No: 379
#1;

I <= 'b1000;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 322 : < Y !== 'b111111111111 >");	// Vector No: 177
verify(FULLbar === 1, "Assert 323 : < FULLbar !== 1 >");
#1;

//------------------------

clk <= 1;		// Cycle No: 380
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(FULLbar === 1, "Assert 324 : < FULLbar !== 1 >");	// Vector No: 178
#1;

// **************************************************
// ** POP  6 (POP EMPTY STACK) **
//------------------------

clk <= 1;		// Cycle No: 381
#1;

I <= 'b1000;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(FULLbar === 1, "Assert 325 : < FULLbar !== 1 >");	// Vector No: 179
#1;

//------------------------

clk <= 1;		// Cycle No: 382
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(FULLbar === 1, "Assert 326 : < FULLbar !== 1 >");	// Vector No: 180
#1;

// **************************************************
// *************************************
// *                                   *
// * TEST VECTORS FOR REGISTER COUNTER *
// *                                   *
// *************************************
// ******* TEST LOADING OPERATION (INSTRUCTION) *******
// ** I = 4 **
//------------------------

clk <= 1;		// Cycle No: 383
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 384
#1;

I <= 'b0100;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 385
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 327 : < Y !== 'b000000000000 >");	// Vector No: 181
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 386
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 387
#1;

I <= 'b0100;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 388
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 328 : < Y !== 'b111111111111 >");	// Vector No: 182
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 389
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 390
#1;

I <= 'b0100;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 391
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 329 : < Y !== 'b000000000000 >");	// Vector No: 183
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 392
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 393
#1;

I <= 'b0100;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 394
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 330 : < Y !== 'b111111111111 >");	// Vector No: 184
#1;

// **************************************************
// **************************************************
//------------------------

clk <= 1;		// Cycle No: 395
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 396
#1;

I <= 'b0100;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 397
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 331 : < Y !== 'b000000000000 >");	// Vector No: 185
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 398
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 399
#1;

I <= 'b0100;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 400
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 332 : < Y !== 'b111111111111 >");	// Vector No: 186
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 401
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 402
#1;

I <= 'b0100;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 403
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 333 : < Y !== 'b000000000000 >");	// Vector No: 187
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 404
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 405
#1;

I <= 'b0100;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 406
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 334 : < Y !== 'b111111111111 >");	// Vector No: 188
#1;

// **************************************************
// **************************************************
//------------------------

clk <= 1;		// Cycle No: 407
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 408
#1;

I <= 'b0100;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 409
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 335 : < Y !== 'b000000000000 >");	// Vector No: 189
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 410
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 411
#1;

I <= 'b0100;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 412
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 336 : < Y !== 'b111111111111 >");	// Vector No: 190
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 413
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 414
#1;

I <= 'b0100;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 415
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 337 : < Y !== 'b000000000000 >");	// Vector No: 191
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 416
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 417
#1;

I <= 'b0100;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 418
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 338 : < Y !== 'b111111111111 >");	// Vector No: 192
#1;

// **************************************************
// **************************************************
// ** I = 12 **
//------------------------

clk <= 1;		// Cycle No: 419
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 420
#1;

I <= 'b1100;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 421
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 339 : < Y !== 'b000000000000 >");	// Vector No: 193
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 422
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 423
#1;

I <= 'b1100;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 424
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 340 : < Y !== 'b111111111111 >");	// Vector No: 194
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 425
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 426
#1;

I <= 'b1100;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 427
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 341 : < Y !== 'b000000000000 >");	// Vector No: 195
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 428
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 429
#1;

I <= 'b1100;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 430
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 342 : < Y !== 'b111111111111 >");	// Vector No: 196
#1;

// **************************************************
// **************************************************
//------------------------

clk <= 1;		// Cycle No: 431
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 432
#1;

I <= 'b1100;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 433
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 343 : < Y !== 'b000000000000 >");	// Vector No: 197
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 434
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 435
#1;

I <= 'b1100;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 436
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 344 : < Y !== 'b111111111111 >");	// Vector No: 198
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 437
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 438
#1;

I <= 'b1100;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 439
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 345 : < Y !== 'b000000000000 >");	// Vector No: 199
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 440
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 441
#1;

I <= 'b1100;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 442
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 346 : < Y !== 'b111111111111 >");	// Vector No: 200
#1;

// **************************************************
// **************************************************
//------------------------

clk <= 1;		// Cycle No: 443
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 444
#1;

I <= 'b1100;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 445
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 347 : < Y !== 'b000000000000 >");	// Vector No: 201
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 446
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 447
#1;

I <= 'b1100;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 448
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 348 : < Y !== 'b111111111111 >");	// Vector No: 202
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 449
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 450
#1;

I <= 'b1100;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 451
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 349 : < Y !== 'b000000000000 >");	// Vector No: 203
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 452
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 453
#1;

I <= 'b1100;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 454
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 350 : < Y !== 'b111111111111 >");	// Vector No: 204
#1;

// **************************************************
// **************************************************
//------------------------

clk <= 1;		// Cycle No: 455
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 456
#1;

I <= 'b1100;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 457
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 351 : < Y !== 'b000000000000 >");	// Vector No: 205
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 458
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 459
#1;

I <= 'b1100;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 460
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 352 : < Y !== 'b111111111111 >");	// Vector No: 206
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 461
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 462
#1;

I <= 'b1100;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 463
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 353 : < Y !== 'b000000000000 >");	// Vector No: 207
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 464
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 465
#1;

I <= 'b1100;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 466
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 354 : < Y !== 'b111111111111 >");	// Vector No: 208
#1;

// **************************************************
// **************************************************
// ******* TEST LOADING OPERATION (RLDbar) *******
//------------------------

clk <= 1;		// Cycle No: 467
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 468
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 355 : < Y !== 'b000000000000 >");	// Vector No: 209
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 469
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 470
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 356 : < Y !== 'b111111111111 >");	// Vector No: 210
#1;

// **************************************************
// ******* TEST DECREMENT OPERATION ********
// ** I = 8 **
//------------------------

clk <= 1;		// Cycle No: 471
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000001;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 472
#1;

I <= 'b1000;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 473
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 357 : < Y !== 'b000000000000 >");	// Vector No: 211
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 474
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000001;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 475
#1;

I <= 'b1000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 476
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 358 : < Y !== 'b000000000000 >");	// Vector No: 212
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 477
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000001;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 478
#1;

I <= 'b1000;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 479
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 359 : < Y !== 'b000000000000 >");	// Vector No: 213
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 480
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000001;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 481
#1;

I <= 'b1000;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 482
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 360 : < Y !== 'b000000000000 >");	// Vector No: 214
#1;

// **************************************************
// ** I = 9 **
//------------------------

clk <= 1;		// Cycle No: 483
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000001;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 484
#1;

I <= 'b1001;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 485
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 361 : < Y !== 'b000000000000 >");	// Vector No: 215
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 486
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000001;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 487
#1;

I <= 'b1001;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 488
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 362 : < Y !== 'b000000000000 >");	// Vector No: 216
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 489
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000001;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 490
#1;

I <= 'b1001;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 491
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 363 : < Y !== 'b000000000000 >");	// Vector No: 217
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 492
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000001;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 493
#1;

I <= 'b1001;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 494
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 364 : < Y !== 'b000000000000 >");	// Vector No: 218
#1;

// **************************************************
// ** I = 15 **
//------------------------

clk <= 1;		// Cycle No: 495
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000001;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 496
#1;

I <= 'b1111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 497
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 365 : < Y !== 'b000000000000 >");	// Vector No: 219
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 498
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000001;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 499
#1;

I <= 'b1111;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 500
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 366 : < Y !== 'b000000000000 >");	// Vector No: 220
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 501
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000001;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 502
#1;

I <= 'b1111;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 503
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 367 : < Y !== 'b000000000000 >");	// Vector No: 221
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 504
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000001;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 505
#1;

I <= 'b1111;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 506
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 368 : < Y !== 'b000000000000 >");	// Vector No: 222
#1;

// **************************************************
// ******* TEST DECREMENT OPERATION BORROW RIPPLE *******
//------------------------

clk <= 1;		// Cycle No: 507
#1;

I <= 'b1110;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 508
#1;

I <= 'b1000;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 509
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111110, "Assert 369 : < Y !== 'b111111111110 >");	// Vector No: 223
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 510
#1;

I <= 'b1110;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111110;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 511
#1;

I <= 'b1000;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 512
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111101, "Assert 370 : < Y !== 'b111111111101 >");	// Vector No: 224
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 513
#1;

I <= 'b1110;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111100;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 514
#1;

I <= 'b1000;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 515
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111011, "Assert 371 : < Y !== 'b111111111011 >");	// Vector No: 225
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 516
#1;

I <= 'b1110;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 517
#1;

I <= 'b1000;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 518
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111110111, "Assert 372 : < Y !== 'b111111110111 >");	// Vector No: 226
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 519
#1;

I <= 'b1110;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111110000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 520
#1;

I <= 'b1000;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 521
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111101111, "Assert 373 : < Y !== 'b111111101111 >");	// Vector No: 227
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 522
#1;

I <= 'b1110;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111100000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 523
#1;

I <= 'b1000;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 524
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111011111, "Assert 374 : < Y !== 'b111111011111 >");	// Vector No: 228
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 525
#1;

I <= 'b1110;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 526
#1;

I <= 'b1000;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 527
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111110111111, "Assert 375 : < Y !== 'b111110111111 >");	// Vector No: 229
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 528
#1;

I <= 'b1110;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111110000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 529
#1;

I <= 'b1000;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 530
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111101111111, "Assert 376 : < Y !== 'b111101111111 >");	// Vector No: 230
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 531
#1;

I <= 'b1110;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111100000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 532
#1;

I <= 'b1000;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 533
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111011111111, "Assert 377 : < Y !== 'b111011111111 >");	// Vector No: 231
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 534
#1;

I <= 'b1110;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 535
#1;

I <= 'b1000;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 536
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b110111111111, "Assert 378 : < Y !== 'b110111111111 >");	// Vector No: 232
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 537
#1;

I <= 'b1110;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b110000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 538
#1;

I <= 'b1000;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 539
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b101111111111, "Assert 379 : < Y !== 'b101111111111 >");	// Vector No: 233
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 540
#1;

I <= 'b1110;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b100000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 541
#1;

I <= 'b1000;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 542
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b011111111111, "Assert 380 : < Y !== 'b011111111111 >");	// Vector No: 234
#1;

// **************************************************
// *****************************************
// *                                       *
// * TEST VECTORS FOR MICROPROGRAM COUNTER *
// *                                       *
// *****************************************
// ******* TEST CLEARING OPERATION ********
//------------------------

clk <= 1;		// Cycle No: 543
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 544
#1;

I <= 'b0001;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 381 : < Y !== 'b000000000000 >");	// Vector No: 235
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 545
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 546
#1;

I <= 'b0001;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 382 : < Y !== 'b000000000000 >");	// Vector No: 236
#1;

// **************************************************
// ******* TEST LOADING OPERATION ********
//------------------------

clk <= 1;		// Cycle No: 547
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 548
#1;

I <= 'b0001;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 383 : < Y !== 'b111111111111 >");	// Vector No: 237
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 549
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 550
#1;

I <= 'b0001;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 384 : < Y !== 'b000000000000 >");	// Vector No: 238
#1;

// **************************************************
// ******* TEST INCREMENT CARRY RIPPLE ********
//------------------------

clk <= 1;		// Cycle No: 551
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 1;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 552
#1;

I <= 'b0001;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000001, "Assert 385 : < Y !== 'b000000000001 >");	// Vector No: 239
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 553
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 1;
OEbar <= 0;
D <= 'b000000000001;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 554
#1;

I <= 'b0001;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000010, "Assert 386 : < Y !== 'b000000000010 >");	// Vector No: 240
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 555
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 1;
OEbar <= 0;
D <= 'b000000000011;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 556
#1;

I <= 'b0001;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000100, "Assert 387 : < Y !== 'b000000000100 >");	// Vector No: 241
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 557
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 1;
OEbar <= 0;
D <= 'b000000000111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 558
#1;

I <= 'b0001;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000001000, "Assert 388 : < Y !== 'b000000001000 >");	// Vector No: 242
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 559
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 1;
OEbar <= 0;
D <= 'b000000001111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 560
#1;

I <= 'b0001;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000010000, "Assert 389 : < Y !== 'b000000010000 >");	// Vector No: 243
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 561
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 1;
OEbar <= 0;
D <= 'b000000011111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 562
#1;

I <= 'b0001;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000100000, "Assert 390 : < Y !== 'b000000100000 >");	// Vector No: 244
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 563
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 1;
OEbar <= 0;
D <= 'b000000111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 564
#1;

I <= 'b0001;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000001000000, "Assert 391 : < Y !== 'b000001000000 >");	// Vector No: 245
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 565
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 1;
OEbar <= 0;
D <= 'b000001111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 566
#1;

I <= 'b0001;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000010000000, "Assert 392 : < Y !== 'b000010000000 >");	// Vector No: 246
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 567
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 1;
OEbar <= 0;
D <= 'b000011111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 568
#1;

I <= 'b0001;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000100000000, "Assert 393 : < Y !== 'b000100000000 >");	// Vector No: 247
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 569
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 1;
OEbar <= 0;
D <= 'b000111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 570
#1;

I <= 'b0001;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b001000000000, "Assert 394 : < Y !== 'b001000000000 >");	// Vector No: 248
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 571
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 1;
OEbar <= 0;
D <= 'b001111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 572
#1;

I <= 'b0001;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b010000000000, "Assert 395 : < Y !== 'b010000000000 >");	// Vector No: 249
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 573
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 1;
OEbar <= 0;
D <= 'b011111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 574
#1;

I <= 'b0001;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b100000000000, "Assert 396 : < Y !== 'b100000000000 >");	// Vector No: 250
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 575
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 1;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 576
#1;

I <= 'b0001;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 397 : < Y !== 'b000000000000 >");	// Vector No: 251
#1;

// **************************************************
// ********************************
// *                              *
// * TEST VECTORS FOR MULTIPLEXER *
// *                              *
// ********************************
// *************************
// ******* SELECT 0 ********
// *************************
// ** I = 0 **
//------------------------

clk <= 1;		// Cycle No: 577
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 578
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 398 : < Y !== 'b000000000000 >");	// Vector No: 252
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 579
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 580
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 399 : < Y !== 'b000000000000 >");	// Vector No: 253
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 581
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 582
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 400 : < Y !== 'b000000000000 >");	// Vector No: 254
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 583
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 584
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 401 : < Y !== 'b000000000000 >");	// Vector No: 255
#1;

// **************************************************
// **************************************************
//------------------------

clk <= 1;		// Cycle No: 585
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 586
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 402 : < Y !== 'b000000000000 >");	// Vector No: 256
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 587
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 588
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 403 : < Y !== 'b000000000000 >");	// Vector No: 257
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 589
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 590
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 404 : < Y !== 'b000000000000 >");	// Vector No: 258
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 591
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 592
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 405 : < Y !== 'b000000000000 >");	// Vector No: 259
#1;

// **************************************************
// **************************************************
//------------------------

clk <= 1;		// Cycle No: 593
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 594
#1;

I <= 'b0000;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 406 : < Y !== 'b000000000000 >");	// Vector No: 260
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 595
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 596
#1;

I <= 'b0000;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 407 : < Y !== 'b000000000000 >");	// Vector No: 261
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 597
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 598
#1;

I <= 'b0000;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 408 : < Y !== 'b000000000000 >");	// Vector No: 262
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 599
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 600
#1;

I <= 'b0000;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 409 : < Y !== 'b000000000000 >");	// Vector No: 263
#1;

// **************************************************
// **************************************************
//------------------------

clk <= 1;		// Cycle No: 601
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 602
#1;

I <= 'b0000;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 410 : < Y !== 'b000000000000 >");	// Vector No: 264
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 603
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 604
#1;

I <= 'b0000;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 411 : < Y !== 'b000000000000 >");	// Vector No: 265
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 605
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 606
#1;

I <= 'b0000;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 412 : < Y !== 'b000000000000 >");	// Vector No: 266
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 607
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 608
#1;

I <= 'b0000;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 413 : < Y !== 'b000000000000 >");	// Vector No: 267
#1;

// **************************************************
// **************************************************
// *************************
// ******* SELECT D ********
// *************************
// ** I = 1 **
//------------------------

clk <= 1;		// Cycle No: 609
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 610
#1;

I <= 'b0001;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 414 : < Y !== 'b000000000000 >");	// Vector No: 268
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 611
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 612
#1;

I <= 'b0001;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 415 : < Y !== 'b111111111111 >");	// Vector No: 269
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 613
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 614
#1;

I <= 'b0001;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 416 : < Y !== 'b000000000000 >");	// Vector No: 270
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 615
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 616
#1;

I <= 'b0001;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 417 : < Y !== 'b111111111111 >");	// Vector No: 271
#1;

// **************************************************
// **************************************************
//------------------------

clk <= 1;		// Cycle No: 617
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 618
#1;

I <= 'b0001;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 418 : < Y !== 'b000000000000 >");	// Vector No: 272
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 619
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 620
#1;

I <= 'b0001;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 419 : < Y !== 'b111111111111 >");	// Vector No: 273
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 621
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 622
#1;

I <= 'b0001;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 420 : < Y !== 'b000000000000 >");	// Vector No: 274
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 623
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 624
#1;

I <= 'b0001;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 421 : < Y !== 'b111111111111 >");	// Vector No: 275
#1;

// **************************************************
// **************************************************
//------------------------

clk <= 1;		// Cycle No: 625
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 626
#1;

I <= 'b0001;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 422 : < Y !== 'b000000000000 >");	// Vector No: 276
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 627
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 628
#1;

I <= 'b0001;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 423 : < Y !== 'b111111111111 >");	// Vector No: 277
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 629
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 630
#1;

I <= 'b0001;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 424 : < Y !== 'b000000000000 >");	// Vector No: 278
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 631
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 632
#1;

I <= 'b0001;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 425 : < Y !== 'b111111111111 >");	// Vector No: 279
#1;

// **************************************************
// **************************************************
// ** I = 2 **
//------------------------

clk <= 1;		// Cycle No: 633
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 634
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 426 : < Y !== 'b000000000000 >");	// Vector No: 280
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 635
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 636
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 427 : < Y !== 'b111111111111 >");	// Vector No: 281
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 637
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 638
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 428 : < Y !== 'b000000000000 >");	// Vector No: 282
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 639
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 640
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 429 : < Y !== 'b111111111111 >");	// Vector No: 283
#1;

// **************************************************
// **************************************************
//------------------------

clk <= 1;		// Cycle No: 641
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 642
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 430 : < Y !== 'b000000000000 >");	// Vector No: 284
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 643
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 644
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 431 : < Y !== 'b111111111111 >");	// Vector No: 285
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 645
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 646
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 432 : < Y !== 'b000000000000 >");	// Vector No: 286
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 647
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 648
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 433 : < Y !== 'b111111111111 >");	// Vector No: 287
#1;

// **************************************************
// **************************************************
//------------------------

clk <= 1;		// Cycle No: 649
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 650
#1;

I <= 'b0010;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 434 : < Y !== 'b000000000000 >");	// Vector No: 288
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 651
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 652
#1;

I <= 'b0010;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 435 : < Y !== 'b111111111111 >");	// Vector No: 289
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 653
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 654
#1;

I <= 'b0010;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 436 : < Y !== 'b000000000000 >");	// Vector No: 290
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 655
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 656
#1;

I <= 'b0010;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 437 : < Y !== 'b111111111111 >");	// Vector No: 291
#1;

// **************************************************
// **************************************************
//------------------------

clk <= 1;		// Cycle No: 657
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 658
#1;

I <= 'b0010;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 438 : < Y !== 'b000000000000 >");	// Vector No: 292
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 659
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 660
#1;

I <= 'b0010;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 439 : < Y !== 'b111111111111 >");	// Vector No: 293
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 661
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 662
#1;

I <= 'b0010;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 440 : < Y !== 'b000000000000 >");	// Vector No: 294
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 663
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 664
#1;

I <= 'b0010;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 441 : < Y !== 'b111111111111 >");	// Vector No: 295
#1;

// **************************************************
// **************************************************
// ** I = 3 **
//------------------------

clk <= 1;		// Cycle No: 665
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 666
#1;

I <= 'b0011;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 442 : < Y !== 'b000000000000 >");	// Vector No: 296
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 667
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 668
#1;

I <= 'b0011;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 443 : < Y !== 'b111111111111 >");	// Vector No: 297
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 669
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 670
#1;

I <= 'b0011;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 444 : < Y !== 'b000000000000 >");	// Vector No: 298
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 671
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 672
#1;

I <= 'b0011;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 445 : < Y !== 'b111111111111 >");	// Vector No: 299
#1;

// **************************************************
// **************************************************
//------------------------

clk <= 1;		// Cycle No: 673
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 674
#1;

I <= 'b0011;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 446 : < Y !== 'b000000000000 >");	// Vector No: 300
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 675
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 676
#1;

I <= 'b0011;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 447 : < Y !== 'b111111111111 >");	// Vector No: 301
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 677
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 678
#1;

I <= 'b0011;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 448 : < Y !== 'b000000000000 >");	// Vector No: 302
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 679
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 680
#1;

I <= 'b0011;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 449 : < Y !== 'b111111111111 >");	// Vector No: 303
#1;

// **************************************************
// **************************************************
//------------------------

clk <= 1;		// Cycle No: 681
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 682
#1;

I <= 'b0011;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 450 : < Y !== 'b000000000000 >");	// Vector No: 304
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 683
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 684
#1;

I <= 'b0011;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 451 : < Y !== 'b111111111111 >");	// Vector No: 305
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 685
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 686
#1;

I <= 'b0011;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 452 : < Y !== 'b000000000000 >");	// Vector No: 306
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 687
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 688
#1;

I <= 'b0011;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 453 : < Y !== 'b111111111111 >");	// Vector No: 307
#1;

// **************************************************
// **************************************************
// ** I = 5 **
//------------------------

clk <= 1;		// Cycle No: 689
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 690
#1;

I <= 'b0101;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 454 : < Y !== 'b000000000000 >");	// Vector No: 308
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 691
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 692
#1;

I <= 'b0101;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 455 : < Y !== 'b111111111111 >");	// Vector No: 309
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 693
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 694
#1;

I <= 'b0101;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 456 : < Y !== 'b000000000000 >");	// Vector No: 310
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 695
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 696
#1;

I <= 'b0101;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 457 : < Y !== 'b111111111111 >");	// Vector No: 311
#1;

// **************************************************
// **************************************************
//------------------------

clk <= 1;		// Cycle No: 697
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 698
#1;

I <= 'b0101;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 458 : < Y !== 'b000000000000 >");	// Vector No: 312
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 699
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 700
#1;

I <= 'b0101;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 459 : < Y !== 'b111111111111 >");	// Vector No: 313
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 701
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 702
#1;

I <= 'b0101;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 460 : < Y !== 'b000000000000 >");	// Vector No: 314
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 703
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 704
#1;

I <= 'b0101;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 461 : < Y !== 'b111111111111 >");	// Vector No: 315
#1;

// **************************************************
// **************************************************
//------------------------

clk <= 1;		// Cycle No: 705
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 706
#1;

I <= 'b0101;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 462 : < Y !== 'b000000000000 >");	// Vector No: 316
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 707
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 708
#1;

I <= 'b0101;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 463 : < Y !== 'b111111111111 >");	// Vector No: 317
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 709
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 710
#1;

I <= 'b0101;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 464 : < Y !== 'b000000000000 >");	// Vector No: 318
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 711
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 712
#1;

I <= 'b0101;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 465 : < Y !== 'b111111111111 >");	// Vector No: 319
#1;

// **************************************************
// **************************************************
// ** I = 6 **
//------------------------

clk <= 1;		// Cycle No: 713
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 714
#1;

I <= 'b0110;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 466 : < Y !== 'b000000000000 >");	// Vector No: 320
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 715
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 716
#1;

I <= 'b0110;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 467 : < Y !== 'b111111111111 >");	// Vector No: 321
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 717
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 718
#1;

I <= 'b0110;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 468 : < Y !== 'b000000000000 >");	// Vector No: 322
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 719
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 720
#1;

I <= 'b0110;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 469 : < Y !== 'b111111111111 >");	// Vector No: 323
#1;

// **************************************************
// **************************************************
//------------------------

clk <= 1;		// Cycle No: 721
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 722
#1;

I <= 'b0110;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 470 : < Y !== 'b000000000000 >");	// Vector No: 324
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 723
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 724
#1;

I <= 'b0110;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 471 : < Y !== 'b111111111111 >");	// Vector No: 325
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 725
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 726
#1;

I <= 'b0110;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 472 : < Y !== 'b000000000000 >");	// Vector No: 326
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 727
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 728
#1;

I <= 'b0110;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 473 : < Y !== 'b111111111111 >");	// Vector No: 327
#1;

// **************************************************
// **************************************************
//------------------------

clk <= 1;		// Cycle No: 729
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 730
#1;

I <= 'b0110;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 474 : < Y !== 'b000000000000 >");	// Vector No: 328
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 731
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 732
#1;

I <= 'b0110;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 475 : < Y !== 'b111111111111 >");	// Vector No: 329
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 733
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 734
#1;

I <= 'b0110;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 476 : < Y !== 'b000000000000 >");	// Vector No: 330
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 735
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 736
#1;

I <= 'b0110;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 477 : < Y !== 'b111111111111 >");	// Vector No: 331
#1;

// **************************************************
// **************************************************
// ** I = 7 **
//------------------------

clk <= 1;		// Cycle No: 737
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 738
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 478 : < Y !== 'b000000000000 >");	// Vector No: 332
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 739
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 740
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 479 : < Y !== 'b111111111111 >");	// Vector No: 333
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 741
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 742
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 480 : < Y !== 'b000000000000 >");	// Vector No: 334
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 743
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 744
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 481 : < Y !== 'b111111111111 >");	// Vector No: 335
#1;

// **************************************************
// **************************************************
//------------------------

clk <= 1;		// Cycle No: 745
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 746
#1;

I <= 'b0111;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 482 : < Y !== 'b000000000000 >");	// Vector No: 336
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 747
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 748
#1;

I <= 'b0111;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 483 : < Y !== 'b111111111111 >");	// Vector No: 337
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 749
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 750
#1;

I <= 'b0111;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 484 : < Y !== 'b000000000000 >");	// Vector No: 338
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 751
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 752
#1;

I <= 'b0111;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 485 : < Y !== 'b111111111111 >");	// Vector No: 339
#1;

// **************************************************
// **************************************************
//------------------------

clk <= 1;		// Cycle No: 753
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 754
#1;

I <= 'b0111;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 486 : < Y !== 'b000000000000 >");	// Vector No: 340
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 755
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 756
#1;

I <= 'b0111;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 487 : < Y !== 'b111111111111 >");	// Vector No: 341
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 757
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 758
#1;

I <= 'b0111;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 488 : < Y !== 'b000000000000 >");	// Vector No: 342
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 759
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 760
#1;

I <= 'b0111;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 489 : < Y !== 'b111111111111 >");	// Vector No: 343
#1;

// **************************************************
// **************************************************
// ** I = 9 **
//------------------------

clk <= 1;		// Cycle No: 761
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 762
#1;

I <= 'b1001;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 490 : < Y !== 'b000000000000 >");	// Vector No: 344
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 763
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 764
#1;

I <= 'b1001;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 491 : < Y !== 'b111111111111 >");	// Vector No: 345
#1;

// **************************************************
// **************************************************
//------------------------

clk <= 1;		// Cycle No: 765
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 766
#1;

I <= 'b1001;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 492 : < Y !== 'b000000000000 >");	// Vector No: 346
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 767
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 768
#1;

I <= 'b1001;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 493 : < Y !== 'b111111111111 >");	// Vector No: 347
#1;

// **************************************************
// **************************************************
//------------------------

clk <= 1;		// Cycle No: 769
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 770
#1;

I <= 'b1001;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 494 : < Y !== 'b000000000000 >");	// Vector No: 348
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 771
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 772
#1;

I <= 'b1001;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 495 : < Y !== 'b111111111111 >");	// Vector No: 349
#1;

// **************************************************
// **************************************************
//------------------------

clk <= 1;		// Cycle No: 773
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 774
#1;

I <= 'b1001;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 496 : < Y !== 'b000000000000 >");	// Vector No: 350
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 775
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 776
#1;

I <= 'b1001;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 497 : < Y !== 'b111111111111 >");	// Vector No: 351
#1;

// **************************************************
// **************************************************
// ** I = 11 **
//------------------------

clk <= 1;		// Cycle No: 777
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 778
#1;

I <= 'b1011;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 498 : < Y !== 'b000000000000 >");	// Vector No: 352
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 779
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 780
#1;

I <= 'b1011;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 499 : < Y !== 'b111111111111 >");	// Vector No: 353
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 781
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 782
#1;

I <= 'b1011;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 500 : < Y !== 'b000000000000 >");	// Vector No: 354
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 783
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 784
#1;

I <= 'b1011;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 501 : < Y !== 'b111111111111 >");	// Vector No: 355
#1;

// **************************************************
// **************************************************
//------------------------

clk <= 1;		// Cycle No: 785
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 786
#1;

I <= 'b1011;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 502 : < Y !== 'b000000000000 >");	// Vector No: 356
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 787
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 788
#1;

I <= 'b1011;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 503 : < Y !== 'b111111111111 >");	// Vector No: 357
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 789
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 790
#1;

I <= 'b1011;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 504 : < Y !== 'b000000000000 >");	// Vector No: 358
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 791
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 792
#1;

I <= 'b1011;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 505 : < Y !== 'b111111111111 >");	// Vector No: 359
#1;

// **************************************************
// **************************************************
//------------------------

clk <= 1;		// Cycle No: 793
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 794
#1;

I <= 'b1011;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 506 : < Y !== 'b000000000000 >");	// Vector No: 360
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 795
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 796
#1;

I <= 'b1011;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 507 : < Y !== 'b111111111111 >");	// Vector No: 361
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 797
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 798
#1;

I <= 'b1011;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 508 : < Y !== 'b000000000000 >");	// Vector No: 362
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 799
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 800
#1;

I <= 'b1011;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 509 : < Y !== 'b111111111111 >");	// Vector No: 363
#1;

// **************************************************
// **************************************************
// ** I = 15 **
//------------------------

clk <= 1;		// Cycle No: 801
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 802
#1;

I <= 'b1111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 510 : < Y !== 'b000000000000 >");	// Vector No: 364
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 803
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 804
#1;

I <= 'b1111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 511 : < Y !== 'b111111111111 >");	// Vector No: 365
#1;

// **************************************************
// **************************************************
// ***************************
// ******* SELECT REG ********
// ***************************
// ** I = 5 **
//------------------------

clk <= 1;		// Cycle No: 805
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 806
#1;

I <= 'b0101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 512 : < Y !== 'b000000000000 >");	// Vector No: 366
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 807
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 808
#1;

I <= 'b0101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 513 : < Y !== 'b111111111111 >");	// Vector No: 367
#1;

// **************************************************
// ** I = 7 **
//------------------------

clk <= 1;		// Cycle No: 809
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 810
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 514 : < Y !== 'b000000000000 >");	// Vector No: 368
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 811
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 812
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 515 : < Y !== 'b111111111111 >");	// Vector No: 369
#1;

// **************************************************
// ******* SELECT STACK ********
// *****************************
// ** I = 8 **
//------------------------

clk <= 1;		// Cycle No: 813
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 814
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 815
#1;

I <= 'b0001;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 816
#1;

I <= 'b1010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 516 : < Y !== 'b000000000000 >");	// Vector No: 370
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 817
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 818
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 819
#1;

I <= 'b0001;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 820
#1;

I <= 'b1010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 517 : < Y !== 'b111111111111 >");	// Vector No: 371
#1;

// **************************************************
// **************************************************
//------------------------

clk <= 1;		// Cycle No: 821
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 822
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 823
#1;

I <= 'b0001;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 824
#1;

I <= 'b1010;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 518 : < Y !== 'b000000000000 >");	// Vector No: 372
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 825
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 826
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 827
#1;

I <= 'b0001;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 828
#1;

I <= 'b1010;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 519 : < Y !== 'b111111111111 >");	// Vector No: 373
#1;

// **************************************************
// **************************************************
//------------------------

clk <= 1;		// Cycle No: 829
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 830
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 831
#1;

I <= 'b0001;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 832
#1;

I <= 'b1010;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 520 : < Y !== 'b000000000000 >");	// Vector No: 374
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 833
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 834
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 835
#1;

I <= 'b0001;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 836
#1;

I <= 'b1010;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 521 : < Y !== 'b111111111111 >");	// Vector No: 375
#1;

// **************************************************
// **************************************************
//------------------------

clk <= 1;		// Cycle No: 837
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 838
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 839
#1;

I <= 'b0001;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 840
#1;

I <= 'b1010;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 522 : < Y !== 'b000000000000 >");	// Vector No: 376
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 841
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 842
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 843
#1;

I <= 'b0001;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 844
#1;

I <= 'b1010;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 523 : < Y !== 'b111111111111 >");	// Vector No: 377
#1;

// **************************************************
// **************************************************
// ** I = 10 **
//------------------------

clk <= 1;		// Cycle No: 845
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 846
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 847
#1;

I <= 'b0001;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 848
#1;

I <= 'b1010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 524 : < Y !== 'b000000000000 >");	// Vector No: 378
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 849
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 850
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 851
#1;

I <= 'b0001;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 852
#1;

I <= 'b1010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 525 : < Y !== 'b111111111111 >");	// Vector No: 379
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 853
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 854
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 855
#1;

I <= 'b0001;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 856
#1;

I <= 'b1010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 526 : < Y !== 'b000000000000 >");	// Vector No: 380
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 857
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 858
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 859
#1;

I <= 'b0001;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 860
#1;

I <= 'b1010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 527 : < Y !== 'b111111111111 >");	// Vector No: 381
#1;

// **************************************************
// **************************************************
//------------------------

clk <= 1;		// Cycle No: 861
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 862
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 863
#1;

I <= 'b0001;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 864
#1;

I <= 'b1010;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 528 : < Y !== 'b000000000000 >");	// Vector No: 382
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 865
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 866
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 867
#1;

I <= 'b0001;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 868
#1;

I <= 'b1010;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 529 : < Y !== 'b111111111111 >");	// Vector No: 383
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 869
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 870
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 871
#1;

I <= 'b0001;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 872
#1;

I <= 'b1010;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 530 : < Y !== 'b000000000000 >");	// Vector No: 384
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 873
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 874
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 875
#1;

I <= 'b0001;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 876
#1;

I <= 'b1010;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 531 : < Y !== 'b111111111111 >");	// Vector No: 385
#1;

// **************************************************
// **************************************************
//------------------------

clk <= 1;		// Cycle No: 877
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 878
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 879
#1;

I <= 'b0001;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 880
#1;

I <= 'b1010;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 532 : < Y !== 'b000000000000 >");	// Vector No: 386
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 881
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 882
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 883
#1;

I <= 'b0001;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 884
#1;

I <= 'b1010;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 533 : < Y !== 'b111111111111 >");	// Vector No: 387
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 885
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 886
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 887
#1;

I <= 'b0001;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 888
#1;

I <= 'b1010;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 534 : < Y !== 'b000000000000 >");	// Vector No: 388
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 889
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 890
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 891
#1;

I <= 'b0001;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 892
#1;

I <= 'b1010;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 535 : < Y !== 'b111111111111 >");	// Vector No: 389
#1;

// **************************************************
// **************************************************
// ** I = 13 **
//------------------------

clk <= 1;		// Cycle No: 893
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 894
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 895
#1;

I <= 'b0001;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 896
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 536 : < Y !== 'b000000000000 >");	// Vector No: 390
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 897
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 898
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 899
#1;

I <= 'b0001;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 900
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 537 : < Y !== 'b111111111111 >");	// Vector No: 391
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 901
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 902
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 903
#1;

I <= 'b0001;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 904
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 538 : < Y !== 'b000000000000 >");	// Vector No: 392
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 905
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 906
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 907
#1;

I <= 'b0001;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 908
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 539 : < Y !== 'b111111111111 >");	// Vector No: 393
#1;

// **************************************************
// ** I = 15 **
//------------------------

clk <= 1;		// Cycle No: 909
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 910
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 911
#1;

I <= 'b0001;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 912
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 540 : < Y !== 'b000000000000 >");	// Vector No: 394
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 913
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 914
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 915
#1;

I <= 'b0001;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 916
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 541 : < Y !== 'b111111111111 >");	// Vector No: 395
#1;

// **************************************************
// ***************************
// ******* SELECT uPC ********
// ***************************
// ** I = 1 **
//------------------------

clk <= 1;		// Cycle No: 917
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 918
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 919
#1;

I <= 'b0001;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 542 : < Y !== 'b000000000000 >");	// Vector No: 396
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 920
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 921
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 922
#1;

I <= 'b0001;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 543 : < Y !== 'b111111111111 >");	// Vector No: 397
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 923
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 924
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 925
#1;

I <= 'b0001;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 544 : < Y !== 'b000000000000 >");	// Vector No: 398
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 926
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 927
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 928
#1;

I <= 'b0001;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 545 : < Y !== 'b111111111111 >");	// Vector No: 399
#1;

// **************************************************
// **************************************************
// ** I = 3 **
//------------------------

clk <= 1;		// Cycle No: 929
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 930
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 931
#1;

I <= 'b0011;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 546 : < Y !== 'b000000000000 >");	// Vector No: 400
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 932
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 933
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 934
#1;

I <= 'b0011;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 547 : < Y !== 'b111111111111 >");	// Vector No: 401
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 935
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 936
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 937
#1;

I <= 'b0011;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 548 : < Y !== 'b000000000000 >");	// Vector No: 402
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 938
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 939
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 940
#1;

I <= 'b0011;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 549 : < Y !== 'b111111111111 >");	// Vector No: 403
#1;

// **************************************************
// **************************************************
// ** I = 4 **
//------------------------

clk <= 1;		// Cycle No: 941
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 942
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 943
#1;

I <= 'b0100;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 550 : < Y !== 'b000000000000 >");	// Vector No: 404
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 944
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 945
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 946
#1;

I <= 'b0100;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 551 : < Y !== 'b111111111111 >");	// Vector No: 405
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 947
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 948
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 949
#1;

I <= 'b0100;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 552 : < Y !== 'b000000000000 >");	// Vector No: 406
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 950
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 951
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 952
#1;

I <= 'b0100;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 553 : < Y !== 'b111111111111 >");	// Vector No: 407
#1;

// **************************************************
// **************************************************
//------------------------

clk <= 1;		// Cycle No: 953
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 954
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 955
#1;

I <= 'b0100;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 554 : < Y !== 'b000000000000 >");	// Vector No: 408
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 956
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 957
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 958
#1;

I <= 'b0100;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 555 : < Y !== 'b111111111111 >");	// Vector No: 409
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 959
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 960
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 961
#1;

I <= 'b0100;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 556 : < Y !== 'b000000000000 >");	// Vector No: 410
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 962
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 963
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 964
#1;

I <= 'b0100;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 557 : < Y !== 'b111111111111 >");	// Vector No: 411
#1;

// **************************************************
// **************************************************
//------------------------

clk <= 1;		// Cycle No: 965
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 966
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 967
#1;

I <= 'b0100;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 558 : < Y !== 'b000000000000 >");	// Vector No: 412
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 968
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 969
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 970
#1;

I <= 'b0100;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 559 : < Y !== 'b111111111111 >");	// Vector No: 413
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 971
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 972
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 973
#1;

I <= 'b0100;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 560 : < Y !== 'b000000000000 >");	// Vector No: 414
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 974
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 975
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 976
#1;

I <= 'b0100;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 561 : < Y !== 'b111111111111 >");	// Vector No: 415
#1;

// **************************************************
// **************************************************
//------------------------

clk <= 1;		// Cycle No: 977
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 978
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 979
#1;

I <= 'b0100;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 562 : < Y !== 'b000000000000 >");	// Vector No: 416
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 980
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 981
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 982
#1;

I <= 'b0100;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 563 : < Y !== 'b111111111111 >");	// Vector No: 417
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 983
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 984
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 985
#1;

I <= 'b0100;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 564 : < Y !== 'b000000000000 >");	// Vector No: 418
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 986
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 987
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 988
#1;

I <= 'b0100;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 565 : < Y !== 'b111111111111 >");	// Vector No: 419
#1;

// **************************************************
// **************************************************
// ** I = 6 **
//------------------------

clk <= 1;		// Cycle No: 989
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 990
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 991
#1;

I <= 'b0110;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 566 : < Y !== 'b000000000000 >");	// Vector No: 420
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 992
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 993
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 994
#1;

I <= 'b0110;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 567 : < Y !== 'b111111111111 >");	// Vector No: 421
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 995
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 996
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 997
#1;

I <= 'b0110;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 568 : < Y !== 'b000000000000 >");	// Vector No: 422
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 998
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 999
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1000
#1;

I <= 'b0110;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 569 : < Y !== 'b111111111111 >");	// Vector No: 423
#1;

// **************************************************
// **************************************************
// ** I = 8 **
//------------------------

clk <= 1;		// Cycle No: 1001
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1002
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1003
#1;

I <= 'b1000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 570 : < Y !== 'b000000000000 >");	// Vector No: 424
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1004
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1005
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1006
#1;

I <= 'b1000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 571 : < Y !== 'b111111111111 >");	// Vector No: 425
#1;

// **************************************************
// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1007
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1008
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1009
#1;

I <= 'b1000;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 572 : < Y !== 'b000000000000 >");	// Vector No: 426
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1010
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1011
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1012
#1;

I <= 'b1000;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 573 : < Y !== 'b111111111111 >");	// Vector No: 427
#1;

// **************************************************
// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1013
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1014
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1015
#1;

I <= 'b1000;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 574 : < Y !== 'b000000000000 >");	// Vector No: 428
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1016
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1017
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1018
#1;

I <= 'b1000;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 575 : < Y !== 'b111111111111 >");	// Vector No: 429
#1;

// **************************************************
// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1019
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1020
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1021
#1;

I <= 'b1000;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 576 : < Y !== 'b000000000000 >");	// Vector No: 430
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1022
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1023
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1024
#1;

I <= 'b1000;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 577 : < Y !== 'b111111111111 >");	// Vector No: 431
#1;

// **************************************************
// **************************************************
// ** I = 9 **
//------------------------

clk <= 1;		// Cycle No: 1025
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1026
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1027
#1;

I <= 'b1001;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 578 : < Y !== 'b000000000000 >");	// Vector No: 432
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1028
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1029
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1030
#1;

I <= 'b1001;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 579 : < Y !== 'b111111111111 >");	// Vector No: 433
#1;

// **************************************************
// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1031
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1032
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1033
#1;

I <= 'b1001;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 580 : < Y !== 'b000000000000 >");	// Vector No: 434
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1034
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1035
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1036
#1;

I <= 'b1001;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 581 : < Y !== 'b111111111111 >");	// Vector No: 435
#1;

// **************************************************
// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1037
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1038
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1039
#1;

I <= 'b1001;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 582 : < Y !== 'b000000000000 >");	// Vector No: 436
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1040
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1041
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1042
#1;

I <= 'b1001;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 583 : < Y !== 'b111111111111 >");	// Vector No: 437
#1;

// **************************************************
// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1043
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1044
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1045
#1;

I <= 'b1001;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 584 : < Y !== 'b000000000000 >");	// Vector No: 438
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1046
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1047
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1048
#1;

I <= 'b1001;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 585 : < Y !== 'b111111111111 >");	// Vector No: 439
#1;

// **************************************************
// **************************************************
// ** I = 10 **
//------------------------

clk <= 1;		// Cycle No: 1049
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1050
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1051
#1;

I <= 'b1010;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 586 : < Y !== 'b000000000000 >");	// Vector No: 440
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1052
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1053
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1054
#1;

I <= 'b1010;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 587 : < Y !== 'b111111111111 >");	// Vector No: 441
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1055
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1056
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1057
#1;

I <= 'b1010;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 588 : < Y !== 'b000000000000 >");	// Vector No: 442
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1058
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1059
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1060
#1;

I <= 'b1010;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 589 : < Y !== 'b111111111111 >");	// Vector No: 443
#1;

// **************************************************
// **************************************************
// ** I = 11 **
//------------------------

clk <= 1;		// Cycle No: 1061
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1062
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1063
#1;

I <= 'b1011;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 590 : < Y !== 'b000000000000 >");	// Vector No: 444
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1064
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1065
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1066
#1;

I <= 'b1011;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 591 : < Y !== 'b111111111111 >");	// Vector No: 445
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1067
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1068
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1069
#1;

I <= 'b1011;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 592 : < Y !== 'b000000000000 >");	// Vector No: 446
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1070
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1071
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1072
#1;

I <= 'b1011;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 593 : < Y !== 'b111111111111 >");	// Vector No: 447
#1;

// **************************************************
// **************************************************
// ** I = 12 **
//------------------------

clk <= 1;		// Cycle No: 1073
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1074
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1075
#1;

I <= 'b1100;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 594 : < Y !== 'b000000000000 >");	// Vector No: 448
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1076
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1077
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1078
#1;

I <= 'b1100;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 595 : < Y !== 'b111111111111 >");	// Vector No: 449
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1079
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1080
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1081
#1;

I <= 'b1100;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 596 : < Y !== 'b000000000000 >");	// Vector No: 450
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1082
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1083
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1084
#1;

I <= 'b1100;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 597 : < Y !== 'b111111111111 >");	// Vector No: 451
#1;

// **************************************************
// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1085
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1086
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1087
#1;

I <= 'b1100;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 598 : < Y !== 'b000000000000 >");	// Vector No: 452
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1088
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1089
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1090
#1;

I <= 'b1100;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 599 : < Y !== 'b111111111111 >");	// Vector No: 453
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1091
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1092
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1093
#1;

I <= 'b1100;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 600 : < Y !== 'b000000000000 >");	// Vector No: 454
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1094
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1095
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1096
#1;

I <= 'b1100;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 601 : < Y !== 'b111111111111 >");	// Vector No: 455
#1;

// **************************************************
// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1097
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1098
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1099
#1;

I <= 'b1100;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 602 : < Y !== 'b000000000000 >");	// Vector No: 456
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1100
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1101
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1102
#1;

I <= 'b1100;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 603 : < Y !== 'b111111111111 >");	// Vector No: 457
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1103
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1104
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1105
#1;

I <= 'b1100;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 604 : < Y !== 'b000000000000 >");	// Vector No: 458
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1106
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1107
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1108
#1;

I <= 'b1100;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 605 : < Y !== 'b111111111111 >");	// Vector No: 459
#1;

// **************************************************
// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1109
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1110
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1111
#1;

I <= 'b1100;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 606 : < Y !== 'b000000000000 >");	// Vector No: 460
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1112
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1113
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1114
#1;

I <= 'b1100;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 607 : < Y !== 'b111111111111 >");	// Vector No: 461
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1115
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1116
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1117
#1;

I <= 'b1100;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 608 : < Y !== 'b000000000000 >");	// Vector No: 462
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1118
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1119
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1120
#1;

I <= 'b1100;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 609 : < Y !== 'b111111111111 >");	// Vector No: 463
#1;

// **************************************************
// **************************************************
// ** I = 13 **
//------------------------

clk <= 1;		// Cycle No: 1121
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1122
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1123
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 610 : < Y !== 'b000000000000 >");	// Vector No: 464
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1124
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1125
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1126
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 611 : < Y !== 'b111111111111 >");	// Vector No: 465
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1127
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1128
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1129
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 612 : < Y !== 'b000000000000 >");	// Vector No: 466
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1130
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1131
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1132
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 613 : < Y !== 'b111111111111 >");	// Vector No: 467
#1;

// **************************************************
// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1133
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1134
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1135
#1;

I <= 'b1101;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 614 : < Y !== 'b000000000000 >");	// Vector No: 468
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1136
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1137
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1138
#1;

I <= 'b1101;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 615 : < Y !== 'b111111111111 >");	// Vector No: 469
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1139
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1140
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1141
#1;

I <= 'b1101;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 616 : < Y !== 'b000000000000 >");	// Vector No: 470
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1142
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1143
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1144
#1;

I <= 'b1101;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 617 : < Y !== 'b111111111111 >");	// Vector No: 471
#1;

// **************************************************
// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1145
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1146
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1147
#1;

I <= 'b1101;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 618 : < Y !== 'b000000000000 >");	// Vector No: 472
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1148
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1149
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1150
#1;

I <= 'b1101;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 619 : < Y !== 'b111111111111 >");	// Vector No: 473
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1151
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1152
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1153
#1;

I <= 'b1101;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 620 : < Y !== 'b000000000000 >");	// Vector No: 474
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1154
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1155
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1156
#1;

I <= 'b1101;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 621 : < Y !== 'b111111111111 >");	// Vector No: 475
#1;

// **************************************************
// **************************************************
// ** I = 14 **
//------------------------

clk <= 1;		// Cycle No: 1157
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1158
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1159
#1;

I <= 'b1110;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 622 : < Y !== 'b000000000000 >");	// Vector No: 476
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1160
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1161
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1162
#1;

I <= 'b1110;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 623 : < Y !== 'b111111111111 >");	// Vector No: 477
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1163
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1164
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1165
#1;

I <= 'b1110;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 624 : < Y !== 'b000000000000 >");	// Vector No: 478
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1166
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1167
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1168
#1;

I <= 'b1110;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 625 : < Y !== 'b111111111111 >");	// Vector No: 479
#1;

// **************************************************
// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1169
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1170
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1171
#1;

I <= 'b1110;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 626 : < Y !== 'b000000000000 >");	// Vector No: 480
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1172
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1173
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1174
#1;

I <= 'b1110;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 627 : < Y !== 'b111111111111 >");	// Vector No: 481
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1175
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1176
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1177
#1;

I <= 'b1110;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 628 : < Y !== 'b000000000000 >");	// Vector No: 482
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1178
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1179
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1180
#1;

I <= 'b1110;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 629 : < Y !== 'b111111111111 >");	// Vector No: 483
#1;

// **************************************************
// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1181
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1182
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1183
#1;

I <= 'b1110;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 630 : < Y !== 'b000000000000 >");	// Vector No: 484
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1184
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1185
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1186
#1;

I <= 'b1110;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 631 : < Y !== 'b111111111111 >");	// Vector No: 485
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1187
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1188
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1189
#1;

I <= 'b1110;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 632 : < Y !== 'b000000000000 >");	// Vector No: 486
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1190
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1191
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1192
#1;

I <= 'b1110;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 633 : < Y !== 'b111111111111 >");	// Vector No: 487
#1;

// **************************************************
// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1193
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1194
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1195
#1;

I <= 'b1110;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 634 : < Y !== 'b000000000000 >");	// Vector No: 488
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1196
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1197
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1198
#1;

I <= 'b1110;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 635 : < Y !== 'b111111111111 >");	// Vector No: 489
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1199
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1200
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1201
#1;

I <= 'b1110;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 636 : < Y !== 'b000000000000 >");	// Vector No: 490
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1202
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1203
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1204
#1;

I <= 'b1110;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 637 : < Y !== 'b111111111111 >");	// Vector No: 491
#1;

// **************************************************
// **************************************************
// ** I = 15 **
//------------------------

clk <= 1;		// Cycle No: 1205
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1206
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1207
#1;

I <= 'b1111;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 638 : < Y !== 'b000000000000 >");	// Vector No: 492
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1208
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1209
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1210
#1;

I <= 'b1111;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 639 : < Y !== 'b111111111111 >");	// Vector No: 493
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1211
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1212
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1213
#1;

I <= 'b1111;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 640 : < Y !== 'b000000000000 >");	// Vector No: 494
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1214
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1215
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1216
#1;

I <= 'b1111;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 641 : < Y !== 'b111111111111 >");	// Vector No: 495
#1;

// **************************************************
// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1217
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1218
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1219
#1;

I <= 'b1111;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 642 : < Y !== 'b000000000000 >");	// Vector No: 496
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1220
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1221
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1222
#1;

I <= 'b1111;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 643 : < Y !== 'b111111111111 >");	// Vector No: 497
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1223
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1224
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1225
#1;

I <= 'b1111;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 644 : < Y !== 'b000000000000 >");	// Vector No: 498
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1226
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1227
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1228
#1;

I <= 'b1111;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 645 : < Y !== 'b111111111111 >");	// Vector No: 499
#1;

// **************************************************
// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1229
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1230
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1231
#1;

I <= 'b1111;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 646 : < Y !== 'b000000000000 >");	// Vector No: 500
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1232
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1233
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1234
#1;

I <= 'b1111;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 647 : < Y !== 'b111111111111 >");	// Vector No: 501
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1235
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1236
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1237
#1;

I <= 'b1111;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 648 : < Y !== 'b000000000000 >");	// Vector No: 502
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1238
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1239
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1240
#1;

I <= 'b1111;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 649 : < Y !== 'b111111111111 >");	// Vector No: 503
#1;

// **************************************************
// **************************************************
// *************************************
// *                                   *
// * TEST VECTORS FOR TRI-STATE-DRIVER *
// *                                   *
// *************************************
//------------------------

clk <= 1;		// Cycle No: 1241
#1;

I <= 'b0001;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'b000000000000, "Assert 650 : < Y !== 'b000000000000 >");	// Vector No: 504
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1242
#1;

I <= 'b0001;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'b111111111111, "Assert 651 : < Y !== 'b111111111111 >");	// Vector No: 505
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1243
#1;

I <= 'b0001;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 1;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

verify(Y === 'z, "Assert 652 : < Y !== 'z >");	// Vector No: 506
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1244
#1;

I <= 'b0001;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 1;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

verify(Y === 'z, "Assert 653 : < Y !== 'z >");	// Vector No: 507
#1;

// **************************************************
// *************************************
// *                                   *
// * TEST VECTORS FOR ENABLE SIGNALS   *
// *                                   *
// *************************************
// ****** I = 0 *******
// *** R = 0 ***
//------------------------

clk <= 1;		// Cycle No: 1245
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1246
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 654 : < PLbar !== 0 >");	// Vector No: 508
verify(VECTbar === 1, "Assert 655 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 656 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1247
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1248
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 657 : < PLbar !== 0 >");	// Vector No: 509
verify(VECTbar === 1, "Assert 658 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 659 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1249
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1250
#1;

I <= 'b0000;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 660 : < PLbar !== 0 >");	// Vector No: 510
verify(VECTbar === 1, "Assert 661 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 662 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1251
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1252
#1;

I <= 'b0000;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 663 : < PLbar !== 0 >");	// Vector No: 511
verify(VECTbar === 1, "Assert 664 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 665 : < MAPbar !== 1 >");
#1;

// **************************************************
// *** R = 1 ***
//------------------------

clk <= 1;		// Cycle No: 1253
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1254
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 666 : < PLbar !== 0 >");	// Vector No: 512
verify(VECTbar === 1, "Assert 667 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 668 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1255
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1256
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 669 : < PLbar !== 0 >");	// Vector No: 513
verify(VECTbar === 1, "Assert 670 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 671 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1257
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1258
#1;

I <= 'b0000;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 672 : < PLbar !== 0 >");	// Vector No: 514
verify(VECTbar === 1, "Assert 673 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 674 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1259
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1260
#1;

I <= 'b0000;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 675 : < PLbar !== 0 >");	// Vector No: 515
verify(VECTbar === 1, "Assert 676 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 677 : < MAPbar !== 1 >");
#1;

// **************************************************
// ****** I = 1 *******
// *** R = 0 ***
//------------------------

clk <= 1;		// Cycle No: 1261
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1262
#1;

I <= 'b0001;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 678 : < PLbar !== 0 >");	// Vector No: 516
verify(VECTbar === 1, "Assert 679 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 680 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1263
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1264
#1;

I <= 'b0001;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 681 : < PLbar !== 0 >");	// Vector No: 517
verify(VECTbar === 1, "Assert 682 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 683 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1265
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1266
#1;

I <= 'b0001;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 684 : < PLbar !== 0 >");	// Vector No: 518
verify(VECTbar === 1, "Assert 685 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 686 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1267
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1268
#1;

I <= 'b0001;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 687 : < PLbar !== 0 >");	// Vector No: 519
verify(VECTbar === 1, "Assert 688 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 689 : < MAPbar !== 1 >");
#1;

// **************************************************
// *** R = 1 ***
//------------------------

clk <= 1;		// Cycle No: 1269
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1270
#1;

I <= 'b0001;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 690 : < PLbar !== 0 >");	// Vector No: 520
verify(VECTbar === 1, "Assert 691 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 692 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1271
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1272
#1;

I <= 'b0001;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 693 : < PLbar !== 0 >");	// Vector No: 521
verify(VECTbar === 1, "Assert 694 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 695 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1273
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1274
#1;

I <= 'b0001;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 696 : < PLbar !== 0 >");	// Vector No: 522
verify(VECTbar === 1, "Assert 697 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 698 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1275
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1276
#1;

I <= 'b0001;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 699 : < PLbar !== 0 >");	// Vector No: 523
verify(VECTbar === 1, "Assert 700 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 701 : < MAPbar !== 1 >");
#1;

// **************************************************
// ****** I = 2 *******
// *** R = 0 ***
//------------------------

clk <= 1;		// Cycle No: 1277
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1278
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 1, "Assert 702 : < PLbar !== 1 >");	// Vector No: 524
verify(VECTbar === 1, "Assert 703 : < VECTbar !== 1 >");
verify(MAPbar === 0, "Assert 704 : < MAPbar !== 0 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1279
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1280
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 1, "Assert 705 : < PLbar !== 1 >");	// Vector No: 525
verify(VECTbar === 1, "Assert 706 : < VECTbar !== 1 >");
verify(MAPbar === 0, "Assert 707 : < MAPbar !== 0 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1281
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1282
#1;

I <= 'b0010;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 1, "Assert 708 : < PLbar !== 1 >");	// Vector No: 526
verify(VECTbar === 1, "Assert 709 : < VECTbar !== 1 >");
verify(MAPbar === 0, "Assert 710 : < MAPbar !== 0 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1283
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1284
#1;

I <= 'b0010;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 1, "Assert 711 : < PLbar !== 1 >");	// Vector No: 527
verify(VECTbar === 1, "Assert 712 : < VECTbar !== 1 >");
verify(MAPbar === 0, "Assert 713 : < MAPbar !== 0 >");
#1;

// **************************************************
// *** R = 1 ***
//------------------------

clk <= 1;		// Cycle No: 1285
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1286
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 1, "Assert 714 : < PLbar !== 1 >");	// Vector No: 528
verify(VECTbar === 1, "Assert 715 : < VECTbar !== 1 >");
verify(MAPbar === 0, "Assert 716 : < MAPbar !== 0 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1287
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1288
#1;

I <= 'b0010;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 1, "Assert 717 : < PLbar !== 1 >");	// Vector No: 529
verify(VECTbar === 1, "Assert 718 : < VECTbar !== 1 >");
verify(MAPbar === 0, "Assert 719 : < MAPbar !== 0 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1289
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1290
#1;

I <= 'b0010;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 1, "Assert 720 : < PLbar !== 1 >");	// Vector No: 530
verify(VECTbar === 1, "Assert 721 : < VECTbar !== 1 >");
verify(MAPbar === 0, "Assert 722 : < MAPbar !== 0 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1291
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1292
#1;

I <= 'b0010;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 1, "Assert 723 : < PLbar !== 1 >");	// Vector No: 531
verify(VECTbar === 1, "Assert 724 : < VECTbar !== 1 >");
verify(MAPbar === 0, "Assert 725 : < MAPbar !== 0 >");
#1;

// **************************************************
// ****** I = 3 *******
// *** R = 0 ***
//------------------------

clk <= 1;		// Cycle No: 1293
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1294
#1;

I <= 'b0011;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 726 : < PLbar !== 0 >");	// Vector No: 532
verify(VECTbar === 1, "Assert 727 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 728 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1295
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1296
#1;

I <= 'b0011;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 729 : < PLbar !== 0 >");	// Vector No: 533
verify(VECTbar === 1, "Assert 730 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 731 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1297
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1298
#1;

I <= 'b0011;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 732 : < PLbar !== 0 >");	// Vector No: 534
verify(VECTbar === 1, "Assert 733 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 734 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1299
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1300
#1;

I <= 'b0011;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 735 : < PLbar !== 0 >");	// Vector No: 535
verify(VECTbar === 1, "Assert 736 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 737 : < MAPbar !== 1 >");
#1;

// **************************************************
// *** R = 1 ***
//------------------------

clk <= 1;		// Cycle No: 1301
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1302
#1;

I <= 'b0011;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 738 : < PLbar !== 0 >");	// Vector No: 536
verify(VECTbar === 1, "Assert 739 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 740 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1303
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1304
#1;

I <= 'b0011;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 741 : < PLbar !== 0 >");	// Vector No: 537
verify(VECTbar === 1, "Assert 742 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 743 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1305
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1306
#1;

I <= 'b0011;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 744 : < PLbar !== 0 >");	// Vector No: 538
verify(VECTbar === 1, "Assert 745 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 746 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1307
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1308
#1;

I <= 'b0011;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 747 : < PLbar !== 0 >");	// Vector No: 539
verify(VECTbar === 1, "Assert 748 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 749 : < MAPbar !== 1 >");
#1;

// **************************************************
// ****** I = 4 *******
// *** R = 0 ***
//------------------------

clk <= 1;		// Cycle No: 1309
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1310
#1;

I <= 'b0100;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 750 : < PLbar !== 0 >");	// Vector No: 540
verify(VECTbar === 1, "Assert 751 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 752 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1311
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1312
#1;

I <= 'b0100;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 753 : < PLbar !== 0 >");	// Vector No: 541
verify(VECTbar === 1, "Assert 754 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 755 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1313
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1314
#1;

I <= 'b0100;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 756 : < PLbar !== 0 >");	// Vector No: 542
verify(VECTbar === 1, "Assert 757 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 758 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1315
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1316
#1;

I <= 'b0100;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 759 : < PLbar !== 0 >");	// Vector No: 543
verify(VECTbar === 1, "Assert 760 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 761 : < MAPbar !== 1 >");
#1;

// **************************************************
// *** R = 1 ***
//------------------------

clk <= 1;		// Cycle No: 1317
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1318
#1;

I <= 'b0100;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 762 : < PLbar !== 0 >");	// Vector No: 544
verify(VECTbar === 1, "Assert 763 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 764 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1319
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1320
#1;

I <= 'b0100;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 765 : < PLbar !== 0 >");	// Vector No: 545
verify(VECTbar === 1, "Assert 766 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 767 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1321
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1322
#1;

I <= 'b0100;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 768 : < PLbar !== 0 >");	// Vector No: 546
verify(VECTbar === 1, "Assert 769 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 770 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1323
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1324
#1;

I <= 'b0100;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 771 : < PLbar !== 0 >");	// Vector No: 547
verify(VECTbar === 1, "Assert 772 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 773 : < MAPbar !== 1 >");
#1;

// **************************************************
// ****** I = 5 *******
// *** R = 0 ***
//------------------------

clk <= 1;		// Cycle No: 1325
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1326
#1;

I <= 'b0101;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 774 : < PLbar !== 0 >");	// Vector No: 548
verify(VECTbar === 1, "Assert 775 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 776 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1327
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1328
#1;

I <= 'b0101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 777 : < PLbar !== 0 >");	// Vector No: 549
verify(VECTbar === 1, "Assert 778 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 779 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1329
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1330
#1;

I <= 'b0101;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 780 : < PLbar !== 0 >");	// Vector No: 550
verify(VECTbar === 1, "Assert 781 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 782 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1331
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1332
#1;

I <= 'b0101;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 783 : < PLbar !== 0 >");	// Vector No: 551
verify(VECTbar === 1, "Assert 784 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 785 : < MAPbar !== 1 >");
#1;

// **************************************************
// *** R = 1 ***
//------------------------

clk <= 1;		// Cycle No: 1333
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1334
#1;

I <= 'b0101;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 786 : < PLbar !== 0 >");	// Vector No: 552
verify(VECTbar === 1, "Assert 787 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 788 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1335
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1336
#1;

I <= 'b0101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 789 : < PLbar !== 0 >");	// Vector No: 553
verify(VECTbar === 1, "Assert 790 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 791 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1337
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1338
#1;

I <= 'b0101;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 792 : < PLbar !== 0 >");	// Vector No: 554
verify(VECTbar === 1, "Assert 793 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 794 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1339
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1340
#1;

I <= 'b0101;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 795 : < PLbar !== 0 >");	// Vector No: 555
verify(VECTbar === 1, "Assert 796 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 797 : < MAPbar !== 1 >");
#1;

// **************************************************
// ****** I = 6 *******
// *** R = 0 ***
//------------------------

clk <= 1;		// Cycle No: 1341
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1342
#1;

I <= 'b0110;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 1, "Assert 798 : < PLbar !== 1 >");	// Vector No: 556
verify(VECTbar === 0, "Assert 799 : < VECTbar !== 0 >");
verify(MAPbar === 1, "Assert 800 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1343
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1344
#1;

I <= 'b0110;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 1, "Assert 801 : < PLbar !== 1 >");	// Vector No: 557
verify(VECTbar === 0, "Assert 802 : < VECTbar !== 0 >");
verify(MAPbar === 1, "Assert 803 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1345
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1346
#1;

I <= 'b0110;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 1, "Assert 804 : < PLbar !== 1 >");	// Vector No: 558
verify(VECTbar === 0, "Assert 805 : < VECTbar !== 0 >");
verify(MAPbar === 1, "Assert 806 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1347
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1348
#1;

I <= 'b0110;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 1, "Assert 807 : < PLbar !== 1 >");	// Vector No: 559
verify(VECTbar === 0, "Assert 808 : < VECTbar !== 0 >");
verify(MAPbar === 1, "Assert 809 : < MAPbar !== 1 >");
#1;

// **************************************************
// *** R = 1 ***
//------------------------

clk <= 1;		// Cycle No: 1349
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1350
#1;

I <= 'b0110;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 1, "Assert 810 : < PLbar !== 1 >");	// Vector No: 560
verify(VECTbar === 0, "Assert 811 : < VECTbar !== 0 >");
verify(MAPbar === 1, "Assert 812 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1351
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1352
#1;

I <= 'b0110;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 1, "Assert 813 : < PLbar !== 1 >");	// Vector No: 561
verify(VECTbar === 0, "Assert 814 : < VECTbar !== 0 >");
verify(MAPbar === 1, "Assert 815 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1353
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1354
#1;

I <= 'b0110;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 1, "Assert 816 : < PLbar !== 1 >");	// Vector No: 562
verify(VECTbar === 0, "Assert 817 : < VECTbar !== 0 >");
verify(MAPbar === 1, "Assert 818 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1355
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1356
#1;

I <= 'b0110;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 1, "Assert 819 : < PLbar !== 1 >");	// Vector No: 563
verify(VECTbar === 0, "Assert 820 : < VECTbar !== 0 >");
verify(MAPbar === 1, "Assert 821 : < MAPbar !== 1 >");
#1;

// **************************************************
// ****** I = 7 *******
// *** R = 0 ***
//------------------------

clk <= 1;		// Cycle No: 1357
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1358
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 822 : < PLbar !== 0 >");	// Vector No: 564
verify(VECTbar === 1, "Assert 823 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 824 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1359
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1360
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 825 : < PLbar !== 0 >");	// Vector No: 565
verify(VECTbar === 1, "Assert 826 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 827 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1361
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1362
#1;

I <= 'b0111;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 828 : < PLbar !== 0 >");	// Vector No: 566
verify(VECTbar === 1, "Assert 829 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 830 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1363
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1364
#1;

I <= 'b0111;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 831 : < PLbar !== 0 >");	// Vector No: 567
verify(VECTbar === 1, "Assert 832 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 833 : < MAPbar !== 1 >");
#1;

// **************************************************
// *** R = 1 ***
//------------------------

clk <= 1;		// Cycle No: 1365
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1366
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 834 : < PLbar !== 0 >");	// Vector No: 568
verify(VECTbar === 1, "Assert 835 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 836 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1367
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1368
#1;

I <= 'b0111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 837 : < PLbar !== 0 >");	// Vector No: 569
verify(VECTbar === 1, "Assert 838 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 839 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1369
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1370
#1;

I <= 'b0111;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 840 : < PLbar !== 0 >");	// Vector No: 570
verify(VECTbar === 1, "Assert 841 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 842 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1371
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1372
#1;

I <= 'b0111;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 843 : < PLbar !== 0 >");	// Vector No: 571
verify(VECTbar === 1, "Assert 844 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 845 : < MAPbar !== 1 >");
#1;

// **************************************************
// ****** I = 8 *******
// *** R = 0 ***
//------------------------

clk <= 1;		// Cycle No: 1373
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1374
#1;

I <= 'b1000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 846 : < PLbar !== 0 >");	// Vector No: 572
verify(VECTbar === 1, "Assert 847 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 848 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1375
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1376
#1;

I <= 'b1000;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 849 : < PLbar !== 0 >");	// Vector No: 573
verify(VECTbar === 1, "Assert 850 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 851 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1377
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1378
#1;

I <= 'b1000;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 852 : < PLbar !== 0 >");	// Vector No: 574
verify(VECTbar === 1, "Assert 853 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 854 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1379
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1380
#1;

I <= 'b1000;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 855 : < PLbar !== 0 >");	// Vector No: 575
verify(VECTbar === 1, "Assert 856 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 857 : < MAPbar !== 1 >");
#1;

// **************************************************
// *** R = 1 ***
//------------------------

clk <= 1;		// Cycle No: 1381
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1382
#1;

I <= 'b1000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 858 : < PLbar !== 0 >");	// Vector No: 576
verify(VECTbar === 1, "Assert 859 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 860 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1383
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1384
#1;

I <= 'b1000;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 861 : < PLbar !== 0 >");	// Vector No: 577
verify(VECTbar === 1, "Assert 862 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 863 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1385
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1386
#1;

I <= 'b1000;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 864 : < PLbar !== 0 >");	// Vector No: 578
verify(VECTbar === 1, "Assert 865 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 866 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1387
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1388
#1;

I <= 'b1000;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 867 : < PLbar !== 0 >");	// Vector No: 579
verify(VECTbar === 1, "Assert 868 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 869 : < MAPbar !== 1 >");
#1;

// **************************************************
// ****** I = 9 *******
// *** R = 0 ***
//------------------------

clk <= 1;		// Cycle No: 1389
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1390
#1;

I <= 'b1001;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 870 : < PLbar !== 0 >");	// Vector No: 580
verify(VECTbar === 1, "Assert 871 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 872 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1391
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1392
#1;

I <= 'b1001;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 873 : < PLbar !== 0 >");	// Vector No: 581
verify(VECTbar === 1, "Assert 874 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 875 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1393
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1394
#1;

I <= 'b1001;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 876 : < PLbar !== 0 >");	// Vector No: 582
verify(VECTbar === 1, "Assert 877 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 878 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1395
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1396
#1;

I <= 'b1001;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 879 : < PLbar !== 0 >");	// Vector No: 583
verify(VECTbar === 1, "Assert 880 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 881 : < MAPbar !== 1 >");
#1;

// **************************************************
// *** R = 1 ***
//------------------------

clk <= 1;		// Cycle No: 1397
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1398
#1;

I <= 'b1001;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 882 : < PLbar !== 0 >");	// Vector No: 584
verify(VECTbar === 1, "Assert 883 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 884 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1399
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1400
#1;

I <= 'b1001;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 885 : < PLbar !== 0 >");	// Vector No: 585
verify(VECTbar === 1, "Assert 886 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 887 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1401
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1402
#1;

I <= 'b1001;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 888 : < PLbar !== 0 >");	// Vector No: 586
verify(VECTbar === 1, "Assert 889 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 890 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1403
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1404
#1;

I <= 'b1001;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 891 : < PLbar !== 0 >");	// Vector No: 587
verify(VECTbar === 1, "Assert 892 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 893 : < MAPbar !== 1 >");
#1;

// **************************************************
// ****** I = 10 *******
// *** R = 0 ***
//------------------------

clk <= 1;		// Cycle No: 1405
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1406
#1;

I <= 'b1010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 894 : < PLbar !== 0 >");	// Vector No: 588
verify(VECTbar === 1, "Assert 895 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 896 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1407
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1408
#1;

I <= 'b1010;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 897 : < PLbar !== 0 >");	// Vector No: 589
verify(VECTbar === 1, "Assert 898 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 899 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1409
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1410
#1;

I <= 'b1010;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 900 : < PLbar !== 0 >");	// Vector No: 590
verify(VECTbar === 1, "Assert 901 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 902 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1411
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1412
#1;

I <= 'b1010;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 903 : < PLbar !== 0 >");	// Vector No: 591
verify(VECTbar === 1, "Assert 904 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 905 : < MAPbar !== 1 >");
#1;

// **************************************************
// *** R = 1 ***
//------------------------

clk <= 1;		// Cycle No: 1413
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1414
#1;

I <= 'b1010;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 906 : < PLbar !== 0 >");	// Vector No: 592
verify(VECTbar === 1, "Assert 907 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 908 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1415
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1416
#1;

I <= 'b1010;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 909 : < PLbar !== 0 >");	// Vector No: 593
verify(VECTbar === 1, "Assert 910 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 911 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1417
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1418
#1;

I <= 'b1010;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 912 : < PLbar !== 0 >");	// Vector No: 594
verify(VECTbar === 1, "Assert 913 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 914 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1419
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1420
#1;

I <= 'b1010;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 915 : < PLbar !== 0 >");	// Vector No: 595
verify(VECTbar === 1, "Assert 916 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 917 : < MAPbar !== 1 >");
#1;

// **************************************************
// ****** I = 11 *******
// *** R = 0 ***
//------------------------

clk <= 1;		// Cycle No: 1421
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1422
#1;

I <= 'b1011;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 918 : < PLbar !== 0 >");	// Vector No: 596
verify(VECTbar === 1, "Assert 919 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 920 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1423
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1424
#1;

I <= 'b1011;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 921 : < PLbar !== 0 >");	// Vector No: 597
verify(VECTbar === 1, "Assert 922 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 923 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1425
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1426
#1;

I <= 'b1011;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 924 : < PLbar !== 0 >");	// Vector No: 598
verify(VECTbar === 1, "Assert 925 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 926 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1427
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1428
#1;

I <= 'b1011;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 927 : < PLbar !== 0 >");	// Vector No: 599
verify(VECTbar === 1, "Assert 928 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 929 : < MAPbar !== 1 >");
#1;

// **************************************************
// *** R = 1 ***
//------------------------

clk <= 1;		// Cycle No: 1429
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1430
#1;

I <= 'b1011;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 930 : < PLbar !== 0 >");	// Vector No: 600
verify(VECTbar === 1, "Assert 931 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 932 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1431
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1432
#1;

I <= 'b1011;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 933 : < PLbar !== 0 >");	// Vector No: 601
verify(VECTbar === 1, "Assert 934 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 935 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1433
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1434
#1;

I <= 'b1011;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 936 : < PLbar !== 0 >");	// Vector No: 602
verify(VECTbar === 1, "Assert 937 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 938 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1435
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1436
#1;

I <= 'b1011;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 939 : < PLbar !== 0 >");	// Vector No: 603
verify(VECTbar === 1, "Assert 940 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 941 : < MAPbar !== 1 >");
#1;

// **************************************************
// ****** I = 12 *******
// *** R = 0 ***
//------------------------

clk <= 1;		// Cycle No: 1437
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1438
#1;

I <= 'b1100;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 942 : < PLbar !== 0 >");	// Vector No: 604
verify(VECTbar === 1, "Assert 943 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 944 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1439
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1440
#1;

I <= 'b1100;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 945 : < PLbar !== 0 >");	// Vector No: 605
verify(VECTbar === 1, "Assert 946 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 947 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1441
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1442
#1;

I <= 'b1100;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 948 : < PLbar !== 0 >");	// Vector No: 606
verify(VECTbar === 1, "Assert 949 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 950 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1443
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1444
#1;

I <= 'b1100;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 951 : < PLbar !== 0 >");	// Vector No: 607
verify(VECTbar === 1, "Assert 952 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 953 : < MAPbar !== 1 >");
#1;

// **************************************************
// *** R = 1 ***
//------------------------

clk <= 1;		// Cycle No: 1445
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1446
#1;

I <= 'b1100;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 954 : < PLbar !== 0 >");	// Vector No: 608
verify(VECTbar === 1, "Assert 955 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 956 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1447
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1448
#1;

I <= 'b1100;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 957 : < PLbar !== 0 >");	// Vector No: 609
verify(VECTbar === 1, "Assert 958 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 959 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1449
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1450
#1;

I <= 'b1100;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 960 : < PLbar !== 0 >");	// Vector No: 610
verify(VECTbar === 1, "Assert 961 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 962 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1451
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1452
#1;

I <= 'b1100;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 963 : < PLbar !== 0 >");	// Vector No: 611
verify(VECTbar === 1, "Assert 964 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 965 : < MAPbar !== 1 >");
#1;

// **************************************************
// ****** I = 13 *******
// *** R = 0 ***
//------------------------

clk <= 1;		// Cycle No: 1453
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1454
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 966 : < PLbar !== 0 >");	// Vector No: 612
verify(VECTbar === 1, "Assert 967 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 968 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1455
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1456
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 969 : < PLbar !== 0 >");	// Vector No: 613
verify(VECTbar === 1, "Assert 970 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 971 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1457
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1458
#1;

I <= 'b1101;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 972 : < PLbar !== 0 >");	// Vector No: 614
verify(VECTbar === 1, "Assert 973 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 974 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1459
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1460
#1;

I <= 'b1101;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 975 : < PLbar !== 0 >");	// Vector No: 615
verify(VECTbar === 1, "Assert 976 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 977 : < MAPbar !== 1 >");
#1;

// **************************************************
// *** R = 1 ***
//------------------------

clk <= 1;		// Cycle No: 1461
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1462
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 978 : < PLbar !== 0 >");	// Vector No: 616
verify(VECTbar === 1, "Assert 979 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 980 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1463
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1464
#1;

I <= 'b1101;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 981 : < PLbar !== 0 >");	// Vector No: 617
verify(VECTbar === 1, "Assert 982 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 983 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1465
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1466
#1;

I <= 'b1101;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 984 : < PLbar !== 0 >");	// Vector No: 618
verify(VECTbar === 1, "Assert 985 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 986 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1467
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1468
#1;

I <= 'b1101;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 987 : < PLbar !== 0 >");	// Vector No: 619
verify(VECTbar === 1, "Assert 988 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 989 : < MAPbar !== 1 >");
#1;

// **************************************************
// ****** I = 14 *******
// *** R = 0 ***
//------------------------

clk <= 1;		// Cycle No: 1469
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1470
#1;

I <= 'b1110;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 990 : < PLbar !== 0 >");	// Vector No: 620
verify(VECTbar === 1, "Assert 991 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 992 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1471
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1472
#1;

I <= 'b1110;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 993 : < PLbar !== 0 >");	// Vector No: 621
verify(VECTbar === 1, "Assert 994 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 995 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1473
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1474
#1;

I <= 'b1110;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 996 : < PLbar !== 0 >");	// Vector No: 622
verify(VECTbar === 1, "Assert 997 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 998 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1475
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1476
#1;

I <= 'b1110;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 999 : < PLbar !== 0 >");	// Vector No: 623
verify(VECTbar === 1, "Assert 1000 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 1001 : < MAPbar !== 1 >");
#1;

// **************************************************
// *** R = 1 ***
//------------------------

clk <= 1;		// Cycle No: 1477
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1478
#1;

I <= 'b1110;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 1002 : < PLbar !== 0 >");	// Vector No: 624
verify(VECTbar === 1, "Assert 1003 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 1004 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1479
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1480
#1;

I <= 'b1110;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 1005 : < PLbar !== 0 >");	// Vector No: 625
verify(VECTbar === 1, "Assert 1006 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 1007 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1481
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1482
#1;

I <= 'b1110;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 1008 : < PLbar !== 0 >");	// Vector No: 626
verify(VECTbar === 1, "Assert 1009 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 1010 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1483
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1484
#1;

I <= 'b1110;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 1011 : < PLbar !== 0 >");	// Vector No: 627
verify(VECTbar === 1, "Assert 1012 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 1013 : < MAPbar !== 1 >");
#1;

// **************************************************
// ****** I = 15 *******
// *** R = 0 ***
//------------------------

clk <= 1;		// Cycle No: 1485
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1486
#1;

I <= 'b1111;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 1014 : < PLbar !== 0 >");	// Vector No: 628
verify(VECTbar === 1, "Assert 1015 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 1016 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1487
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1488
#1;

I <= 'b1111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 1017 : < PLbar !== 0 >");	// Vector No: 629
verify(VECTbar === 1, "Assert 1018 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 1019 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1489
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1490
#1;

I <= 'b1111;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 1020 : < PLbar !== 0 >");	// Vector No: 630
verify(VECTbar === 1, "Assert 1021 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 1022 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1491
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b000000000000;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1492
#1;

I <= 'b1111;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 1023 : < PLbar !== 0 >");	// Vector No: 631
verify(VECTbar === 1, "Assert 1024 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 1025 : < MAPbar !== 1 >");
#1;

// **************************************************
// *** R = 1 ***
//------------------------

clk <= 1;		// Cycle No: 1493
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1494
#1;

I <= 'b1111;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 1026 : < PLbar !== 0 >");	// Vector No: 632
verify(VECTbar === 1, "Assert 1027 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 1028 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1495
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1496
#1;

I <= 'b1111;
CCENbar <= 0;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 1029 : < PLbar !== 0 >");	// Vector No: 633
verify(VECTbar === 1, "Assert 1030 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 1031 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1497
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1498
#1;

I <= 'b1111;
CCENbar <= 1;
CCbar <= 1;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 1032 : < PLbar !== 0 >");	// Vector No: 634
verify(VECTbar === 1, "Assert 1033 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 1034 : < MAPbar !== 1 >");
#1;

// **************************************************
//------------------------

clk <= 1;		// Cycle No: 1499
#1;

I <= 'b0000;
CCENbar <= 0;
CCbar <= 0;
RLDbar <= 0;
CI <= 0;
OEbar <= 0;
D <= 'b111111111111;
#4;

clk <= 0;
#4;

#1;

//------------------------

clk <= 1;		// Cycle No: 1500
#1;

I <= 'b1111;
CCENbar <= 1;
CCbar <= 0;
RLDbar <= 1;
CI <= 0;
OEbar <= 0;
#4;

clk <= 0;
#4;

verify(PLbar === 0, "Assert 1035 : < PLbar !== 0 >");	// Vector No: 635
verify(VECTbar === 1, "Assert 1036 : < VECTbar !== 1 >");
verify(MAPbar === 1, "Assert 1037 : < MAPbar !== 1 >");
#1;

// **************************************************
if (fail) begin
    $display("Test FAIL");
    $display("------------------------");
    $finish(1);
end
$display("Test PASS");
$display("------------------------");
$finish;

end

endmodule
