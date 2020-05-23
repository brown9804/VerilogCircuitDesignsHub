`ifndef MUX21_2B
`define MUX21_2B


// Behavioral module of a multiplexer with two data inputs and one selection input
// Mux 2: 1 where 2 ^ n are the data inputs and n is the select input

// In order to understand the bits bits [3: 0] equals 4 bits and [1: 0] 2 bits

module mux21_2b(
// The inputs are defined
input wire clk,
input wire reset,
input wire select,
input wire [1:0] in0,
input wire [1:0] in1,
// Valid for inputs
input wire in0_valid,
input wire in1_valid,
// The outputs are defined
output reg [1:0] out_b,
// Valid for ouput because its going to be used for create mux 2:1 4 bits
// It's for definition "a bit valid"
output reg out_valid_b
);

reg [1:0] out_con;
reg out_val;
// Mux 2:1 2 bits with valid
// Defining reset for Flip Flops
// In order to define flip flops: this being a two-state (bi-stable) device, which serves as
// basic memory for sequential logic operations.
always @(posedge clk) // Each positive edge of the clock make these changes
//If this happens on a positive edge of the clock, make the following changes for the next clock edge
    begin
    // Reset synchronous
    if (reset == 0) // If reset in LOW nonblobking assing zero
      begin
          out_b <= 0;
          out_valid_b <= 0;
      end // end reset zero

    else begin // reset == 1

    case(select)
        0:   begin
            if (in0_valid == 1)
              begin
                    out_valid_b <= in0_valid;
                    out_b <= in0;
              end // in0_valid == 1
              else begin
                    out_valid_b <= 0;
              end // end valid == 0
        end // end select == 0

        1: begin
            if (in1_valid == 1)
            begin
                out_valid_b <= in1_valid;
                out_b <= in1;
            end // in1_valid == 1
            else begin
                 out_valid_b <= 0;
            end
        end // end select == 1

        default: begin
            out_valid_b <= 0;
            out_b <= 2'b00;
        end // end default
    endcase // end case selec == 0 or select == 1
    end // end reset
 end // end posedge clk
endmodule


// Local Variables:
// verilog-library-directories:("."):
// verilog-auto-wire-type:\"logic\"
// End:

`endif
