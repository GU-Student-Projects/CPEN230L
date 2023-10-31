// CPEN 230L lab 8 part 3, 4-bit synchronous counter
// Gabe DiMartino 10/30/2023

module counter4bit (
  input Clock,
  input nReset,           // asynchronous active low reset
  input Enable,
  output [3:0] Count);

  
  wire en1, en2, en3;     // enables for stages 1, 2, 3

  JK_FlipFlop FF0 (
    .nPr  (1'b1),         // Same for all 4 instances
    .nClr (nReset),       // Same for all 4 instances
    .Clk  (Clock),        // Same for all 4 instances
    .J    (Enable),
    .K    (Enable),
    .Q    (Count[0]),
    .Qn   () );           // No connection

  assign en1 = Enable & Count[0];

  JK_FlipFlop FF1 (
    .nPr  (1'b1),         // Same for all 4 instances
    .nClr (nReset),       // Same for all 4 instances
    .Clk  (Clock),        // Same for all 4 instances
    .J    (en1),          
    .K    (en1),         
    .Q    (Count[1]),
    .Qn   () );           // No connection

  assign en2 = en1 & Count[1];

  JK_FlipFlop FF2 (
    .nPr  (1'b1),         // Same for all 4 instances
    .nClr (nReset),       // Same for all 4 instances
    .Clk  (Clock),        // Same for all 4 instances
    .J    (en2),          
    .K    (en2),          
    .Q    (Count[2]),
    .Qn   () );           // No connection

  assign en3 = en2 & Count[2];

  JK_FlipFlop FF3 (
    .nPr  (1'b1),         // Same for all 4 instances
    .nClr (nReset),       // Same for all 4 instances
    .Clk  (Clock),        // Same for all 4 instances
    .J    (en3),          
    .K    (en3),          
    .Q    (Count[3]),
    .Qn   () );           // No connection

endmodule
