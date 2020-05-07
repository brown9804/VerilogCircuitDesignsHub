// Creating the tester for OR

// Creating the tester module for the two input gate or
module or_two_input_gate_tester(
output reg in_or1_tester,
output reg in_or2_tester,
input wire out_or_tester
);


// Starting the tester for OR gate 
initial
begin
	$dumpfile("or_two_input_gate_tester.vcd");
	$dumpvars;

	in_or1_tester = 0;
	in_or2_tester = 0;


	#5 in_or1_tester = 1;
	#5 in_or2_tester = 1;
	
	#5 in_or1_tester = 0;
	#5 in_or2_tester = 0;


// It is defined how many times the tasks are performed
	in_or1_tester <= #15 0;  in_or2_tester <= #15 0;
	in_or1_tester <= #15 0;  in_or2_tester <= #15 1;
	in_or1_tester <= #15 1;  in_or2_tester <= #15 0;
	in_or1_tester <= #15 1;  in_or2_tester <= #15 1;

	#40 $finish;
end
endmodule
