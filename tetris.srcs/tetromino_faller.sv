module tetromino_faller (
    input clk,
    input shortint center_row, center_col,
    input shortint delta_rows[2:0], delta_cols[2:0],
    input shortint delta_center_row, delta_center_col,
    input [19:0][9:0] map,
    output succeed,
    output shortint new_center_row, new_center_col
);

    assign new_center_row = (clk ? center_row + delta_center_row : center_row);
    assign new_center_col = (clk ? center_col + delta_center_col : center_col);

    logic collision;
    collision_detector detector (
        .center_row(center_row),
        .center_col(center_col),
        .delta_rows(delta_rows),
        .delta_cols(delta_cols),
        .map(map),
        .collision(collision)
    );
    assign succeed = !collision;

endmodule