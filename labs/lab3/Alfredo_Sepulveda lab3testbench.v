`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2018 03:21:06 PM
// Design Name: 
// Module Name: testbench
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


module testbench;
    //initialize variables
    reg clk;

    reg [7:0] addr;
    wire [31:0] IOut;
    
    reg wrt;
    reg [5:0] rs;
    reg [5:0] rt;
    reg [5:0] rd;
    reg [31:0] dataIn1;
    wire [31:0] rsOut;
    wire [31:0] rtOut;
    
    reg r;
    reg  w;
    reg [31:0] dataIn2;
    reg [31:0] addrIn;
    wire [31:0] dataOut;

    //set clock
    initial begin
        clk = 0;
        forever #5 clk=~clk;
    end

    begin
        //test the instruction memory passing 75 as address input
        im imTest(clk, addr, IOut);
        initial begin
            addr = 8'd75;
        end
    
        //test the registers by storing 7000 in dataIn, 5 in rs, 10 in rt
        //set the write flag to 1 to write 7000 in registers 5 and 10
        registers rTest(clk, wrt, rs, rt, rd, dataIn1, rsOut, rtOut);
        initial begin
            dataIn1 = 32'd7000;
            rs=6'd5;
            rt=6'd10;
            wrt=1'b1;
            rd=6'd10;
            #10
            
            rd=6'd5;
        end
    
        //test the data memory by setting dataIn to 5, addrIn to 10
        //first, we write the data into address 10,
        //then we output the data in adress 10
        dataMem dmTest(clk, r, w, dataIn2, addrIn, dataOut);
        initial begin
            dataIn2 = 32'd5;
            addrIn = 32'd10;
            r=1'b0;
            w=1'b1;
            #10;
            r=1'b1;
            w=1'b0;
            
        end
    end

endmodule