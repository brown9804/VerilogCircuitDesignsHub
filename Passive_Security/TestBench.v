// The testbench is related to the behavior and logical structure
// where each module receives signals from a Test sequence
// which are sent to a data monitor.


// scale time unit (value of one) / precision
`timescale 	1ns				/ 100ps

// Includes verilog files
// Can be omitted and called from the testbench
`include "Passive_b.v"
`include "Passive_s.v"
`include "tester.v"

// Testbench module
// Usually the signals in the test bench are wires.
// They do not store a value, they are handled by other module instances.
module TestsBench;

	wire PassiveSignal_b_tb, PassiveSignal_s_tb, CarLightsOnSign, OpenDoorSign, IgnitionSignalOn;

// Behavioral alarm description
	Passive_b	tb_Passive_b(	/*AUTOINST*/
		.PassiveSignal_b		(PassiveSignal_b_tb),
					.CarLightsOnSign		(CarLightsOnSign),
					.OpenDoorSign		(OpenDoorSign),
					.IgnitionSignalOn		(IgnitionSignalOn)
	);

// Structural description of alarm
	Passive_s	tb_Passive_s(	/*AUTOINST*/
		.PassiveSignal_s		(PassiveSignal_s_tb),
					.CarLightsOnSign		(CarLightsOnSign),
					.OpenDoorSign		(OpenDoorSign),
					.IgnitionSignalOn		(IgnitionSignalOn)
	);

// Tester: signal generator and monitor
	tester tester_testbench(/*AUTOINST*/
			.PassiveSignal_s (PassiveSignal_s_tb),
					.PassiveSignal_b	(PassiveSignal_b_tb),
					.CarLightsOnSign		(CarLightsOnSign),
					.OpenDoorSign		(OpenDoorSign),
					.IgnitionSignalOn		(IgnitionSignalOn)
	);
endmodule
