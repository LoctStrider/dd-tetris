module VGA (
    input vga_clk, reset, // 时钟信号；重置信�?
    input [11:0] color, // 当前显示颜色
    output reg [8:0] row_addr, // 像素点的行地�?
    output reg [9:0] col_addr, // 下一个像素点的列地址
    output reg addr_valid, // 下一个像素点地址是否在有效范�?
    output reg [3:0] r, g, b, // 颜色输出
    output reg vsync, hsync // 同步信号
);
    reg [9:0] nowh,nowv;
    initial begin
        nowh=0;nowv=0;
        r=4'd0;g=4'd0;b=4'd0;
        addr_valid=0;
        vsync=0;hsync=0;
        row_addr=0;col_addr=0;
    end
    always @ (posedge vga_clk) begin
        nowh <= (reset || nowh==10'd799)?10'd0:(nowh+10'd1);
    end
    
    always @ (posedge vga_clk or posedge reset) begin
       if (reset) nowv=10'd0;
       else if (nowh == 10'd799) nowv <= (nowv==10'd524)?10'd0:(nowv+10'd1);
   end
   
   wire  read   = (nowh > 10'd142) && (nowh < 10'd783) &&  (nowv > 10'd34)  &&  (nowv < 10'd515); 
    always @ (posedge vga_clk) begin
        row_addr  <=  nowv - 10'd35; // pixel ram row address
        col_addr  <=  nowh - 10'd143;      // pixel ram col address
        addr_valid<= ~read;     // read pixel (active low)
        hsync        <=  (nowh > 10'd95);   // horizontal synchronization
        vsync        <=  (nowv > 10'd1);   // vertical   synchronization
        r         <=  addr_valid ? 4'h0 : color[3:0]; // 3-bit red
        g         <=  addr_valid ? 4'h0 : color[7:4]; // 3-bit green
        b         <=  addr_valid ? 4'h0 : color[11:8]; // 3-bit blue
    end
endmodule
