module registers(clk, wrt, rs, rt, rd, dataIn, rsOut, rtOut);
    //create 64 registers of size 32 bits
    reg [31:0] regs [63:0];
    
    //initialize variables
    input clk;
    input wrt;
    input[5:0] rs; // registers are 6 bits each
    input[5:0] rt;
    input[5:0] rd;
    input[31:0] dataIn;
    output reg [31:0] rsOut;
    output reg [31:0] rtOut;
    
    initial begin
        regs[0] = 32'd0;
        regs[10] = 32'd0;
        regs[11] = 32'd0;
        regs[12] = 32'd5;
        regs[13] = 32'd0;
        regs[14] = 32'd0;
        regs[15] = 32'd0;
        regs[16] = 32'd0;
        regs[17] = 32'd0;
        regs[18] = 32'd0;
        regs[19] = 32'd0;
        regs[20] = 32'd0;
    end
    
    //at every positive edge of clock, output the value of the addresses passed as input (rs, rt)
    //if the write flag is 1, the data passed as input is stored in the address of rd
    always@(negedge clk)
    begin
        rsOut = regs[rs];
        rtOut = regs[rt];
        if(wrt==1'b1)
            regs[rd]= dataIn;
    end
    
endmodule