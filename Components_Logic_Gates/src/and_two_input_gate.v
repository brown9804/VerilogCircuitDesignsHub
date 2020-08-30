// Defining the module for the two input AND gate
`ifndef AND_TWO_INPUT_GATE
`define AND_TWO_INPUT_GATE
module and_two_input_gate(
// inputs
input in1_and_gate,
input in2_and_gate,
//outputs
output out_and_gate
);

// Using verilog's definition for a OR GATE
and #4.3 and_gate(out_and_gate, in1_and_gate, in2_and_gate);
endmodule
`endif
