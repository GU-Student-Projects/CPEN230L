// CPEN230L lab 7 part 3, MUX/Decoder test bench
// Gabe DiMartino, 10/d23/23

module tb_oct7seg;
  reg [17:0] SW_sim; // Simulated switch inputs
  wire [6:0] disp_sim; // Simulated 7-segment display output

  // Instantiate the oct7seg module
  oct7seg u1 (
    .c_i(SW_sim[2:0]), // Use the lower 3 bits of SW_sim as input
    .disp_o(disp_sim) // Connect the display output
  );

  initial begin
    SW_sim[14:0] = 15'o01234; // Use octal to deal with 3-bit groups
    SW_sim[17:15] = 3'o0; // @t=0 output = SW[2:0] = 0 = 1000000
    #5 SW_sim[17:15] = 3'o1; // @t=5 output = SW[2:0] = 1 = 1111001
    #5 SW_sim[17:15] = 3'o2; // @t=10 output = SW[2:0] = 2 = 0100100
    #5 SW_sim[17:15] = 3'o3; // @t=15 output = SW[2:0] = 3 = 0110000
    #5 SW_sim[17:15] = 3'o4; // @t=20 output = SW[2:0] = 4 = 0011001
    #5 SW_sim[14:0] = 15'o56777; // Set the input for 5, 6, 7
    #5 SW_sim[17:15] = 3'o5; // @t=30 output = SW[2:0] = 5
    #5 SW_sim[17:15] = 3'o6; // @t=35 output = SW[2:0] = 6
    #5 SW_sim[17:15] = 3'o7; // @t=40 output = SW[2:0] = 7
    #5 $finish; // @t=45, end simulation
  end

  always begin
    $display("Time = %0t: SW = %b, Display = %b", $time, SW_sim, disp_sim);
  end
endmodule
