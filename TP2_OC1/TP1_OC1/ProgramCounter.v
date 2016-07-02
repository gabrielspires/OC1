module ProgramCounter(
	input clock,
	input write_pc,
	input[4:0] branch_instruction_address,
	input in_mux_control,
	output[4:0] out_instruction_address
);
	reg[4:0] reg_instruction_address;
	assign out_instruction_address = reg_instruction_address;
	always @(clock) begin
		if (write_pc) begin
			if (in_mux_control) begin
				reg_instruction_address <= branch_instruction_address;
			end else begin
				//Aqui soma-se 1 ao invés de 4 pois a memória de instrução está sendo feita com registradores
				//e não endereços de memória.
				reg_instruction_address <= reg_instruction_address + 1;
			end
		end
	end
	
	initial begin
		reg_instruction_address <= 0;
	end
endmodule
