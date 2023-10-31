// CPEN 230L lab 9 part 2, JK flip flop test on DE2-115 board
// Gabe DiMartino 10/30/2023

module JK_FlipFlop_top (
  input  [1:0] SW,      
  input  [2:0] KEY,    
  output [1:0] LEDG   
);

  JK_FlipFlop JK1 (
    .nPr(SW[1]),      
    .nClr(SW[0]),      
    .Clk(~KEY[2]),     
    .J(~KEY[1]),       
    .K(~KEY[0]),       
    .Q(LEDG[1]),       
    .Qn(LEDG[0])
  );

endmodule
