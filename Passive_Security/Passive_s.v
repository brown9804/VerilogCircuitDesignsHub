// The structural module of the alarm is described, being this
// related to the logic gates or writing of the logic design


module Passive_s (
// Output - Type of PassiveSignal not indicated, implicit wire
	output 	PassiveSignal_s,
// Input - Type of CarLightsOnSign not indicated, implicit wire
	input 	CarLightsOnSign,
// The type of OpenDoorSign is not indicated, implicit wire
	input 	OpenDoorSign,
// The type of IgnitionSignalOn is not indicated, implicit wire
	input 	IgnitionSignalOn);


// In the structural descriptions, the ports of entry and
// output is always wires.
// In this scenario, the declaration of state is implicit
// wire state;


// Verilog primitive "not" gate, propagation delay = 1
// Departure, first port
	not #1 notgate(	x,
// Inputs, second port and others
			IgnitionSignalOn);


// Verilog primitive "and" gate, propagation delay = 1
// Departure, first port
	and #1 andgate(	PassiveSignal_s,
// Inputs, second port and others
			CarLightsOnSign,
			OpenDoorSign,
			x);
endmodule
