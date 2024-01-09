module posedge_detector(
    input clk,
    input sig,
    output logic posedge_sig
);

    reg sig_lst;

    always @(negedge clk)
        sig_lst <= sig;

    always @(posedge clk)
        posedge_sig <= sig & ~sig_lst;
endmodule