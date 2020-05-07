// Creando banco de pruebas para los siguientes elementos
// and_two_input_gate, or_two_input_gate, inversor_as_not_gate,
// inversor_as_not_gate, mux_2_1_2bit, mux2_1_2bit

// escala	unidad temporal medida para los retardos y simulacion (time_unit) / define como se
// redondean los valores de retardo antes de usarse en la simulacion(time_precision)
`timescale 	1ns / 1ns

// Incluyendo archivos
`include "and_two_input_gate_tester.v"
`include "or_two_input_gate_tester.v"
`include "flip_flop_single_type_D.v"
`include "flip_flop_single_type_D_tester.v"
`include "inversor_as_not_gate_tester.v"
//`include "mux2_1_1bit.v"
`include "mux2_1_2bit.v"
`include "mux2_1_1bit_tester.v"
`include "mux2_1_2bit_tester.v"


module BancoPruebas_Elementos; // Testbench
// Por lo general, las senales en el banco de pruebas son wires.
// No almacenan un valor, son manejadas por otras instancias de modulos.
// Dado que requieren coincidir con el tamaño de las entradas y salidas se debe asignar con su tamano
// definido en los modulos

// Si define formato de cantidad, se recomienda mantenerlo en el mismo formato siendo el
// mismo utilizado en el modulo para la cantidad de bits -- [1:0] ---, otra forma de hacerlo es con
// [0:1]

wire in1_AND_testbench, in2_AND_testbench, out_AND_testbench;
wire in1_OR_testbench, in2_OR_testbench, out_OR_testbench;
wire d_FF_testbench, q_FF_testbench, clk_testbench;
wire in_NOT_testbench, out_NOT_testbench;
wire out_1bit_testbench, in1_1bit_testbench, in2_1bit_testbench, select_1bit_testbench;
wire [1:0] out_2bit_testbench, in1_2bit_testbench, in2_2bit_testbench;
wire select_2bit_testbench;


// Dado que son 6 elementos y dos archivos por elemento tenemos 12 modulos que importar...

// 1. AND GATE

// Conectando modulo and gate
and_two_input_gate	and_two_input_gate_testbench(.out_and_gate		(out_AND_testbench),
								.in1_and_gate		(in1_AND_testbench),
								.in2_and_gate		(in2_AND_testbench)
);


// 2. AND GATE TESTER

// Generador de senales y monitor
and_two_input_gate_tester	and_two_input_gate_tester_testbench(.out_and_gate_tester		(out_AND_testbench),
								.in1_and_gate_tester		(in1_AND_testbench),
								.in2_and_gate_tester		(in2_AND_testbench)
);

// 3. OR GATE

// Conectando modulo and gate
or_two_input_gate	or_two_input_gate_testbench(.out_or		(out_AND_testbench),
	              .in_or1		(in1_OR_testbench),
								.in_or2		(in2_OR_testbench)

);


// 4. OR GATE TESTER

// Generador de senales y monitor
or_two_input_gate_tester	or_two_input_gate_tester_testbench(.out_or_tester		(out_OR_testbench),
								.in_or1_tester		(in1_OR_testbench),
								.in_or2_tester		(in2_OR_testbench)
);


// 5. FLIP-FLIP

//Conectando el modulo de Flip Flop
flip_flop_single_type_D flip_flop_testbench(.Q (q_FF_testbench),
              .D (d_FF_testbench),
              .clk (clk_testbench)
);

// 6. FLIP-FLIP TESTER

//  Realizando las conexiones del tester
flip_flop_single_type_D_tester flip_flop_tester_testbench(.Q_tester (q_FF_testbench),
							.D_tester (d_FF_testbench),
							.clk_tester (clk_testbench)
);

// 7. NOT GATE

// Conectando modulo de NOT gate
inversor_as_not_gate inversor_as_not_gate_testbench(.out_not (out_NOT_testbench),
             .in_not (in_NOT_testbench)
);

// 8. NOT GATE TESTER
inversor_as_not_gate_tester inversor_as_not_gate_tester_testbench(.tester_out_not (out_NOT_testbench),
            .tester_in_not (in_NOT_testbench)
);

// 9. MUX 2:1 1 BIT
mux2_1_1bit mux2_1_1bit_testbench(.out_mux1bit (out_1bit_testbench),
.in1_mux2_1_1bit (in1_1bit_testbench),
.in2_mux2_1_1bit (in2_1bit_testbench),
.selec_1bit (select_1bit_testbench)
);

// 10. MUX 2:1 1 BIT TESTER
mux2_1_1bit_tester mux2_1_1bit_tester_testbench(.out_mux1bits_tester (out_mux1bit_testbench),
.in1_mux1bits_tester (in1_mux1bit_testbench),
.in2_mux1bits_tester (in2_mux1bit_testbench),
.selec_mux1bits_tester (selec_mux1bit_testbench)
);

// 11. MUX 2:1 2 BIT
mux2_1_2bit mux2_1_2bit_testbench(.out_mux2bit (out_2bit_testbench),
.in1_mux2_1_2bit (in1_2bit_testbench),
.in2_mux2_1_2bit (in2_2bit_testbench),
.selec_2bit (select_2bit_testbench)
);

// 12. MUX 2:1 2 BIT TESTER
mux2_1_2bit_tester mux2_1_2bit_tester_testbench(.out_mux2bits_tester (out_2bit_testbench),
.in1_mux2bits_tester (in1_2bit_testbench),
.in2_mux2bits_tester (in2_2bit_testbench),
.selec_mux2bits_tester (select_2bit_testbench)
);

endmodule
