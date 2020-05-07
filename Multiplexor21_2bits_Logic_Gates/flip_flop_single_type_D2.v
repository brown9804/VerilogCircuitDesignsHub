// Flip Flop type D of 2 bits module 
module flip_flop_single_type_D2(
	input clk,
	input [1:0] D,
	output reg [1:0] Q
);

always@(posedge clk)
			Q <= #6 D;
endmodule
