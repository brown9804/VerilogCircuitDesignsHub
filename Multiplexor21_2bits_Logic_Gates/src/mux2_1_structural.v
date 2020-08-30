// Belinda Brown Ramírez
// Mayo, 2020
// timna.brown@ucr.ac.cr

`ifndef MUX2_1_STRUCTURAL
`define MUX2_1_STRUCTURAL



// Structural Module for a 2-bit mux 2_1 with reset, flip flop
`include "./src/flip_flop_single_type_D2.v"
`include "./src/mux2_1_2bit.v"

module mux2_1_2bit_struct(

input [1:0] in1_struc,
input [1:0] in2_struc,
output [1:0] out_struc,
input clk_struc,
input reset_L_struc,
input selector_struc
);

wire [1:0] mux1a2cascda;
wire [1:0] mux2affcascda;
wire [1:0] reset_muxff = 2'b00;

mux2_1_2bit  mux2_2_struc_1(.out_mux2bit (mux1a2cascda),
.in1_mux2_1_2bit (in1_struc),
.in2_mux2_1_2bit (in2_struc),
.selec_2bit (selector_struc)
);

mux2_1_2bit  mux2_1_struc_2(.out_mux2bit (mux2affcascda),
.in1_mux2_1_2bit (reset_muxff),
.in2_mux2_1_2bit (mux1a2cascda),
.selec_2bit (reset_L_struc)
);


flip_flop_single_type_D2 FF1struc(.clk (clk_struc),
.D (mux2affcascda),
.Q (out_struc)
);
endmodule

// Local Variables:
// verilog-library-directories:("."):
// verilog-auto-wire-type:\"logic\"
// End:

`endif
