// Se define el modulo tester para mux2_1_2bit

module mux2_1_2bit_tester(
output reg [1:0] in1_mux2bits_tester,
output reg [1:0] in2_mux2bits_tester,
input wire [1:0] out_mux2bits_tester,
output reg selec_mux2bits_tester
);

initial
begin
	$dumpfile("mux2_1_2bit_tester.vcd");
	$dumpvars;

in1_mux2bits_tester = 2'b0;
in2_mux2bits_tester  =  2'b0;
selec_mux2bits_tester =  2'b0;
  // Declarando repeticiones
	in1_mux2bits_tester[0] <= #10 2'b0; in2_mux2bits_tester[0] <= #10 2'b0; selec_mux2bits_tester <= #10 1'b0;
	in1_mux2bits_tester[0] <= #10 2'b0; in2_mux2bits_tester[0] <= #10 2'b0; selec_mux2bits_tester <= #10 1'b1;
	in1_mux2bits_tester[0] <= #10 2'b0; in2_mux2bits_tester[0] <= #10 2'b1; selec_mux2bits_tester <= #10 1'b0;
	in1_mux2bits_tester[0] <= #10 2'b0; in2_mux2bits_tester[0] <= #10 2'b1; selec_mux2bits_tester <= #10 1'b1;
	in1_mux2bits_tester[0] <= #10 2'b1; in2_mux2bits_tester[0] <= #10 2'b0; selec_mux2bits_tester <= #10 1'b0;
	in1_mux2bits_tester[0] <= #10 2'b1; in2_mux2bits_tester[0] <= #10 2'b0; selec_mux2bits_tester <= #10 1'b1;
	in1_mux2bits_tester[0] <= #10 2'b1; in2_mux2bits_tester[0] <= #10 2'b1; selec_mux2bits_tester <= #10 1'b0;
	in1_mux2bits_tester[0] <= #10 2'b1; in2_mux2bits_tester[0] <= #10 2'b1; selec_mux2bits_tester <= #10 1'b1;
	in1_mux2bits_tester[1] <= #10 2'b0; in2_mux2bits_tester[1] <= #10 2'b0; selec_mux2bits_tester <= #10 1'b0;
	in1_mux2bits_tester[1] <= #10 2'b0; in2_mux2bits_tester[1] <= #10 2'b0; selec_mux2bits_tester <= #10 1'b1;
	in1_mux2bits_tester[1] <= #10 2'b0; in2_mux2bits_tester[1] <= #10 2'b1; selec_mux2bits_tester <= #10 1'b0;
	in1_mux2bits_tester[1] <= #10 2'b0; in2_mux2bits_tester[1] <= #10 2'b1; selec_mux2bits_tester <= #10 1'b1;
	in1_mux2bits_tester[1] <= #10 2'b1; in2_mux2bits_tester[1] <= #10 2'b0; selec_mux2bits_tester <= #10 1'b0;
	in1_mux2bits_tester[1] <= #10 2'b1; in2_mux2bits_tester[1] <= #10 2'b0; selec_mux2bits_tester <= #10 1'b1;
	in1_mux2bits_tester[1] <= #10 2'b1; in2_mux2bits_tester[1] <= #10 2'b1; selec_mux2bits_tester <= #10 1'b0;
	in1_mux2bits_tester[1] <= #10 2'b1; in2_mux2bits_tester[1] <= #10 2'b1; selec_mux2bits_tester <= #10 1'b1;
	#20 $finish;
end
endmodule
