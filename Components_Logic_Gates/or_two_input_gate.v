// Defining the module for the two input OR gate

module or_two_input_gate(
// inputs
input in_or1,
input in_or2,
//outputs
output out_or
);

// Using verilog's definition for a gate or
or #4.6 or_gate(in_or1, in_or2, out_or);
endmodule
