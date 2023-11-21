module counter
  #(parameter cntr_bits_p = 4,    // number of bits in the counter
    parameter cntr_tc_p   = 9) (  // counter terminal count
  input  clk_i,       // positive edge triggered clock
  input  nRst_i,      // asynchronous active-low reset
  input  enable_i,    // synchronous active-high enable
  input up_i,
  input [3:0] load_i,
  output reg term_cnt_o,  // set during terminal count
  output reg [cntr_bits_p-1:0] count_o ); // count value

  reg [cntr_bits_p-1:0] count_r = 0;    // count register

  always @(posedge clk_i or negedge nRst_i) begin
    if (~nRst_i) begin
      if (load_i) 
        count_r <= load_i; // set to Load on reset and load
      else if (up_i)
        count_r <= 0; // set to 0 on reset and up
      else
        count_r <= cntr_tc_p; // set to TC on reset and not up
    end
    else if (enable_i) begin
      if (count_r == cntr_tc_p && up_i)
        count_r <= 0; // enabled & at TC, wrap to 0
      else if (count_r == 0 && ~up_i)
        count_r <= cntr_tc_p; // enabled & at 0, wrap to TC
      else
        count_r <= count_r + (2*up_i - 1); // enabled & not TC, increment or decrement
    end
  end

  always @(posedge clk_i or negedge nRst_i) begin
    count_o <= count_r;
    term_cnt_o <= (up_i && (count_r == cntr_tc_p)) || (~up_i && (count_r == 0));
  end
endmodule
