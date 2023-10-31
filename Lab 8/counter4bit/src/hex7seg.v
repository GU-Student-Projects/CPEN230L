// CPEN 230L lab 8 part 3, hex to 7-segment decoder
// Gabe DiMartino 10/30/2023

module hex7seg (
  input  [3:0] num_i,
  output [6:0] disp_o );

  // 7-segment display segment number: 6543210
  assign disp_o = (num_i == 4'h0) ? 7'b1000000 :
                  (num_i == 4'h1) ? 7'b1111001 :
                  (num_i == 4'h2) ? 7'b0100100 :
                  (num_i == 4'h3) ? 7'b0110000 :
                  (num_i == 4'h4) ? 7'b0011001 :
                  (num_i == 4'h5) ? 7'b0010010 :
                  (num_i == 4'h6) ? 7'b0000010 :
                  (num_i == 4'h7) ? 7'b1111000 :
                  (num_i == 4'h8) ? 7'b0000000 :
                  (num_i == 4'h9) ? 7'b0011000 :
                  (num_i == 4'hA) ? 7'b0001000 :
                  (num_i == 4'hb) ? 7'b0000011 :
                  (num_i == 4'hC) ? 7'b1000110 :
                  (num_i == 4'hD) ? 7'b0100001 :
                  (num_i == 4'hE) ? 7'b0000110 :
                  (num_i == 4'hF) ? 7'b0001110 : 
                  7'bXXXXXXX;
endmodule
