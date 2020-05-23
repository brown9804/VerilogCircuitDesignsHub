`ifndef MUX41_4B
`define MUX41_4B


// Mux 4:1 of 4 bits using:
// mux 2:1 4 bit ---- output 1
// mux 2:1 4 bit ---  output 2
// mux 2:1 4 bit ----  input are output 1 and ouput 2

// With bit valid working as enable flag


// Includes
`include "./src/mux21_4b.v"

// Defining module
module mux41_4b(
// Inputs
input wire clk,
input wire reset,
input wire [1:0] select,
input wire [3:0] in0,
input wire [3:0] in1,
input wire [3:0] in2,
input wire [3:0] in3,
//Valid inputs
input wire in0_valid,
input wire in1_valid,
input wire in2_valid,
input wire in3_valid,
// Outputs
output [3:0] out_b,
// Valid output
output out_valid_b
);

wire [3:0] out_1_mux, out_2_mux;
wire valid_1_mux, valid_2_mux;
// wire [3:0] out_3_mux;
// wire valid_3_mux;
// reg [1:0] valid_conexions;

//            Mux #1
// Conecting a mux 2:1 of 4 bits
// Conecting inputs with  of this mux
mux21_4b mux41_1(.clk (clk),
.reset    (reset),
.select      (select[0]),
//            Inputs
// In0
.in0    (in0),
// In1
.in1     (in1),
// Valid inputs
.in0_valid   (in0_valid),
.in1_valid   (in1_valid),
//Output
// Bit0 and Bit1
.out_b     (out_1_mux),
// Valid outputs
.out_valid_b      (valid_1_mux)
);

//          Mux #2
// Conecting a mux 2:1 of 4 bits
// Conecting inputs with  of this mux
mux21_4b mux41_2(.clk (clk),
.reset    (reset),
.select      (select[0]),
//          Inputs
// In2
.in0    (in2),
// In3
.in1     (in3),
// Valid inputs
.in0_valid   (in2_valid),
.in1_valid   (in3_valid),
//Outpus
// Bit2 and Bit3
.out_b     (out_2_mux),
// Valid outputs
.out_valid_b      (valid_2_mux)
);

//        Mux #3
// Conecting the outputs of the MUX#1 and MUX#2 as
// inputs of this mux
// Conecting inputs with  of this mux
mux21_4b mux41_3(.clk (clk),
.reset    (reset),
.select      (select[1]),
//            Inputs
// Of mux#1
// In0
.in0    (out_1_mux),
// In1
.in1    (out_2_mux),
// Valid inputs
.in0_valid   (valid_1_mux),
.in1_valid   (valid_2_mux),
//Outpus
.out_b    (out_b),
// Valid outputs
.out_valid_b      (out_valid_b)
);
endmodule


// Local Variables:
// verilog-library-directories:("."):
// End:
`endif
