// Module of FF single type D where D means data
`ifndef FLIP_FLOP_SINGLE_TYPE_D
`define FLIP_FLOP_SINGLE_TYPE_D

module flip_flop_single_type_D(
	input clk,
	input   D,
	output reg Q
);

always@(posedge clk)
			Q <= #6 D;
endmodule
`endif
