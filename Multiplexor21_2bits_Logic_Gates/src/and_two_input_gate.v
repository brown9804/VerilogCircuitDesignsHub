// Belinda Brown Ramírez
// Mayo, 2020
// timna.brown@ucr.ac.cr

`ifndef AND_TWO_INPUT_GATE
`define AND_TWO_INPUT_GATE


// Defining the module for the two input AND gate

module and_two_input_gate(
// inputs
input in1_and_gate,
input in2_and_gate,
//outputs
output out_and_gate
);

// Using verilog's definition for a gate or
and #4.3 and_gate(out_and_gate, in1_and_gate, in2_and_gate);
endmodule

// Local Variables:
// verilog-library-directories:("."):
// verilog-auto-wire-type:\"logic\"
// End:

`endif
