// Creating a module for mux 2: 1 of a bit

`include "and_two_input_gate.v"
`include "or_two_input_gate.v"
`include "inversor_as_not_gate.v"

// Declaring module
module mux2_1_1bit(
input in1_mux2_1_1bit,
input in2_mux2_1_1bit,
output out_mux1bit,
input selec_1bit
);

// Wires to connect the modules already created      
wire out_not_mux_1bit_conec;
wire out_1and_mux_1bit_conec, out_2and_mux_1bit_conec;

// Connecting with the created 1AND module
      and_two_input_gate and_mux211(.in1_and_gate (in1_mux2_1_1bit),
        .in2_and_gate (out_not_mux_1bit_conec),
        .out_and_gate (out_1and_mux_1bit_conec)
      );

// Connecting with the created NOT module
        inversor_as_not_gate	not_inversor_mux2_1(.in_not (selec_1bit),
          .out_not (out_not_mux_1bit_conec)
        );

// Connecting with the created 2AND module
        and_two_input_gate	and_mux212(.in1_and_gate (in2_mux2_1_1bit),
          .in2_and_gate (selec_1bit),
          .out_and_gate	(out_2and_mux_1bit_conec)
        );

// Connecting with the created OR module
      or_two_input_gate	or_mux2_1(.in_or1 (out_1and_mux_1bit_conec),
        .in_or2(out_2and_mux_1bit_conec),
        .out_or	(out_mux1bit)
      );
endmodule
