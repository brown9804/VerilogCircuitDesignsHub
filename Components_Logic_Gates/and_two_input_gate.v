// Definiendo el modulo para la compuerta AND de dos entradas

module and_two_input_gate(
// entradas
input in1_and_gate,
input in2_and_gate,
//salida
output out_and_gate
);

//Utilizando la definicion de verilog para una compuerta or
and #4.3 and_gate(out_and_gate, in1_and_gate, in2_and_gate);
endmodule
