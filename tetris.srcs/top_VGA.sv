`include "types.svh"

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
    output reg vsync, hsync // 同步信号
//    output reg [8:0] row_addr, // 像素点的行地址
//    output reg [9:0] col_addr, // 下一个像素点的列地址
//    output reg addr_valid // 下一个像素点地址是否在有效范围
//    output reg vga_clk
    );
    
    reg [31:0]clkdiv;
	always@(posedge clk) begin
		clkdiv <= clkdiv + 1'b1;
	end
    
    wire vga_clk = clkdiv[1];
    // clkdiv clkdiv1(
    //     .board_clk(clk),
    //     .div_clk(vga_clk)
    // );
    
    
    
//    VGA VGA1(
//        .vga_clk(clkdiv[1]),
//        .clrn(1),
//        .d_in(12'b000011111111),
//        .r(r),.g(g),.b(b),
//        .vs(vsync),
//        .hs(hsync)
////        .row_addr(row_addr),
////        .col_addr(col_addr),
////        .addr_valid(addr_valid)
    
//    );
    
    
//    VGA VGA1(
//        .vga_clk(clkdiv[1]),
//        .reset(1),
//        .color(12'b000011111111),
//        .r(r),.g(g),.b(b),
//        .vsync(vsync),
//        .hsync(hsync)
////        .row_addr(row_addr),
////        .col_addr(col_addr),
////        .addr_valid(addr_valid)
    
//    );
    
    
    
    shortint nr[2:0];
    shortint nc[2:0];
    reg [19:0][9:0] map;
    
    initial begin
        map = 0;
        nr[0] = -1;
        nr[1] = 2;
        nr[2] = 1;
        nc[0] = 0;
        nc[1] = 0;
        nc[2] = 0;
    end
    
    
    VGA_ctrl VGA_ctrl1(
        .vga_clk(vga_clk),
        .reset(1'd1),
        .map(map),
//        .active_center_row(0),
//        .active_center_col(0),
        .next_center_row(1),
        .next_center_col(12),
        .active_exist(0),
//        .active_delta_rows(0),
//        .active_delta_cols(0),
        .next_delta_rows(nr),
        .next_delta_cols(nc),
        .r(r),.g(g),.b(b),
        .vsync(vsync),
        .hsync(hsync)
    );
    
    
    
    
    
endmodule
