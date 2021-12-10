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
    reg initial_sel;
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
	.initial_sel(initial_sel),
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
    task Fetch(input initial_sel_tb);
     begin
	initial_sel = initial_sel_tb;
        PCWrite = 1;
        IorD = 0;
        MemWrite = 0;
        IRWrite = 1;
        RegWrite = 0;
        ALUSrcA = 0;
        ALUSrcB = 2'b01;
        ALUControl = 4'b0100;
        PCSrc = 0;
        
     end
    endtask

    task Decode(input PCWrite_tb, IRWrite_tb);
	begin
       		PCWrite = PCWrite_tb;
       		IRWrite = IRWrite_tb;
	end
    endtask

    task Execution(input ALUSrcA_tb, input [1:0] ALUSrcB_tb, input [3:0] ALUControl_tb);
	begin
		ALUSrcA = ALUSrcA_tb;
		ALUSrcB = ALUSrcB_tb;
	        ALUControl = ALUControl_tb;
	end
    endtask

    task WriteBack(input RegDst_tb, Memtoreg_tb, RegWrite_tb);
	begin
       	 	RegDst = RegDst_tb;
        	MemtoReg = Memtoreg_tb;
        	RegWrite = RegWrite_tb;
	end
    endtask

    task LOAD(input IorD_tb, MemtoReg_tb);
  	begin
		IorD = IorD_tb;
	        MemtoReg = MemtoReg_tb;
	end
    endtask

    //============ Clock generator =====================
    initial begin
	forever #1 clk = !clk;
    end
	 
    //============ Test cases ==========================

    initial begin	
        #0  Fetch(0);
	#10 Decode(0, 0);
	#10 Execution(0, 2'b10, 4'b0100);
	#10 WriteBack(0, 0, 1);
	#10 LOAD(1, 1);
	#10 Result();

	#10  Fetch(1);
	#10 Decode(0, 0);
	#10 Execution(0, 2'b10, 4'b0100);
	#10 WriteBack(0, 0, 1);
	#10 LOAD(1, 1);
	#10 Result();

	#10  Fetch(1);
	#10 Decode(0, 0);
	#10 Execution(0, 2'b10, 4'b0100);
	#10 WriteBack(0, 0, 1);
	#10 LOAD(1, 1);
	#10 Result();
	
	#10  Fetch(1);
	#10 Decode(0, 0);
	#10 Execution(0, 2'b00, 4'b0100);
	#10 WriteBack(0, 0, 1);
	#10 LOAD(1, 1);
	#10 Result();

	#10  Fetch(1);
	#10 Decode(0, 0);
	#10 Execution(0, 2'b00, 4'b0100);
	#10 WriteBack(0, 0, 1);
	#10 LOAD(1, 1);
	#10 Result();

	#10  Fetch(1);
	#10 Decode(0, 0);
	#10 Execution(0, 2'b00, 4'b0100);
	#10 WriteBack(0, 0, 1);
	#10 LOAD(1, 1);
	#10 Result();
    end
	
endmodule 