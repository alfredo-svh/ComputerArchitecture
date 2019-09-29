`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2018 03:12:02 PM
// Design Name: 
// Module Name: bufferTest
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


module bufferTest;
    //initializing inputs for testbench:
    //we have the clock that goes to all buffers and assume
    //a single wire between buffers.
    reg clk;
    reg [31:0] start;
    wire [31:0] ID;
    wire [31:0] EX;
    wire [31:0] WB;
    
    //clock cycles
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    
    begin
        //first buffer. We set the staring values here, which are taken as input
        //and then passed as output
        IFIDBuffer IFIDBufferTest(clk, start, start, ID, ID);
        initial begin
            start = 32'd5;
            #100;
            start = 32'd4;
            #100;
        end
        
        //second buffer. Takes the output of the first buffer and passes it as output
        IDEXBuffer IDEXBufferTest(clk, ID, ID, ID, ID, ID, ID, ID, ID, ID, ID, ID, EX, EX, EX, EX, EX, EX, EX, EX, EX, EX, EX);
        initial begin
        end
        
        //third buffer. Takes the output of the second buffer and passes it as output
        EXWBBuffer EXWBBufferTest(clk, EX, EX, EX, EX, EX, EX, EX, EX, EX, EX, EX, EX, EX, WB, WB, WB, WB, WB, WB, WB, WB, WB, WB, WB, WB, WB);
        initial begin
        end
        
        
    end
endmodule