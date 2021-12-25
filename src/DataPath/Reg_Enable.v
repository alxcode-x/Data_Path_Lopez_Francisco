//Reg with enable
module Reg_Enable(
    input clk, enable, reset,
    input [31:0] data_i,
    output reg [31:0] data_o
);

    always @(posedge clk or negedge reset) begin 
        if(!reset) data_o <= 0;
        else
            if (enable) data_o <= data_i;
    end

endmodule 