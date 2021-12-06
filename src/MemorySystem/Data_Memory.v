module Data_Memory
#
(	
	parameter MEMORY_DEPTH 	= 64,
	parameter DATA_WIDTH 	= 32
)(
	input clk,
	input Write_Enable_i,
	input [(DATA_WIDTH-1):0] Write_Data_i,
	input [(DATA_WIDTH-1):0] Address_i,
	
	output [(DATA_WIDTH-1):0]	Instruction_o
);
	reg [(DATA_WIDTH-1):0] read_address;
	reg [(DATA_WIDTH-1):0] ram [(MEMORY_DEPTH-1):0];
	
	always @(posedge clk) begin
		if (Write_Enable_i) begin
			ram[Address_i] <= Write_Data_i;
			read_address <= Address_i;
		end	
	end
	
	assign Instruction_o = ram[read_address];

endmodule 