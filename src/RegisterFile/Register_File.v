module Register_File
#(
	parameter N = 32
)(
	input 		clk,
	input 		reset,
	input 		Reg_Write_i,
	input  [4:0] Write_Register_i,
	input  [4:0] Read_Register_1_i,
	input  [4:0] Read_Register_2_i,
	input  [N-1:0] Write_Data_i,
	
	output [N-1:0] Read_Data_1_o,
	output [N-1:0] Read_Data_2_o
);
	wire [31:0] enc;
	wire [31:0] q0,  q1,  q2,  q3,  q4,  q5,  q6,  q7, 
					q8,  q9,  q10, q11, q12, q13, q14, q15, 
				   q16, q17, q18, q19, q20, q21, q22, q23, 
				   q24, q25, q26, q27, q28, q29, q30, q31;
	
	//Create encoder instance
	encoder_32 EN(.selector_i(Write_Register_i), .data_o(enc));

	//Create ff_d instances
	ff_d  S0(.d(Write_Data_i), .clk(clk), .rst(reset), .en(enc[0]&Reg_Write_i),  .q(q0));
	ff_d  S1(.d(Write_Data_i), .clk(clk), .rst(reset), .en(enc[1]&Reg_Write_i),  .q(q1));
	ff_d  S2(.d(Write_Data_i), .clk(clk), .rst(reset), .en(enc[2]&Reg_Write_i),  .q(q2));
	ff_d  S3(.d(Write_Data_i), .clk(clk), .rst(reset), .en(enc[3]&Reg_Write_i),  .q(q3));
	ff_d  S4(.d(Write_Data_i), .clk(clk), .rst(reset), .en(enc[4]&Reg_Write_i),  .q(q4));
	ff_d  S5(.d(Write_Data_i), .clk(clk), .rst(reset), .en(enc[5]&Reg_Write_i),  .q(q5));
	ff_d  S6(.d(Write_Data_i), .clk(clk), .rst(reset), .en(enc[6]&Reg_Write_i),  .q(q6));
	ff_d  S7(.d(Write_Data_i), .clk(clk), .rst(reset), .en(enc[7]&Reg_Write_i),  .q(q7));
	ff_d  S8(.d(Write_Data_i), .clk(clk), .rst(reset), .en(enc[8]&Reg_Write_i),  .q(q8));
	ff_d  S9(.d(Write_Data_i), .clk(clk), .rst(reset), .en(enc[9]&Reg_Write_i),  .q(q9));
	ff_d S10(.d(Write_Data_i), .clk(clk), .rst(reset), .en(enc[10]&Reg_Write_i), .q(q10));
	ff_d S11(.d(Write_Data_i), .clk(clk), .rst(reset), .en(enc[11]&Reg_Write_i), .q(q11));
	ff_d S12(.d(Write_Data_i), .clk(clk), .rst(reset), .en(enc[12]&Reg_Write_i), .q(q12));
	ff_d S13(.d(Write_Data_i), .clk(clk), .rst(reset), .en(enc[13]&Reg_Write_i), .q(q13));
	ff_d S14(.d(Write_Data_i), .clk(clk), .rst(reset), .en(enc[14]&Reg_Write_i), .q(q14));
	ff_d S15(.d(Write_Data_i), .clk(clk), .rst(reset), .en(enc[15]&Reg_Write_i), .q(q15));
	ff_d S16(.d(Write_Data_i), .clk(clk), .rst(reset), .en(enc[16]&Reg_Write_i), .q(q16));
	ff_d S17(.d(Write_Data_i), .clk(clk), .rst(reset), .en(enc[17]&Reg_Write_i), .q(q17));
	ff_d S18(.d(Write_Data_i), .clk(clk), .rst(reset), .en(enc[18]&Reg_Write_i), .q(q18));
	ff_d S19(.d(Write_Data_i), .clk(clk), .rst(reset), .en(enc[19]&Reg_Write_i), .q(q19));
	ff_d S20(.d(Write_Data_i), .clk(clk), .rst(reset), .en(enc[20]&Reg_Write_i), .q(q20));
	ff_d S21(.d(Write_Data_i), .clk(clk), .rst(reset), .en(enc[21]&Reg_Write_i), .q(q21));
	ff_d S22(.d(Write_Data_i), .clk(clk), .rst(reset), .en(enc[22]&Reg_Write_i), .q(q22));
	ff_d S23(.d(Write_Data_i), .clk(clk), .rst(reset), .en(enc[23]&Reg_Write_i), .q(q23));
	ff_d S24(.d(Write_Data_i), .clk(clk), .rst(reset), .en(enc[24]&Reg_Write_i), .q(q24));
	ff_d S25(.d(Write_Data_i), .clk(clk), .rst(reset), .en(enc[25]&Reg_Write_i), .q(q25));
	ff_d S26(.d(Write_Data_i), .clk(clk), .rst(reset), .en(enc[26]&Reg_Write_i), .q(q26));
	ff_d S27(.d(Write_Data_i), .clk(clk), .rst(reset), .en(enc[27]&Reg_Write_i), .q(q27));
	ff_d S28(.d(Write_Data_i), .clk(clk), .rst(reset), .en(enc[28]&Reg_Write_i), .q(q28));
	ff_d S29(.d(Write_Data_i), .clk(clk), .rst(reset), .en(enc[29]&Reg_Write_i), .q(q29));
	ff_d S30(.d(Write_Data_i), .clk(clk), .rst(reset), .en(enc[30]&Reg_Write_i), .q(q30));
	ff_d S31(.d(Write_Data_i), .clk(clk), .rst(reset), .en(enc[31]&Reg_Write_i), .q(q31));
	
	//Mux instance for Read Data 1
	mux4to1 RD1(
		.in0(q0),   .in1(q1),   .in2(q2),   .in3(q3),   .in4(q4),   .in5(q5),   .in6(q6),   .in7(q7), 
		.in8(q8),   .in9(q9),   .in10(q10), .in11(q11), .in12(q12), .in13(q13), .in14(q14), .in15(q15), 
		.in16(q16), .in17(q17), .in18(q18), .in19(q19), .in20(q20), .in21(q21), .in22(q22), .in23(q23), 
		.in24(q24), .in25(q25), .in26(q26), .in27(q27), .in28(q28), .in29(q29), .in30(q30), .in31(q31),
		.selector_i(Read_Register_1_i),
		.data_o(Read_Data_1_o)
	);
	
	mux4to1 RD2(
		.in0(q0),   .in1(q1),   .in2(q2),   .in3(q3),   .in4(q4),   .in5(q5),   .in6(q6),   .in7(q7), 
		.in8(q8),   .in9(q9),   .in10(q10), .in11(q11), .in12(q12), .in13(q13), .in14(q14), .in15(q15), 
		.in16(q16), .in17(q17), .in18(q18), .in19(q19), .in20(q20), .in21(q21), .in22(q22), .in23(q23), 
		.in24(q24), .in25(q25), .in26(q26), .in27(q27), .in28(q28), .in29(q29), .in30(q30), .in31(q31),
		.selector_i(Read_Register_2_i),
		.data_o(Read_Data_2_o)
	);
	
endmodule
