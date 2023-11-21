module upDownTimer #(
    parameter STAGE0_BITS = 26,
    parameter STAGE0_COUNT = 50000,
    parameter STAGE1_BITS = 4,
    parameter STAGE1_COUNT = 9
)(
    input clk,
    input rst,
    input [3:0] load1,
    input [3:0] load2,
    input en,
    input up,
    output [STAGE0_BITS-1:0] count0_o,
    output [STAGE1_BITS-1:0] count1_o,
    output [STAGE1_BITS-1:0] count2_o,
    output [STAGE1_BITS-1:0] count3_o,
    output [STAGE1_BITS-1:0] count4_o,
    output [STAGE1_BITS-1:0] count5_o
);

    wire stage1_increment;
	 wire stage2_increment;
	 wire stage3_increment;
	 wire stage4_increment;
	 wire stage5_increment;
	 
	 

    counter #(.cntr_bits_p(STAGE0_BITS), .cntr_tc_p(STAGE0_COUNT)) stage0 (
        .clk_i(clk),
        .nRst_i(rst),
        .enable_i(en),
        .up_i(1),
        .load_i(),
        .term_cnt_o(stage1_increment),
        .count_o(count0_o)
    );
    
    counter #(.cntr_bits_p(STAGE1_BITS), .cntr_tc_p(STAGE1_COUNT)) stage1 (
        .clk_i(clk),
        .nRst_i(rst),
        .enable_i(stage1_increment && en),
        .up_i(up),
        .load_i(),
        .term_cnt_o(stage2_increment),
        .count_o(count1_o)
    );

    counter #(.cntr_bits_p(STAGE1_BITS), .cntr_tc_p(STAGE1_COUNT)) stage2 (
        .clk_i(clk),
        .nRst_i(rst),
        .enable_i(stage1_increment && stage2_increment && en),
        .up_i(up),
        .load_i(),
        .term_cnt_o(stage3_increment),
        .count_o(count2_o)
    );

    counter #(.cntr_bits_p(STAGE1_BITS), .cntr_tc_p(STAGE1_COUNT)) stage3 (
        .clk_i(clk),
        .nRst_i(rst),
        .enable_i(stage1_increment && stage2_increment && stage3_increment && en),
        .up_i(up),
        .load_i(),
        .term_cnt_o(stage4_increment),
        .count_o(count3_o)
    );

    counter #(.cntr_bits_p(STAGE1_BITS), .cntr_tc_p(STAGE1_COUNT)) stage4 (
        .clk_i(clk),
        .nRst_i(rst),
        .enable_i(stage1_increment && stage2_increment && stage3_increment && stage4_increment && en),
        .up_i(up),
        .load_i(load2),
        .term_cnt_o(stage5_increment),
        .count_o(count4_o)
    );

    counter #(.cntr_bits_p(STAGE1_BITS), .cntr_tc_p(STAGE1_COUNT)) stage5 (
        .clk_i(clk),
        .nRst_i(rst),
        .enable_i(stage1_increment && stage2_increment && stage3_increment && stage4_increment && stage5_increment && en),
        .up_i(up),
        .load_i(load1),
        .term_cnt_o(),
        .count_o(count5_o)
    );

endmodule
