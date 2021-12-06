module mux4to1(
	input [31:0]  in0,  in1,  in2,  in3,  in4,  in5,  in6,  in7, 
					  in8,  in9,  in10, in11, in12, in13, in14, in15, 
					  in16, in17, in18, in19, in20, in21, in22, in23, 
					  in24, in25, in26, in27, in28, in29, in30, in31,
	input  [4:0]  selector_i,
	output reg [31:0] data_o
);

   always @ (*) begin
      case(selector_i)
         5'b00000: begin
            data_o = in0;
         end
			5'b00001: begin
            data_o = in1;
         end
			5'b00010: begin
            data_o = in2;
         end
			5'b00011: begin
            data_o = in3;
         end
			5'b00100: begin
            data_o = in4;
         end
			5'b00101: begin
            data_o = in5;
         end
			5'b00110: begin
            data_o = in6;
         end
			5'b00111: begin
            data_o = in7;
         end
			5'b01000: begin
            data_o = in8;
         end
			5'b01001: begin
            data_o = in9;
         end
			5'b01010: begin
            data_o = in10;
         end
			5'b01011: begin
            data_o = in11;
         end
			5'b01100: begin
            data_o = in12;
         end
			5'b01101: begin
            data_o = in13;
         end
			5'b01110: begin
            data_o = in14;
         end
			5'b01111: begin
            data_o = in15;
         end
			5'b10000: begin
            data_o = in16;
         end
			5'b10001: begin
            data_o = in17;
         end
			5'b10010: begin
            data_o = in18;
         end
			5'b10011: begin
            data_o = in19;
         end
			5'b10100: begin
            data_o = in20;
         end
			5'b10101: begin
            data_o = in21;
         end
			5'b10110: begin
            data_o = in22;
         end
			5'b10111: begin
            data_o = in23;
         end
			5'b11000: begin
            data_o = in24;
         end
			5'b11001: begin
            data_o = in25;
         end
			5'b11010: begin
            data_o = in26;
         end
			5'b11011: begin
            data_o = in27;
         end
			5'b11100: begin
            data_o = in28;
         end
			5'b11101: begin
            data_o = in29;
         end
			5'b11110: begin
            data_o = in30;
         end
			5'b11111: begin
            data_o = in31;
         end
       endcase
   end
endmodule 