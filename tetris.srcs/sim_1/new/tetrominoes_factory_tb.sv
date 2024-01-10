`include "types.svh"
module tetrominoes_factory_tb();
reg clk;
tetro_type_t tetro_type;
shortint delta_rows[2:0];
shortint delta_cols[2:0];
tetro_type_t next_type;

tetrominoes_factory_old tetrominoes_factory_inst(
    .clk(clk),.tetro_type(tetro_type),.delta_rows(delta_rows),.delta_cols(delta_cols),.next_type(next_type)
);

initial begin
    tetro_type_t res;
    res=0;clk=0;
    repeat(19)begin
        tetro_type = res;
        res=res + 1;
        clk=!clk;
        #10;
        clk=!clk;
        #10;
        clk=!clk;
        #10;
        clk=!clk;
        #10;
        
    end
end
endmodule
