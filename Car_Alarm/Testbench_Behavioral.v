// scale time unit (value of one) / precision
`timescale 	1ns	/ 100ps

// Includes verilog files
// Can be omitted and called from the makefile
`include "Alarm_Behavioral_Description.v"
`include "tester.v"

// The Testbench module is declared
// Usually the signals in the test bench are wires.
// They do not store a value, they are handled by other module instances.

module TestsBench_module;

	wire SignalAlarmBehavioralDescription, CarLightsOnSign, OpenDoorSign, IgnitionSignalOn;

// Behavioral alarm description
	Alarm_Behavioral_Description	a_cond(	.CarAlarmSignal		(SignalAlarmBehavioralDescription),
									.CarLightsOnSign		(CarLightsOnSign),
									.OpenDoorSign		(OpenDoorSign),
									.IgnitionSignalOn		(IgnitionSignalOn)
	);

// Tester: signal generator and monitor
	tester 				prob(	.LogicGatesStructuralAlarmSignal	(LogicGatesStructuralAlarmSignal),
									.SignalAlarmBehavioralDescription	(SignalAlarmBehavioralDescription),
									.CarLightsOnSign		(CarLightsOnSign),
									.OpenDoorSign		(OpenDoorSign),
									.IgnitionSignalOn		(IgnitionSignalOn)
	);
endmodule
