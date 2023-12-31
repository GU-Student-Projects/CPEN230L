// CPEN230L lab 7 part 3, MUX/Decoder test bench
// Gabe DiMartino, 10/d23/23

module mux_disp_top_tb; // testbench top level, no inputs/outputs
  reg [17:0] SW_sim;    // simulated input switches
  wire [6:0] HEX0_sim;  // simulated output 7-segment display segments

  mux_disp_top DUT(     // instantiate the DUT
    .SW   (SW_sim),
    .HEX0 (HEX0_sim));

  initial begin
    SW_sim[14:0] = 15'o01234; // Use octal to deal with 3-bit groups
    SW_sim[17:15] = 3'o0;     // @t=0 output = SW[2:0] = 0 = 1000000
    #5 SW_sim[17:15] = 3'o1;  // @t=5 output = SW[2:0] = 1 = 1111001
    #5 SW_sim[17:15] = 3'o2;  // @t=10 output = SW[2:0] = 2 = 0100100
    #5 SW_sim[17:15] = 3'o3;  // @t=15 output = SW[2:0] = 3 = 0110000
    #5 SW_sim[17:15] = 3'o4;  // @t=20 output = SW[2:0] = 4 = 0011001
    #5 SW_sim[14:0] = 15'o56777; // Set the input for 5, 6, 7
    #5 SW_sim[17:15] = 3'o0;  // @t=30 output = SW[2:0] = 5 = 0010010
    #5 SW_sim[17:15] = 3'o1;  // @t=35 output = SW[2:0] = 6 = 0000010
    #5 SW_sim[17:15] = 3'o2;  // @t=40 output = SW[2:0] = 7 = 1111000
    #5 $finish;               // @t=45, end simulation
  end

  initial begin               // test bench response
    $display("time  HEX0 bit 6543210");
    $display("====  ================");
    $monitor("%4d           %7b", $time, HEX0_sim);
  end
endmodule