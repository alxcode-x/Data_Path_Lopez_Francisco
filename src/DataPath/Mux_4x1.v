module Mux_4x1(
    input  [1:0]  selector,
    input  [31:0] in_0, in_1, in_2, in_3,
    output reg [31:0] data_out
);

    always @(*) begin
        case (selector)
            2'b00: begin data_out = in_0; end
            2'b01: begin data_out = in_1; end
            2'b10: begin data_out = in_2; end
            2'b11: begin data_out = in_3; end
        endcase
    end

endmodule 