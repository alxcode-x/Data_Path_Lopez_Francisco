module Mux_2x1(
    input  selector,
    input  [31:0] in_0, 
    inout  [31:0] in_1,
    output [31:0] data_out
);

    assign data_out = (selector) ? in_1 : in_0;

endmodule 