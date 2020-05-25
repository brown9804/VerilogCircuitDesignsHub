// The behavioral module of the car passive security is described

module Passive_b (
// PassiveSignal of type reg, stores the value
	output reg	PassiveSignal_b,
// The type of CarLightsOnSign is not indicated, implicit wire
	input 		CarLightsOnSign,
// The type of OpenDoorSign is not indicated, implicit wire
	input 		OpenDoorSign,
// The type of IgnitionSignalOn is not indicated, implicit wire
	input 		IgnitionSignalOn);


// In behavioral descriptions, the input ports are wires.
// The output ports can be wires or regs, depending on the
// implementation.
// always combinational, procedure / behavior block


// (*) Sensitivity list, enter "always" before any change
// in (CarLightsOnSign or OpenDoorSign or IgnitionSignalOn)

	always @ (*) begin
		if (CarLightsOnSign == 1 & OpenDoorSign == 1 & IgnitionSignalOn == 0)
// blocking assignment (=)
			PassiveSignal_b 	= 1;
      		else
// blocking assignment (=)
			PassiveSignal_b	= 0;
    	end
endmodule
