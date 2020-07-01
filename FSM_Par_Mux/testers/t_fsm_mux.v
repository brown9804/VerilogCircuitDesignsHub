// Belinda Brown Ramírez
// June, 2020
// timna.brown@ucr.ac.cr

`ifndef T_FSM_MUX
`define T_FSM_MUX

module t_fsm_par_mux #(
// Parameters
parameter BUS_SIZE = 16,
parameter WORD_SIZE = 4,
parameter WORD_NUM = BUS_SIZE / WORD_SIZE
)(
  // Outputs
  output reg  clk,
  output reg [BUS_SIZE-1:0] bus_data_in,
  output reg reset,
  // Inputs
  input [BUS_SIZE-1:0] bus_data_out,
  input [3:0] nxt_state,
  input [3:0]state_control,
  input nxt_error,
  input error,
  // Syn
  input [BUS_SIZE-1:0] bus_data_out_s,
  input [3:0] nxt_state_s,
  input [3:0] state_control_s,
  input nxt_error_s,
  input error_s);

// *******  Resume
// good 1
// good 2
// seq error 4
// good 1
// good 2
// seg error 4
// good 1
// F_error 3
// good 1

initial begin
		$dumpfile("fsm_mux.vcd");
		$dumpvars;


  // The stimulus must be changed, where it allows testing to give an idea of ​​the behavior of the signals.
  // Therefore, the inputs will be initialized with a value chosen between one and zero. Since they are not defined
  // initial conditions in the algorithm request. They are personally chosen.

  // VERILOG ASSIGNMENTS FOR NUMBERS - FORMAT
  // 'b binary base
  // 'd Decimal base
  // 'h Hexadecimal base
  // 'or octal base
  // and what comes after the letter is the value then in the case of binary
  // the following examples are considered for understanding
  // 2'b0 = 2'b00 = 00
  // 2'b1 = 2'b01 = 01
  // 2'b10 = 10
  // 2'b11 = 11
  // If it does not indicate the size, 32 bits are assigned by default, that is, 'b0 = 00000000000000000000000000000000
  // This passes the first clock cycle ... Defining initial values ​​....

  // Tester conditions F in first bits and 1,2,3, in lower

  {bus_data_in} = 'h0;
  #4 reset = 0;

  // Begin test
  repeat (11) begin
  @(posedge clk);
  reset <= 0;
  end

  @(posedge clk) begin
    reset <= 1;
    {bus_data_in} <= 'hFFF0; // good
    end

  @(posedge clk) begin
    {bus_data_in} <= 'hFDD1; // good
    end

  @(posedge clk) begin
    {bus_data_in} <= 'hFEE9; // seq error
    end

  @(posedge clk) begin
    {bus_data_in} <= 'hFCC0; // good
    end


  @(posedge clk) begin
    {bus_data_in} <= 'hFBB1;// good
    end

  @(posedge clk) begin
    {bus_data_in} <= 'hF998; // seq error
    end

  @(posedge clk) begin
    {bus_data_in} <= 'hFAA0; // good
    end

  @(posedge clk) begin
    {bus_data_in} <= 'hA881; // F_error
    end

  @(posedge clk) begin
    {bus_data_in} <= 'hF770; // good
    end


#40 $finish;
end // end initial

// clock logic
initial	clk	 			<= 0;			// Initial value to avoid indeterminations
always	#10 clk				<= ~clk;		// toggle every 10ns



endmodule

// Local Variables:
// verilog-library-directories:("."):
// End:
`endif
