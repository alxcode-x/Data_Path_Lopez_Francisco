module Memory_MUX 
#(
	parameter DATA_WIDTH = 32)
(
	input [1:0] Address_i,
	input  [DATA_WIDTH-1:0] Ram_i, Rom_i,
	output reg [DATA_WIDTH-1:0] Instruction_o
);
	
	always @(*) begin
		case(Address_i)
			Instruction_o = (Address_i > 32'h10000000) ? Ram_i : Rom_i;
		endcase
	end
	
endmodule 