// tester for flip_flop_single_type_D.v

// Module definition
module flip_flop_single_type_D_tester(
output reg clk_tester,
output reg D_tester,
input wire Q_tester
);

// Starting the tests
initial
begin
	$dumpfile("flip_flop_single_type_D_tester.vcd");

// Message that prints to console once
	$display ("\t\t\tclk_tester, \tQ_tester , \tD_tester");

// Message that is printed in console every time a list item changes
	$monitor($time,"\t%b\t%b\t\t%b", clk_tester, Q_tester, D_tester);

// It is used to specify which variables are to be put in the dump file. The bibliography mentions that the way
// simple to do it is only with $ dumpvars since this way they all assign them to the test bench
	$dumpvars;
D_tester = 0;

// The number of repetitions is stipulated, these are the ones that go #
  D_tester <= #10 1; clk_tester <= #6 1;
	D_tester <= #5 0;
	D_tester <= #10 0; clk_tester <= #6 0;
	D_tester <= #5 1;
	D_tester <= #10 1; clk_tester <= #6 1;
	D_tester <= #5 0 ;
	D_tester <= #10 1; 	clk_tester <= #6 0;
	D_tester <= #5 0;
// prints ten times
	#40 $finish;
end // end initial
endmodule
