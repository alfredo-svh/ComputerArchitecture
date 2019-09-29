module aluTest;
//initialize variables
    reg [3:0] opcode;
    reg [31:0] dataA;
    reg [31:0] dataB;
    wire [31:0] dataRes;
    wire flagZ;
    wire flagN;
    
    //instance of our ALU
    alu test(opcode, dataA, dataB, dataRes, flagZ, flagN);
    initial begin
        //set A & B = 20 and opcode to 0000 for first test case
        dataA= 32'd20;
        dataB = 32'd20;
        opcode = 4'b0000;
        #50;
        
        //test the rest of opcodes
        
        opcode = 4'b0001;
        #50;
        
        opcode = 4'b0010;
        #50;
        
        opcode = 4'b0011;
        #50
        
        opcode = 4'b0100;
        #50
        
        $finish;
    end
endmodule