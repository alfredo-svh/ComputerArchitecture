module control(InstOP, RegWrt, MemToReg, SavePC, ALUOp, MemRead, MemWrt, BranchNeg, BranchZero, Jump, JumpMem);
    input [3:0] InstOP;
    output reg RegWrt;
    output reg MemToReg;
    output reg SavePC;
    output reg [3:0] ALUOp;
    output reg MemRead;
    output reg MemWrt;
    output reg BranchNeg;
    output reg BranchZero;
    output reg Jump;
    output reg JumpMem;


    always@(InstOP)
    begin
      //NOP
      if (InstOP == 4'b0000)  begin
        RegWrt=0;
        MemToReg=0;
        SavePC=0;
        ALUOp=4'b0000;
        MemRead=0;
        MemWrt=0;
        BranchNeg=0;
        BranchZero=0;
        Jump=0;
        JumpMem=0;
      end

      //SavePC
      if (InstOP == 4'b1111)  begin
        RegWrt=1;
        MemToReg=0;
        SavePC=1;
        ALUOp=4'b0000;
        MemRead=0;
        MemWrt=0;
        BranchNeg=0;
        BranchZero=0;
        Jump=0;
        JumpMem=0;
      end

      //Load
      if(InstOP == 4'b1110)  begin
        RegWrt=1;
        MemToReg=1;
        SavePC=0;
        ALUOp=4'b0000;
        MemRead=1;
        MemWrt=0;
        BranchNeg=0;
        BranchZero=0;
        Jump=0;
        JumpMem=0;
      end

      //Store
      if (InstOP == 4'b0011)  begin
        RegWrt=0;
        MemToReg=0;
        SavePC=0;
        ALUOp=4'b0000;
        MemRead=0;
        MemWrt=1;
        BranchNeg=0;
        BranchZero=0;
        Jump=0;
        JumpMem=0;
      end

      //Add
      if(InstOP == 4'b0100)  begin
        RegWrt=1;
        MemToReg=0;
        SavePC=0;
        ALUOp=4'b1000;
        MemRead=0;
        MemWrt=0;
        BranchNeg=0;
        BranchZero=0;
        Jump=0;
        JumpMem=0;
      end

      //Increment
      if (InstOP == 4'b0101)  begin
	RegWrt=1;
	MemToReg=0;
	SavePC=0;
	ALUOp=4'b0100;
	MemRead=0;
	MemWrt=0;
	BranchNeg=0;
	BranchZero=0;
	Jump=0;
	JumpMem=0;
      end

      //Negate
      if (InstOP == 4'b0110)  begin
        RegWrt=1;
        MemToReg=0;
        SavePC=0;
        ALUOp=4'b0010;
        MemRead=0;
        MemWrt=0;
        BranchNeg=0;
        BranchZero=0;
        Jump=0;
        JumpMem=0;
      end

      //Subtract
      if (InstOP == 4'b0111)  begin
        RegWrt=1;
        MemToReg=0;
        SavePC=0;
        ALUOp=4'b0001;
        MemRead=0;
        MemWrt=0;
        BranchNeg=0;
        BranchZero=0;
        Jump=0;
        JumpMem=0;
      end

      //Jump
      if (InstOP == 4'b1000)  begin
        RegWrt=0;
        MemToReg=0;
        SavePC=0;
        ALUOp=4'b1111;
        MemRead=0;
        MemWrt=0;
        BranchNeg=0;
        BranchZero=0;
        Jump=1;
        JumpMem=0;
      end

      //Branch if zero
      if (InstOP == 4'b1001)  begin
        RegWrt=0;
        MemToReg=0;
        SavePC=0;
        ALUOp=4'b1111;
        MemRead=0;
        MemWrt=0;
        BranchNeg=0;
        BranchZero=1;
        Jump=0;
        JumpMem=0;
      end

      //Jump memory
      if (InstOP == 4'b1010)  begin
        RegWrt=0;
        MemToReg=0;
        SavePC=0;
        ALUOp=4'b0000;
        MemRead=0;
        MemWrt=0;
        BranchNeg=0;
        BranchZero=0;
        Jump=0;
        JumpMem=1;
      end

      //Branch if negative
      if (InstOP == 4'b1011)  begin
        RegWrt=0;
        MemToReg=0;
        SavePC=0;
        ALUOp=4'b1111;
        MemRead=0;
        MemWrt=0;
        BranchNeg=1;
        BranchZero=0;
        Jump=0;
        JumpMem=0;
      end




    end

endmodule