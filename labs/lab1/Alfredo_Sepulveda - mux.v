`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/26/2018 02:22:02 PM
// Design Name: 
// Module Name: mux
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

//inputs and outputs as arguments
module mux(d0, d1, d2, d3, sel, dout);
    //initializing inputs and outputs
    input d0;
    input d1;
    input d2;
    input d3;
    input [1:0] sel;
    output reg dout;
    
    //will listen for changes in inputs
    always@(d0, d1, d2, d3, sel)
    //selects output according to the select input
    begin
        if(sel==2'b00)
            dout = d0;
        else if(sel==2'b01)
            dout = d1;
        else if(sel==2'b10)
            dout = d2;
        else if(sel==2'b11)
            dout = d3;
    end
endmodule