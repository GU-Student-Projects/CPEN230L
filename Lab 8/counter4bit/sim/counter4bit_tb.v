// CPEN 230L Lab 8, test bench for module counter4bit
// Gabe DiMartino 10/30/2023

module counter4bit_tb;
                       // DUT INPUT INITIAL CONDITIONS
  reg Clk_r    = 1;    // clock rising edges at 10, 20, 30... ticks
  reg nReset_r = 0;    // reset = true
  reg Enable_r = 0;    // enable = false

  wire [3:0] Count_w;  // DUT output

   counter4bit my_counter (
    .Clock(Clk_r),
    .nReset(nReset_r),
    .Enable(Enable_r),
    .Count(Count_w)
  );

  always
    #5 Clk_r = ~Clk_r;    // clock period = 10 ticks (half-cycle = 5 ticks)

  initial begin                    // TEST PROCEDURE
    $dumpfile("a.vcd");            // for GTKWave (comment out if not)
    $dumpvars(0, counter4bit_tb);  // for GTKWave (comment out if not)
    $display("time  Count_w");     // output table header
    $monitor("%4d  %2d",           // output table signal formatting
      $time, Count_w);             // output table signals

    #5   nReset_r  = 1;  // @t=5 (1/2 clock period), reset = false,
         Enable_r  = 1;  //      and enable = true (count 0..15, 0..2)
    #180 nReset_r  = 0;  // @t=185 (mid count = 2), reset = true
    #1   nReset_r  = 1;  // @t=186, reset = false (pulse, count 0 1 2 3 4)
    #39  Enable_r  = 0;  // @t=225 (mid count = 4), stop counting
    #20  $finish;        // @t=245, finish simulation
  end

endmodule
