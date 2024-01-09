`timescale 1ns / 1ps

module MP_CLR_TB();
reg clk;
reg [19:0] [9:0] map;
wire [19:0] [9:0] next_map;
map_clearer tested(
    .clk(clk),
    .map(map),
    .next_map(next_map)
);
always begin
    clk=0;#1;
    clk=1;#1;
end
reg signed [5:0] i;
reg signed [5:0] j;

initial begin
    for(i=0;i<6'd10;i=i+1) begin
        map[2*i][9:0] <= i+1;
        map[2*i+1][9:0] <= 10'b1111111111;
    end
    #100;
    for(i=0;i<6'd10;i=i+1) begin
        map[i][9:0] <= i+10;
        map[i+10][9:0] <= 10'b1111111111;
    end
end



endmodule
