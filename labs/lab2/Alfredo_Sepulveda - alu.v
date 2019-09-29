module alu(op, a, b, res, z, neg);
    //initializing inputs and outputs
    input [3:0] op;
    input [31:0] a;
    input [31:0] b;
    output reg [31:0] res;
    output reg z;
    output reg neg;
    
    //listens for changes in op code and performs the correct operation on the inputs
    always@(op, a, b)
    begin
    if(op==4'b0000)
        res = a+b;
    else if(op==4'b0001)
        res = b+1;
    else if(op==4'b0010)
        res= ~a +1; //2's complement: negate, add 1
    else if(op==4'b0011)
        res = b+ ~a +1; //2's complement of a: negate, add 1
    else if(op==4'b0100)
        res=a;
    end
    
    //listens for changes in the result to set the correct negative and zero flags
    always@(res)
    begin
        if(res[31]==1)  //if left-most bit is 1, number is negative
            neg=1;
        else
            neg=0;
        if(res==32'd0)
            z=1;
        else
            z=0;
    end
endmodule