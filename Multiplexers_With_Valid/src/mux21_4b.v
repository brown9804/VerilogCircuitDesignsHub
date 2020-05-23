`ifndef MUX21_4B
`define MUX21_4B


// Using  2 muxes 2: 1 of 2 bits its a mux de 2: 1 of  4 bits
// with bit valid working as enable flag

// Includes
`include "./src/mux21_2b.v"

// Defining module
module mux21_4b(
//inputs
input wire clk,
input wire reset,
input wire select,
input wire [3:0] in0,
input wire [3:0] in1,
// Input valids
input wire in0_valid,
input wire in1_valid,
//outputs
output reg [3:0] out_b,
// Valid output
output reg out_valid_b
);

wire valid0, valid1;
wire [1:0] data0, data1;

// First mux of 2:1 2 bits
// Has the bit0 and bit1 of this mux
mux21_2b mux21_4b1(.clk (clk),
.reset    (reset),
.select      (select),
// For the input 0 of 2:1 4 bits
// We  conect 2 bits at: bit0 and bit1 of this mux
.in0   (in0[1:0]),
// For the input 1 of 2:1 4 bits
// Same we conect 2 bits at: bit0 and bit1 of this mux
.in1     (in1[1:0]),
// Valid inputs
.in0_valid   (in0_valid),
.in1_valid   (in1_valid),
// Outputs bit0 and bit1
.out_b   (data0),
// Valid output
.out_valid_b      (valid0)
);

// Second mux of 2:1 2 bits
// Has the bit2 and bit3 of this mux
mux21_2b mux21_4b2(.clk (clk),
.reset    (reset),
.select      (select),
// For the input 0 of 2:1 4 bits
// We  conect 2 bits at: bit2 and bit3  of this mux
.in0    (in0[3:2]),
// For the input 1 of 2:1 4 bits
// Same we conect 2 bits at: bit2 and bit3 of this mux
.in1     (in1[3:2]),
//Valids for inputs
.in0_valid   (in0_valid),
.in1_valid   (in1_valid),
// Outputs bit2 and bit3
.out_b     (data1),
.out_valid_b      (valid1)
);


always @ (*)
begin
  out_b[1:0] =data0;
  out_b[3:2] = data1;

if(valid0 == valid1 && valid0 == 1 )
begin
  out_valid_b = 1;
end // end if
else begin
  out_valid_b = 0;
end // end else
end // end always
endmodule



// Local Variables:
// verilog-library-directories:("."):
// End:
`endif
