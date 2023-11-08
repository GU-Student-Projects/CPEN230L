// CPEN 230L lab 10, debouncer on the DE2-115 board
// Rick Nungester, 3/20/16

module debouncer_top (
  input  CLOCK_50,   // 50 MHz clock for debouncer
  input  KEY0,       // noisy key to clock flip-flop
  output LEDG0);     // LED to see one toggle per key press

  wire KEY0_clean;  // Debounced KEY0

  debouncer db1 (             // clean up noisy KEY0
    .clk_i   (CLOCK_50),
    .noisy_i (KEY0),
    .clean_o (KEY0_clean) );

  T_FlipFlop tff1 (           // use KEY0_clean to toggle a flip-flop
    .clk_i    (~KEY0_clean),  // key press gives a +edge to flip-flop
    .nReset_i (1'b1),         // not Reset
    .enable_i (1'b1),         // always enabled
    .Q_o      (LEDG0) );

endmodule
