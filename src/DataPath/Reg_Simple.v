module Reg_Simple(
    input clk,
    input [31:0] data_i,
    output reg [31:0] data_o
);

    always @(posedge clk) begin 
        data_o <= data_i;
    end

endmodule 