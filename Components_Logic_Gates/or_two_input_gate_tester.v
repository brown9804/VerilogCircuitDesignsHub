// Creando el tester para OR

//Creando el modulo del tester para la compuerta or de dos entradas
module or_two_input_gate_tester(
output reg in_or1_tester,
output reg in_or2_tester,
input wire out_or_tester
);

//Iniciando el tester
initial
begin
	$dumpfile("or_two_input_gate_tester.vcd");
	$dumpvars;
in_or1_tester = 0;
in_or2_tester =0;
// Se define cuantas veces se realiza la tareas
	in_or1_tester <= #15 0;  in_or2_tester <= #15 0;
	in_or1_tester <= #15 0;  in_or2_tester <= #15 1;
	in_or1_tester <= #15 1;  in_or2_tester <= #15 0;
	in_or1_tester <= #15 1;  in_or2_tester <= #15 1;

	#40 $finish;
end
endmodule
