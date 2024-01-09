module tetromino_settler(
    input shortint center_row, center_col,
    input shortint delta_rows[2:0], delta_cols[2:0],
    input [19:0][9:0] map,
    output reg [19:0][9:0] new_map
);

    always @(*) begin
        new_map = map;
        new_map[center_row][center_col] = 1;
        new_map[center_row + delta_rows[0]][center_col + delta_cols[0]] = 1;
        new_map[center_row + delta_rows[1]][center_col + delta_cols[1]] = 1;
        new_map[center_row + delta_rows[2]][center_col + delta_cols[2]] = 1;
    end

endmodule