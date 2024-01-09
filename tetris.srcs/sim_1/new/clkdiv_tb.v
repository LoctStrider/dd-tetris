`timescale 1ns / 1ps

module clkdiv_tb();
reg board_clk;
reg [31:0] period;
wire div_clk;

clkdiv tested1(
    .board_clk(board_clk),
    .period(period),
    .div_clk(div_clk)
);
always begin
    board_clk=0;#1;
    board_clk=1;#1;
end

initial begin
    period=32'd100;#400;
    period=32'd50;#100;
end

endmodule
