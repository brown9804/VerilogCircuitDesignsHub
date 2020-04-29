// The testbench is related to the behavior and logical structure
// where each module receives signals from a Test sequence
// which are sent to a data monitor.


// scale time unit (value of one) / precision
`timescale 	1ns				/ 100ps

// Includes verilog files
// Can be omitted and called from the testbench
`include "Alarm_Behavioral_Description.v"
`include "Alarm_Estruc_LogicGates_Description.v"
`include "tester.v"

// Testbench module
// Usually the signals in the test bench are wires.
// They do not store a value, they are handled by other module instances.
module TestsBench_module;

	wire SignalAlarmBehavioralDescription, LogicGatesStructuralAlarmSignal, CarLightsOnSign, OpenDoorSign, IgnitionSignalOn;

// Behavioral alarm description
	Alarm_Behavioral_Description	a_cond(	.CarAlarmSignal		(SignalAlarmBehavioralDescription),
					.CarLightsOnSign		(CarLightsOnSign),
					.OpenDoorSign		(OpenDoorSign),
					.IgnitionSignalOn		(IgnitionSignalOn)
	);

// Structural description of alarm
	Alarm_Estruc_LogicGates_Description	a_estr(	.CarAlarmSignal		(LogicGatesStructuralAlarmSignal),
					.CarLightsOnSign		(CarLightsOnSign),
					.OpenDoorSign		(OpenDoorSign),
					.IgnitionSignalOn		(IgnitionSignalOn)
	);

// Tester: signal generator and monitor
	tester tester_(		.LogicGatesStructuralAlarmSignal	(LogicGatesStructuralAlarmSignal),
					.SignalAlarmBehavioralDescription	(SignalAlarmBehavioralDescription),
					.CarLightsOnSign		(CarLightsOnSign),
					.OpenDoorSign		(OpenDoorSign),
					.IgnitionSignalOn		(IgnitionSignalOn)
	);
endmodule
