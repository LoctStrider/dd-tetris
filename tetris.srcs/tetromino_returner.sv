`include "functions.svh"

module tetromino_returner (
    input shortint center_row, center_col,
    input shortint delta_rows[2:0], delta_cols[2:0],
    input [19:0][9:0] map,
    output shortint new_center_row, new_center_col
);

    shortint row_0 = center_row + delta_rows[0];
    shortint row_1 = center_row + delta_rows[1];
    shortint row_2 = center_row + delta_rows[2];
    shortint col_0 = center_col + delta_cols[0];
    shortint col_1 = center_col + delta_cols[1];
    shortint col_2 = center_col + delta_cols[2];
    shortint row_min = min_of_4(row_0, row_1, row_2, center_row);
    shortint row_max = max_of_4(row_0, row_1, row_2, center_row);
    shortint col_min = min_of_4(col_0, col_1, col_2, center_col);
    shortint col_max = max_of_4(col_0, col_1, col_2, center_col);
    assign new_center_row = (row_min < 0 ? center_row - row_min : (row_max > 19 ? center_row - row_max + 19 : center_row));
    assign new_center_col = (col_min < 0 ? center_col - col_min : (col_max > 9 ? center_col - col_max + 9 : center_col));

endmodule