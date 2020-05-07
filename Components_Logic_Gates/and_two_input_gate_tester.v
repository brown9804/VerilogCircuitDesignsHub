// Creating the tester for and_two_input_gate.v

// Creating the tester module for the two input gate or
module and_two_input_gate_tester(

output reg in1_and_gate_tester,
output reg in2_and_gate_tester,
input wire out_and_gate_tester
);

// Starting the tester
initial
begin
	$dumpfile("and_two_input_gate_tester.vcd");
	$dumpvars;

in1_and_gate_tester = 0;
in2_and_gate_tester = 0;
// It is defined how many times the tasks are performed
	in1_and_gate_tester <= #15 0;  in2_and_gate_tester <= #15 0;
	in1_and_gate_tester <= #15 0;  in2_and_gate_tester <= #15 1;
	in1_and_gate_tester <= #15 1;  in2_and_gate_tester <= #15 0;
	in1_and_gate_tester <= #15 1;  in2_and_gate_tester <= #15 1;

	#40 $finish;
end
endmodule
