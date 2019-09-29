`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2018 02:43:24 PM
// Design Name: 
// Module Name: registers
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


module registers(clk, wrt, rs, rt, rd, dataIn, rsOut, rtOut);
    //create 64 registers of size 32 bits
    reg [31:0] regs [63:0];
    
    //initialize variables
    input clk;
    input wrt;
    input[5:0] rs;
    input[5:0] rt;
    input[5:0] rd;
    input[31:0] dataIn;
    output reg [31:0] rsOut;
    output reg [31:0] rtOut;
    
    //at every positive edge of clock, output the value of the addresses passed as input (rs, rt)
    //if the write flag is 1, the data passed as input is stored in the address of rd
    always@(posedge clk)
    begin
        rsOut = regs[rs];
        rtOut = regs[rt];
        if(wrt==1'b1)
            regs[rd]= dataIn;
    end
    
endmodule