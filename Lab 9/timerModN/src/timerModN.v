module timerModN #(
    parameter STAGE0_BITS = 26,
    parameter STAGE0_COUNT = 50000000,
    parameter STAGE1_BITS = 4,
	 parameter STAGE1_COUNT = 9
)(
    input clk,
    input rst,
    output [STAGE0_BITS-1:0] hex0_o,
	 output [STAGE1_BITS-1:0] hex1_o
);

    wire stage1_increment;

    cntrStage #(.cntr_bits_p(STAGE0_BITS), .cntr_tc_p(STAGE0_COUNT)) stage0 (
        .clk_i(clk),
        .nRst_i(rst),
        .enable_i(1'b1),
        .term_cnt_o(stage1_increment),
        .count_o(hex0_o)
    );
	 
	 cntrStage #(.cntr_bits_p(STAGE1_BITS), .cntr_tc_p(STAGE1_COUNT)) stage1 (
        .clk_i(clk),
        .nRst_i(rst),
        .enable_i(stage1_increment),
        .term_cnt_o(),
        .count_o(hex1_o)
    );

endmodule