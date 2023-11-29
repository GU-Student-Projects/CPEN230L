`timescale 1ms / 100ns

module UpDownTimer_tb;
  reg clk = 1;
  reg rst;
  reg en;
  reg up;
  wire [3:0] HEX1;
  wire [3:0] HEX2;
  wire [3:0] HEX3;
  wire [3:0] HEX4;
  wire [3:0] HEX5;

  // DUT instantiation
  upDownTimer #(
      .STAGE0_BITS(26),
      .STAGE0_COUNT((50000000)/(10**3)),
      .STAGE1_BITS(4),
      .STAGE1_COUNT(9)
  ) DUT (
      .clk    (clk),
      .rst    (rst),
      .load1  (),
      .load2  (),
      .en     (en),
      .up     (up),
      .count1_o(),
      .count0_o(HEX1),
      .count2_o(HEX2),
      .count3_o(HEX3),
      .count4_o(HEX4),
      .count5_o(HEX5)
  );

  // Clock generation
  always #0.25 clk = ~clk;

  // Test Procedure
  initial begin
    $display(" time  count ");
    $monitor("%5d %6d", $time, DUT.count0_o);  // Monitoring count0_o from UpDownTimer_top

    // Test scenarios
    rst = 1'b0;
    en = 1'b1;
    up = 0;

    // Scenario 1: Simulate counting down in base 2 from 00000 to 11111
    // (wrap-around) to 11110 ... 00000 (its full range) to 11100 (a few counts further).
    #100 rst = 1'b1;  // Start counting 00000

    // Scenario 3: Simulate load control (active-low and synchronous)
    #16000 rst = 1'b0;
    #100 rst = 1'b1;

    // Scenario 4: Simulate disable control (active-low and synchronous)
    #8000 en = 1'b0;

    #15000 $finish;
  end
endmodule
