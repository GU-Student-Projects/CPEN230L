// CPEN 230L lab 8, BCD to 7-segment display decoder
// Rick Nungester, 2/27/16

module dec7seg (
  input [3:0] bcd_i,     // BCD digit in
  output [6:0] disp_o);  // 7-segment display drive out

  // display segment number:           6543210
  assign disp_o = (bcd_i == 4'd0) ? 7'b1000000 :
                  (bcd_i == 4'd1) ? 7'b1111001 :
                  (bcd_i == 4'd2) ? 7'b0100100 :
                  (bcd_i == 4'd3) ? 7'b0110000 :
                  (bcd_i == 4'd4) ? 7'b0011001 :
                  (bcd_i == 4'd5) ? 7'b0010010 :
                  (bcd_i == 4'd6) ? 7'b0000010 :
                  (bcd_i == 4'd7) ? 7'b1111000 :
                  (bcd_i == 4'd8) ? 7'b0000000 :
                  (bcd_i == 4'd9) ? 7'b0011000 :
                                    7'bxxxxxxx;
endmodule
