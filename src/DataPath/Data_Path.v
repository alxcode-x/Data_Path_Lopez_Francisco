module Data_Path
#(	
	parameter MEMORY_DEPTH 	= 64,
	parameter DATA_WIDTH 	= 32
)(
    // Inputs
    input clk,
    input reset,
    //Output
    output [7:0] GPIO_o,

    /********* Control Signals *********/
    input initial_sel,
    input       PCWrite,
                IorD,
                MemWrite,
                IRWrite,
                RegDst,
                MemtoReg,
                RegWrite,
                PCSrc,
                ALUSrcA,
    input [1:0] ALUSrcB,
    input [3:0] ALUControl,
    
    output [5:0] OP,
    output [5:0] Funct, 
    output [31:0] Result_o
);
    wire [31:0] PC_i_w, PC_o_w, ALU_PC_w;
    wire [31:0] Adr_w;
    wire [31:0] SrcA_w, SrcB_w;
    wire [31:0] ALUResult_w, ALUOut_w;
    wire [31:0] RD_w, RD_1_w, RD_2_w;
    wire [31:0] A_w, B_w;
    wire [31:0] Instr_w, Data_w;
    wire [4:0]  A1_w, A2_w, A3_w;
    wire [31:0] WD3_w;
    wire [31:0] RD1_w, RD2_w;
    wire [31:0] A_w, B_w;
    wire [31:0] SignImm_w;
    wire [31:0] LS_w;
    wire [5:0] OP_w, Funct_w;

    assign OP = OP_w;
    assign Funct = Funct_w;
    assign Result_o = ALUOut_w;
    

    //PC - Register
    Reg_PC PROGRAM_COUNTER(
        .clk(clk), 
        .enable(PCWrite),
        .reset(reset), 
        .data_i(ALU_PC_w), 
        .data_o(PC_o_w)
    );

    //Adr - Mux
    Mux_2x1 Adr(
        .selector(IorD), 
        .in_0(PC_o_w), 
        .in_1(ALUOut_w), 
        .data_out(Adr_w)
    );

    //Memory System
    Memory_System #(
        .MEMORY_DEPTH(MEMORY_DEPTH),
        .DATA_WIDTH(DATA_WIDTH))
    MEMORY(
        .clk(clk),
        .Write_Enable_i(MemWrite),
        .Write_Data_i(B_W),
        .Address_i(Adr_w),
        .Instruction_o(RD_w) //output
    );

    //Instr - Register
    Reg_Enable Instr(
        .clk(clk), 
        .enable(IRWrite), 
        .reset(reset),
        .data_i(RD_w), 
        .data_o(Instr_w)
    );

    //Data - Register
    Reg_Simple Data(
        .clk(clk), 
        .reset(reset),
        .data_i(RD_w), 
        .data_o(Data_w)
    );

    //RF input: A3 - Mux 
    Mux_2x1 A3(
        .selector(RegDst), 
        .in_0(Instr_w[20:16]), 
        .in_1(Instr_w[15:11]), 
        .data_out(A3_w)
    );

    //RF input: WD3 - Mux
    Mux_2x1 WD3(
        .selector(MemtoReg), 
        .in_0(ALUOut_w), 
        .in_1(Data_w), 
        .data_out(WD3_w)
    );

    //Register File
    Register_File #(
        .N(DATA_WIDTH)
    )REGISTER_File(
        .clk(clk),
        .reset(reset),
        .Reg_Write_i(RegWrite),
        .Write_Register_i(A3_w),
        .Read_Register_1_i(Instr_w[25:21]),
        .Read_Register_2_i(Instr_w[20:16]),
        .Write_Data_i(WD3_w),
        .Read_Data_1_o(RD1_w),
        .Read_Data_2_o(RD2_w)
    );

    //Post Register File - Register
    Reg_D PostRF(
        .clk(clk), 
        .reset(reset),
        .data_A_i(RD1_w), 
        .data_B_i(RD2_w), 
        .data_A_o(A_w), 
        .data_B_o(B_w)
    );

    //Sign Extend
    Sign_Extend SignImm(
        .data_i(Instr_w[15:0]), 
        .data_o(SignImm_w)
    );

    //<<2
    Left_Shift LS(
        .data_i(SignImm_w), 
        .data_o(LS_w)
    );

    //SrcA - Mux
    Mux_2x1 SrcA(
        .selector(ALUSrcA),
        .in_0(PC_o_w), 
        .in_1(A_w), 
        .data_out(SrcA_w)
    );

    //SrcB - Mux_4x1
    Mux_4x1 SrcB(
        .selector(ALUSrcB),
        .in_0(B_w),
        .in_1(4),
        .in_2(SignImm_w),
        .in_3(LS_w),
        .data_out(SrcB_w)
    );

    //ALU
    ALU ALUIF(
        .selector(ALUControl), 
        .a(SrcA_w), 
        .b(SrcB_w), 
        .y(ALUResult_w)
    );

    //ALUOut - Register
    Reg_Simple ALUOut(
        .clk(clk),
        .reset(reset),
        .data_i(ALUResult_w),
        .data_o(ALUOut_w)
    );

    //ALU out, PC in - Mux
    Mux_2x1 ALU_PC(
        .selector(PCSrc),
        .in_0(ALUResult_w),
        .in_1(ALUOut_w),
        .data_out(ALU_PC_w)
    );

endmodule 