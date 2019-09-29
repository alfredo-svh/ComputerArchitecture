module EXWBBuffer(clk, SIn, zIn, regWrtIn, memToRegIn, PCtoRegIn, manyIn0, manyIn1, manyIn2, manyIn3, ALUIn, DMEMIn, rdIn, adderIn, SOut, zOut, regWrtOut, memToRegOut, PCtoRegOut, brNeg, brZero, jump, jumpMem, ALUOut, DMEMOut, rdOut, adderOut);

    //initialize variables
    input clk;
    input SIn;
    input zIn;
    input regWrtIn;
    input memToRegIn;
    input PCtoRegIn;
    input manyIn0;
    input manyIn1;
    input manyIn2;
    input manyIn3;
    input [31:0] ALUIn;
    input [31:0] DMEMIn;
    input [5:0] rdIn;
    input [31:0] adderIn;
    
    output reg SOut;
    output reg zOut;
    output reg regWrtOut;
    output reg memToRegOut;
    output reg PCtoRegOut;
    output reg brNeg;
    output reg brZero;
    output reg jump;
    output reg jumpMem;
    output reg [31:0] ALUOut;
    output reg [31:0] DMEMOut;
    output reg [31:0] adderOut;
    output reg [5:0] rdOut;
    
    //on positive edge of clock, passes inputs directly to outputs
    always@(posedge clk)
    begin
        SOut = SIn;
        zOut = zIn;
        regWrtOut = regWrtIn;
        memToRegOut = memToRegIn;
        PCtoRegOut = PCtoRegIn;
        brNeg = manyIn0;
        brZero = manyIn1;
        jump = manyIn2;
        jumpMem = manyIn3;
        ALUOut = ALUIn;
        DMEMOut = DMEMIn;
        adderOut = adderIn;
        rdOut = rdIn;
    end


endmodule