// https://stackoverflow.com/questions/14497877/how-to-implement-a-pseudo-hardware-random-number-generator
// modified

module fibonacci_lfsr_nbit
   (
    input             clk,
    input             reset,

    output reg [7:0] data
    );

   reg [7:0] data_next;
   always_comb begin
      data_next = data;
      repeat(8) begin
         data_next = {(data_next[7]^data_next[5]^data_next[2]^data_next[1]), data_next[7:1]};
      end
   end

   always_ff @(posedge clk or posedge reset) begin
      if(reset)
         data <= 8'b11111111;
      else
         data <= data_next;
   end
endmodule