module ff_d(input [31:0] d, input clk, rst, en, output reg [31:0] q);
	
	always @ (posedge clk or negedge rst) begin
		if (!rst) begin
			q <= 0;
		end
		else begin
			if (en) begin
				q <= d;
			end
		end
	end
	
endmodule 