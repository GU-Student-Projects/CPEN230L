// CPEN 230L Lab 6b testbench for module fullAdder
// Gabe DiMartino, 10/16/2023

module majority_tb; // no inputs or outputs

  reg A, B, Cin; // Inputs to the DUT
  wire Sum, Cout; // Outputs from the DUT
  reg [2:0] count; // 3-bit value to help generate DUT inputs

  // Instantiate the fullAdder module
  fullAdder DUT (
    .A(A),
    .B(B),
    .Cin(Cin),
    .Sum(Sum),
    .Cout(Cout)
  );

  // Initial block
  initial begin
    count = 3'b0; // Initialize count to 000 binary
    $display("time  A B Cin Sum Cout"); // Truth table header
    $monitor("%4d %1b %1b %1b %1b %1b", $time, A, B, Cin, Sum, Cout); // Output formatting

    // Run the simulation for 40 time units
    #40 $finish;
  end

  // Always block to generate inputs
  always begin
    {A, B, Cin} = count; // Assign 3-bit count to 1-bit A, B, Cin
    #5 count = count + 1; // Increment count every 5 time units
  end

endmodule
