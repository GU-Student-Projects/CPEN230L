// CPEN 230L lab 10, debouncer test bench
// Rick Nungester, 3/26/16
//
// As well as testing module debouncer, this code demonstrates
// simulation timescale and Verilog parameter override.

// See www.verilogjobs.com/learn/verilog-timescale-compiler-directive
// for a good explanation of the following Verilog compiler directive.
`timescale 1ms / 100ns  // 1 sim tick = 1 ms, times to 100 ns resolution

module debouncer_tb;
  reg  clock = 1'b0;  // simulated 50 MHz clock, 1st +edge at 1 half-period
  reg  sw_noisy;      // simulated noisy switch
  wire sw_clean;      // DUT output

  initial begin                  // make a timing diagram (no text output)
    // for GTKWave, else comment out $dumpfile("a.vcd");          
    // for GTKWave, else comment out $dumpvars(0, debouncer_tb);  

                            // Test Procedure
          sw_noisy = 1'b1;  // @t=0ms set 1 & wait for stable sw_clean
    #15   sw_noisy = 1'b0;  // @t=15ms, settled at 1, switch to 0
    #15   sw_noisy = 1'b1;  // @t=30ms, settled at 0, switch to 1
    #1    sw_noisy = 1'b0;  // @t=31ms, 0 (start noise)
    #2    sw_noisy = 1'b1;  // @t=33ms, 1
    #4    sw_noisy = 1'b0;  // @t=37ms, 0
    #8    sw_noisy = 1'b1;  // @t=45ms, 1 (sw_clean should show this one)
    #16   sw_noisy = 1'b0;  // @t=61ms, 0 (sw_clean should show this one)
    #19   $finish;          // @t-80ms, finish
  end

  // Default debouncer settling time is 2^19 clocks * 1/50e6 s/clock =
  // 10.48576 ms, +/- one clock period uncertainty in first noticing a
  // switch transition.  Use parameter override to simulate this time in
  // 2^3 = 8 clock cycles.  So each cycle is 10.48576/8 = 1.31072 ms,
  // or a half-cycle of 0.65536 ms.  Notice that the +/- 1 cycle
  // uncertainty is much more apparent in the simulation (1 out of 8)   
  // than it is in reality (1 out of 2^19).

  always
    #0.6554 clock = ~clock; // resolve to 100 ns as per timescale

 debouncer #(.cnt_bits (3)) db1 (
   .clk_i   (clock),
   .noisy_i (sw_noisy),
   .clean_o (sw_clean) );

endmodule
