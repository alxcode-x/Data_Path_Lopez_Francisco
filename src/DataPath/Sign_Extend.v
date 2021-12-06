module Sign_Extend(
    input  [15:0] data_i,
    output [31:0] data_o
);
    localparam add_0 = 16'b0000000000000000;
    localparam add_1 = 16'b1111111111111111;

   assign data_o = (data_i[15]) ? {add_1,data_i} : {add_0,data_i};

endmodule 