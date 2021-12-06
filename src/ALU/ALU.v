module ALU (	 // ARITHMETIC UNIT
	input [3:0]  selector,
	input [31:0] a, b,
	output reg	[31:0] y
);

	always @ (*)
		begin
			y= 4'b0;
			case (selector)
			4'b0000: y = a;
			4'b0001: y = b;
			4'b0010: y = a + 1'b1;
			4'b0011: y = b + 1'b1;
			4'b0100: y = a + b;
			4'b0101: y = a + ~b;
			4'b0110: y = a + (~b) + 1'b1;
			4'b0111: y = a & b;
			4'b1001: y = a | b;
			4'b1010: y = a ^ b;
			4'b1011: y = ~a;
			4'b1100: y = ~b;
			4'b1101: y = a << 1;
			4'b1110: y = a >> 1;
			4'b1111: y = 0;
			default: y = 4'b0;
		endcase
	end
endmodule
