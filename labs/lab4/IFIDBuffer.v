`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2018 02:32:54 PM
// Design Name: 
// Module Name: IFIDBuffer
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


module IFIDBuffer(clk, in1, in2, out1, out2);
    //initialize variables
    input clk;
    input [31:0] in1;
    input [7:0] in2;
    output reg [32:0] out1;
    output reg [7:0] out2;
    
    //on positive edge of clock, pass inputs directly into outputs
    always@(posedge clk)
    begin
        out1=in1;
        out2=in1;
    end

endmodule