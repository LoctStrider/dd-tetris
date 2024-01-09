module collision_detector(
    input shortint center_row, center_col,
    input shortint delta_rows[2:0], delta_cols[2:0],
    input [19:0][9:0] map,
    output collision
);

    shortint row_0 = center_row + delta_rows[0];
    shortint row_1 = center_row + delta_rows[1];
    shortint row_2 = center_row + delta_rows[2];
    shortint col_0 = center_col + delta_cols[0];
    shortint col_1 = center_col + delta_cols[1];
    shortint col_2 = center_col + delta_cols[2];
    wire map_collision = map[row_0][col_0] | map[row_1][col_1] | map[row_2][col_2] | map[center_row][center_col];
    wire row_range_collision = (row_0 < 0) | (row_0 > 19) | (row_1 < 0) | (row_1 > 19) | (row_2 < 0) | (row_2 > 19);
    wire col_range_collision = (col_0 < 0) | (col_0 > 9) | (col_1 < 0) | (col_1 > 9) | (col_2 < 0) | (col_2 > 9);
    assign collision = map_collision | row_range_collision | col_range_collision;

endmodule