// CPEN 230L lab 7 part 1, 3-bit wide 5-to-1 MUX
// Gabe DiMartino, 10/23/23

module mux3w_5to1 (
  input  [17:0] SW,     // 18 switch inputs
  output [2:0]  LEDG);  // 3 green LED outputs

assign LEDG = (SW[17:15] == 3'b000) ? SW[14:12] :
              (SW[17:15] == 3'b001) ? SW[11:9] :
              (SW[17:15] == 3'b010) ? SW[8:6] :
              (SW[17:15] == 3'b011) ? SW[5:3] :
              (SW[17:15] == 3'b100) ? SW[2:0] :
                                      3'bxxx; // don't care
endmodule
