`timescale 1ns / 10ps

module PS2_tb();
reg clk;
reg reset;
reg pclk;
reg pdata;
wire up, down, left, right, enter;
wire [7:0] data;
wire [3:0] num;
PS2 PS2333(
    .clk(clk),
    .reset(reset),
    .ps2_clk(pclk),
    .ps2_data(pdata),
    .up(up),
    .down(down),
    .left(left),
    .right(right),
    .enter(enter),
    
    .out_data(data),
    .out_num(num)
);
always begin
    clk = 0;#1;
    clk = 1;#1;
end
initial begin
    reset=1;pclk=1;pdata=0;#10;
    reset=0;#10;
    pclk=1;pdata=0;#10;
    pclk=0;#10;
    pclk=1;pdata=0;#10;
    pclk=0;#10;
    pclk=1;pdata=0;#10;
    pclk=0;#10;
    pclk=1;pdata=0;#10;
    pclk=0;#10;
    pclk=1;pdata=0;#10;
    pclk=0;#10;
    pclk=1;pdata=0;#10;
    pclk=0;#10;
    pclk=1;pdata=1;#10;
    pclk=0;#10;
    pclk=1;pdata=1;#10;
    pclk=0;#10;
    pclk=1;pdata=1;#10;
    pclk=0;#10;
    pclk=1;pdata=0;#10;
    pclk=0;#10;
    pclk=1;pdata=1;#10;
    pclk=0;#10;
    
    pclk=1;pdata=0;#10;
    pclk=0;#10;
    pclk=1;pdata=1;#10;
    pclk=0;#10;
    pclk=1;pdata=0;#10;
    pclk=0;#10;
    pclk=1;pdata=1;#10;
    pclk=0;#10;
    pclk=1;pdata=0;#10;
    pclk=0;#10;
    pclk=1;pdata=1;#10;
    pclk=0;#10;
    pclk=1;pdata=1;#10;
    pclk=0;#10;
    pclk=1;pdata=1;#10;
    pclk=0;#10;
    pclk=1;pdata=0;#10;
    pclk=0;#10;
    pclk=1;pdata=0;#10;
    pclk=0;#10;
    pclk=1;pdata=1;#10;
    pclk=0;#10;
    pclk=1; #10;
    
    pclk=1;pdata=0;#10;
    pclk=0;#10;
    pclk=1;pdata=0;#10;
    pclk=0;#10;
    pclk=1;pdata=0;#10;
    pclk=0;#10;
    pclk=1;pdata=0;#10;
    pclk=0;#10;
    pclk=1;pdata=0;#10;
    pclk=0;#10;
    pclk=1;pdata=1;#10;
    pclk=0;#10;
    pclk=1;pdata=1;#10;
    pclk=0;#10;
    pclk=1;pdata=1;#10;
    pclk=0;#10;
    pclk=1;pdata=1;#10;
    pclk=0;#10;
    pclk=1;pdata=1;#10;
    pclk=0;#10;
    pclk=1;pdata=1;#10;
    pclk=0;#10;

    pclk=1;pdata=0;#10;
    pclk=0;#10;
    pclk=1;pdata=0;#10;
    pclk=0;#10;
    pclk=1;pdata=0;#10;
    pclk=0;#10;
    pclk=1;pdata=0;#10;
    pclk=0;#10;
    pclk=1;pdata=0;#10;
    pclk=0;#10;
    pclk=1;pdata=0;#10;
    pclk=0;#10;
    pclk=1;pdata=1;#10;
    pclk=0;#10;
    pclk=1;pdata=1;#10;
    pclk=0;#10;
    pclk=1;pdata=1;#10;
    pclk=0;#10;
    pclk=1;pdata=0;#10;
    pclk=0;#10;
    pclk=1;pdata=1;#10;
    pclk=0;#10;
    
    pclk=1;pdata=0;#10;
    pclk=0;#10;
    pclk=1;pdata=1;#10;
    pclk=0;#10;
    pclk=1;pdata=0;#10;
    pclk=0;#10;
    pclk=1;pdata=1;#10;
    pclk=0;#10;
    pclk=1;pdata=0;#10;
    pclk=0;#10;
    pclk=1;pdata=1;#10;
    pclk=0;#10;
    pclk=1;pdata=1;#10;
    pclk=0;#10;
    pclk=1;pdata=1;#10;
    pclk=0;#10;
    pclk=1;pdata=0;#10;
    pclk=0;#10;
    pclk=1;pdata=0;#10;
    pclk=0;#10;
    pclk=1;pdata=1;#10;
    pclk=0;#10;
    pclk=1; #10;
    
end

endmodule
