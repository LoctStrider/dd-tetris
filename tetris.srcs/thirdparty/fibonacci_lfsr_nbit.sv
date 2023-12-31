// https://stackoverflow.com/questions/14497877/how-to-implement-a-pseudo-hardware-random-number-generator
// modified

module fibonacci_lfsr_nbit
   #(parameter BITS = 5)
   (
    input             clk,
    input             reset,

    output reg [BITS-1:0] data
    );

   reg [BITS-1:0] data_next;
   always_comb begin
      data_next = data;
      repeat(BITS) begin
         data_next = {(data_next[BITS-1]^data_next[1]), data_next[BITS-1:1]};
      end
   end

   initial begin
        data = 5'h1f;
   end

   always_ff @(posedge clk or posedge reset) begin
      if(reset)
         data <= 5'h1f;
      else
         data <= data_next;
   end

endmodule