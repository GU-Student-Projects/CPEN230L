// CPEN 230L lab 8 part 1, SR Latch, active-low Set & Reset
// Gabe DiMartino 10/30/2023

module SR_Latch (
  input nS,
  input nR,
  output reg Q,
  output Qn
);

  always @ (nS or nR)
  begin
    if (nS == 0 && nR == 1)
      Q <= 1;
    else if (nR == 0 && nS == 1)
      Q <= 0;
  end

  assign Qn = ~Q;

endmodule
