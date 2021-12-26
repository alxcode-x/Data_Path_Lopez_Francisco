module Reg_D(
    input clk, reset,
    input  [31:0] data_A_i, data_B_i,
    output [31:0] data_A_o, data_B_o
);

    Reg_Simple A(.clk(clk), .reset(reset), .data_i(data_A_i), .data_o(data_A_o));
    Reg_Simple B(.clk(clk), .reset(reset), .data_i(data_B_i), .data_o(data_B_o));

endmodule 