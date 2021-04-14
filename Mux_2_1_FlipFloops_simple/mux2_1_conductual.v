// Modulo conductual de un multiplexor con dos entradas de datos y una entrada de seleccion
// Mux 2:1 donde 2^n  son las entradas de datos y n es la entrada de seleccion

//Con el fin de entender los bits aginados [3:0] equivale a 4 bits y [1:0] a 2 bits

module mux2_1 (
// Se definen las entradas
input clk,
input reset_L,
input selector,
input [1:0] data_in0,
input [1:0] data_in1,

//se define la salida
output reg [1:0] data_out
);
reg [1:0] cable_conexion;



// Definiendo reset para los Flip Flops, se utiliza always@(*) debido a que se recomienda para
// crear un bloque combinacional (lógica combinacional), cuando no se requiere memoria en el bloque -
// sin flops. El always@(*) permite evitar pulgas
always @(*)
// inicio del bloque
    begin
        if(selector == 0)
          cable_conexion = data_in0;
        else begin
            if (selector == 1)
              cable_conexion = data_in1;
        end
    end



// Con el fin de definir los flip flops:  siendo esto un dispositivo de dos estados (biestables), que sirve como
// memoria básica para las operaciones de lógica secuencial.

// Para la entrada 0 y 1 - salida
always @ (posedge clk) begin
      if (reset_L == 1)
         data_out <= cable_conexion;
      else begin
        if (reset_L == 0)
          data_out <= 0;
      end
      end

endmodule
