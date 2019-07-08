`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:33:08 06/21/2019
// Design Name:   mips_16
// Module Name:   W:/shiva/16-bit MIPS processor/MIPS16/test_bench.v
// Project Name:  MIPS16
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: mips_16
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module test_bench;

	// Inputs
	reg [2:0] opcode;
	reg [3:0] Function;
	reg [15:0] reg1;
	reg [15:0] reg2;
	reg [15:0] L;
	reg [15:0] LJ;

	// Outputs
	wire [15:0] alu_result;
	wire [15:0] pc_out;

	// Instantiate the Unit Under Test (UUT)
	mips_16 uut (
		.opcode(opcode), 
		.Function(Function), 
		.reg1(reg1), 
		.reg2(reg2),
		.L(L),
		.LJ(LJ),
		.alu_result(alu_result),
		.pc_out(pc_out)
		
	);

	initial begin
		// Initialize Inputs
		opcode = 0;
		Function = 0;
		reg1 = 0;
		reg2 = 0;
		L = 0;
		LJ = 0;

		// Wait 100 ns for global reset to finish
		#100;
		//add 1+2 = 3
		opcode = 3'b000;
		Function = 4'b0000;
		reg1 = 4'h0002;
		reg2 = 4'h0001;
		L = 4'h000F;
		LJ = 4'h000A;

		// Wait 100 ns for global reset to finish
		#100;
		//sub
		opcode = 3'b000;
		Function = 4'b0001;
		reg1 = 4'h0006;
		reg2 = 4'h0001;
		L = 4'h000F;
		LJ = 4'h000A;

		// Wait 100 ns for global reset to finish
		#100;
		//and 1 & 2 = 0
		opcode = 3'b000;
		Function = 4'b0010;
		reg1 = 4'h0006;
		reg2 = 4'h0001;
		L = 4'h000F;
		LJ = 4'h000A;

		// Wait 100 ns for global reset to finish
		#100;
		//or 1 | 2 = 3
		opcode = 3'b000;
		Function = 4'b0011;
		reg1 = 4'h0006;
		reg2 = 4'h0001;
		L = 4'h000F;
		LJ = 4'h000A;

		// Wait 100 ns for global reset to finish
		#100;
		//slti 1 < 3 => 1
		opcode = 3'b001;
		Function = 4'bxxxx;
		reg1 = 4'h0006;
		reg2 = 4'h0001;
		L = 4'h0000;
		LJ = 4'h0000;

		// Wait 100 ns for global reset to finish
		#100;
		//slti 1 > 3 => 0
		opcode = 3'b001;
		Function = 4'bxxxx;
		reg1 = 4'h0006;
		reg2 = 4'h0001;
		L = 4'h0000;
		LJ = 4'h0000;

		// Wait 100 ns for global reset to finish
		#100;
		//j pc_out =000a
		opcode = 3'b010;
		Function = 4'b0000;
		reg1 = 0;
		reg2 = 0;
		L = 4'h000F;
		LJ = 4'h000A;
		
		

		// Wait 100 ns for global reset to finish
		#100;
		//beq pc_out = 000f
		opcode = 3'b110;
		Function = 4'b0000;
		reg1 = 0;
		reg2 = 0;
		L = 4'h000F;
		LJ = 4'h000A;

		// Wait 100 ns for global reset to finish
		#100;
		//jal pc_out = 000a
		opcode = 3'b011;
		Function = 4'b0000;
		reg1 = 0;
		reg2 = 0;
		L = 4'h000F;
		LJ = 4'h000A;

		// Wait 100 ns for global reset to finish
		#100;
		/*
		opcode = 3'b100;
		Function = 4'b0000;
		reg1 = 0;
		reg2 = 0;
		L = 4'h0000;
		LJ = 4'h0000;

		// Wait 100 ns for global reset to finish
		#100;
		
		opcode = 3'b101;
		Function = 4'b0000;
		reg1 = 0;
		reg2 = 0;
		L = 4'h0000;
		LJ = 4'h0000;
      */
		// Wait 100 ns for global reset to finish
		#100;
		//addi 
		opcode = 3'b111;
		Function = 4'b0000;
		reg1 = 4'h0002;
		reg2 = 4'h0005;
		L = 4'h000F;
		LJ = 4'h000A;

		// Wait 100 ns for global reset to finish
		#100;
		
      
		
		// Add stimulus here

	end
      
endmodule

