//
// Am2902 - High-Speed Look-Ahead Carry Generator
//
module am2902(
    input        Cin,       // Carry-in input N
    input        nG0,       // Generate term input 0
    input        nP0,       // Propagate term input 0
    input        nG1,       // Generate term input 1
    input        nP1,       // Propagate term input 1
    input        nG2,       // Generate term input 2
    input        nP2,       // Propagate term input 2
    input        nG3,       // Generate term input 3
    input        nP3,       // Propagate term input 3
    output logic Cout1,     // Carry-out output N+1
    output logic Cout2,     // Carry-out output N+2
    output logic Cout3,     // Carry-out output N+3
    output logic nG,        // Generate term output
    output logic nP         // Propagate term output
);

// According to datasheet:
// Cout1 = G0 | (P0 & Cin)
// Cout2 = G1 | (P1 & G0) | (P1 & P0 & Cin)
// Cout3 = G2 | (P2 & G1) | (P2 & P1 & G0) | (P2 & P1 & P0 & Cin)
// G = G3 | (P3 & G2) | (P3 & P2 & G1) | (P3 & P2 & P1 & G0)
// P = P3 & P2 & P1 & P0

assign Cout1 = !nG0 | (!nP0 & Cin);
assign Cout2 = !nG1 | (!nP1 & !nG0) | (!nP1 & !nP0 & Cin);
assign Cout3 = !nG2 | (!nP2 & !nG1) | (!nP2 & !nP1 & !nG0) | (!nP2 & !nP1 & !nP0 & Cin);
assign nG = !(!nG3 | (!nP3 & !nG2) | (!nP3 & !nP2 & !nG1) | (!nP3 & !nP2 & !nP1 & !nG0));
assign nP = !(!nP3 & !nP2 & !nP1 & !nP0);

endmodule
