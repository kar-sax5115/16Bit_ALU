`timescale 1ns/1ps

module alu_16bit_tb;

    // Inputs
    reg [15:0] A;
    reg [15:0] B;
    reg [3:0] ALU_Sel;

    // Outputs
    wire [15:0] ALU_Out;
    wire Zero;
    wire Carry;
    wire Overflow;

    // Instantiate the ALU
    alu_16bit uut (
        .A(A),
        .B(B),
        .ALU_Sel(ALU_Sel),
        .ALU_Out(ALU_Out),
        .Zero(Zero),
        .Carry(Carry),
        .Overflow(Overflow)
    );

    // Test procedure
    initial begin


        // Test cases
        A = 16'h000A; B = 16'h0005;

        ALU_Sel = 4'b0000; #10; // ADD
        ALU_Sel = 4'b0001; #10; // SUB
        ALU_Sel = 4'b0010; #10; // AND
        ALU_Sel = 4'b0011; #10; // OR
        ALU_Sel = 4'b0100; #10; // XOR
        ALU_Sel = 4'b0101; #10; // NOR
        ALU_Sel = 4'b0110; #10; // NAND
        ALU_Sel = 4'b0111; #10; // SLT

        ALU_Sel = 4'b1000; #10; // SHIFT LEFT
        ALU_Sel = 4'b1001; #10; // SHIFT RIGHT

        ALU_Sel = 4'b1010; #10; // INCREMENT
        ALU_Sel = 4'b1011; #10; // DECREMENT
        ALU_Sel = 4'b1100; #10; // NOT

        // Edge cases
        A = 16'hFFFF; B = 16'h0001;
        ALU_Sel = 4'b0000; #10; // Overflow check (ADD)

        A = 16'h8000; B = 16'h8000;
        ALU_Sel = 4'b0000; #10; // Signed overflow

        A = 16'h0000; B = 16'h0000;
        ALU_Sel = 4'b0000; #10; // Zero output

        $finish;
    end

endmodule