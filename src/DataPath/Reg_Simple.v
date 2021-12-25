module Reg_Simple(
    input clk, reset,
    input [31:0] data_i,
    output reg [31:0] data_o
);

    always @(posedge clk or negedge reset) begin 
        data_o <= (!reset) ? 0 : data_i;
    end

endmodule 