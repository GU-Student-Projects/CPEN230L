// CPEN 230L lab 8 part 1, SR Latch on the DE2-115 board
// Gabe DiMartino 10/30/23

module SR_Latch_top (
  input  [1:0] KEY,
  output [1:0] LEDG
);

  SR_Latch SR1 (
    .nS(KEY[0]),
    .nR(KEY[1]),
    .Q(LEDG[0]),
    .Qn(LEDG[1])
  );

endmodule
