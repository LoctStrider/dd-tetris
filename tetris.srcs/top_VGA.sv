`include "types.svh"

module top_VGA(
    input clk,
    input ps2_clk, ps2_data,
    output reg [3:0] r, g, b, // 颜色输出
    output reg vsync, hsync // 同步信号
    );
    
    wire vga_clk;
    clkdiv clkdiv1(
        .board_clk(clk),
        .period(2),
        .div_clk(vga_clk)
    );

    reg debug;
    
    wire up, down, left, right, enter;
    reg active_exist;
    tetro_type_t active_type, next_type, active_rotated_type;
    shortint active_center_row, active_center_col;
    reg [19:0][9:0] map;
    shortint active_rows[2:0], active_cols[2:0];
    shortint next_rows[2:0], next_cols[2:0];

    reg move_left, move_right, move_down, start_game, rotate;
    reg gen_new_tetro, cleanup, settle;
    wire speedup = down;

    reg in_game;
    logic [31:0] period;
    logic game_clk;
    clkdiv game_clkdiv(
        .board_clk(clk & in_game),
        .period(period),
        .div_clk(game_clk)
    );

    tetrominoes_factory active_factory(
        .tetro_type(active_type),
        .delta_rows(active_rows),
        .delta_cols(active_cols),
        .next_type(active_rotated_type)
    );

    shortint rotated_rows[2:0], rotated_cols[2:0];

    tetrominoes_factory rotated_factory(
        .tetro_type(active_rotated_type),
        .delta_rows(rotated_rows),
        .delta_cols(rotated_cols),
        .next_type()
    );

    tetrominoes_factory next_factory(
        .tetro_type(next_type),
        .delta_rows(next_rows),
        .delta_cols(next_cols),
        .next_type()
    );

    reg [7:0] rand_data;
    logic rand_reset;
    fibonacci_lfsr_nbit lfsr(
        .clk(game_clk),
        .reset(rand_reset),
        .data(rand_data)
    );

    posedge_detector up_posedge(
        .clk(clk),
        .sig(up),
        .posedge_sig(rotate)
    );

    posedge_detector left_posedge(
        .clk(clk),
        .sig(left),
        .posedge_sig(move_left)
    );

    posedge_detector right_posedge(
        .clk(clk),
        .sig(right),
        .posedge_sig(move_right)
    );

    posedge_detector enter_posedge(
        .clk(clk),
        .sig(enter),
        .posedge_sig(start_game)
    );

    always @(speedup)
        period = (speedup ? 15_000_000 : 80_000_000);

    logic rotated_collision;
    collision_detector rotated_detector(
        .center_row(active_center_row),
        .center_col(active_center_col),
        .delta_rows(rotated_rows),
        .delta_cols(rotated_cols),
        .map(map),
        .collision(rotated_collision)
    );

    logic down_collision;
    collision_detector down_detector(
        .center_row(active_center_row + 1),
        .center_col(active_center_col),
        .delta_rows(active_rows),
        .delta_cols(active_cols),
        .map(map),
        .collision(down_collision)
    );

    logic active_collision;
    collision_detector active_detector(
        .center_row(active_center_row),
        .center_col(active_center_col),
        .delta_rows(active_rows),
        .delta_cols(active_cols),
        .map(map),
        .collision(active_collision)
    );

    shortint placed_row, placed_col;

    tetromino_returner placer(
        .center_row(0),
        .center_col(active_center_col),
        .delta_rows(next_rows),
        .delta_cols(next_cols),
        .map(map),
        .new_center_row(placed_row),
        .new_center_col(placed_col)
    );

    shortint left_row, left_col;
    tetromino_faller left_faller(
        .center_row(active_center_row),
        .center_col(active_center_col),
        .delta_rows(active_rows),
        .delta_cols(active_cols),
        .delta_center_row(0),
        .delta_center_col(-1),
        .map(map),
        .new_center_row(left_row),
        .new_center_col(left_col)
    );

    shortint right_row, right_col;
    tetromino_faller right_faller(
        .center_row(active_center_row),
        .center_col(active_center_col),
        .delta_rows(active_rows),
        .delta_cols(active_cols),
        .delta_center_row(0),
        .delta_center_col(1),
        .map(map),
        .new_center_row(right_row),
        .new_center_col(right_col)
    );

    shortint down_row, down_col;
    tetromino_faller down_faller(
        .center_row(active_center_row),
        .center_col(active_center_col),
        .delta_rows(active_rows),
        .delta_cols(active_cols),
        .delta_center_row(1),
        .delta_center_col(0),
        .map(map),
        .new_center_row(down_row),
        .new_center_col(down_col)
    );

    logic [19:0][9:0] map_cleared;
    shortint clear_index;
    reg clear_enable;
    map_clearer clearer(
        .i(clear_index),
        .map(map),
        .next_map(map_cleared)
    );

    logic [19:0][9:0] map_settled;
    tetromino_settler settler(
        .center_row(active_center_row),
        .center_col(active_center_col),
        .delta_rows(active_rows),
        .delta_cols(active_cols),
        .map(map),
        .new_map(map_settled)
    );

    logic game_run;
    posedge_detector game_clk_posedge(
        .clk(clk),
        .sig(game_clk),
        .posedge_sig(game_run)
    );

    always_ff @(posedge clk) begin
        if (in_game) begin
            if (game_run) begin
                rand_reset <= 0;
                if (!active_exist) begin
                    gen_new_tetro = 1;
                end
                else begin
                    if (active_collision) begin
                        in_game = 0;
                    end
                    else if (!down_collision) begin
                        move_down = 1;
                    end
                    else begin
                        settle = 1;
                        cleanup = 1;
                    end
                end
            end

            if (gen_new_tetro) begin
                gen_new_tetro = 0;
                active_exist <= 1;
                active_center_row <= placed_row;
                active_center_col <= placed_col;
                active_type <= next_type;
                next_type <= rand_data % 19;
            end
            else if (move_left) begin
                active_center_row <= left_row;
                active_center_col <= left_col;
            end
            else if (move_right) begin
                active_center_row <= right_row;
                active_center_col <= right_col;
            end
            else if (move_down) begin
                move_down = 0;
                active_center_row <= down_row;
                active_center_col <= down_col;
            end
            else if (rotate) begin
                if (!rotated_collision)
                    active_type <= active_rotated_type;
            end
            else if (settle) begin
                settle = 0;
                active_exist <= 0;
                map <= map_settled;
            end
            else if (cleanup) begin
                cleanup = 0;
                clear_index <= 19;
                clear_enable <= 1;
            end

            if (clear_enable) begin
                if (clear_index == 0)
                    clear_enable <= 0;
                map <= map_cleared;
                clear_index <= clear_index - 1;
            end
        end
        else if (start_game) begin
            in_game = 1;
            rand_reset <= 1;
            map <= 0;
            active_exist <= 0;
            next_type <= rand_data % 19;
        end
    end

    VGA_ctrl VGA_ctrl1(
        .vga_clk(vga_clk),
        .reset(debug),
        .map(map),
        .active_center_row(active_center_row),
        .active_center_col(active_center_col),
        .next_center_row(1),
        .next_center_col(12),
        .active_exist(active_exist),
        .active_delta_rows(active_rows),
        .active_delta_cols(active_cols),
        .next_delta_rows(next_rows),
        .next_delta_cols(next_cols),
        .r(r),.g(g),.b(b),
        .vsync(vsync),
        .hsync(hsync)
    );

    PS2 ps2(
        .clk(clk),
        .reset(0),
        .ps2_clk(ps2_clk),
        .ps2_data(ps2_data),
        .up(up),
        .down(down),
        .left(left),
        .right(right),
        .enter(enter)
    );
endmodule
