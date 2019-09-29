module IFIDBuffer(clk, in1, in2, out1, out2);
    //initialize variables
    input clk;
    input [31:0] in1;
    input [31:0] in2;
    output reg [31:0] out1;
    output reg [31:0] out2;
    
    //on positive edge of clock, pass inputs directly into outputs
    always@(posedge clk)
    begin
        out1=in1;
        out2=in2;
    end

endmodule