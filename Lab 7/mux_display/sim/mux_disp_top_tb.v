// CPEN230L lab 7 part 3, MUX/Decoder test bench
// Firstname Lastname, mm/dd/yy

module mux_disp_top_tb; // testbench top level, no inputs/outputs
  reg [17:0] SW_sim;    // simulated input switches
  wire [6:0] HEX0_sim;  // simulated output 7-segment display segments

  mux_disp_top DUT(     // instantiate the DUT
    .SW   (SW_sim),
    .HEX0 (HEX0_sim));

  initial begin                   // test bench stimulus
       SW_sim[14: 0] = 15'o01234; // use octal to deal with 3-bit groups
       SW_sim[17:15] =  3'o0;     // @t=0  output = SW[14:12] = 0 = 1000000
    #5 SW_sim[17:15] =  3'o1;     // @t=5  output = SW[11: 9] = 1 = 1111001
    #5 SW_sim[17:15] =  3'o2;     // @t=10 output = SW[ 8: 6] = 2 = 0100100
    #5 SW_sim[17:15] =  3'o3;     // @t=15 output = SW[ 5: 3] = 3 = 0110000
    #5 SW_sim[17:15] =  3'o4;     // @t=20 output = SW[ 2: 0] = 4 = 0011001
    #5 SW_sim[14: 0] = 15'o56777;
       //Replace this comment with the remaining three lines to display 5, 6, 7
    #5 $finish;                   // @t=40, end simulation
  end

  initial begin               // test bench response
    $display("time  HEX0 bit 6543210");
    $display("====  ================");
    $monitor("%4d           %7b", $time, HEX0_sim);
  end

endmodule
