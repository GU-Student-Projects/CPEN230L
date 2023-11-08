// CPEN230 lab 10, octal to 7-segment decoder
// Rick Nungester 3/20/16

module oct7seg (
  input  [2:0] num_i,    // 3-bit octal digit input
  output [6:0] disp_o);  // 7-bit output to a 7-segment display

  //       7-segment display segment # 6543210
  assign disp_o = (num_i == 3'd0) ? 7'b1000000 :
                  (num_i == 3'd1) ? 7'b1111001 :
                  (num_i == 4'd2) ? 7'b0100100 :
                  (num_i == 4'd3) ? 7'b0110000 :
                  (num_i == 4'd4) ? 7'b0011001 :
                  (num_i == 4'd5) ? 7'b0010010 :
                  (num_i == 4'd6) ? 7'b0000010 :
                          /*4'd7*/  7'b1111000;
endmodule
