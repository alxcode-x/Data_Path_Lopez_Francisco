module Data_Memory
#
(	
	parameter MEMORY_DEPTH 	= 64,
	parameter DATA_WIDTH 	= 32
)(
	input clk,
	input Write_Enable_i,
	input [DATA_WIDTH-1:0] Write_Data_i,
	input [DATA_WIDTH-1:0] Address_i,
	
	output [DATA_WIDTH-1:0]	Instruction_o
);
	reg [DATA_WIDTH-1:0] ram [(MEMORY_DEPTH-1):0];
	reg [DATA_WIDTH-1:0] inst_range = 32'h10010000;
	
	always @(posedge clk) begin
		if (Write_Enable_i) begin
			ram[(Address_i - inst_range) >> 2] <= Write_Data_i;
		end	
	end
	
	assign Instruction_o = ram[(Address_i - inst_range) >> 2];

endmodule 