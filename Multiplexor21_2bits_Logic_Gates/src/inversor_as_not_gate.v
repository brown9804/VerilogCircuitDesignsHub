// Belinda Brown Ramírez
// Mayo, 2020
// timna.brown@ucr.ac.cr

`ifndef INVERSOR_AS_NOT_GATE
`define INVERSOR_AS_NOT_GATE


module inversor_as_not_gate(
// Both output and input are wires
input in_not,
output out_not
);
      // Assign the inverse input to the output
      assign #2.4 out_not = ~in_not;
    endmodule

  // Local Variables:
  // verilog-library-directories:("."):
  // verilog-auto-wire-type:\"logic\"
  // End:

  `endif
