// Module for NOT gate 
module inversor_as_not_gate(
// Both output and input are wires
input in_not,
output out_not
);
      // Assign the inverse input to the output
      assign #2.4 out_not = ~in_not;
    endmodule
