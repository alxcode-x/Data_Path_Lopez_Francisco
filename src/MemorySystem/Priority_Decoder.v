module Priority_Decoder
(
	input  [31:0] Instruction_Range_i, 
	output reg[1:0] Enable_o
);

	always @(Instruction_Range_i) begin
		case (Instruction_Range_i)
			 32'h400000: begin
            Enable_o[0] = 1'b1;
         end
			32'h10010000: begin
            Enable_o[1] = 1'b1;
         end
		endcase
	end
endmodule 