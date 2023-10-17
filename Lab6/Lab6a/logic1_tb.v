// CPEN 230L Lab 6a, testbench for module logic
// Gabriel DiMartino, 10/17/2023
module logic1_tb; // test bench, so no inputs/outputs
reg a, b, c;      // inputs to the DUT
wire d;           // output from the DUT
reg [2:0] count;  // 3-bit value to help generate DUT inputs

logic1 DUT(d, a, b, c); // instantiate the DUT

initial begin
	count = 3'b0;   // initialize count to 000 binary
	$display("time  a b c  d");     // truth table header
	$monitor("%4d %2d %1d %1d %2d", // output formatting
	$time, a, b, c, d);           // signals to be output
	#40 $finish;  // time goes 0 to 40 in steps of 5, then ends
end

always begin
	{a, b,c} = count;  // 3-bit count goes to 1-bit a, b, c
	#5 count = count+1; // increment count every 5 time ticks
end
endmodule

