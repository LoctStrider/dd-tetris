module map_clearer(
    input clk,
    input shortint i,
    input [19:0][9:0]map,
    input enable,
    output [19:0][9:0]next_map,
    output finished
);
    reg [19:0][9:0]g;
    reg signed [5:0] t;

    logic enable_pe;
    posedge_detector enable_posedge(
        .clk(clk),
        .sig(enable),
        .posedge_sig(enable_pe)
    );
    assign finished = (i == 0);

    always @(posedge clk) begin
        if (enable_pe)
            t = 19;
        if (enable) begin
            if (t >= 0)
                if (map[t] == 10'b1111111111)
                    t = t - 1;
            if (t >= 0)
                if (map[t] == 10'b1111111111)
                    t = t - 1;
            if (t >= 0)
                if (map[t] == 10'b1111111111)
                    t = t - 1;
            if (t >= 0)
                if (map[t] == 10'b1111111111)
                    t = t - 1;
            if(t<0)begin
                g[i] = 10'b0;
            end
            else begin
                g[i] = map[t];
                t = t - 1;
            end
        end
    end
    
    assign next_map=g;
endmodule
