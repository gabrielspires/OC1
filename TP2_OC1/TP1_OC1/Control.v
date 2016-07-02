module Control(
	input [5:0] in_instruction,
	input clock,
	output PCEsc,
	output IREsc,
	output [1:0] ULAop,
	output MemParaReg,
	output EscMem,
	output LeMem,
	output Desvio,
	output ULAFonte,
	output RegFonte,
	output EscReg
);
	reg [4:0] contador;
	reg [1:0] reg_ULAop;
	reg reg_PCEsc, reg_IREsc, reg_MemParaReg, reg_EscMem, reg_LeMem, reg_Desvio, reg_ULAFonte, reg_RegFonte, reg_EscReg;
	initial begin
		contador <= 0;
	end
	always @(clock) begin
		if (contador == 0) begin]
			reg_LeMem <= 0;
			reg_EscMem <= 0;
			reg_EscReg <= 0;
			reg_IREsc <= 1;
			reg_PCEsc <= 1;
			reg_Desvio <= 0;
			contador <= contador + 1;
		end else if (contador == 1) begin //Vai servir só de atraso
			reg_PCEsc <= 0;
			reg_IREsc <= 0;
			contador <= contador + 1;
		end else if (contador == 2) begin
			contador <= contador + 1;
		end else if (contador == 3) begin
			if (in_instruction == 6'b000010) begin //instrução jump
				reg_PCEsc <= 1;
				reg_Desvio <= 1;
				contador <= 0;
			end else begin
				if (in_instruction == 6'b000000) begin //instrução R
					reg_ULAop <= 2;
					reg_ULAFonte <= 0;
				end else if (in_instruction[5:1] == 5'b00010) begin //beq ou bne
					reg_ULAop <= 1;
					reg_ULAFonte <= 1;
				end else begin //lw sw
					reg_ULAop <= 0;
					reg_ULAFonte <= 1;
				end
				contador <= contador + 1;
			end
		end else if (contador == 4) begin
			if (in_instruction == 6'b100011) begin //lw
				reg_LeMem <= 1;
				reg_EscMem <= 0;
			end else if (in_instruction == 6'b101011) begin //sw
				reg_LeMem <= 0;
				reg_EscMem <= 1;
				reg_RegFonte <= 0;
			end else begin //tipo R
				reg_EscReg <= 1;
				reg_MemParaReg <= 0;
				reg_RegFonte <= 1;
				//contador <= 0;
			end
			contador <= contador + 1;
		end else if (contador == 5) begin
			contador <= contador + 1;
		end else if (contador == 6) begin
			contador <= contador + 1;
		end else begin
			contador <= 0;
		end
	end
	assign IREsc = reg_IREsc;
	assign PCEsc = reg_PCEsc;
	assign Desvio = reg_Desvio;
	assign ULAop = reg_ULAop;
	assign ULAFonte = reg_ULAFonte;
	assign EscMem = reg_EscMem;
	assign LeMem = reg_LeMem;
	assign EscReg = reg_EscReg;
	assign MemParaReg = reg_MemParaReg;
	assign RegFonte = reg_RegFonte;
endmodule
