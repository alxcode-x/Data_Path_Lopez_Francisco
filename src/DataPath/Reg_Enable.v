//Reg with enable
module Reg_Enable(
    input clk, enable,
    input [31:0] data_i,
    output reg [31:0] data_o
);

    always @(posedge clk) begin 
        if (enable) data_o <= data_i;
    end

endmodule 