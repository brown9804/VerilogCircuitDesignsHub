// Tester for NOT
  module inversor_as_not_gate_tester(
// 1 bit register connected to the input of the inverter
output reg tester_in_not,
// Cable connected to the inverter output
input wire tester_out_not
);

// Start of tests
  initial begin

    // File to store the results
    $dumpfile("inversor_as_not_gate_tester.vcd");
    $dumpvars;

    tester_in_not = 0;
    #5 tester_in_not = 1;
    // We set the input of the inverter to 0
    #10 tester_in_not = 0;

    if (tester_out_not != 1)
      #10 $display("There is an error, I was expecting a value of 1 and it read: %d", tester_out_not);


    // After another 5 units of time, we change the input
    #15 tester_in_not = 1;

    // After 5 more time units, we check if there is a 0 in the output
    if (tester_out_not != 0)
      #10 $display("There is an error, I was expecting a value of 0 and it read: %d", tester_out_not);

    #15 $display("Simulated tests end");
    #25 $finish;
  end
  endmodule
