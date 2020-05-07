module flip_flop_single_type_D(
	input clk,
	input   D,
	output reg Q
);

always@(posedge clk)
			Q <= #6 D;
endmodule
