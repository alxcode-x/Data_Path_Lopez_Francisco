module Instruction_Decoder
#
(	
	parameter DATA_WIDTH = 32
)(
	input [31:0] SUBSTRACT,
	input  		[DATA_WIDTH-1:0] v_inst_i, 
	output reg 	[DATA_WIDTH-1:0] ph_inst_o
);
	reg [31:0]sub;
	
	always @(v_inst_i) begin
		sub = v_inst_i - SUBSTRACT;
		ph_inst_o = sub >> 2;
		//$display($time," DECODER: %h", ph_inst_o);
	end
endmodule 