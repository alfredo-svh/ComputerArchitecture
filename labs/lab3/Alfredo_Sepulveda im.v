`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2018 02:43:24 PM
// Design Name: 
// Module Name: im
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


module im(clk, addr, IOut);
    //create the array of instructions (size 256, each of 32 bits)
    wire [31:0] inst[255:0];
    
    //initialize variables
    input clk;
    input [7:0] addr;
    output reg [31:0] IOut;
    
    //set instruction #75 to 3000
    assign inst[75] = 32'd3000;
    
    //output the instruction saved at the address taken as input at every positive edge of clock
    always@(posedge clk)
    begin
        IOut = inst[addr];
    end

endmodule