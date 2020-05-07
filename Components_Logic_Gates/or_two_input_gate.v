// Definiendo el modulo para la compuerta OR de dos entradas

module or_two_input_gate(
// entradas
input in_or1,
input in_or2,
//salida
output out_or
);

//Utilizando la definicion de verilog para una compuerta or
or #4.6 or_gate(in_or1, in_or2, out_or);
endmodule
