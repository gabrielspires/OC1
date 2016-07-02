module DataMemory(
	input[4:0] data_address,
	input escreveMem,
	input [31:0] dado_esc,
	input leMem,
	output [31:0] out_data
);
	reg[31:0] data_memory[31:0];
	reg[31:0] reg_data;
	assign out_data = reg_data;
	always @(*) begin
		if (escreveMem) begin
			data_memory[data_address] <= dado_esc;
		end
		if (leMem) begin
			reg_data <= data_memory[data_address];
		end
		
	end
	//Inicializa alguns valores para as instruções para serem vistos na simulação
	/*initial begin
		//data_memory[0] <= 32'b00000010000010000001000000100010;//sub
		data_memory[1] <= 32'b00000010000010000001000000100000;//add
		data_memory[0] <= 32'b10001100001001110000000000000010;
		data_memory[2] <= 32'b00000011001001011111111111111111;
		data_memory[3] <= 3;
		data_memory[4] <= 4;
		data_memory[5] <= 5;
		data_memory[6] <= 6;
		data_memory[7] <= 7;
	end*/
endmodule
