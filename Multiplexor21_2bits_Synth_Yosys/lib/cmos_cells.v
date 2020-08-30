//  Describing the modules of the same cmos_cells.lib
//

// Adding relative relative delay times to AND, OR,
// NOT gates since NOR and NAND are expected to be faster

// NOT gate #2.4 ns
// AND gate #4.3 ns
// OR gate #4.6 ns
// FF gate #6 ns

// The following approach is related:
// NOR = abs(#NOT - #OR) = abs(2.4 - 4.6) = 2.2
// NAND = abs(#NOT - #AND) = abs(2.4 - 4.3) = 1.9

// BUF = buffer
// Is a single-input single-output gate,
// similar to NOT, that copies its input
// value to its output. In diagram
// gate has the following shape -[>-
module BUF(A, Y);
input A;
output Y;
assign Y = A;
endmodule

// Not gate or inversor
// Is a single-input single-output gate,
// opies its input value to its output with
// inversor. Shape -[>o-
module NOT(A, Y);
input A;
output Y;
assign #2.4 Y = ~A;
endmodule

// Not and = NAND
// NAND is the result of the negation
// of the AND operator. Where or means
// if two of the two inputs are HIGH
// output HIGH.
module NAND(A, B, Y);
input A, B;
output Y;
assign #1.9 Y = ~(A & B);
endmodule

// Not or = NOR
// NOR is the result of the negation
// of the OR operator. Where or means
// if one of the two inputs is HIGH
// output HIGH.
module NOR(A, B, Y);
input A, B;
output Y;
assign #2.2 Y = ~(A | B);
endmodule


// DFF =  D-type flip-flop = Data type flip-flop
// Flip Flop is a two-state (bi-stable) device, which serves as
// basic memory for sequential logic operations.
module DFF(C, D, Q);
input C, D;
output reg Q;
always @(posedge C)
	Q <= #6 D;
endmodule


// DFFSR =  D-type flip-flop set reset = Data type flip-flop set reset
// Flip Flop is a two-state (bi-stable) device, which serves as
// basic memory for sequential logic operations. Whit set reset
module DFFSR(C, D, Q, S, R);
input C, D, S, R;
output reg Q;
always @(posedge C, posedge S, posedge R)
	if (S)
		Q <= #6 1'b1;
	else if (R)
		Q <= #6 1'b0;
	else
		Q <= D;
endmodule
