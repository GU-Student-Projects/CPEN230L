module timerModN #(
    parameter STAGE0_BITS = 4,
    parameter STAGE0_COUNT = 10,
    parameter STAGE1_COUNT = 10
)(
    input clk,
    input rst,
    output reg [6:0] hex0

);

    reg [STAGE0_BITS-1:0] stage0_counter;
    reg [3:0] stage1_counter;
    reg stage1_increment;

    always @(posedge clk or posedge rst) begin
        if (rst)
            stage0_counter <= 0;
        else if (stage0_counter == STAGE0_COUNT - 1)
            stage0_counter <= 0;
        else
            stage0_counter <= stage0_counter + 1'b1;
    end
    
    always @(posedge clk or posedge rst) begin
        if (rst)
            stage1_increment <= 0;
        else if (stage0_counter == STAGE0_COUNT - 1)
            stage1_increment <= 1;
        else
            stage1_increment <= 0;
    end

    always @(posedge clk) begin
        if (stage0_counter == STAGE0_COUNT - 1)
            hex0 <= stage1_counter;
        else
            hex0 <= stage0_counter;
    end

endmodule