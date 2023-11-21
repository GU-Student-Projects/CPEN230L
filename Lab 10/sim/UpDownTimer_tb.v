`timescale 1ms / 100ns

module timerModN_tb;
  reg clk = 1;
  reg nRst;
  reg en;
  wire [6:0] HEX1, HEX2, HEX3, HEX4, HEX5;

  // Clock generation
  always #50 clk = ~clk;

  // DUT instantiation

    upDownTimer #(
        .STAGE0_BITS(26),
        .STAGE0_COUNT(50000000/(10**3)),
        .STAGE1_BITS(4),
        .STAGE1_COUNT(9)
    ) uut (
        .clk    (clk),
        .rst    (nRst),
        .en     (en),
        .up     (1),
        .count0_o(),
        .count1_o(HEX1),
        .count2_o(HEX2),
        .count3_o(HEX3),
        .count4_o(HEX4),
        .count5_o(HEX5)
    );

  // Test Procedure
  initial begin
    $dumpfile("a.vcd");
    $dumpvars(0, timerModN_tb);
    $display(" time  count");
    $monitor("%5d %6d", $time, uut.count);  // Monitoring the count from UpDownTimer_top

    // Test scenarios
    nRst = 1'b0;
    #100 nRst = 1'b1;  // Start counting

    // Scenario 1: Simulate counting down in base 2 from 00000 to 11111
    // (wrap-around) to 11110 ... 00000 (its full range) to 11100 (a few counts further).
    #800 SW = 18'b00000;  // Load 00000
    #500 SW = 18'b11111;  // Count down to 11111
    #500 SW = 18'b11110;  // Count down to 11110
    // ... Continue counting down

    // Scenario 2: Simulate timer updating every ms on the ms.
    // For example, at time = 1 ms, the timer transitions from indicating 11111 to 11110.
    #1000 SW = 18'b11111;  // Load 11111
    #500 SW = 18'b11110;   // Count down to 11110

    // Scenario 3: Simulate load control (active-low and synchronous)
    #500 SW = 18'b10000;   // Load 10000
    #500 SW = 18'b10001;   // Count up from 10000

    // Scenario 4: Simulate disable control (active-low and synchronous)
    #500 SW = 18'b11111;   // Load 11111
    #500 SW = 18'b11110;   // Count down to 11110
    #500 SW = 18'b11100;   // Count down to 11100
    en = 1'b0;         // Disable the timer
    #500 SW = 18'b11000;   // Ensure counting stops

    #1500 $finish;
  end

endmodule
