// Belinda Brown Ramírez
// Mayo, 2020
// timna.brown@ucr.ac.cr

`ifndef T_MUX41_4B
`define T_MUX41_4B

//                            TESTER

//                         MUX 4:1 4 bits

// Verifying that the generic structural description works using the automatic
// verifier already built. What is done using the checker and the tester

module t_mux41_4b(
// Data out mux
input [3:0] out_b,
input [3:0] out_s,
// Valid for outputs
input out_valid_b,
input out_valid_s,
// Inputs
output reg [3:0] in0,
output reg [3:0] in1,
output reg [3:0] in2,
output reg [3:0] in3,
// Another signals
output reg reset,
output reg clk,
output reg [1:0] select,
// Valid Inputs
output reg in0_valid,
output reg in1_valid,
output reg in2_valid,
output reg in3_valid
);

// Counter positive transitions in both descriptions
//Because its 4 bits we need 4 per each
// Counter for Behavioral
reg [6:0] count_B0;
reg [6:0] count_B1;
reg [6:0] count_B2;
reg [6:0] count_B3;
// Counter for Structural
reg [6:0] count_S0;
reg [6:0] count_S1;
reg [6:0] count_S2;
reg [6:0] count_S3;

initial	count_B0 <= 0;
initial count_B1 <= 0;
initial	count_B2 <= 0;
initial count_B3 <= 0;

initial count_S0 <= 0;
initial count_S1 <= 0;
initial count_S2 <= 0;
initial count_S3 <= 0;

// Initial block works to provide you with initial stimuli - if we think about it physically,
// can be interpreted as stimuli from the environment that the device we are creating will receive -
// An analogy with mathematical equations would be comparing the initial block
// with initial conditions to find a result.

initial
begin


// Defining the dumpfile NAME_OF_FILE_CHOICE_PERSONAL.vcd), or known by change dump variable, this file contains
// information about the simulator used, time scale, creation date, variable definitions, and value changes.

    $dumpfile("mux41_4b.vcd");
// Message that prints once
    $display ("\t\t\tclk,\treset,\tselect, \tin0,\tin1, \tout_b, \tout_s");

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
  in0 = 4'b0;
  in1 = 4'b0;
  in2 = 4'b0;
  in3 = 4'b0;
  // Another signals
  select = 2'b0;
  reset = 0;

// For initial value on bit valid (is't like a flag)
  in0_valid = 0;
  in1_valid = 0;
  in2_valid = 0;
  in3_valid = 0;
// The following test # 1 is performed

  repeat(3) begin

    @(posedge clk);
// Once the first clock cycle has passed the signals
// In order for the signals to go through all their possible values
    {in0, in1} <= {in0, in1} + 4'b1;
    {in2, in3} <= {in2, in3} + 4'b1;
    select <= select + 1;
    reset <= 1;
    in0_valid <= 1;
    in1_valid <= 0;
    in2_valid <= 1;
    in3_valid <= 0;

// The following test # 2 is performed
    @(posedge clk);
// Once the first clock cycle has passed the signals
// In order for the signals to go through all their possible values
  {in0, in1} <= {in0, in1} + 4'b1;
  {in2, in3} <= {in2, in3} + 4'b1;
   select <= 1;
   reset <= 1;
   in0_valid <= 0;
   in1_valid <= 1;
   in2_valid <= 0;
   in3_valid <= 1;

// The following test # 3 is carried out
    @(posedge clk);
// Once the first clock cycle has passed the signals
// In order for the signals to go through all their possible values
  {in0, in1} <= {in0, in1} + 4'b1;
  {in2, in1} <= {in3, in1} + 4'b1;
  select <= 0;
  reset <= 1;
  in0_valid <= 1;
  in1_valid <= 1;
  in2_valid <= 0;
  in3_valid <= 0;
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
// Counters for                       BEHAVIORAL
// For output           bit0
always @(posedge out_b[0]) begin
count_B0<=count_B0+1;
$display ("Behavioral Output Bit 0 Counter on Tester: %d", count_B0);
end
// For output           bit1
always @(posedge out_b[1]) begin
count_B1<=count_B1+1;
$display ("Behavioral Output Bit 1 Counter on Tester: %d", count_B1);
end

// For output           bit2
always @(posedge out_b[2]) begin
count_B2<=count_B2+1;
$display ("Behavioral Output Bit 2 Counter on Tester: %d", count_B2);
end

// For output           bit3
always @(posedge out_b[3]) begin
count_B3<=count_B3+1;
$display ("Behavioral Output Bit 3 Counter on Tester: %d", count_B3);
end

// Counters for                       STRUCTURAL
// For output           bit0
always @(posedge out_s[0]) begin
count_S0<=count_S0+1;
$display ("Bit 0 counter of the structural output in the tester: %d", count_S0);
end

// For output           bit1
always @(posedge out_s[1]) begin
count_S1<=count_S1+1;
$display ("Bit 1 counter of the structural output in the tester: %d", count_S1);
end

// For output           bit2
always @(posedge out_s[2]) begin
count_S2<=count_S2+1;
$display ("Bit 2 counter of the structural output in the tester: %d", count_S2);
end

// For output           bit3
always @(posedge out_s[3]) begin
count_S3<=count_S3+1;
$display ("Bit 3 counter of the structural output in the tester: %d", count_S3);
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
// "toggle" every 3 * 10ns
always	#3 clk 	<= ~clk;

endmodule



// Local Variables:
// verilog-library-directories:("."):
// End:
`endif
