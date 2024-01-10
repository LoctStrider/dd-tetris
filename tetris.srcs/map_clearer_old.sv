module map_clearer_old(
    input clk,
    input [19:0][9:0]map,
    output [19:0][9:0]next_map
);
    reg [19:0][9:0]g;
    reg signed [5:0]t,i;
    always @(posedge clk) begin
        t=19;
        for(i=19; i>=0;i--)begin
            while(t>=0 && map[t]==10'b1111111111)t=t-1;
            if(t<0)g[i] <= 10'b0;
            else g[i] <= map[t];
        end    
    end
    
    assign next_map=g;
endmodule