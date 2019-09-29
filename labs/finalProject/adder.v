module adder(a, b, res);
    //initializing inputs and outputs
    input [31:0] a;
    input [31:0] b;
    output reg [31:0] res;
    
    //listens for changes in op code and performs the correct operation on the inputs
    always@(a, b)
    begin
        res = a+b;
    end
    
endmodule