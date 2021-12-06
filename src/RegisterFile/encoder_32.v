module encoder_32(
	input  [4:0] selector_i, 
	output reg[31:0] data_o
);
	always @(selector_i) begin
		case (selector_i)
			 5'b00000: begin
            data_o[0] = 1'b1;
         end
			5'b00001: begin
            data_o[1] = 1'b1;
         end
			5'b00010: begin
            data_o[2] = 1'b1;
         end
			5'b00011: begin
            data_o[3] = 1'b1;
         end
			5'b00100: begin
            data_o[4] = 1'b1;
         end
			5'b00101: begin
            data_o[5] = 1'b1;
         end
			5'b00110: begin
            data_o[6] = 1'b1;
         end
			5'b00111: begin
            data_o[7] = 1'b1;
         end
			5'b01000: begin
            data_o[8] = 1'b1;
         end
			5'b01001: begin
            data_o[9] = 1'b1;
         end
			5'b01010: begin
            data_o[10] = 1'b1;
         end
			5'b01011: begin
            data_o[11] = 1'b1;
         end
			5'b01100: begin
            data_o[12] = 1'b1;
         end
			5'b01101: begin
            data_o[13] = 1'b1;
         end
			5'b01110: begin
            data_o[14] = 1'b1;
         end
			5'b01111: begin
            data_o[15] = 1'b1;
         end
			5'b10000: begin
            data_o[16] = 1'b1;
         end
			5'b10001: begin
            data_o[17] = 1'b1;
         end
			5'b10010: begin
            data_o[18] = 1'b1;
         end
			5'b10011: begin
            data_o[19] = 1'b1;
         end
			5'b10100: begin
            data_o[20] = 1'b1;
         end
			5'b10101: begin
            data_o[21] = 1'b1;
         end
			5'b10110: begin
            data_o[22] = 1'b1;
         end
			5'b10111: begin
            data_o[23] = 1'b1;
         end
			5'b11000: begin
            data_o[24] = 1'b1;
         end
			5'b11001: begin
            data_o[25] = 1'b1;
         end
			5'b11010: begin
            data_o[26] = 1'b1;
         end
			5'b11011: begin
            data_o[27] = 1'b1;
         end
			5'b11100: begin
            data_o[28] = 1'b1;
         end
			5'b11101: begin
            data_o[29] = 1'b1;
         end
			5'b11110: begin
            data_o[30] = 1'b1;
         end
			5'b11111: begin
            data_o[31] = 1'b1;
         end
		endcase
	end
endmodule 