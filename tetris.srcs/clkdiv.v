module clkdiv #(
    PERIOD = 100_000_000 // 周期，单位为 10ns
) (
    input board_clk, // 来自 SWORD 板的时钟信号，周期为 10ns
    output reg div_clk // 分频后的时钟信号
);

    reg [31:0] cnt;

    initial begin
        cnt = 0;
    end

    wire [31:0] cnt_next = cnt + 1;

    always @(posedge board_clk) begin
        if (cnt < PERIOD / 2)
        begin
            cnt <= cnt_next;
        end
        else
        begin
            cnt <= 0;
            div_clk <= ~div_clk;
        end
    end
    
endmodule