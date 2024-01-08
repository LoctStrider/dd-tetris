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
    tetro_type_t active_type, next_type, active_rotated_type;
    reg [19:0][9:0] map;
    shortint active_rows[2:0], active_cols[2:0];
    shortint next_rows[2:0], next_cols[2:0];

    tetrominoes_factory active_factory(
        .tetro_type(active_type),
        .delta_rows(active_rows),
        .delta_cols(active_cols),
        .next_type(active_rotated_type)
    );

    tetrominoes_factory next_factory(
        .tetro_type(next_type),
        .delta_rows(next_rows),
        .delta_cols(next_cols),
        .next_type()
    );
    
    initial begin
        map = 0;
    end
    
    
    VGA_ctrl VGA_ctrl1(
        .vga_clk(vga_clk),
        .reset(1'd1),
        .map(map),
        .active_center_row(0),
        .active_center_col(0),
        .next_center_row(1),
        .next_center_col(12),
        .active_exist(active_exist),
        .active_delta_rows(active_rows),
        .active_delta_cols(active_cols),
        .next_delta_rows(next_rows),
        .next_delta_cols(next_cols),
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
