// Creando modulo para mux 2:1 de dos bit
`include "mux2_1_1bit.v"

module mux2_1_2bit(
input [1:0] in1_mux2_1_2bit,
input [1:0] in2_mux2_1_2bit,
output [1:0] out_mux2bit,
input selec_2bit
);

// Realizando el mux de dos bits con dos mux de un bit

mux2_1_1bit mux2_1_1bit_1(.in1_mux2_1_1bit (in1_mux2_1_2bit[0]),
.in2_mux2_1_1bit (in2_mux2_1_2bit[0]),
.out_mux1bit (out_mux2bit[0]),
.selec_1bit (selec_2bit)
);

mux2_1_1bit mux2_1_1bit_2(.in1_mux2_1_1bit (in1_mux2_1_2bit[1]),
.in2_mux2_1_1bit (in2_mux2_1_2bit[1]),
.out_mux1bit (out_mux2bit[1]),
.selec_1bit (selec_2bit)
);
endmodule
