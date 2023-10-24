// CPEN230 lab 7 part 2, top level DE2-115 board connections
// Gabe DiMartino, 10/23/23
//
// Input is an octal digit. Output is 0 to 7 on a 7-segment
// display.

module display_decoder (
  input  [2:0] SW,     // 3 input toggle switches
  output [6:0] HEX0);  // 7-seg display element

  oct7seg char0 (      // instantiate oct7seg
    .c_i    (SW),      // c_i and SW are 3 bits each
    .disp_o (HEX0));   // disp_o and HEX0 are 7 bits each

endmodule
