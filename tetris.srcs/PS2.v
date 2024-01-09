module PS2 (
    input clk, reset,
    input ps2_clk, ps2_data, // PS/2 协议输入
    output reg up, down, left, right, enter // 每一按键是否按下
);
    // TODO
    
    // 定义寄存器与线网
    reg clk_flag0, clk_flag1, clk_flag2; // 一组移位寄存器，用于检测PS2_clk的下降沿
    reg [7:0] temp_data; // 临时存储输入信号
    reg [3:0] num; // 计数寄存器
    wire negedge_ps2_clk = !clk_flag1 & clk_flag2; // 检测是否为PS2_clk下降沿
    reg negedge_ps2_clk_shift; // 将negedge_ps2_clk的值传递至下一时钟周期
    reg [9:0] data; // 处理后得到的输入数据
    reg data_break; // 是否为断码
    reg data_expand; // 是否为两字节数据
    reg data_done; // 输入信号是否全部读入且处理完毕

    // 检测PS2_clk下降沿
    always@(posedge clk or posedge reset) begin
        if(reset) begin
            clk_flag0 <= 1'b0;
            clk_flag1 <= 1'b0;
            clk_flag2 <= 1'b0;
        end
        else begin
            clk_flag0 <= ps2_clk;
            clk_flag1 <= clk_flag0;
            clk_flag2 <= clk_flag1;
        end
    end
    always@(posedge clk) begin
        negedge_ps2_clk_shift <= negedge_ps2_clk;
    end

    // 对PS2_clk的周期进行计数
    always@(posedge clk or posedge reset) begin
	    if(reset)
		    num <= 4'd0;
	    else if (num == 4'd11)
		    num <= 4'd0; // 到达上限，重置
	    else if (negedge_ps2_clk)
		    num <= num + 1'b1; // num值自加
    end
    
    // 读入串行输入信号
    always@(posedge clk or posedge reset) begin
        if(reset)
            temp_data <= 8'd0;
        else if (negedge_ps2_clk_shift) begin
            case(num)
                4'd2: temp_data[0] <= ps2_data;
                4'd3: temp_data[1] <= ps2_data;
                4'd4: temp_data[2] <= ps2_data;
                4'd5: temp_data[3] <= ps2_data;
                4'd6: temp_data[4] <= ps2_data;
                4'd7: temp_data[5] <= ps2_data;
                4'd8: temp_data[6] <= ps2_data;
                4'd9: temp_data[7] <= ps2_data;
                default: temp_data <= temp_data;
            endcase // 根据num的值决定哪一位读入
        end
        else temp_data <= temp_data;
    end
    
    // 处理输入信号
    always@(posedge clk or posedge reset) begin
        if(reset) begin
            data_break <= 1'b0;
            data <= 10'd0;
            data_done <= 1'b0;
            data_expand <= 1'b0;
        end
        else if(num == 4'd11) begin
            if(temp_data == 8'hE0) 
                data_expand <= 1'b1; // 检测到输入信号的通码为两字节
            else if(temp_data == 8'hF0)
                data_break <= 1'b1; // 检测到输入信号是断码
            else begin
                data<={data_expand, data_break, temp_data}; // 合并数据
                data_done <= 1'b1; // 信号处理完毕
                data_expand <= 1'b0;
                data_break <= 1'b0;
            end
        end
        else begin
            data <= data;
            data_done <= 1'b0;
            data_expand <= data_expand;
            data_break <= data_break;
        end
    end
    
    // 更新按键状态
    always @(posedge clk) begin
        if(data_done) begin
            case(data)
                10'h05A: enter <= 1'b1;
                10'h15A: enter <= 1'b0;
                10'h275: up <= 1'b1;
                10'h375: up <= 1'b0;
                10'h272: down <= 1'b1;
                10'h372: down <= 1'b0;
                10'h26B: left <= 1'b1;
                10'h36B: left <= 1'b0;
                10'h274: right <= 1'b1;
                10'h374: right <= 1'b0;
            endcase
        end
        else begin
            enter <= enter;
            up <= up;
            down <= down;
            left <= left;
            right <= right;
        end
    end
    
endmodule
