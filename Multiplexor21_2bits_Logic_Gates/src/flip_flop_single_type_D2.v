// Belinda Brown Ramírez
// Mayo, 2020
// timna.brown@ucr.ac.cr

`ifndef FLIP_FLOP_SINGLE_TYPE_D2
`define FLIP_FLOP_SINGLE_TYPE_D2



// Flip Flop type D of 2 bits module
module flip_flop_single_type_D2(
	input clk,
	input [1:0] D,
	output reg [1:0] Q
);

always@(posedge clk)
			Q <= #6 D;
endmodule

// Local Variables:
// verilog-library-directories:("."):
// verilog-auto-wire-type:\"logic\"
// End:

`endif
