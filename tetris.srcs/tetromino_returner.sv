`include "functions.svh"

module tetromino_returner (
    input shortint center_row, center_col,
    input shortint delta_rows[2:0], delta_cols[2:0],
    input [19:0][9:0] map,
    output shortint new_center_row, new_center_col
);
    shortint row_0, row_1, row_2, col_0, col_1, col_2;
    shortint row_min, row_max, col_min, col_max;
    always @(*) begin
        row_0 = center_row + delta_rows[0];
        row_1 = center_row + delta_rows[1];
        row_2 = center_row + delta_rows[2];
        col_0 = center_col + delta_cols[0];
        col_1 = center_col + delta_cols[1];
        col_2 = center_col + delta_cols[2];
        row_min = min_of_4(row_0, row_1, row_2, center_row);
        row_max = max_of_4(row_0, row_1, row_2, center_row);
        col_min = min_of_4(col_0, col_1, col_2, center_col);
        col_max = max_of_4(col_0, col_1, col_2, center_col);
    end

    assign new_center_row = (row_min < 0 ? center_row - row_min : (row_max > 19 ? center_row - row_max + 19 : center_row));
    assign new_center_col = (col_min < 0 ? center_col - col_min : (col_max > 9 ? center_col - col_max + 9 : center_col));

endmodule