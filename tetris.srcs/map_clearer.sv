module map_clearer(
    input clk,
    input [19:0][9:0]map,
    output [19:0][9:0]next_map
);
    reg [19:0][9:0]g;
    reg signed [5:0] t;
    always @(posedge clk) begin
        t = 19;
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
            g[19] = 10'b0;
        end
        else begin
            g[19] = map[t];
            t = t - 1;
        end

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
            g[18] = 10'b0;
        end
        else begin
            g[18] = map[t];
            t = t - 1;
        end

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
            g[17] = 10'b0;
        end
        else begin
            g[17] = map[t];
            t = t - 1;
        end

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
            g[16] = 10'b0;
        end
        else begin
            g[16] = map[t];
            t = t - 1;
        end

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
            g[15] = 10'b0;
        end
        else begin
            g[15] = map[t];
            t = t - 1;
        end

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
            g[14] = 10'b0;
        end
        else begin
            g[14] = map[t];
            t = t - 1;
        end

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
            g[13] = 10'b0;
        end
        else begin
            g[13] = map[t];
            t = t - 1;
        end

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
            g[12] = 10'b0;
        end
        else begin
            g[12] = map[t];
            t = t - 1;
        end

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
            g[11] = 10'b0;
        end
        else begin
            g[11] = map[t];
            t = t - 1;
        end

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
            g[10] = 10'b0;
        end
        else begin
            g[10] = map[t];
            t = t - 1;
        end

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
            g[9] = 10'b0;
        end
        else begin
            g[9] = map[t];
            t = t - 1;
        end

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
            g[8] = 10'b0;
        end
        else begin
            g[8] = map[t];
            t = t - 1;
        end

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
            g[7] = 10'b0;
        end
        else begin
            g[7] = map[t];
            t = t - 1;
        end

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
            g[6] = 10'b0;
        end
        else begin
            g[6] = map[t];
            t = t - 1;
        end

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
            g[5] = 10'b0;
        end
        else begin
            g[5] = map[t];
            t = t - 1;
        end

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
            g[4] = 10'b0;
        end
        else begin
            g[4] = map[t];
            t = t - 1;
        end

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
            g[3] = 10'b0;
        end
        else begin
            g[3] = map[t];
            t = t - 1;
        end

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
            g[2] = 10'b0;
        end
        else begin
            g[2] = map[t];
            t = t - 1;
        end

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
            g[1] = 10'b0;
        end
        else begin
            g[1] = map[t];
            t = t - 1;
        end

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
            g[0] = 10'b0;
        end
        else begin
            g[0] = map[t];
            t = t - 1;
        end

    end
    
    assign next_map=g;
endmodule
