`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2018 02:32:54 PM
// Design Name: 
// Module Name: IDEXBuffer
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module IDEXBuffer(clk, regWrtIn, memToRegIn, PCtoRegIn, manyIn, ALUOpIn, MemReadIn, MemWrtIn, rsIn, rtIn, rdIn, sgnExtIn, regWrtOut, memToRegOut, PCtoRegOut, manyOut, ALUOpOut, MemReadOut, MemWrtOut, rsOut, rtOut, rdOut, sgnExtOut);
    input clk;
    input regWrtIn;
    input memToRegIn;
    input PCtoRegIn;
    input [3:0] manyIn;
    input [1:0] ALUOpIn;
    input MemReadIn;
    input MemWrtIn;
    input [5:0] rsIn;
    input [5:0] rtIn;
    input [5:0] rdIn;
    input [31:0] sgnExtIn;
    output reg regWrtOut;
    output reg memToRegOut;
    output reg PCtoRegOut;
    output reg [3:0] manyOut;
    output reg [1:0] ALUOpOut;
    output reg MemReadOut;
    output reg MemWrtOut;
    output reg [5:0] rsOut;
    output reg [5:0] rtOut;
    output reg [5:0] rdOut;
    output reg [31:0] sgnExtOut;
    
    //on positive edge of clock, pass inputs directly into outputs
    always@(posedge clk)
    begin
        regWrtOut = regWrtIn;
        memToRegOut = memToRegIn;
        PCtoRegOut = PCtoRegIn;
        manyOut = manyIn;
        ALUOpOut = ALUOpIn;
        MemReadOut = MemReadIn;
        MemWrtOut =MemWrtIn;
        rsOut = rsIn;
        rtOut = rtIn;
        rdOut = rdIn;
        sgnExtOut = sgnExtIn;
    end
endmodule