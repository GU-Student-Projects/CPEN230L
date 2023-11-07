module timerModN_tb;

    reg clk = 0;
    reg rst = 0;
    reg key0 = 0;

    [6:0] hex0;

    timerModN #(
        .STAGE0_COUNT(4)
    ) u_timerModN (
        .clk(clk),
        .rst(rst),
        .hex0(hex0)
    );

    always begin
        #5 clk = ~clk;
    end
    always begin
        #10 rst = 0;
        #10 rst = 1;
    end
    always begin
        #40 key0 = 1;
        #40 key0 = 0;
    end
endmodule