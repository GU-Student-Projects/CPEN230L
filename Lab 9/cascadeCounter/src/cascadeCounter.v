// CPEN 230L lab 10, Cascade Counter
// Rick Nungester 3/20/16
//
// The code below demonstrates how to use a faster stage0 counter to
// overflow and increment slower stage1 counter *synchronously*.
// That is, the same clock edge that causes the faster counter to wrap
// around to 0 also causes the slower counter to increment by 1.

module cascadeCounter (
  input        clk_i,      // 50 MHz clock
  input        nRst_i,     // active low asynchronous reset
  output [1:0] count0_o,   // counter stage 0 count
  output [2:0] count1_o ); // counter stage 1 count

  wire stage1_en_w;

  cntrStage #(
    .cntr_bits_p (2),    // 2-bit counter
    .cntr_tc_p   (2) )   // terminal count 2 (mod 3)
      stage0 (
        .clk_i      (clk_i),
        .nRst_i     (nRst_i),
        .enable_i   (1'b1),         // always enabled
        .term_cnt_o (stage1_en_w),  // stage 0 at TC (1-cycle pulse)
        .count_o    (count0_o) );

  cntrStage #(
    .cntr_bits_p (3),    // 3-bit counter
    .cntr_tc_p   (4) )   // terminal count 4 (mod 5)
      stage1 (
        .clk_i      (clk_i),        // same clock as stage 0
        .nRst_i     (nRst_i),       // same reset as stage 0
        .enable_i   (stage1_en_w),  // only enabled when stage 0 is at TC
        .term_cnt_o (),             // unused
        .count_o    (count1_o) );

endmodule
