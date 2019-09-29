module IDEXBuffer(clk, regWrtIn, memToRegIn, PCtoRegIn, branchNeg, branchZero, jump, jumpMem, ALUOpIn, MemReadIn, MemWrtIn, rsIn, rtIn, rdIn, sgnExtIn, regWrtOut, memToRegOut, PCtoRegOut, branchNegOut, branchZeroOut, jumpOut, jumpMemOut, ALUOpOut, MemReadOut, MemWrtOut, rsOut, rtOut, rdOut, sgnExtOut);
    input clk;
    input regWrtIn;
    input memToRegIn;
    input PCtoRegIn;
    input branchNeg;
    input branchZero;
    input jump;
    input jumpMem;
    input [3:0] ALUOpIn;
    input MemReadIn;
    input MemWrtIn;
    input [31:0] rsIn;
    input [31:0] rtIn;
    input [5:0] rdIn;
    input [31:0] sgnExtIn;
    output reg regWrtOut;
    output reg memToRegOut;
    output reg PCtoRegOut;
    output reg branchNegOut;
    output reg branchZeroOut;
    output reg jumpOut;
    output reg jumpMemOut;
    output reg [3:0] ALUOpOut;
    output reg MemReadOut;
    output reg MemWrtOut;
    output reg [31:0] rsOut;
    output reg [31:0] rtOut;
    output reg [5:0] rdOut;
    output reg [31:0] sgnExtOut;
    
    //on positive edge of clock, pass inputs directly into outputs
    always@(posedge clk)
    begin
        regWrtOut = regWrtIn;
        memToRegOut = memToRegIn;
        PCtoRegOut = PCtoRegIn;
        branchNegOut = branchNeg;
        branchZeroOut = branchZero;
        jumpOut = jump;
        jumpMemOut = jumpMem;
        ALUOpOut = ALUOpIn;
        MemReadOut = MemReadIn;
        MemWrtOut =MemWrtIn;
        rsOut = rsIn;
        rtOut = rtIn;
        rdOut = rdIn;
        sgnExtOut = sgnExtIn;
    end
endmodule