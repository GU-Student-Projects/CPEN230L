// CPEN 230L lab 10, T Flip Flop
// Rick Nungester 3/19/16 (Doug Snook 11/9/13)

module T_FlipFlop (
  input      clk_i,     // positive edge triggered clock
  input      nReset_i,  // active low asynchronous reset
  input      enable_i,  // active high enable
  output reg Q_o);

  always @(posedge clk_i, negedge nReset_i)
    if (~nReset_i)
      Q_o <= 1'b0;
    else if (enable_i)
      Q_o <= ~Q_o;

endmodule
