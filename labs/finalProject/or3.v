module or3(a,b, c, out);
    input a;
    input b;
    input c;
    output reg out;
    
    always@(a,b, c)
    begin
        if(a==1'b1 || b==1'b1 || c==1'b1)
            out=1'b1;
        else
            out=1'b0;
    end

endmodule