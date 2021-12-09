module Data_Path_TB();
	parameter MEMORY_DEPTH 	= 64;
	parameter DATA_WIDTH 	= 32;
	localparam Instruction_Range_i = 32'h400000;

    // Inputs
    reg clk = 0;
    reg reset = 0;
    //Output
    wire [7:0] GPIO_o;

    /********* Control Signals *********/
    reg PCWrite;
    reg IorD;
    reg MemWrite;
    reg IRWrite;
    reg RegDst;
    reg MemtoReg;
    reg RegWrite;
    reg ALUSrcA;
    reg [1:0] ALUSrcB;
    reg [3:0] ALUControl;
    reg PCSrc;
    wire [5:0] OP;
    wire [5:0] Funct;
    wire [31:0] Result_tb;
    /************************************/
	
//======================= DataPath Instance======================
    Data_Path #(
        .MEMORY_DEPTH(MEMORY_DEPTH),
        .DATA_WIDTH(DATA_WIDTH),
        .Instruction_Range_i(Instruction_Range_i)
    )
    DP(
	.initial_address(Instruction_Range_i),
        .clk(clk),
        .reset(reset),
        .GPIO_o(GPIO_o),
        .PCWrite(PCWrite),
        .IorD(IorD),
        .MemWrite(MemWrite),
        .IRWrite(IRWrite),
        .RegDst(RegDst),
	.MemtoReg(MemtoReg),
        .RegWrite(RegWrite),
        .ALUSrcA(ALUSrcA),
        .ALUSrcB(ALUSrcB),
        .ALUControl(ALUControl),
        .PCSrc(PCSrc),
        .OP(OP),
        .Funct(Funct),
        .Result_o(Result_tb)
    );

    //============ Task to show result =================
    task Result();
        $display ($time, "ALU_Result: %h", Result_tb);
    endtask

    //=== Tasks for fetch cycle of  each isntruction ===
    task FetchCycle(input [3:0] operation, input [1:0] operator, input intruction_type);
     begin
    //****** Fetch ************
        PCWrite = 1;
        IorD = 0;
        MemWrite = 0;
        IRWrite = 1;
        RegWrite = 0;
        ALUSrcA = 0;
        ALUSrcB = 2'b01;
        ALUControl = 4'b0100; //{OP, Funct};
        PCSrc = 0;
    //****** Decode ************
       //PCWrite = 0;
       // IRWrite = 0;
    //****** Execution *********
        ALUSrcA = 1;
        ALUSrcB = operator;
        ALUControl = operation; // SUM
    //*** Write Background ****
        RegDst = intruction_type;
        MemtoReg = 0;
        RegWrite = 1;
    //****** LOAD *************
        IorD = 1;
        MemtoReg = 1;

        Result();
     end
    endtask

    //============ Clock generator =====================
    initial begin
	forever #1 clk = !clk;
    end
	 
    //============ Test cases ==========================

    initial begin	
        #0  FetchCycle(4'b0100, 2'b10, 0);
        #10 FetchCycle(4'b0100, 2'b10, 0);
        #10 FetchCycle(4'b0100, 2'b10, 0);
        #10 FetchCycle(4'b0100, 2'b00, 1);
        #10 FetchCycle(4'b0100, 2'b00, 1);
        #10 FetchCycle(4'b0100, 2'b00, 1);
    end
	
endmodule 