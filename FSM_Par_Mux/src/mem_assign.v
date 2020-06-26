`ifndef MEM_ASSIGN
`define MEM_ASSIGN

// Belinda Brown Ramírez
// June, 2020
// timna.brown@ucr.ac.cr
// Co-worked with Brandon Esquivel

module mem_module #(
parameter WORD_SIZE = 4
) (
    // Inputs
    input wire clk,
    input wire reset,
    input wire [WORD_SIZE-1:0] mem_data_in,
    // Outputs
    output reg [WORD_SIZE-1:0] mem_data_out
);

reg [WORD_SIZE-1:0] memory;

    always @ (posedge clk) begin
        if(reset==0) begin
            mem_data_out <= 0;
            memory <= 0;
        end
        else begin
            memory <= mem_data_in;
            mem_data_out <= memory;
        end
    end

endmodule

// Local Variables:
// verilog-library-directories:("."):
// End:
`endif
