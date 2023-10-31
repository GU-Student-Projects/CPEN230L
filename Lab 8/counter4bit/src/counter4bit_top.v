// CPEN 230 lab 8 part 3, 4-bit synchronous counter on the DE2-115 board
// Gabe DiMartino 10/30/2023

module counter4bit_top (
  input  [2:0] KEY,      // ~Clock, Enable, nReset
  output [3:0] LEDR,     // discrete red LEDs for output
  output [6:0] HEX0 );   // 7-segment display for output

  wire [3:0] count;      // to connect rippleCounter to hex7seg

  counter4bit inst0 (
    .Clock  (~KEY[2]),   // key press makes a positive edge on Clock
    .nReset (KEY[0]),    // key press resets
    .Enable (KEY[1]),    // key press disables
    .Count  (count) );

  assign LEDR = count;   // count out to 4 red LEDs

  hex7seg inst1 (        // count out to 7-segment display
    .num_i  (count),
    .disp_o (HEX0) );

endmodule
