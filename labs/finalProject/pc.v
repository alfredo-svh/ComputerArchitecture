module pc(clock, pc_in, pc_out);

    input clock;
    input [31:0] pc_in;
    output reg [31:0] pc_out;
    
    initial begin
        pc_out=32'd0;
    end
    
    always@(posedge clock)
    begin
        if(pc_in)
            pc_out = pc_in;
    end
    
endmodule