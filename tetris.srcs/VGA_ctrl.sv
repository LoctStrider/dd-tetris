`include "types.svh"
//用于对于给定的map，调用VGA进行整张图的输出。
module VGA_ctrl(

    input vga_clk,
    input reset,
    input [19:0][9:0]map,
    input [4:0] active_center_row,
    input [3:0] active_center_col,
    input [4:0] next_center_row,
    input [3:0] next_center_col,
    input active_exist,
    int3_t [2:0] active_delta_rows,
    int3_t [2:0] active_delta_cols,
    int3_t [2:0] next_delta_rows,
    int3_t [2:0] next_delta_cols,
    
    output [11:0] color,
    output reg addr_valid, // 下一个像素点地址是否在有效范围
    output reg [3:0] r, g, b, // 颜色输出
    output reg hsync, vsync // 同步信号
    
    );
    
    reg [9:0] nowh,nowv;
    VGA VGA1(
        .vga_clk(vga_clk),.reset(reset),
        .color(color),.row_addr(nowv[8:0]),.col_addr(nowh),
        .addr_valid(addr_valid),
        .r(r),.g(g),.b(b),
        .hsync(hsync),.vsync(vsync)
    );
    
    
    reg [1:0]S;
    reg [9:0]id_row;
    reg [9:0]id_col;
    reg[11:0]color_now;
    assign id_row=(nowv)/10'd20;//行所在的格子编号（从0开始）
    assign id_col=(nowh)/10'd20;//列所在的格子编号
    assign color=color_now;
    //注意，这个编号和map的下标不同。map之中存的是边框之外的格子的信息，而加上边框之后向右下偏移了一位，即id_row=x,id_col=y对应map[x+1][y+1].
    //同理，对于右边用来显示下一个块的3*4的格子阵，其左上角对应的id_row=1,id_col=12.
    
    always @ (posedge vga_clk) begin
        if(addr_valid)S <= 2'd0;
        else if(id_row==10'd0&&id_col<=10'd15)S <= 2'd3;//第一行灰色框
        else if(id_row==10'd5&&id_col>=10'd11&&id_col<=10'd15)S <=2'd3;
        else if(id_row==10'd21&&id_col<=10'd11)S<=2'd3;//最后一行灰色框
        else if(id_row<=10'd21&&(id_col==10'd0||id_col==10'd11))S<=2'd3;//两列的灰色框
        else if(id_row<=10'd5&&id_col==10'd15)S <= 2'd3;//灰色小框
        else if(id_row<=10'd20 && id_col<=10'd10)begin
            if(active_exist&& (id_row-10'd1==active_center_row) && (id_col-10'd1==active_center_col) ) S <= 2'd2;//正在掉落的块
            else if(active_exist&& (id_row-10'd1==active_center_row+active_delta_rows[0]) && (id_col-10'd1==active_center_col+active_delta_cols[0]) ) S <= 2'd2;
            else if(active_exist&& (id_row-10'd1==active_center_row+active_delta_rows[1]) && (id_col-10'd1==active_center_col+active_delta_cols[1]) ) S <= 2'd2;
            else if(active_exist&& (id_row-10'd1==active_center_row+active_delta_rows[2]) && (id_col-10'd1==active_center_col+active_delta_cols[2]) ) S <= 2'd2;
            else if(map[id_row-10'd1][id_col-10'd1]==0)S <=2'd0;
            else S<=2'd1;
        end
        else begin
            if( (id_row-10'd1==next_center_row) && (id_col-10'd1==next_center_col) ) S <= 2'd2;//旁边显示的下一个块
            else if( (id_row-10'd1==next_center_row+next_delta_rows[0]) && (id_col-10'd1==next_center_col+next_delta_cols[0]) ) S <= 2'd2;
            else if( (id_row-10'd1==next_center_row+next_delta_rows[1]) && (id_col-10'd1==next_center_col+next_delta_cols[1]) ) S <= 2'd2;
            else if( (id_row-10'd1==next_center_row+next_delta_rows[2]) && (id_col-10'd1==next_center_col+next_delta_cols[2]) ) S <= 2'd2;
            else S <= 2'd0;
        end
        
        if(S==0)color_now <= 12'b0;//黑色
        else if(S==1)color_now <= 12'b000011111111;//黄色
        else if(S==2)color_now <= 12'b000000001111;//红色
        else color_now <= 12'b011101110111;//灰色
    end
    
endmodule

//if(id_row==10'd0&&id_col<=10'd17)S <= 2'd1;//第一行灰色框
//        else if(id_row==10'd5&&id_col>=10'd13&&id_col<=10'd17)S <=2'd1;
//        else if(id_row==10'd23&&id_col<=10'd13)S<=2'd1;//最后一行灰色框
//        else if(id_row<=10'd23&&(id_col==10'd0||id_col==10'd13))S<=2'd1;//两列的灰色框
//        else if(id_row<=10'd5&&id_col==10'd17)S <= 2'd1;//灰色小框
//        else S <= 2'd0;
