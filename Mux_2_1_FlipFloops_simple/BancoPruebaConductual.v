// escala	unidad temporal (valor de uno) / precision
`timescale 	1ns				/ 100ps
// incluye de archivos de verilog
// Pueden omitirse y llamarse desde el testbench
`include "mux2_1_conductual.v"
`include "probador.v"

module BancoPruebas; // Testbench
// Por lo general, las senales en el banco de pruebas son wires.
// No almacenan un valor, son manejadas por otras instancias de modulos.
// Dado que requieren coincidir con el tamaño de las entradas y salidas se debe asignar con su tamano
// definido en los modulos

// Si define formato de cantidad, se recomienda mantenerlo en el mismo formato siendo el
// mismo utilizado en el modulo para la cantidad de bits -- [1:0] ---, otra forma de hacerlo es con
// [0:1]
wire [1:0] data_out_banco_conduc, data_in0_banco_conduc, data_in1_banco_conduc;
wire reset_L_banco_conduc, clk_banco_conduc, selector_banco_conduc;

// Descripcion conductual de alarma
mux2_1	a_cond(	.data_out		(data_out_banco_conduc),
								.data_in0		(data_in0_banco_conduc),
								.data_in1		(data_in1_banco_conduc),
								.reset_L		(reset_L_banco_conduc),
								.clk				(clk_banco_conduc),
								.selector   (selector_banco_conduc)
);


// Probador: generador de senales y monitor
probador prob(.data_out_probador		(data_out_banco_conduc),
								.data_in0_probador		(data_in0_banco_conduc),
								.data_in1_probador		(data_in1_banco_conduc),
								.reset_L_probador		(reset_L_banco_conduc),
								.clk_probador				(clk_banco_conduc),
								.selector_probador   (selector_banco_conduc)

);
endmodule
