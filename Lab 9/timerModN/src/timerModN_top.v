// CPEN 230L lab 10, cascadeCounter on the DE2-115 board
// Rick Nungester 3/20/16

module timerModN_top (
   input         CLOCK_50, // Clock for debounce circuit
   input    		KEY0,      // counter clock, reset
   output [6:0]  HEX0 );   // stage 0 count


  wire [3:0] count1_w;

  wire       clean_nReset_w;

  debouncer db1 (
    .clk_i   (CLOCK_50),
    .noisy_i (KEY0),           // noisy clock key
    .clean_o (clean_nReset_w) );  // clean clock key

  timerModN #(
	.STAGE0_BITS(26),
   .STAGE0_COUNT(50000000),
	.STAGE1_BITS(4),
   .STAGE1_COUNT(9)
  ) u_timerModN (
    .clk    (CLOCK_50),   // key press: clk_i posedge
    .rst   (clean_nReset_w),   // key press: nRst_i = 0 (reset)
    .hex0_o (),
    .hex1_o (count1_w) );
	 
	dec7seg(
		.bcd_i(count1_w),
		.disp_o(HEX0)
	);

endmodule