typedef reg [2:0] int3_t;

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
    
//    reg [31:0]clkdiv;
//	always@(posedge clk) begin
//		clkdiv <= clkdiv + 1'b1;
//	end
    
    wire vga_clk;
    clkdiv clkdiv1(
        .board_clk(clk),
        .div_clk(vga_clk)
    );
    
    
    
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
    
    
    
    int3_t [2:0] nr;
    int3_t [2:0] nc;
    assign nr[0]=-3'sd1;
    assign nr[1]=-3'sd2;
    assign nr[2]=-3'sd3;
    
    assign nc[0]=3'sd0;
    assign nc[1]=3'sd0;
    assign nc[2]=3'sd0;
    
    wire [19:0][9:0] map;
    
    
    VGA_ctrl VGA_ctrl1(
        .vga_clk(vga_clk),
        .reset(1),
        .map(map),
//        .active_center_row(0),
//        .active_center_col(0),
        .next_center_row(5'd1),
        .next_center_col(4'd12),
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
