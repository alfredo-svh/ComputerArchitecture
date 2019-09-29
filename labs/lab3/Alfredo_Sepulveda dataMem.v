`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2018 02:43:24 PM
// Design Name: 
// Module Name: dataMem
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

module dataMem(clk, r, w, dataIn, addrIn, dataOut);
    //create 65536 memory spots each of size 32 bits
    reg [31:0] data [65535:0];

    //initalize variables
    input clk;
    input r;
    input w;
    input[31:0] dataIn;
    input[31:0] addrIn;
    output reg [31:0] dataOut;
    
    //at every positive edge of clock, depending on the read and write flags,
    //output the data stored in the address taken as input
    //or save the data passed as input into the address passed as input
    always@(posedge clk)
    begin
        if(r==1'b1)
            dataOut = data[addrIn[15:0]];
        if(w==1'b1)
            data[addrIn[15:0]] = dataIn;
    end
    
endmodule