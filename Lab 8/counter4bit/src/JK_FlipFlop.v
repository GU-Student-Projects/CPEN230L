// CPEN 230L lab 8, JK Flip-Flop
// Gabe DiMartino 10/30/23

module JK_FlipFlop (
  input  nPr,    // asynchronous active-low preset
  input  nClr,   // asnychronous active-low clear
  input  Clk,    // positive edge triggers
  input  J,
  input  K,
  output Q,
  output Qn );

  reg Q_r  = 0;      // registers for use inside the always block
  reg Qn_r = 1;

  assign Q  = Q_r;   // set outputs from the always block registers
  assign Qn = Qn_r;

  always @(posedge Clk, negedge nPr, negedge nClr) begin
    if (nClr == 1'b0) begin          // clear (nPr == x)
      Q_r  <= 1'b0;
      Qn_r <= 1'b1;
    end else if (nPr == 1'b0) begin  // preset (nClr == 1)
      Q_r  <= 1'b1;
      Qn_r <= 1'b0;
    end else if ( J & ~K) begin      // set (nPr == 1 && nClr == 1)
      Q_r  <= 1'b1;
      Qn_r <= 1'b0;
    end else if (~J &  K) begin      // reset
      Q_r  <= 1'b0;
      Qn_r <= 1'b1;
    end else if ( J &  K) begin      // toggle
      Q_r  <= ~Q_r;
      Qn_r <= ~Qn_r;
    end // else (~J & ~K), so do nothing
  end

endmodule
