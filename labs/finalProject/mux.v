//inputs and outputs as arguments
module mux(d0, d1, d2, d3, sel0, sel1, dout);
    //initializing inputs and outputs
    input [31:0] d0;
    input [31:0] d1;
    input [31:0] d2;
    input [31:0] d3;
    input sel0;
    input sel1;
    output reg [31:0] dout;
    
    //will listen for changes in inputs
    always@(d0, d1, d2, d3, sel0, sel1)
    //selects output according to the select input
    begin
        if(sel1==1'b0 && sel0==1'b0)
            dout = d0;
        else if(sel1==1'b0 && sel0==1'b1)
            dout = d1;
        else if(sel1==1'b1 && sel0==1'b0)
            dout = d2;
        else if(sel1==1'b1 && sel0==1'b1)
            dout = d3;
    end
endmodule