typedef  reg signed[2:0] int3_t;

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
    
    output [11:0] color 
    
    );
    
    reg [9:0] nowh,nowv;
    wire addr_valid;
    VGA VGA1(
        .vga_clk(vga_clk),.reset(reset),
        .color(color),.row_addr(nowv[8:0]),.col_addr(nowh),
        .addr_valid(addr_valid)
    );
    
    
    reg [1:0]S;
    reg [9:0]id_row;
    reg [9:0]id_col;
    reg[11:0]color_now;
    assign id_row=(nowv-10'd35)/10'd20;//�����ڵĸ��ӱ�ţ���0��ʼ��
    assign id_col=(nowh-10'd143)/10'd20;//�����ڵĸ��ӱ��
    assign color=color_now;
    //ע�⣬�����ź�map���±겻ͬ��map֮�д���Ǳ߿�֮��ĸ��ӵ���Ϣ�������ϱ߿�֮��������ƫ����һλ����id_row=x,id_col=y��Ӧmap[x+1][y+1].
    //ͬ�������ұ�������ʾ��һ�����3*4�ĸ����������ϽǶ�Ӧ��id_row=1,id_col=12.
    
    always @ (posedge vga_clk) begin
        if(addr_valid)S <= 2'd0;
        else if(id_row==10'd0&&id_col<=10'd15)S <= 2'd3;//��һ�л�ɫ��
        else if(id_row==10'd5&&id_col>=10'd11&&id_col<=10'd15)S <=2'd3;
        else if(id_row==10'd21&&id_col<=10'd11)S<=2'd3;//���һ�л�ɫ��
        else if(id_row<=10'd21&&(id_col==10'd0||id_col==10'd11))S<=2'd3;//���еĻ�ɫ��
        else if(id_row<=10'd5&&id_col==10'd15)S <= 2'd3;//��ɫС��
        else if(id_row<=10'd20 && id_col<=10'd10)begin
            if( (id_row-10'd1==active_center_row) && (id_col-10'd1==active_center_col) ) S <= 2'd2;//���ڵ���Ŀ�
            else if( (id_row-10'd1==active_center_row+active_delta_rows[0]) && (id_col-10'd1==active_center_col+active_delta_cols[0]) ) S <= 2'd2;
            else if( (id_row-10'd1==active_center_row+active_delta_rows[1]) && (id_col-10'd1==active_center_col+active_delta_cols[1]) ) S <= 2'd2;
            else if( (id_row-10'd1==active_center_row+active_delta_rows[2]) && (id_col-10'd1==active_center_col+active_delta_cols[2]) ) S <= 2'd2;
            else if(map[id_row-10'd1][id_col-10'd1]==0)S <=2'd0;
            else S<=2'd1;
        end
        else begin
            if( (id_row-10'd1==next_center_row) && (id_col-10'd1==next_center_col) ) S <= 2'd2;//�Ա���ʾ����һ����
            else if( (id_row-10'd1==next_center_row+next_delta_rows[0]) && (id_col-10'd1==next_center_col+next_delta_cols[0]) ) S <= 2'd2;
            else if( (id_row-10'd1==next_center_row+next_delta_rows[1]) && (id_col-10'd1==next_center_col+next_delta_cols[1]) ) S <= 2'd2;
            else if( (id_row-10'd1==next_center_row+next_delta_rows[2]) && (id_col-10'd1==next_center_col+next_delta_cols[2]) ) S <= 2'd2;
            else S <= 2'd0;
        end
        
        if(S==0)color_now <= 12'b0;//��ɫ
        else if(S==1)color_now <= 12'b000011111111;//��ɫ
        else if(S==2)color_now <= 12'b000000001111;//��ɫ
        else color_now <= 12'b011101110111;//��ɫ
    end
    
endmodule

//if(id_row==10'd0&&id_col<=10'd17)S <= 2'd1;//��һ�л�ɫ��
//        else if(id_row==10'd5&&id_col>=10'd13&&id_col<=10'd17)S <=2'd1;
//        else if(id_row==10'd23&&id_col<=10'd13)S<=2'd1;//���һ�л�ɫ��
//        else if(id_row<=10'd23&&(id_col==10'd0||id_col==10'd13))S<=2'd1;//���еĻ�ɫ��
//        else if(id_row<=10'd5&&id_col==10'd17)S <= 2'd1;//��ɫС��
//        else S <= 2'd0;