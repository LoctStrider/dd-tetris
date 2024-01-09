`include "types.svh"
//用于对于给定的map，调用VGA进行整张图的输出�?
module VGA_ctrl(

    input vga_clk,
    input reset,
    input [19:0][9:0]map,
    input shortint active_center_row,
    input shortint active_center_col,
    input shortint next_center_row,
    input shortint next_center_col,
    input active_exist,
    input shortint active_delta_rows[2:0],
    input shortint active_delta_cols[2:0],
    input shortint next_delta_rows[2:0],
    input shortint next_delta_cols[2:0],
    
    output reg [3:0] r, g, b, // 颜色输出
    output reg hsync, vsync // 同步信号
    
    );
    
    shortint nowh,nowv;

    initial begin
        nowh = 0;
        nowv = 0;
    end

    wire addr_valid;

    VGA VGA1(
        .vga_clk(vga_clk),.reset(reset),
        .color(color),.row_addr(nowv[8:0]),.col_addr(nowh[9:0]),
        .addr_valid(addr_valid),
        .r(r),.g(g),.b(b),
        .hsync(hsync),.vsync(vsync)
    );
    
    
    reg [1:0]S;
    shortint id_row = nowv / 20;
    shortint id_col = nowh / 20;
    reg[11:0]color_now;
    wire [11:0] color=color_now;
    //注意，这个编号和map的下标不同�?�map之中存的是边框之外的格子的信息，而加上边框之后向右下偏移了一位，即id_row=x,id_col=y对应map[x+1][y+1].
    //同理，对于右边用来显示下�?个块�?3*4的格子阵，其左上角对应的id_row=1,id_col=12.
    shortint active_row_0 = active_center_row + active_delta_rows[0];
    shortint active_col_0 = active_center_col + active_delta_cols[0];
    shortint active_row_1 = active_center_row + active_delta_rows[1];
    shortint active_col_1 = active_center_col + active_delta_cols[1];
    shortint active_row_2 = active_center_row + active_delta_rows[2];
    shortint active_col_2 = active_center_col + active_delta_cols[2];

    shortint next_row_0 = next_center_row + next_delta_rows[0];
    shortint next_col_0 = next_center_col + next_delta_cols[0];
    shortint next_row_1 = next_center_row + next_delta_rows[1];
    shortint next_col_1 = next_center_col + next_delta_cols[1];
    shortint next_row_2 = next_center_row + next_delta_rows[2];
    shortint next_col_2 = next_center_col + next_delta_cols[2];
    
    always @ (posedge vga_clk) begin
        if(addr_valid)S <= 0;
        else if(id_row==0&&id_col<=16)S <= 3;//第一行灰色框
        else if(id_row==5&&id_col>=11&&id_col<=16)S <= 3;
        else if(id_row==21&&id_col<=11)S <= 3;//�?后一行灰色框
        else if(id_row<=21&&(id_col==0||id_col==11))S<=3;//两列的灰色框
        else if(id_row<=5&&id_col==16)S <= 3;//灰色小框
        else if(id_row<=20 && id_col<=10)begin
            if(active_exist&& (id_row-1==active_center_row) && (id_col-1==active_center_col) ) S <= 2;//正在掉落的块
            else if(active_exist&& (id_row-1==active_row_0) && (id_col-1==active_col_0) ) S <= 2;
            else if(active_exist&& (id_row-1==active_row_1) && (id_col-1==active_col_1) ) S <= 2;
            else if(active_exist&& (id_row-1==active_row_2) && (id_col-1==active_col_2) ) S <= 2;
            else if(map[id_row-1][id_col-1]==0)S <=0;
            else S<=1;
        end
        else begin
            if( (id_row-1==next_center_row) && (id_col-1==next_center_col) ) S <= 2;//旁边显示的下�?个块
            else if( (id_row-1==next_row_0) && (id_col-1==next_col_0) ) S <= 2;
            else if( (id_row-1==next_row_1) && (id_col-1==next_col_1) ) S <= 2;
            else if( (id_row-1==next_row_2) && (id_col-1==next_col_2) ) S <= 2;
            else S <= 0;
        end
        
        if(S==0)color_now <= 12'b0;//黑色
        else if(S==1)color_now <= 12'b000011111111;//黄色
        else if(S==2)color_now <= 12'b000000001111;//红色
        else color_now <= 12'b011101110111;//灰色
    end
    
endmodule

//if(id_row==0&&id_col<=17)S <= 1;//第一行灰色框
//        else if(id_row==5&&id_col>=13&&id_col<=17)S <=1;
//        else if(id_row==23&&id_col<=13)S<=1;//�?后一行灰色框
//        else if(id_row<=23&&(id_col==0||id_col==13))S<=1;//两列的灰色框
//        else if(id_row<=5&&id_col==17)S <= 1;//灰色小框
//        else S <= 0;
