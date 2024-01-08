`include "types.svh"

module tetrominoes_factory(
    input tetro_type_t tetro_type,
    output shortint delta_rows[2:0],
    output shortint delta_cols[2:0],
    output tetro_type_t next_type
);
//0-3: reversed L
//4-7: L
//8-9: reversed Z
//10:11: Z
//12-15: T
//16-17: l
//18: square
    always @(*) begin
        case(tetro_type)
            0 :begin delta_rows[0]=-1;delta_rows[1]=1;delta_rows[2]=1;delta_cols[0]=0;delta_cols[1]=-1;delta_cols[2]=0;next_type=3;   end
            1 :begin delta_rows[0]=0;delta_rows[1]=0;delta_rows[2]=1;delta_cols[0]=-1;delta_cols[1]=1;delta_cols[2]=1;next_type=0;    end
            2 :begin delta_rows[0]=-1;delta_rows[1]=-1;delta_rows[2]=1;delta_cols[0]=0;delta_cols[1]=1;delta_cols[2]=0;next_type=1;   end
            3 :begin delta_rows[0]=-1;delta_rows[1]=0;delta_rows[2]=0;delta_cols[0]=-1;delta_cols[1]=-1;delta_cols[2]=1;next_type=2;  end
            4 :begin delta_rows[0]=-1;delta_rows[1]=-1;delta_rows[2]=1;delta_cols[0]=-1;delta_cols[1]=0;delta_cols[2]=0;next_type=5;  end
            5 :begin delta_rows[0]=-1;delta_rows[1]=0;delta_rows[2]=0;delta_cols[0]=1;delta_cols[1]=-1;delta_cols[2]=1;next_type=6;   end
            6 :begin delta_rows[0]=-1;delta_rows[1]=1;delta_rows[2]=1;delta_cols[0]=0;delta_cols[1]=0;delta_cols[2]=1;next_type=7;    end
            7 :begin delta_rows[0]=0;delta_rows[1]=0;delta_rows[2]=1;delta_cols[0]=-1;delta_cols[1]=1;delta_cols[2]=-1;next_type=4;   end
            8 :begin delta_rows[0]=0;delta_rows[1]=1;delta_rows[2]=1;delta_cols[0]=1;delta_cols[1]=-1;delta_cols[2]=0;next_type=9;    end
            9 :begin delta_rows[0]=-1;delta_rows[1]=0;delta_rows[2]=1;delta_cols[0]=-1;delta_cols[1]=-1;delta_cols[2]=0;next_type=8;  end
            10:begin delta_rows[0]=0;delta_rows[1]=1;delta_rows[2]=1;delta_cols[0]=-1;delta_cols[1]=0;delta_cols[2]=1;next_type=11;   end
            11:begin delta_rows[0]=-1;delta_rows[1]=0;delta_rows[2]=1;delta_cols[0]=0;delta_cols[1]=-1;delta_cols[2]=-1;next_type=10; end
            12:begin delta_rows[0]=0;delta_rows[1]=0;delta_rows[2]=1;delta_cols[0]=-1;delta_cols[1]=1;delta_cols[2]=0;next_type=15;   end
            13:begin delta_rows[0]=-1;delta_rows[1]=0;delta_rows[2]=1;delta_cols[0]=0;delta_cols[1]=1;delta_cols[2]=0;next_type=12;   end
            14:begin delta_rows[0]=-1;delta_rows[1]=0;delta_rows[2]=0;delta_cols[0]=0;delta_cols[1]=-1;delta_cols[2]=1;next_type=13;  end
            15:begin delta_rows[0]=-1;delta_rows[1]=0;delta_rows[2]=1;delta_cols[0]=0;delta_cols[1]=-1;delta_cols[2]=0;next_type=14;  end
            16:begin delta_rows[0]=0;delta_rows[1]=0;delta_rows[2]=0;delta_cols[0]=-1;delta_cols[1]=1;delta_cols[2]=2;next_type=17;   end
            17:begin delta_rows[0]=-1;delta_rows[1]=1;delta_rows[2]=2;delta_cols[0]=0;delta_cols[1]=0;delta_cols[2]=0;next_type=16;   end
            18:begin delta_rows[0]=-1;delta_rows[1]=-1;delta_rows[2]=0;delta_cols[0]=-1;delta_cols[1]=0;delta_cols[2]=-1;next_type=18;end
            default:begin    end
        endcase
        
        
        
    end




endmodule
