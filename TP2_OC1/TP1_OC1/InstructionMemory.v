module InstructionMemory(
	input[4:0] in_instruction_address,
	input IREsc,
	output [31:0] out_instruction
);
	reg[31:0] instruction_memory[31:0];
	reg[31:0] reg_instruction;
	assign out_instruction = reg_instruction;
	always @(*) begin
		if (IREsc) begin
			reg_instruction <= instruction_memory[in_instruction_address];
		end
	end
	//Inicializa alguns valores para as instruções para serem vistos na simulação
	initial begin
		instruction_memory[0] <= 32'b00000010000010000111100000100010;//sub $15 $16 $8
		instruction_memory[1] <= 32'b00000001111010001000000000100010;//sub $16 $15 $8
		instruction_memory[2] <= 32'b00000011001001011111111111111111;
		instruction_memory[3] <= 3;
		instruction_memory[4] <= 4;
		instruction_memory[5] <= 5;
		instruction_memory[6] <= 6;
		instruction_memory[7] <= 7;
	end
endmodule
