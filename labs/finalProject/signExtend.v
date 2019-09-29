module signExtend(in, out);
    input [11:0] in;
    output reg [31:0] out;
    
    always@(in)
    begin
        out <= { {20{in[11]}}, in };
    end
endmodule