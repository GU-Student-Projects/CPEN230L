//CPEN 230L Lab 6b testbench for module majority
//Gabe DiMartino, 10/16/2023

module majority_tb; //no inputs or outpusts

  reg a, b, c; // Inputs to the DUT 
  wire y;  // Output from the DUT
  reg [2:0] count; // 3-bit value to help generate DUT inputs

  // Instantiate the majority module
  majority DUT(
    .a(a),   // Input 'a'
    .b(b),   // Input 'b'
    .c(c),   // Input 'c'
    .y(y)    // Output 'y'
  );

  // Initial block
  initial begin
    count = 3'b0; // Initialize count to 000 binary
    $display("time  a b c  y"); // Truth table header
    $monitor("%4d %2d %1d %1d %1d", $time, a, b, c, y); // Output formatting

    // Run the simulation for 40 time units
    #40 $finish;
  end

  // Always block to generate inputs
  always begin
    {a, b, c} = count; // Assign 3-bit count to 1-bit a, b, c
    #5 count = count + 1; // Increment count every 5 time units
  end

endmodule
