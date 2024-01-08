`include "types.svh"

module top_VGA(
    input clk,
    input ps2_clk, ps2_data,
    output reg [3:0] r, g, b, // 颜色输出
    output reg vsync, hsync // 同步信号
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
    
    
    wire up, down, left, right, enter;
    reg active_exist;
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

    PS2 ps2(
        .clk(clk),
        .reset(0),
        .ps2_clk(ps2_clk),
        .ps2_data(ps2_data),
        .up(up),
        .down(down),
        .left(left),
        .right(right),
        .enter(enter)
    );
endmodule
