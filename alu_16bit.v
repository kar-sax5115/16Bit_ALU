module alu_16bit (
    input  [15:0] A,       
    input  [15:0] B,       
    input  [3:0]  ALU_Sel, 
    output reg [15:0] ALU_Out,
    output Zero,           
    output Carry,          
    output Overflow        
);

reg [16:0] temp;

assign Zero = (ALU_Out == 16'b0);

always @(*) begin
    temp = 17'b0;
    case (ALU_Sel)
        4'b0000: begin // Addition
            temp = A + B;
            ALU_Out = temp[15:0];
        end

        4'b0001: begin // Subtraction
            temp = A - B;
            ALU_Out = temp[15:0];
        end

        4'b0010: ALU_Out = A & B; // AND

        4'b0011: ALU_Out = A | B; // OR

        4'b0100: ALU_Out = A ^ B; // XOR

        4'b0101: ALU_Out = ~(A | B); // NOR

        4'b0110: ALU_Out = ~(A & B); // NAND

        4'b0111: ALU_Out = (A < B) ? 16'd1 : 16'd0; // SLT

        4'b1000: ALU_Out = A << 1; // Shift left

        4'b1001: ALU_Out = A >> 1; // Shift right

        4'b1010: ALU_Out = A + 1; // Increment

        4'b1011: ALU_Out = A - 1; // Decrement

        4'b1100: ALU_Out = ~A; // NOT

        default: ALU_Out = 16'b0;
    endcase
end

assign Carry = temp[16];

assign Overflow = ((ALU_Sel == 4'b0000) && 
                  (A[15] == B[15]) && (ALU_Out[15] != A[15])) ||
                  ((ALU_Sel == 4'b0001) && 
                  (A[15] != B[15]) && (ALU_Out[15] != A[15]));

endmodule