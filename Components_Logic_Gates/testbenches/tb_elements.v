// Creating test bench for the following elements
// and_two_input_gate, or_two_input_gate, inverter_as_not_gate,
// inverter_as_not_gate, mux_2_1_2bit, mux2_1_2bit
`ifndef TB_ELEMENTS
`define TB_ELEMENTS
// scale time unit measured for delays and simulation (time_unit) / define as
// round the delay values before being used in the simulation (time_precision)
`timescale 	1ns / 1ns

// Including files
`include "./testers/t_and_two_input_gate.v"
`include "./testers/t_or_two_input_gate.v"
`include "./testers/t_flip_flop_single_type_D.v"
`include "./testers/t_inversor_as_not_gate.v"
`include "./testers/t_mux2_1_1bit.v"
`include "./testers/t_mux2_1_2bit.v"


`include "./src/flip_flop_single_type_D.v"
`include "./src/mux2_1_2bit.v"
`include "./src/mux2_1_1bit.v"


module tb_elements; // Testbench
// Usually the signals in the test bench are wires.
// They do not store a value, they are handled by other module instances.
// Since they require matching the size of the inputs and outputs, they must be assigned their size
// defined in the modules

// If you define quantity format, it is recommended to keep it in the same format being the
// same used in the module for the number of bits - [1: 0] ---, another way to do it is with
// [0: 1]

wire in1_AND_testbench, in2_AND_testbench, out_AND_testbench;
wire in1_OR_testbench, in2_OR_testbench, out_OR_testbench;
wire d_FF_testbench, q_FF_testbench, clk_testbench;
wire in_NOT_testbench, out_NOT_testbench;
wire out_mux_1bit, in1_mux_1bit, in2_mux_1bit, select_mux_1bit;
wire [1:0] out_mux_2bit, in1_mux_2bit, in2_mux_2bit;
wire select_mux_2bit;


// Since there are 6 elements and two files per element we have 12 modules to import ...

// 1. AND GATE

// connecting module and gate
and_two_input_gate	and_two_input_gate_testbench(.out_and_gate		(out_AND_testbench),
								.in1_and_gate		(in1_AND_testbench),
								.in2_and_gate		(in2_AND_testbench)
);


// 2. AND GATE TESTER

// Signal generator and monitor
and_two_input_gate_tester	and_two_input_gate_tester_testbench(.out_and_gate_tester		(out_AND_testbench),
								.in1_and_gate_tester		(in1_AND_testbench),
								.in2_and_gate_tester		(in2_AND_testbench)
);

// 3. OR GATE

// connecting module and gate
or_two_input_gate	or_two_input_gate_testbench(.out_or		(out_OR_testbench),
	              .in_or1		(in1_OR_testbench),
								.in_or2		(in2_OR_testbench)

);


// 4. OR GATE TESTER

// Signal generator and monitor
or_two_input_gate_tester	or_two_input_gate_tester_testbench(.out_or_tester		(out_OR_testbench),
								.in_or1_tester		(in1_OR_testbench),
								.in_or2_tester		(in2_OR_testbench)
);


// 5. FLIP-FLOP

// Connecting the Flip Flop module
flip_flop_single_type_D flip_flop_testbench(.Q (q_FF_testbench),
              .D (d_FF_testbench),
              .clk (clk_testbench)
);

// 6. FLIP-FLOP TESTER

// Making the tester connections
flip_flop_single_type_D_tester flip_flop_tester_testbench(.Q_tester (q_FF_testbench),
							.D_tester (d_FF_testbench),
							.clk_tester (clk_testbench)
);

// 7. NOT GATE

// Connecting NOT gate module
inversor_as_not_gate inversor_as_not_gate_testbench(.out_not (out_NOT_testbench),
             .in_not (in_NOT_testbench)
);

// 8. NOT GATE TESTER
inversor_as_not_gate_tester inversor_as_not_gate_tester_testbench(.tester_out_not (out_NOT_testbench),
            .tester_in_not (in_NOT_testbench)
);

// 9. MUX 2:1 1 BIT
mux2_1_1bit mux2_1_1bit_testbench(.out_mux1bit (out_mux_1bit),
.in1_mux2_1_1bit (in1_mux_1bit),
.in2_mux2_1_1bit (in2_mux_1bit),
.selec_1bit (select_mux_1bit)
);

// 10. MUX 2:1 1 BIT TESTER
mux2_1_1bit_tester mux2_1_1bit_tester_testbench(.out_mux1bits_tester (out_mux_1bit),
.in1_mux1bits_tester (in1_mux_1bit),
.in2_mux1bits_tester (in2_mux_1bit),
.selec_mux1bits_tester (select_mux_1bit)
);

// 11. MUX 2:1 2 BIT
mux2_1_2bit mux2_1_2bit_testbench(.out_mux2bit (out_mux_2bit),
.in1_mux2_1_2bit (in1_mux_2bit),
.in2_mux2_1_2bit (in2_mux_2bit),
.selec_2bit (select_mux_2bit)
);

// 12. MUX 2:1 2 BIT TESTER
mux2_1_2bit_tester mux2_1_2bit_tester_testbench(.out_mux2bits_tester (out_mux_2bit),
.in1_mux2bits_tester (in1_mux_2bit),
.in2_mux2bits_tester (in2_mux_2bit),
.selec_mux2bits_tester (select_mux_2bit)
);

endmodule
`endif
