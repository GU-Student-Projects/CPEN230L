`timescale 1ms / 100ns

module UpDownTimer_tb;
  reg clk = 1;
  reg rst;
  reg en;
  reg [3:0] SW;
  wire [6:0] HEX1;
  wire [6:0] HEX2;
  wire [6:0] HEX3;
  wire [6:0] HEX4;
  wire [6:0] HEX5;

  // Clock generation
  always #50 clk = ~clk;

  // Test Procedure
  initial begin
    $display(" time  count");
    $monitor("%5d %6d", $time, uut.count0_o);  // Monitoring count0_o from UpDownTimer_top

    // Test scenarios
    rst = 1'b0;
    #100 rst = 1'b1;  // Start counting

    // Scenario 1: Simulate counting down in base 2 from 00000 to 11111
    // (wrap-around) to 11110 ... 00000 (its full range) to 11100 (a few counts further).
    #800 SW = 4'b0000;  // Load 00000
    #500 SW = 4'b1111;  // Count down to 11111
    #500 SW = 4'b1110;  // Count down to 11110
    // ... Continue counting down

    // Scenario 2: Simulate timer updating every ms on the ms.
    // For example, at time = 1 ms, the timer transitions from indicating 11111 to 11110.
    #1000 SW = 4'b1111;  // Load 11111
    #500 SW = 4'b1110;   // Count down to 11110

    // Scenario 3: Simulate load control (active-low and synchronous)
    #500 SW = 4'b1000;   // Load 10000
    #500 SW = 4'b1001;   // Count up from 10000

    // Scenario 4: Simulate disable control (active-low and synchronous)
    #500 SW = 4'b1111;   // Load 11111
    #500 SW = 4'b1110;   // Count down to 11110
    #500 SW = 4'b1100;   // Count down to 11100
    en = 1'b0;           // Disable the timer
    #500 SW = 4'b1000;   // Ensure counting stops

    #1500 $finish;
  end

  // DUT instantiation
  upDownTimer #(
      .STAGE0_BITS(26),
      .STAGE0_COUNT((50000000)/(2**3)),
      .STAGE1_BITS(4),
      .STAGE1_COUNT(9)
  ) uut (
      .clk    (clk),
      .rst    (rst),
      .load1  (SW[3:0]),
      .load2  (SW[3:0]),
      .en     (en),
      .up     (1),
      .count0_o(),
      .count1_o(HEX1),
      .count2_o(HEX2),
      .count3_o(HEX3),
      .count4_o(HEX4),
      .count5_o(HEX5)
  );
endmodule
