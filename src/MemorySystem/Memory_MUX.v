module Memory_MUX 
#(
	parameter DATA_WIDTH = 32)
(
	input [31:0] Selector,
	input  [(DATA_WIDTH-1):0] Ram_i, Rom_i,
	output reg [(DATA_WIDTH-1):0] Instruction_o
);
	
	always @(*) begin
		//$display($time," MUX: ram=%h, rom=%h", Ram_i, Rom_i);
		case(Selector)
			32'h400000: begin
				Instruction_o = Rom_i;
				//$display($time," ROM: %h", Instruction_o);
			end
			32'h010010000: begin
				Instruction_o = Ram_i;
				//$display($time," RAM: %h", Instruction_o);
			end			
		endcase
	end
	
endmodule 