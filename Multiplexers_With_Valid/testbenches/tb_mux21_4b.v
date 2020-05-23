`ifndef TB_MUX21_4B
`define TB_MUX21_4B

// scale time unit (value of one) / precision
`timescale 	1ns				/ 1ns
// includes verilog files
// Can be omitted and called from the testbench
// Cmos
`include "./lib/cmos_cells.v"
// Muxes Behavioral
`include "./src/mux21_4b.v"
// Muxes Structural
`include "./syn/mux21_4b_syn.v"
// // Muxes testersm
`include "./testers/t_mux21_4b.v"

module TestBench; // Testbench
// Usually the signals in the test bench are wires.
// They do not store a value, they are handled by other module instances.
// Since they require matching the size of the inputs and outputs, they must be assigned their size
// defined in the modules

// If you define quantity format, it is recommended to keep it in the same format being the
// same used in the module for the number of bits - [1: 0] ---, another way to do it is with
// [0: 1]

// We are going to use AUTOINST: It is responsible for replacing the connections (considering it is HDL)
// pin to an instance (module) with variables as they change over time automatically in the instantiated module

// It's needed /*AUTOWIRE*/ because: Creates wires for outputs that ins't declare

/*AUTOWIRE*/
wire select_TB, reset_TB, clk_TB;
wire [3:0] in0_TB, in1_TB, out_BTB, out_STB;
wire valid_in0_TB, valid_in1_TB, valid_out_BTB, valid_out_STB;

/*AUTOREGINPUT*/

///////////////////////////////////////////////////////////////////////////////////////////
              ////////////  Mux 2:1 4 BITS
              ////////////
///////////////////////////////////////////////////////////////////////////////////////////

// 							Behavioral
/* mux21_4b_c AUTO_TEMPLATE (.out\(.*\) (out\1_c[]));*/
mux21_4b mux21_4b_B_TB(/*AUTOINST*/
	// Outputs
	.out_b					(out_BTB[3:0]),
	.out_valid_b 				(valid_out_BTB),
	// Inputs
	.clk					(clk_TB),
	.reset 				(reset_TB),
	.select 				(select_TB),
	.in0_valid 				(valid_in0_TB),
	.in1_valid					(valid_in1_TB),
	.in0					(in0_TB[3:0]),
	.in1 				(in1_TB[3:0])
);

// 						Synthesis
/* mux21_4b_syn AUTO_TEMPLATE (.out\(.*\) (out\1_s[]));*/
mux21_4b_syn mux21_4b_S_TB(/*AUTOINST*/
	// Outputs
	.out_b					(out_STB[3:0]),
	.out_valid_b 				(valid_out_STB),
	// Inputs
	.clk					(clk_TB),
	.reset 				(reset_TB),
	.select 				(select_TB),
	.in0_valid 				(valid_in0_TB),
	.in1_valid					(valid_in1_TB),
	.in0					(in0_TB[3:0]),
	.in1 				(in1_TB[3:0])
);

//            Tester
/* t_mux21_4b AUTO_TEMPLATE (.out\(.*\) (out\1_t[]));*/
t_mux21_4b mux21_4b_B_TBtester(/*AUTOINST*/
	.clk					(clk_TB),
	.reset 				(reset_TB),
	.select 				(select_TB),
	.in0_valid 				(valid_in0_TB),
	.in1_valid					(valid_in1_TB),
	.in0					(in0_TB[3:0]),
	.in1 				(in1_TB[3:0]),
	// Inputs
	.out_b					(out_BTB[3:0]),
	.out_s					(out_STB[3:0]),
	.out_valid_b 		(valid_out_BTB),
	.out_valid_s		(valid_out_STB)
	);


endmodule

`endif
