// Defining the module for the two input OR gate

// Belinda Brown Ramírez
// Mayo, 2020
// timna.brown@ucr.ac.cr

`ifndef OR_TWO_INPUT_GATE
`define OR_TWO_INPUT_GATE

module or_two_input_gate(
// inputs
input in_or1,
input in_or2,
//outputs
output out_or
);

// Using verilog's definition for a gate or
or #4.6 or_gate(out_or, in_or1, in_or2);
endmodule

// Local Variables:
// verilog-library-directories:("."):
// verilog-auto-wire-type:\"logic\"
// End:

`endif
