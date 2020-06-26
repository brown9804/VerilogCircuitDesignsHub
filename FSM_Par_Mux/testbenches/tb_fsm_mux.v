// Belinda Brown Ramírez
// June, 2020
// timna.brown@ucr.ac.cr

`ifndef TB_FSM_MUX
`define TB_FSM_MUX


// scale time unit (value of one) / precision
`timescale 	1ns		/ 1ps
// includes verilog files
// Can be omitted and called from the testbench
// Cmos
`include "./lib/cmos_cells.v"
`include "./src/fsm_mux.v"
`include "./syn/fsm_mux_syn.v"
`include "./testers/t_fsm_mux.v"

module TestBench; // Testbench

// Usually the signals in the test bench are wires.
// They do not store a value, they are handled by other module instances.
// Since they require matching the size of the inputs and outputs, they must be assigned their size
// defined in the modules

// If you define quantity format, it is recommended to keep it in the same format being the
// same used in the module for the number of bits - [1: 0] ---, another way to do it is with
// [0: 1]

// We are going to use AUTOINST: It is responsible for replacing the connections (considering it is HDL)
// pin to an instance (module) with variables as they change over time automatically in the instantiated module

// It's needed /*AUTOWIRE*/ because: Creates wires for outputs that ins't declare

/*AUTOWIRE*/
wire  clk, reset;
wire [15:0] bus_data_in_TB;

wire nxt_state_BTB, error_BTB;
wire nxt_state_STB, error_STB;

wire state_control_BTB;
wire state_control_STB;

wire nxt_error_BTB;
wire nxt_error_STB;

wire [15:0] bus_data_out_BTB;
wire [15:0] bus_data_out_STB;


///////////////////////////////////////////////////////////////////////////////////////////
              //////////// FSM MUX BEHAVIORAL
              ////////////
///////////////////////////////////////////////////////////////////////////////////////////

fsm_par_mux fsm_mux_TB(/*AUTOINST*/
  // Outputs
  .bus_data_out (bus_data_out_BTB),
  .nxt_state (nxt_state_BTB),
  .state_control (state_control_BTB),
  .nxt_error (nxt_error_BTB),
  .error (error_BTB),
  // Inputs
  .clk (clk),
  .bus_data_in (bus_data_in_TB),
  .reset (reset)
);



///////////////////////////////////////////////////////////////////////////////////////////
              //////////// FSM MUX SYN
              ////////////
///////////////////////////////////////////////////////////////////////////////////////////

fsm_par_mux_syn fsm_mux_syn_TB(/*AUTOINST*/
  // Outputs
  .bus_data_out (bus_data_out_STB),
  .nxt_state (nxt_state_STB),
  .state_control (state_control_STB),
  .nxt_error (nxt_error_STB),
  .error (error_STB),
  // Inputs
  .clk (clk),
  .bus_data_in (bus_data_in_TB),
  .reset (reset)
);



///////////////////////////////////////////////////////////////////////////////////////////
              //////////// TESTER FSM MUX
              ////////////
///////////////////////////////////////////////////////////////////////////////////////////

t_fsm_par_mux t_fsm_parame_mux_TB(/*AUTOINST*/
  // Outputs
  .bus_data_out (bus_data_out_BTB),
  .nxt_state (nxt_state_BTB),
  .state_control (state_control_BTB),
  .nxt_error (nxt_error_BTB),
  .error (error_BTB),
  // Syn

  .bus_data_out_s (bus_data_out_STB),
  .nxt_state_s (nxt_state_BTB),
  .state_control_s (state_control_BTB),
  .nxt_error_s (nxt_error_BTB),
  .error_s (error_BTB),
  // Inputs
  .clk (clk),
  .bus_data_in (bus_data_in_TB),
  .reset (reset)
);



endmodule

// Local Variables:
// verilog-library-directories:("."):
// End:
`endif
