// Tester para flip_flop_single_type_D.v

// Definicion del modulo
module flip_flop_single_type_D_tester(
output reg clk_tester,
output reg D_tester,
input wire Q_tester
);

// Iniciando las pruebas
initial
begin
	$dumpfile("flip_flop_single_type_D_tester.vcd");

// Mensaje que se imprime en consola una vez
	$display ("\t\t\tclk_tester, \tQ_tester , \tD_tester");

// Mensaje que se imprime en consola cada vez que un elemento de la lista cambia
	$monitor($time,"\t%b\t%b\t\t%b", clk_tester, Q_tester, D_tester);

	// Se utiliza para especificar qué variables se van a poner en el dump file. La bibliografía menciona que la manera
	// simple de realizarlo es solo con $dumpvars dado que de este modo las asigan todas al banco de pruebas
	$dumpvars;
D_tester = 0;

	// Se estipula la cantidad de repitaciones estas son las que van #
  D_tester <= #10 1; clk_tester <= #6 1;
	D_tester <= #5 0;
	D_tester <= #10 0; clk_tester <= #6 0;
	D_tester <= #5 1;
	D_tester <= #10 1; clk_tester <= #6 1;
	D_tester <= #5 0 ;
	D_tester <= #10 1; 	clk_tester <= #6 0;
	D_tester <= #5 0;
  // Se imprime diez veces
	#40 $finish;
end // end initial
endmodule
