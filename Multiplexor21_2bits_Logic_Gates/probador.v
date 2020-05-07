// The tester module is defined
module probador(

input [1:0] data_out_conduc_tester,
input [1:0] data_out_struc_tester,
output reg [1:0] data_in0_probador,
output reg [1:0] data_in1_probador,
output reg reset_L_probador,
output reg clk_probador,
output reg selector_probador
);


// counter positive transitions in both descriptions

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

// Defining the dumpfile PERSONAL_ARCHIVE_FILE_NAME.vcd), or known by change dump variable, this file contains
// information about the simulator used, time scale, creation date, variable definitions, and value changes.
    $dumpfile("mux2_1_con_Flip_flop.vcd");
// Message that prints to console once
    $display ("\t\t\tclk_probador,\treset_L_probador,\tselector_probador,\tdata_in0_probador,\tdata_in1_probador, \tdata_out_conduc_tester, \tdata_out_struc_tester");
// Message that is printed in console every time a list item changes
    $monitor($time,"\t%b\t%b\t\t%b\t\t%b\t\t%b\t\t%b\t%b", clk_probador, reset_L_probador, selector_probador, data_in0_probador, data_in1_probador, data_out_conduc_tester, data_out_struc_tester);
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
  data_in0_probador = 2'b0;
  data_in1_probador = 2'b0;
  selector_probador = 0;
  reset_L_probador = 0;

// The following test # 1 is performed

  repeat(3) begin
    @(posedge clk_probador);
    // Once the first clock cycle has passed the signals
    // In order for the signals to go through all their possible values
    {data_in0_probador, data_in1_probador} <= {data_in0_probador, data_in1_probador} + 2'b1;
    selector_probador <= selector_probador + 1;
    reset_L_probador <= 1;

// The following test # 2 is performed
    @(posedge clk_probador);
  // Once the first clock cycle has passed the signals
  // In order for the signals to go through all their possible values
  {data_in0_probador, data_in1_probador} <= {data_in0_probador, data_in1_probador} + 2'b1;
   selector_probador <= selector_probador + 1;
   reset_L_probador <= 1;

   // The following test # 2 is performed
    @(posedge clk_probador);
  // Once the first clock cycle has passed the signals
  // In order for the signals to go through all their possible values
  {data_in0_probador, data_in1_probador} <= {data_in0_probador, data_in1_probador} + 2'b1;
  {reset_L_probador, selector_probador} <= {reset_L_probador, selector_probador} + 1;
end //end repeat tests

#40 $finish;
end // end initial begin

//CHECKER
reg test;
always@(posedge clk_probador) begin
    if(data_out_conduc_tester != data_out_struc_tester)
    begin
     $display ("ERROR behavioral file and structural file are not the same");
     test <= 1;
end // end display
else begin
    test <= 0;
end //else
end // always checker


// Positive transition counter on outputs
always @(posedge data_out_conduc_tester[0]) begin
contador_conduc0<=contador_conduc0+1;
$display ("Bit counter 0 of the behavioral output in the tester: %d", contador_conduc0);
end

always @(posedge data_out_conduc_tester[1]) begin
contador_conduc1<=contador_conduc1+1;
$display ("Bit counter 1 of the behavioral output in the tester: %d", contador_conduc1);
end

always @(posedge data_out_struc_tester[0]) begin
contador_struc0<=contador_struc0+1;
$display ("Bit 0 counter of the structural output in the tester: %d", contador_struc0);
end

always @(posedge data_out_struc_tester[1]) begin
contador_struc1<=contador_struc1+1;
$display ("Bit 0 counter of the structural output in the tester: %d", contador_struc1);
end

// Delays and max frequency
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
end //repeat initial delays and frequency

// For the clock
// Initial value to the clock, otherwise it will always be undetermined
initial	clk_probador 	<= 0;
// Makes "toggle" every 2*10ns
always	#2 clk_probador 	<= ~clk_probador;

endmodule
