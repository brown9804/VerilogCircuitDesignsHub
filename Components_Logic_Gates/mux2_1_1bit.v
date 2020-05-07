// Creando modulo para mux 2:1 de un bit

`include "and_two_input_gate.v"
`include "or_two_input_gate.v"
`include "inversor_as_not_gate.v"

// Declarando modulo
module mux2_1_1bit(
input in1_mux2_1_1bit,
input in2_mux2_1_1bit,
output out_mux1bit,
input selec_1bit
);

// Cables para conectar los modulos ya creados
wire out_not_mux_1bit_conec;
wire out_1and_mux_1bit_conec, out_2and_mux_1bit_conec;

// Conectando con el modulo de 1AND creado
      and_two_input_gate and_mux211(.in1_and_gate (in1_mux2_1_1bit),
        .in2_and_gate (out_not_mux_1bit_conec),
        .out_and_gate (out_1and_mux_1bit_conec)
      );

// Conectando con el modulo de NOT creado
        inversor_as_not_gate	not_inversor_mux2_1(.in_not (selec_1bit),
          .out_not (out_not_mux_1bit_conec)
        );

// Conectando con el modulo de 2AND creado
        and_two_input_gate	and_mux212(.in1_and_gate (in2_mux2_1_1bit),
          .in2_and_gate (selec_1bit),
          .out_and_gate	(out_2and_mux_1bit_conec)
        );

// Conectando con el modulo de OR creado
      or_two_input_gate	or_mux2_1(.in_or1 (out_1and_mux_1bit_conec),
        .in_or2(out_2and_mux_1bit_conec),
        .out_or	(out_mux1bit)
      );
endmodule
