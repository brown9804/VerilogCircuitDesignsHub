// Creando el tester para and_two_input_gate.v

//Creando el modulo del tester para la compuerta or de dos entradas
module and_two_input_gate_tester(

output reg in1_and_gate_tester,
output reg in2_and_gate_tester,
input wire out_and_gate_tester
);

//Iniciando el tester
initial
begin
	$dumpfile("and_two_input_gate_tester.vcd");
	$dumpvars;

in1_and_gate_tester = 0;
in2_and_gate_tester = 0;
// Se define cuantas veces se realiza la tareas
	in1_and_gate_tester <= #15 0;  in2_and_gate_tester <= #15 0;
	in1_and_gate_tester <= #15 0;  in2_and_gate_tester <= #15 1;
	in1_and_gate_tester <= #15 1;  in2_and_gate_tester <= #15 0;
	in1_and_gate_tester <= #15 1;  in2_and_gate_tester <= #15 1;

	#40 $finish;
end
endmodule
