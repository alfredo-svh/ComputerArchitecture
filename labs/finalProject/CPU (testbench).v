module CPU;

    reg clk;
    wire [31:0] mux_PC;
    wire [31:0] pcPlus1;
    wire [31:0] aluResWBIF;
    wire [31:0] DMemOutWBIF;
    wire jumpMem;
    wire orOut;
    wire [31:0] PCIM;
    wire [31:0] IMBuff;
    wire [31:0] BuffAdder;
    wire [31:0] instr;
    wire RegWrt1;
    wire MemtoReg1;
    wire savePC1;
    wire branchNeg1;
    wire branchZero1;
    wire jump1;
    wire jumpMemFlag1;
    wire [3:0] ALUOp1;
    wire MemRead1;
    wire MemWrt1;
    wire RegWrt2;
    wire MemtoReg2;
    wire savePC2;
    wire branchNeg2;
    wire branchZero2;
    wire jump2;
    wire jumpMemFlag2;
    wire [3:0] ALUOp2;
    wire MemRead2;
    wire MemWrt2;
    wire RegWrt3;
    wire MemtoReg3;
    wire savePC3;
    wire branchNeg3;
    wire branchZero3;
    wire jump3;
    wire [5:0] rd1;   // from IDEX -> EXWB
    wire [5:0] rd2;   // from EXWB -> reg. file
    wire [31:0] wrtRegData;
    wire [31:0] rsData1;   //reg file -> IDEX
    wire [31:0] rtData1;   //reg file -> IDEX
    wire [31:0] rsData2;   //IDEX -> ALU
    wire [31:0] rtData2;   //IDEX -> ALU
    wire [31:0] SEtoAdder;
    wire [31:0] newPC1;     //Adder -> IDEX
    wire [31:0] newPC2;     //IDEX -> EXWB
    wire [31:0] newPC3;     //EXWB -> mux
    wire [31:0] dMemOut;
    wire Z1;
    wire N1;
    wire Z2;
    wire N2;
    wire [31:0] ALURes;
    wire negAndRes;
    wire zeroAndRes;
    
    
    
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    begin
    
        pc ProgCount(clk, mux_PC, PCIM);
        initial begin
        end
        
        mux muxPC(pcPlus1, aluResWBIF, DMemOutWBIF, DMemOutWBIF, orOut, jumpMem, mux_PC);
        initial begin
        end
        
        im InstrMem(clk, PCIM, IMBuff);
        initial begin
        end
        
        adder addPC(32'd1, PCIM, pcPlus1);
        initial begin
        end
        
        IFIDBuffer IFIDBuff(clk, IMBuff, PCIM, instr , BuffAdder);
        initial begin
        end
        
        control cntrl(instr[31:28],RegWrt1, MemtoReg1, savePC1, ALUOp1, MemRead1, MemWrt1, branchNeg1, branchZero1, jump1, jumpMemFlag1);
        initial begin
        end
        
        registers regFile(clk, RegWrt3,instr[21:16], instr[15:10], rd2,wrtRegData,rsData1, rtData1);
        initial begin
        end
        
        signExtend SE(instr[21:10], SEtoAdder);
        initial begin
        end
        
        adder addSE(SEtoAdder, BuffAdder, newPC1);
        initial begin
        end
        
        IDEXBuffer IDEXBuff(clk, RegWrt1, MemtoReg1, savePC1, branchNeg1, branchZero1, jump1, jumpMemFlag1, ALUOp1, MemRead1, MemWrt1, rsData1, rtData1, instr[27:22], newPC1, RegWrt2, MemtoReg2, savePC2, branchNeg2, branchZero2, jump2, jumpMemFlag2, ALUOp2, MemRead2, MemWrt2, rsData2, rtData2, rd1, newPC2);
        initial begin
        end
        
        dataMem DM(clk, MemRead2, MemWrt2, rtData2, rsData2, dMemOut);
        initial begin
        end
        
        alu aluEx(ALUOp2, rtData2,rsData2, Z1, N1, ALURes);
        initial begin
        end
        
        EXWBBuffer EXWBBuff(clk, N1, Z1, RegWrt2, MemtoReg2, savePC2, branchNeg2, branchZero2, jump2, jumpMemFlag2, ALURes, dMemOut, rd1, newPC2, N2, Z2, RegWrt3, MemtoReg3, savePC3, branchNeg3, branchZero3, jump3, jumpMem, aluResWBIF, DMemOutWBIF, rd2, newPC3);
        initial begin
        end
        
        mux muxWB(aluResWBIF, DMemOutWBIF, newPC3, newPC3, MemtoReg3, savePC3, wrtRegData);
        initial begin
        end
        
        and2 andNeg(N2, branchNeg3, negAndRes);
        initial begin
        end
        
        and2 andZero(Z2, branchZero3, zeroAndRes);
        initial begin
        end
        
        or3 orJump(negAndRes, zeroAndRes, jump3, orOut);
        initial begin
        end
        
    end    
endmodule