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
  output reg [3:0] nxt_state,
  output reg [3:0] state_control,
  output reg nxt_error,
  output reg error
);

////// Internal wires declaration //////
//******* For assign mem
wire [BUS_SIZE-1:0] out_data;
genvar i;

//******* for fsm
parameter RESET_STATE = 4'h0;
parameter FIST_PKT = 4'h1;
parameter REG_PKT = 4'h2 ;
parameter F_ERROR = 4'h3;
parameter SEQ_ERROR = 4'h4;

reg [3:0] state;
reg error_in;
reg [WORD_SIZE-1:0] lsw; // Is 0x...#
reg [WORD_SIZE-1:0] msw; // Is 0xF the right one
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
     if (reset == 0) // If reset in LOW nonblobking assing zero
       begin
        state <= RESET_STATE;
        error_in <= 0;
       end // end reset zero
// Logic Bits: 15, 14, 13, 12,          11, 10, 9, 8,      7 , 6, 5, 4,    3,2, 1, 0
    else begin // if data in 0xFFFF XXXX YYYY ####
      state <= nxt_state;
      lsw <= bus_data_in[WORD_NUM -1:0]; // 4:0
      msw <=  bus_data_in[BUS_SIZE-1:3*WORD_SIZE]; // 15:12
      // Waveform logic
      if (state == RESET_STATE) begin // state reset = 0
        error_in <= 0;
      end // end reset
      ////////////////////////////////////////////
      else if (state == FIST_PKT) begin // state FIST_PKT = 1
        error_in <=0;
      end // end state FIST_PKT
      ////////////////////////////////////////////
      else if (state == REG_PKT) begin // state REG_PKT = 2
        error_in <= 0;
      end // end state REG_PKT
      ////////////////////////////////////////////
      else if (state == F_ERROR) begin // state F_ERROR = 3
        error_in <= 1;
      end // end state F_ERROR
      ////////////////////////////////////////////
      else if (state == SEQ_ERROR) begin // state SEQ_ERROR = 4
      error_in   <= 1;
      end
      else begin
        error_in <= 0;
        state <= 0;
      end
     end // end reset == 1
 end // end clk

always @(*) begin
if (reset == 0) begin
nxt_state        = RESET_STATE;
nxt_error        =  0;
end // end reset == 0
else begin
case (state)
0: begin
    nxt_error        =  0;
    nxt_state        = FIST_PKT;
end
1: begin // state FIST_PKT
if ({msw} != 'hF)  begin
  nxt_state = F_ERROR;
  nxt_error = 1;
  end
if ({lsw} != 'h1) begin
      nxt_state = SEQ_ERROR;
      nxt_error = 0;
  end
else begin
   nxt_state = REG_PKT;
   nxt_error = 0;
   end
end // end state FIST_PKT
// ////////////////////////////////////////////
2: begin // state REG_PKT
if ({msw} != 'hF)  begin
    nxt_state = F_ERROR;
    nxt_error = 1;
  end
if ({lsw} != 'h2) begin
    nxt_state = SEQ_ERROR;
    nxt_error = 1;
  end
else begin
   nxt_state = REG_PKT;
   nxt_error = 0;
   end
end // end state REG_PKT
// ////////////////////////////////////////////
3: begin // state F_ERROR
  nxt_state = FIST_PKT;
  nxt_error = 0;
end // end state F_ERROR
// ////////////////////////////////////////////
4: begin // state SEQ_ERROR
  nxt_state = FIST_PKT;
  nxt_error = 0;
end // end SEQ_ERROR
default: begin
  nxt_state = REG_PKT;
  nxt_error = 0;
end
endcase
end //reset == 1
bus_data_out = out_data;
error = error_in;
state_control = state;
//////// End FSM /////////////////////
end



endmodule

// Local Variables:
// verilog-library-directories:("."):
// End:
`endif
