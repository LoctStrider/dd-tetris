module posedge_detector(
    input clk,
    input sig,
    output logic posedge_sig
);

    reg sig_lst;

    always @(posedge clk) begin
        posedge_sig <= sig & ~sig_lst;
        sig_lst <= sig;
    end
endmodule