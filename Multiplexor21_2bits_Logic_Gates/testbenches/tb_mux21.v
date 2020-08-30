// Belinda Brown Ramírez
// Mayo, 2020
// timna.brown@ucr.ac.cr

`ifndef TB_MUX21
`define TB_MUX21



// Scale time unit (value of one) / precision
`timescale 	1ns				/ 1ns
// includes verilog files
// Can be omitted and called from the testbench
`include "./src/mux2_1_conductual.v"
`include "./src/mux2_1_structural.v"
`include "./testers/probador.v"

module BancoPruebamux2_1_2bits_reset_ff; // Testbench
// Usually the signals in the test bench are wires.
// They do not store a value, they are handled by other module instances.
// Since they require matching the size of the inputs and outputs, they must be assigned their size
// defined in the modules

// If you define quantity format, it is recommended to keep it in the same format being the
// same used in the module for the number of bits - [1: 0] ---, another way to do it is with
// [0: 1]

wire [1:0] data_out_banco_conduc, data_out_banco_struc, data_in0_banco_conduc, data_in1_banco_conduc;
wire reset_L_banco_conduc, clk_banco_conduc, selector_banco_conduc;


// Behavioral description of mux
mux2_1	a_cond(	.data_out		(data_out_banco_conduc),
								.data_in0		(data_in0_banco_conduc),
								.data_in1		(data_in1_banco_conduc),
								.reset_L		(reset_L_banco_conduc),
								.clk				(clk_banco_conduc),
								.selector   (selector_banco_conduc)
);

mux2_1_2bit_struct structural(.out_struc		(data_out_banco_struc),
								.in1_struc		(data_in0_banco_conduc),
								.in2_struc		(data_in1_banco_conduc),
								.reset_L_struc		(reset_L_banco_conduc),
								.clk_struc				(clk_banco_conduc),
								.selector_struc   (selector_banco_conduc)
);


// Tester: signal generator and monitor
probador prob(.data_out_conduc_tester		(data_out_banco_conduc),
                .data_out_struc_tester   (data_out_banco_struc),
								.data_in0_probador		(data_in0_banco_conduc),
								.data_in1_probador		(data_in1_banco_conduc),
								.reset_L_probador		(reset_L_banco_conduc),
								.clk_probador				(clk_banco_conduc),
								.selector_probador   (selector_banco_conduc)

);
endmodule

// Local Variables:
// verilog-library-directories:("."):
// verilog-auto-wire-type:\"logic\"
// End:

`endif
