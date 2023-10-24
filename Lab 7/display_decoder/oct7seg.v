// CPEN230 lab 7 part 2, octal to 7-segment decoder
// Gabe DiMartino, 10/23/2023

module oct7seg (
  input  [2:0] c_i,      // 3-bit octal digit input
  output [6:0] disp_o);  // 7-bit output to a 7-segment display

  // 7-segment display segment # 6543210
  assign disp_o = (c_i == 3'd0) ? 7'b1000000 :
                  (c_i == 3'd1) ? 7'b1111001 :
                  (c_i == 3'd2) ? 7'b0100100 :
                  (c_i == 3'd3) ? 7'b0110000 :
                  (c_i == 3'd4) ? 7'b0011001 :
                  (c_i == 3'd5) ? 7'b0010010 :
                  (c_i == 3'd6) ? 7'b0000010 :
						(c_i == 3'd7) ? 7'b1111000 :
						7'bxxxxxxx;
endmodule
