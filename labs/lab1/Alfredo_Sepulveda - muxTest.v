`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2018 02:36:32 PM
// Design Name: 
// Module Name: muxTest
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


module muxTest;
//initializing all variables
    reg data0;
    reg data1;
    reg data2;
    reg data3;
    reg [1:0] select;
    wire dataOut;
    
    //instance of our mux
    mux test(data0, data1, data2, data3, select, dataOut);
    initial begin
        //set all the inputs
        data0 = 1'b0;
        data1 = 1'b1;
        data2 = 1'b0;
        data3 = 1'b1;
        select = 2'b00;
        //wait 50 ns and change the value of our select input
        #50;
        select = 2'b01;
        #50;
        select = 2'b10;
        #50;
        select = 2'b11;
        #50;

        $finish;
    end
endmodule