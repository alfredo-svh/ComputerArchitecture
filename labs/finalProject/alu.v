module alu(opcode, A, B, Z, NEG, result);

//opcode, 4bit input
//A, 32bit input
//B, 32bit input
//Z, 1 bit zero flag
//NEG. 1 bit negative flag
//Result, 32bit result

    input [3:0] opcode;
    input [31:0] A;
    input [31:0] B;
    output reg Z;
    output reg NEG;
    output reg [31:0] result;
    
    always@(opcode,A,B)
    begin
        //Opcode 1000, A+B
        if(opcode==4'b1000)
            result = A+B;
            
        //Opcode 0100, B+1    
        else if(opcode==4'b0100)
            result = B + 32'd1;
            
        //Opcode 0010, 0+~A
        else if(opcode==4'b0010)
            //take 2's complement of A...
            result = ~B + 32'd1;
    
        //Opcode 0001, B + ~A
        else if(opcode==4'b0001)
            result = B + (~A+ 32'd1);
            
        //Opcode 1111. pass B  
        else if(opcode==4'b1111)
            result = B;
            
        //Opcode 0000, Don't Care
            
    end
    
    //Set Flags
    always@(result,Z,NEG)
    begin
        //If the operation is PASS or NOP, do not alter the flags
        if(opcode == 4'b1111 || opcode == 4'b0000) begin 
            end
            
        else if(result[31]==1'b1) begin
            NEG=1'b1;
            Z=1'b0;
            end
        else if(result==32'b0) begin
            Z=1'b1;
            NEG=1'b0;
            end
        else begin
            Z=1'b0;
            NEG=1'b0;
            end
    end
endmodule