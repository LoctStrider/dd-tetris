typedef  reg signed[2:0] int3_t;
module top_VGA(
    input clk,
//    input [19:0][9:0]map,
//    input [4:0] active_center_row,
//    input [3:0] active_center_col,
//    input [4:0] next_center_row,
//    input [3:0] next_center_col,
//    input active_exist,
//    int3_t [2:0] active_delta_rows,
//    int3_t [2:0] active_delta_cols,
//    int3_t [2:0] next_delta_rows,
//    int3_t [2:0] next_delta_cols,
    
//    output [11:0] color,
//    output reg addr_valid, // 下一个像素点地址是否在有效范围
    output reg [3:0] r, g, b, // 颜色输出
    output reg hsync, vsync // 同步信号
    
    );
    wire vga_clk;
    clkdiv clkdiv1(
        .board_clk(clk),
        .div_clk(vga_clk)
    );
    int3_t [2:0] nr;
    int3_t [2:0] nc;
    assign nr[0]=-3'sd1;
    assign nr[1]=-3'sd2;
    assign nr[2]=-3'sd3;
    
    assign nc[0]=3'sd0;
    assign nc[1]=3'sd0;
    assign nc[2]=3'sd0;
    
    
    VGA_ctrl VGA_ctrl1(
        .vga_clk(vga_clk),
        .reset(1),
        .map(0),
        .active_center_row(0),
        .active_center_col(0),
        .next_center_row(5'd1),
        .next_center_col(4'd12),
        .active_exist(0),
        .active_delta_rows(0),
        .active_delta_cols(0),
        .next_delta_rows(nr),
        .next_delta_rows(nc),
        .r(r),.g(g),.b(b),
        .hsync(hsync),.vsync(vsync)
    );
    
    
    
    
    
endmodule
