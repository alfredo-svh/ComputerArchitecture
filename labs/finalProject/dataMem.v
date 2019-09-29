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
    
    initial begin
        data [0] = 32'd2;
        data [1] = 32'd4;
        data [2] = 32'd5;
        data [3] = 32'd3;
        data [4] = 32'd300;
    end
    
    //at every positive edge of clock, depending on the read and write flags,
    //output the data stored in the address taken as input
    //or save the data passed as input into the address passed as input
    always@(negedge clk)
    begin
        if(r==1'b1)
            dataOut = data[addrIn[15:0]];
        if(w==1'b1)
            data[addrIn[15:0]] = dataIn;
    end
    
endmodule