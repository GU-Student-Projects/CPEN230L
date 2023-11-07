// CPEN 230L lab 10, cascadeCounter on the DE2-115 board
// Rick Nungester 3/20/16

module cascadeCounter_top (
   input         CLOCK_50, // Clock for debounce circuit
   input  [1:0]  KEY,      // counter clock, reset
   output [6:0]  HEX0,     // stage 0 count
   output [6:0]  HEX1 );   // stage 1 count

  wire [1:0] count0_w;
  wire [2:0] count1_w;
  wire       clean_clock_w;
  wire       clean_nReset_w;

  debouncer db1 (
    .clk_i   (CLOCK_50),
    .noisy_i (KEY[1]),           // noisy clock key
    .clean_o (clean_clock_w) );  // clean clock key

  debouncer db2 (
    .clk_i   (CLOCK_50),
    .noisy_i (KEY[0]),           // noisy reset key
    .clean_o (clean_nReset_w) ); // clean reset key

  cascadeCounter cc (
    .clk_i    (~clean_clock_w),   // key press: clk_i posedge
    .nRst_i   (clean_nReset_w),   // key press: nRst_i = 0 (reset)
    .count0_o (count0_w),
    .count1_o (count1_w) );

  oct7seg o7s0 (
    .num_i  ({1'b0, count0_w}),  // 2 bits to 3 (set MS bit to 0)
    .disp_o (HEX0) );

  oct7seg o7s1 (
    .num_i  (count1_w),
    .disp_o (HEX1) );

endmodule
