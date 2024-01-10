module map_clearer(
    input shortint i,
    input [19:0][9:0] map,
    output reg [19:0][9:0] next_map
);
    shortint t;

    always_comb begin
        if (map[i] == '1) begin
            for (t = 19; t > 0; t -= 1)
                if (t <= i)
                    next_map[t] = map[t - 1];
                else
                    next_map[t] = map[t];
            next_map[0] = '0;
        end
        else
            next_map = map;
    end
endmodule
