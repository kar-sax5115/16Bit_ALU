# 16Bit_ALU

Overview

This project implements a 16-bit Arithmetic Logic Unit (ALU) using Verilog HDL.
The ALU performs a variety of arithmetic and logical operations based on a 4-bit control signal (`ALU_Sel`).

It is designed as a combinational circuit, making it suitable for use in processors, digital systems, and FPGA-based designs.

Features

* 16-bit input operands (`A`, `B`)
* 4-bit operation select line
* Supports arithmetic, logical, and shift operations
* Status flags:

  * Zero Flag
  * Carry Flag
  * Overflow Flag
* Synthesizable design


Supported Operations

| ALU_Sel | Operation   | Description      |
| ------- | ----------- | ---------------- |
| 0000    | Addition    | A + B            |
| 0001    | Subtraction | A - B            |
| 0010    | AND         | Bitwise AND      |
| 0011    | OR          | Bitwise OR       |
| 0100    | XOR         | Bitwise XOR      |
| 0101    | NOR         | Bitwise NOR      |
| 0110    | NAND        | Bitwise NAND     |
| 0111    | SLT         | Set if A < B     |
| 1000    | Shift Left  | A << 1           |
| 1001    | Shift Right | A >> 1           |
| 1010    | Increment   | A + 1            |
| 1011    | Decrement   | A - 1            |
| 1100    | NOT         | Bitwise NOT of A |


Module Description

`alu_16bit`

Inputs:

* `A [15:0]` : First operand
* `B [15:0]` : Second operand
* `ALU_Sel [3:0]` : Operation selector

Outputs:

* `ALU_Out [15:0]` : Result
* `Zero` : High when output is zero
* `Carry` : Carry-out from arithmetic operations
* `Overflow` : Indicates signed overflow

---

Testbench

The testbench (`alu_16bit_tb`) verifies:

* All ALU operations
* Edge cases:

  * Overflow conditions
  * Zero output
  * Boundary values

Key Features:

* Uses `$monitor` for real-time output tracking
* Sequential test execution using delay (`#10`)
* Easy waveform visualization in simulation tools

---

How to Run

Using Vivado / ModelSim:

1. Add both files:

   * `alu_16bit.v`
   * `alu_16bit_tb.v`
2. Set `alu_16bit_tb` as top module
3. Run Behavioral Simulation
4. Observe:

   * Console output
   * Waveforms

Applications

* Microprocessors
* Embedded systems
* FPGA-based digital systems
* Signal processing units
