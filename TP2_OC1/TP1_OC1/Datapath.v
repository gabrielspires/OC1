module Datapath(
	input clock
);
	wire [4:0] instruction_address;
	wire [4:0] branch_instruction_address;
	reg [4:0] reg_branch_instruction_address;
	assign branch_instruction_address = reg_branch_instruction_address;
	wire [31:0] instruction;
	wire [1:0] ULAop;
	wire PCEsc,
		IREsc,
		MemParaReg,
		EscMem,
		LeMem,
		Desvio,
		ULAFonte,
		RegDest,
		EscReg;
	Control control(
		instruction[31:26],
		clock,
		PCEsc,
		IREsc,
		ULAop,
		MemParaReg,
		EscMem,
		LeMem,
		Desvio,
		ULAFonte,
		RegDest,
		EscReg
	);
	wire mux_pc;
	
	ProgramCounter program_counter(
		clock,
		PCEsc,
		branch_instruction_address,
		mux_pc,
		instruction_address
	);
	InstructionMemory instruction_memory(
		instruction_address,
		IREsc,
		instruction
	);
	
	wire [31:0] dado_de_escrita;
	wire [31:0] dado_a;
	wire [31:0] dado_b;
	
	reg [4:0] reg_reg_a_ser_escrito;
	wire [4:0] reg_a_ser_escrito;
	assign reg_a_ser_escrito = reg_reg_a_ser_escrito;
	always @(RegDest) begin
		if (RegDest) begin
			reg_reg_a_ser_escrito <= instruction[15:11];
		end else begin
			reg_reg_a_ser_escrito <= instruction[20:16];
		end
	end
	
	banco_registradores banco_de_registradores(
		instruction[25:21],
		instruction[20:16],
		reg_a_ser_escrito,
		dado_de_escrita,
		EscReg,
		dado_a,
		dado_b
	);
	
	wire [31:0] sign_extended_instruction;
 	SignExtension sign_extension(
		instruction[15:0],
		sign_extended_instruction
	);
	always @(sign_extended_instruction, mux_pc) begin
		reg_branch_instruction_address <= sign_extended_instruction << 2 + instruction_address;
	end
	wire [2:0] alu_operation;
	ALUControl alu_control(
		instruction[5:0],
		ULAop,
		alu_operation
	);
	
	wire ula_zero;
	assign mux_pc = Desvio & ula_zero;
	wire [31:0] ula_res;
	wire [31:0] alu_operand_b;
	reg [31:0] reg_alu_operand_b;
	assign alu_operand_b = reg_alu_operand_b;
	always @(ULAFonte) begin
		if (ULAFonte) begin
			reg_alu_operand_b <= sign_extended_instruction;
		end else begin
			reg_alu_operand_b <= dado_b;
		end
	end
	ula ula_inst(
		dado_a,
		alu_operand_b,
		alu_operation,
		ula_zero,
		ula_res
	);
	
	wire [31:0] out_mem;
	DataMemory data_memory (
		ula_res[4:0],
		EscMem,
		dado_b,
		LeMem,
		out_mem
	);
	
	reg [31:0] reg_dado_de_escrita;
	always @(*) begin
		if (MemParaReg) begin
			reg_dado_de_escrita <= out_mem;
		end else begin
			reg_dado_de_escrita <= ula_res;
		end
	end
	assign dado_de_escrita = reg_dado_de_escrita;

endmodule
