
// Instantiating a module

// In behavioral descriptions, the input ports are wires.
// The output ports can be wires or regs, depending on the
// implementation.

// Instance the behavioral module of the car alarm
module Alarm_Behavioral_Description_autoinst (
// CarAlarmSignal of type reg, stores the value
	output reg	CarAlarmSignal,
// The type of CarLightsOnSign is not indicated, implicit wire
	input 		CarLightsOnSign,
// The type of OpenDoorSign is not indicated, implicit wire
	input 		OpenDoorSign,
// The type of IgnitionSignalOn is not indicated, implicit wire
	input 		IgnitionSignalOn);


// Since it is required to perform using AUTOINST, the always ...
// always combinational, procedure / behavior block


// (*) Sensitivity list, enter "always" before any change
// in (CarLightsOnSign or OpenDoorSign or IgnitionSignalOn)

//	always @ (*) begin
	//	if (CarLightsOnSign == 1 & OpenDoorSign == 1 & IgnitionSignalOn == 0)
	// blocking assignment (=)
	//		CarAlarmSignal 	= 1;
  //    		else
	// blocking assignment (=)
	//		CarAlarmSignal	= 0;
  //  	end


	// Instantiating the module, notice that it goes inside the same module. When running it with emacs
	// using the makefile automate the inputs and outputs.

	Alarm_Behavioral_Description_autoinst insta_modulo_autoinst
	(/*AUTOINST*/);
endmodule
