module timerModN_top (
    input CLOCK_50,
    input KEY0,
    output [6:0] HEX0
);

    wire [6:0] timerModN_hex0;

    timerModN #(
        .STAGE0_BITS(4),
        .STAGE0_COUNT(10),
        .STAGE1_COUNT(10)
    ) u_timerModN (
        .clk(CLOCK_50),
        .rst(KEY0),
        .hex0(timerModN_hex0)
    );

    assign HEX0 = timerModN_hex0;

endmodule