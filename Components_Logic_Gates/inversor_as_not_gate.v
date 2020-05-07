module inversor_as_not_gate(
// Tanto salida como entrada son wires
input in_not,
output out_not
);
      // Se le asigna lo entrada inversa a la salida
      assign #2.4 out_not = ~in_not;
    endmodule
