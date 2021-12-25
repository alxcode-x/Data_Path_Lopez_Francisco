module Reg_PC
(
	input clk, enable, reset,
    input      [31:0] data_i, 
	output reg [31:0] data_o
);
 
 	always @(posedge clk or negedge reset) begin
      if (!reset) data <= 32'h400000;
      else
		if(enable) data_o <= data_i;
   end 

endmodule 