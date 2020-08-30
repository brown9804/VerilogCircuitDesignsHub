// Tester module: signal generator enters behavioral descriptions (architectural = behavior)
// and in the structural one (logic gates) and arrive at the data monitor

`ifndef T_PASSIVE
`define T_PASSIVE

// Define the tester module
module tester(
// The inputs are defined
	input		PassiveSignal_b,
	input		PassiveSignal_s,
// the outputs are defined
	output reg	CarLightsOnSign,
	output reg	OpenDoorSign,
	output reg	IgnitionSignalOn);

// The clock is defined
	reg 		clk;


// Procedure block, not synthesizable, it is traversed only once
// Generally, initials are only used in testbench or testers
// It is always recommended to synchronize with the clock and use
// non-blocking assignments in signal generation

	initial begin
// The file name of the dump is defined
		$dumpfile("Passive.vcd");
// Directive to "dump" variables
		$dumpvars;
// Message that prints to console once
		$display ("\t\t\tclk,\tPassiveSignal_s,\tPassiveSignal_b,\tCarLightsOnSign,\tOpenDoorSign,\tIgnitionSignalOn");
// Message that is printed in console every time a list item changes
		$monitor($time,"\t%b\t%b\t\t%b\t\t%b\t%b\t%b", clk, PassiveSignal_s, PassiveSignal_b, CarLightsOnSign, OpenDoorSign, IgnitionSignalOn);
// To the 3 bits, assign a bit type with value 0.
		CarLightsOnSign = 0;
		OpenDoorSign = 0;
		IgnitionSignalOn =0;
// Repeat 5 times
		repeat (5) begin
// The notation of synchronizing with @ (posedge clk) is very important; and later,
// do a non-blocking assignment (<=), it will save you time.
// wait and sync to the positive edge of the clock
						@(posedge clk);
// Sum 1, non-blocking allocation
			{CarLightsOnSign, OpenDoorSign, IgnitionSignalOn} <= {CarLightsOnSign, OpenDoorSign, IgnitionSignalOn} + 1;
		end


		@(posedge clk);
// Assign a bit type with value 0, of size N
		{CarLightsOnSign, OpenDoorSign, IgnitionSignalOn} <= 0;
// Finish storing signals
		$finish;
	end


// For the clock
// Initial value to the clock, otherwise it will always be undetermined
	initial	clk 	<= 0;
// Toggle (it's like a toggle where it enables / disables) every 2 * 10ns
	always	#2 clk 	<= ~clk;
endmodule

`endif
