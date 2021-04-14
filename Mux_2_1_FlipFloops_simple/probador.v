// Se define el modulo tester
module probador(

input [1:0] data_out_probador,
output reg [1:0] data_in0_probador,
output reg [1:0] data_in1_probador,
output reg reset_L_probador,
output reg clk_probador,
output reg selector_probador
);



//Bloque inicial funciona para brindarle los estimulos iniciales - si lo pensamos físicamente,
// se puede interpretar como estímulos del ambiente que va recibir el dispositivo que estamos creando -
// Una analogía con ecuaciones matemáticas sería comparando el bloque inicial
// con condiciones iniciales para encontrar un resultado.
initial
begin

// Definiendo el dumpfile NOMBRE_DEL_ARCHIVO_ESCOGENCIA_PERSONAL.vcd), o bien conocidor por variable change dump, este archivo contiene
// informacion sobre simulador utilizado, escala de tiempo , fecha de creacion, definiciones de variables, y cambios de valor.
    $dumpfile("mux2_1_con_Flip_flop.vcd");
// Mensaje que se imprime en consola una vez
    $display ("\t\t\tclk_probador,\treset_L_probador,\tselector_probador,\tdata_in0_probador,\tdata_in1_probador, \tdata_out_probador");
// Mensaje que se imprime en consola cada vez que un elemento de la lista cambia
    $monitor($time,"\t%b\t%b\t\t%b\t\t%b\t\t%b\t\t%b", clk_probador, reset_L_probador, selector_probador, data_in0_probador, data_in1_probador, data_out_probador);
// Se utiliza para especificar qué variables se van a poner en el dump file. La bibliografía menciona que la manera
// simple de realizarlo es solo con $dumpvars dado que de este modo las asigan todas al banco de pruebas
    $dumpvars;

// Se debe cambiar el estímulo, donde este permite hacer pruebas para dar idea el comportamiento de las señales.
// Por ende se van a iniciarlizar las entradas con un valor escogido entre uno y cero. Dado que no se definen
// condiciones iniciales en la solicitud del algoritmo. Se escojen personalmente.

// ASIGANCIONES D VERILOG PARA NUMEROS - FORMATO
// 'b Base binaria
//'d Base decimal
//'h Base hexadecimal
//'o Base octal
// y lo que viene después de la letra es el valor entonces en el caso de de binario
// se considerna los siguiente ejemplos para su comprension
// 2'b0 = 2'b00 = 00
// 2'b1 = 2'b01 = 01
// 2'b10 = 10
// 2'b11 = 11
// Si no indica el tamaño se asigna por defecto 32 bits, es decir 'b0= 00000000000000000000000000000000

// Esto pasa el primer ciclo de reloj... Definiendo valores iniciales ....
  data_in0_probador = 2'b0;
  data_in1_probador = 2'b0;
  selector_probador = 0;
  reset_L_probador = 0;

// Se realiza la siguiente prueba       #1

  repeat(3) begin
    @(posedge clk_probador);
// Una vez que pasa el primer ciclo de reloj las senales
// Con el fin de que las senales pasen por todos sus valores posibles
    {data_in0_probador, data_in1_probador} <= {data_in0_probador, data_in1_probador} + 2'b1;
    selector_probador <= selector_probador + 1;
    reset_L_probador <= 1;

// Se realiza la siguiente prueba       #2
    @(posedge clk_probador);
// Una vez que pasa el primer ciclo de reloj las senales
// Con el fin de que las senales pasen por todos sus valores posibles
  {data_in0_probador, data_in1_probador} <= {data_in0_probador, data_in1_probador} + 2'b1;
   selector_probador <= selector_probador + 1;
   reset_L_probador <= 1;

// Se realiza la siguiente prueba       #3
    @(posedge clk_probador);
// Una vez que pasa el primer ciclo de reloj las senales
// Con el fin de que las senales pasen por todos sus valores posibles
  {data_in0_probador, data_in1_probador} <= {data_in0_probador, data_in1_probador} + 2'b1;
  {reset_L_probador, selector_probador} <= {reset_L_probador, selector_probador} + 1;
end

// Termina de almacenar senales
  $finish;
end // end del bloque initial
// Para el reloj
// Valor inicial al reloj, sino siempre será indeterminado
initial	clk_probador 	<= 0;
// Hace "toggle" cada 2*10ns
always	#2 clk_probador 	<= ~clk_probador;
endmodule
