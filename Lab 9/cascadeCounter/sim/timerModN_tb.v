// CPEN 230L timerModN test bench
// Rick Nungester 3/26/16

`timescale 1ms / 100ns  // 1 sim tick = 1 ms, times to 100 ns resolution

module timerModN_tb;
                        // DUT inputs and outputs
  reg        clk = 1;   // clock input to DUT
  reg        nRst;      // active low reset input to DUT
  wire [3:0] count;     // DUT count output

  // We want 5 clock periods to correspond with 1 second, or 1/2 clock
  // period to correspond with 1/10 seconds = 100 ms = 100 simulation
  // time ticks.
  always
    #100 clk = ~clk;   // clock + edges at 200, 400, 600... ms

  initial begin
    $dumpfile("a.vcd");         // for GTKWave
    $dumpvars(0, timerModN_tb); // for GTKWave
    $display(" time  count");    // table header
    $monitor("%5d %6d",         // table formatting
      $time, count);            // table signals

                         // Test Procedure
           nRst = 1'b0;  // @t=0, reset
    #100   nRst = 1'b1;  // @t=100ms, 1st falling clock edge, count
    #12400 nRst = 1'b0;  // @t=12.5s, mid "2", stop counting
    #1500  $finish;      // @t=14s, finish
  end

  timerModN #(.stage0_tc (4)) DUT (  // 5 clocks per count update
    .clk_i    (clk),
    .nRst_i   (nRst),
    .count_o  (count) );

endmodule
