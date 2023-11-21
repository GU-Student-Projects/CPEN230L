module UpDownTimer_top (
    input         CLOCK_50,     // Clock for debounce circuit
    input         KEY0,         // Counter reset
    input         KEY3,
    input  [17:0] SW,           // Declare each bit separately
    output [6:0]  HEX1,
    output [6:0]  HEX2,
    output [6:0]  HEX3,
    output [6:0]  HEX4,
    output [6:0]  HEX5
);

   wire [3:0] count1_w;
	wire [3:0] count2_w;
	wire [3:0] count3_w;
	wire [3:0] count4_w;
	wire [3:0] count5_w;

    wire clean_nReset_w;
    wire clean_nEnabled;

    debouncer db1 (
        .clk_i   (CLOCK_50),
        .noisy_i (KEY0),
        .clean_o (clean_nReset_w)
    );

    debouncer db2 (
        .clk_i   (CLOCK_50),
        .noisy_i (KEY3),
        .clean_o (clean_nEnabled)
    );
	 
	 

    upDownTimer #(
        .STAGE0_BITS(26),
        .STAGE0_COUNT((50000000)/(2**3)),
        .STAGE1_BITS(4),
        .STAGE1_COUNT(1) // Change mod
    ) u_upDownTimer1 (
        .clk    (CLOCK_50),
        .rst    (clean_nReset_w),
        .load1   (SW[17:14]),
        .load2   (SW[13:10]),
        .en     (clean_nEnabled),
        .up     (SW[9]),
        .count0_o(),
        .count1_o(count1_w),
        .count2_o(count2_w),
        .count3_o(count3_w),
        .count4_o(count4_w),
        .count5_o(count5_w)
    );

    // Connect count[1]_o to HEX[1]
    dec7seg seg1(
        .bcd_i(count1_w),
        .disp_o(HEX1)
    );
	 
    // Connect count[2]_o to HEX[2]
    dec7seg seg2(
        .bcd_i(count2_w),
        .disp_o(HEX2)
    );
	 

    // Connect count[3]_o to HEX[3]
    dec7seg seg3(
        .bcd_i(count3_w),
        .disp_o(HEX3)
    );

    // Connect count[4]_o to HEX[4]
    dec7seg seg4(
        .bcd_i(count4_w),
        .disp_o(HEX4)
    );

    // Connect count[5]_o to HEX[5]
    dec7seg seg5(
        .bcd_i(count5_w),
        .disp_o(HEX5)
    );

endmodule
