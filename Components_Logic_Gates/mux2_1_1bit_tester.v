// The tester module is defined for mux2_1_1bit

module mux2_1_1bit_tester(
output reg in1_mux1bits_tester,
output reg in2_mux1bits_tester,
input wire out_mux1bits_tester,
output reg selec_mux1bits_tester
);

initial
begin
	$dumpfile("mux2_1_1bit_tester.vcd");
	$dumpvars;

	in1_mux1bits_tester = 0;
	in2_mux1bits_tester = 0;
	selec_mux1bits_tester = 0;


	// Declaring repetitions
	in1_mux1bits_tester <= #10 1'b0; in2_mux1bits_tester <= #10 1'b0; selec_mux1bits_tester <= #10 1'b0;
	in1_mux1bits_tester <= #10 1'b0; in2_mux1bits_tester <= #10 1'b0; selec_mux1bits_tester <= #10 1'b1;
	in1_mux1bits_tester <= #10 1'b0; in2_mux1bits_tester <= #10 1'b1; selec_mux1bits_tester <= #10 1'b0;
	in1_mux1bits_tester <= #10 1'b0; in2_mux1bits_tester <= #10 1'b1; selec_mux1bits_tester <= #10 1'b1;
	in1_mux1bits_tester <= #10 1'b1; in2_mux1bits_tester <= #10 1'b0; selec_mux1bits_tester <= #10 1'b0;
	in1_mux1bits_tester <= #10 1'b1; in2_mux1bits_tester <= #10 1'b0; selec_mux1bits_tester <= #10 1'b1;
	in1_mux1bits_tester <= #10 1'b1; in2_mux1bits_tester <= #10 1'b1; selec_mux1bits_tester <= #10 1'b0;
	in1_mux1bits_tester <= #10 1'b1; in2_mux1bits_tester <= #10 1'b1; selec_mux1bits_tester <= #10 1'b1;
	#20 $finish;
end
endmodule
