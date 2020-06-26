// Belinda Brown Ramírez
// June, 2020
// timna.brown@ucr.ac.cr

// Design of a state machine and a
// parameterized multiplexer.
// Final details of logic implemented was
//  made because of the lack of time in
// colaboration with
// Brandon Esquivel

`ifndef FSM_MUX
`define FSM_MUX

`include "./src/mem_assign.v"


module fsm_par_mux #(
// Parameters
parameter BUS_SIZE = 16,
parameter WORD_SIZE = 4,
parameter WORD_NUM = BUS_SIZE / WORD_SIZE
)(
  // Inputs
  input clk,
  input [BUS_SIZE-1:0] bus_data_in,
  input reset,
  output reg [BUS_SIZE-1:0] bus_data_out,
  output reg nxt_state,
  output reg state_control,
  output reg nxt_error,
  output reg error
);

////// Internal wires declaration //////
//******* For assign mem
wire [BUS_SIZE-1:0] out_data;
genvar i;

//******* for fsm
parameter RESET_STATE = 0;
parameter FIST_PKT = 1;
parameter REG_PKT = 2 ;
parameter F_ERROR = 3;
parameter SEQ_ERROR = 4;

reg next_state, state;
reg next_error;
reg error_in;
reg [WORD_SIZE-1:0] lsw;
reg [WORD_SIZE-1:0] msw;
///////////////////// Control Logic /////////////////////
generate
for (i=0; i < WORD_NUM; i=i+1) begin : MEMORY

  mem_module #(	  .WORD_SIZE	(WORD_SIZE)
        )
    controlling (
            //  Outputs
            .mem_data_out	  (out_data	[ (BUS_SIZE - 1 - i*WORD_SIZE) : (BUS_SIZE - (i+1)*WORD_SIZE)]), // out^-1
            // Inputs
						.clk	  	  (clk),
						.reset  		(reset),
          	.mem_data_in	  (bus_data_in	[(i*WORD_SIZE)+: WORD_SIZE]) // [begin +: width]
					);
	end
endgenerate

// ////////////////////// Generate template created ////////////////////////////////
// generate
// for (i = 0; i < 4 ; i = i + 1) begin: Control_SEQ1
//   for (j=4; j<8;  j=j+1)  begin
//     always @(posedge clk) begin
//        control1[i] <= bus_data_in[j];
//     end // end clk
// end // end for j
// end // end for i
// endgenerate

///////////////// FSM ///////////////////////////


always @ (posedge clk)
  begin
     // Reset synchronous
     if (reset==0) // If reset in LOW nonblobking assing zero
       begin
        next_state<= 0;
        state <= 0;
        next_error <= 0;
        error_in <= 0;
       end // end reset zero

    else begin
      state <= next_state;
      error_in <= next_error;
      lsw <= bus_data_in[0:WORD_NUM -1]; // 0:4
      msw <=  bus_data_in[BUS_SIZE-1:2*WORD_SIZE]; // 15:11
      // Waveform logic
      if (state == 0) begin // state reset
        error_in <= 0;
        next_error <= 0;
      end // end first
      else if (state == 1) begin // state 0xF...0
        error_in <= 0;
        next_error <= 0;
        if (lsw != 4'hF) begin
          next_state <= F_ERROR;
        end
        else if()
      end
      else if (state == 2) begin // state reg
        error_in <= 0;
        next_error <= 0;
        if (lsw != 4'hF) begin
          next_state <= F_ERROR;
        end
      end
      else if (state == 3) begin // F_ERROR
          error_in <= F_ERROR;
      end
      else if (state == 4) begin // SEQ_ERROR
        error_in <= SEQ_ERROR;
      end
     end // end reset == 1
 end // end clk
//////// End FSM /////////////////////
always @(bus_data_in) begin // when input change
  if ()
end
always @( * ) begin
      lsw = bus_data_in[0]; // 0xF or not
      msw = bus_data_in[15]; // 0x#
      bus_data_out = out_data;
      error = error_in;
      nxt_state = next_state;
      state_control = state;
      nxt_error = next_error;

end


endmodule

// Local Variables:
// verilog-library-directories:("."):
// End:
`endif
