module Memory_System
#
(	
	parameter MEMORY_DEPTH 	= 64,
	parameter DATA_WIDTH 	= 32
)(
	//input [31:0] Instruction_Range_i,
	input clk,
	input Write_Enable_i,
	input [DATA_WIDTH-1:0] Write_Data_i,
	input [DATA_WIDTH-1:0] Address_i,
	
	output [DATA_WIDTH-1:0] Instruction_o
);
	//Wires to memories outputs
	wire [DATA_WIDTH-1:0] Instruction_o_ram; 
	wire [DATA_WIDTH-1:0] Instruction_o_rom;
	
	//===== ROM =================================
	Program_Memory #(
		.MEMORY_DEPTH(MEMORY_DEPTH),
		.DATA_WIDTH(DATA_WIDTH))
	ROM(
		.Address_i(Address_i),
		.Instruction_o(Instruction_o_rom));
	
	//===== RAM =================================	
	Data_Memory #(
		.MEMORY_DEPTH(MEMORY_DEPTH),
		.DATA_WIDTH(DATA_WIDTH))
	RAM
	(
		.clk(clk),
		.Write_Enable_i(Write_Enable_i),
		.Write_Data_i(Write_Data_i),
		.Address_i(Address_i),
		.Instruction_o(Instruction_o_ram));

	//==== MUX =================================
	Memory_MUX 
	#(
		.DATA_WIDTH(DATA_WIDTH))
	MUX(
		.Address_i(Address_i),
		.Ram_i(Instruction_o_ram), 
		.Rom_i(Instruction_o_rom),
		.Instruction_o(Instruction_o));		
			
endmodule 
