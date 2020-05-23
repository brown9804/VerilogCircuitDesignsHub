`ifndef TESTER21_2B
`define TESTER21_2B


// The tester module is defined

// Verifying that the generic structural description works using the automatic
// verifier already built. What is done using the checker and the tester

module t_mux21_2b(
// Data out mux
input [1:0] out_b,
// Synth out_b
input [1:0] out_s,
// Valid for output
input out_valid_b,
// Synth  valid out_b
input out_valid_s,
// Inputs
output reg [1:0] in0,
output reg [1:0] in1,
// Another signals
output reg reset,
output reg clk,
output reg select,
// Valid Inputs
output reg in0_valid,
output reg in1_valid
);

// Counter positive transitions in both descriptions

reg [6:0] contador_conduc0;
reg [6:0] contador_conduc1;
reg [6:0] contador_struc0;
reg [6:0] contador_struc1;

initial	contador_conduc0 <= 0;
initial contador_conduc1 <= 0;
initial contador_struc0 <= 0;
initial contador_struc1 <= 0;


// Initial block works to provide you with initial stimuli - if we think about it physically,
// can be interpreted as stimuli from the environment that the device we are creating will receive -
// An analogy with mathematical equations would be comparing the initial block
// with initial conditions to find a result.

initial
begin


// Defining the dumpfile NAME_OF_FILE_CHOICE_PERSONAL.vcd), or known by change dump variable, this file contains
// information about the simulator used, time scale, creation date, variable definitions, and value changes.

    $dumpfile("mux21_2b.vcd");
// Message that prints once
    $display ("\t\t\tclk,\treset,\tselect,\tin0,\tin1, \tout_b, \tout_s");

// Message that is printed every time an item in the list changes
    $monitor($time,"\t%b\t%b\t\t%b\t\t%b\t\t%b\t\t%b\t%b", clk, reset, select, in0, in1, out_b, out_s);
// It is used to specify which variables are to be put in the dump file. The bibliography mentions that the way
// simple to do it is only with $ dumpvars since this way they all assign them to the test bench
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
  // Inputs
  in0 = 2'b0;
  in1 = 2'b0;
  // Another signals
  select = 0;
  reset = 0;

// For initial value on bit valid (is't like a flag)
  in0_valid = 0;
  in1_valid = 0;


  repeat(3) begin

  // The following test # 1 is performed
  //  Testing valid intermittent  for in0
    @(posedge clk);
// Once the first clock cycle has passed the signals
// In order for the signals to go through all their possible values
    // VALID Input 0
    in0_valid <= in0_valid + 1;
    // Input 0
    in0 <= in0 + 1;
    // Valid Input 1
    in1_valid <= in1_valid + 1;
    // Input 1
    in1 <= in1 + 2'b1;
    // Select
    select <= select + 1;
    // Reset
    reset <= 1;

// The following test # 2 is performed
//  Testing valid intermittent  for in1
    @(posedge clk);
// Once the first clock cycle has passed the signals
// In order for the signals to go through all their possible values
    // VALID Input 0, Input 1
    {in0_valid, in1_valid} <= {in0_valid, in1_valid}  + 1;
    // Input 0
    in0 <= in0 + 2'b1;
    // Input 1
    in1 <= 2'b1;
    // Select
    select <= select + 1;
    // Reset
    reset <= 1;


// The following test # 3 is carried out
    @(posedge clk);
// Once the first clock cycle has passed the signals
// In order for the signals to go through all their possible values
  {in0, in1} <= {in0, in1} + 2'b1;
  select <= select +1;
  reset <= 1;
  in0_valid <= in1_valid + 1;
  in1_valid <= in1_valid + 1;

end //end repeat test block

#40 $finish;
end // end initial block (big one)

//CHECKER
reg test;
always@(posedge clk) begin
    if(out_b != out_s)
    begin
     $display ("ERROR behavioral file and structural file are not the same");
     test <= 1;
end // end display
else begin
    test <= 0;
end //else
end // always checker

// Positive transition counter on outputs
always @(posedge out_b[0]) begin
contador_conduc0<=contador_conduc0+1;
$display ("Behavioral Output Bit 0 Counter on Tester: %d", contador_conduc0);
end

always @(posedge out_b[1]) begin
contador_conduc1<=contador_conduc1+1;
$display ("Behavioral Output Bit 1 Counter on Tester: %d", contador_conduc1);
end

always @(posedge out_s[0]) begin
contador_struc0<=contador_struc0+1;
$display ("Bit 0 counter of the structural output in the tester: %d", contador_struc0);
end

always @(posedge out_s[1]) begin
contador_struc1<=contador_struc1+1;
$display ("Bit 1 counter of the structural output in the tester: %d", contador_struc1);
end


// For delays and max frequency
realtime time_a, time_b, delta_ab;
initial begin
    time_a = $realtime;
    #1;
    time_b = $realtime;
    #1;
    delta_ab = time_a - time_b;
    $display ("Time_a: %d", time_a);
    $display ("Time_b: %d", time_b);
    $display ("Delta_ab: %d", delta_ab);
end //repeat initial delays and max frequency

// For the clock
// Initial value to the clock, otherwise it will always be undetermined
initial	clk 	<= 0;
// "toggle" every 3* 10ns
always	#3 clk 	<= ~clk;

endmodule


// Local Variables:
// verilog-library-directories:("."):
// End:
`endif
