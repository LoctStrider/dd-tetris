module VGA (
    input vga_clk, reset, // 时钟信号；重置信号
    input [11:0] color, // 当前显示颜色
    output [8:0] row_addr, // 下一个像素点的行地址
    output [9:0] col_addr, // 下一个像素点的列地址
    output addr_valid, // 下一个像素点地址是否在有效范围
    output [3:0] r, g, b, // 颜色输出
    output hsync, vsync // 同步信号
);
    // TODO
endmodule