// Tester para NOT
  module inversor_as_not_gate_tester(
//Registro de 1 bit conectado a la entrada del inversor
output reg tester_in_not,
// Cable conectado a la salida del inversor
input wire tester_out_not
);

  //Inicio de las pruebas
  initial begin

    // Archivo para almacenar los resultados
    $dumpfile("inversor_as_not_gate_tester.vcd");
    $dumpvars;


    // Ponemos la entrada del inversor a 0
    #15 tester_in_not = 0;

    if (tester_out_not != 1)
      #10 $display("Hay un error, se esperaba un valor de 1 y se leyó: %d", tester_out_not);


    // Después de otras 5 unidades de tiempo, cambiamos la entrada
    #15 tester_in_not = 1;

    // Después de 5 unidades de tiempo más, verificamos si hay un 0 en la salida
    if (tester_out_not != 0)
      #10 $display("Hay un error, se esperaba un valor de 0 y se leyó: %d", tester_out_not);

    #15 $display("Terminan las pruebas simuladas");
    #25 $finish;
  end
  endmodule
