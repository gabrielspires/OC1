module UnidadeDeControle(iin, Contador, Resetn,
						 OpSelect, Imediato, Renable, Aenable, Clear,
						 r0Enable, r1Enable, r2Enable, r3Enable,
						 r4Enable, r5Enable, r6Enable, r7Enable,
						 regNumSelect, Rselect, Iselect);
	input[15:0] iin;
	input[1:0] Contador;
	input Resetn;
	
	output reg[2:0] OpSelect;
	output reg[2:0] regNumSelect;
	output reg[9:0] Imediato;
	output reg Renable, Aenable, Clear,
				r0Enable, r1Enable, r2Enable, r3Enable,
				r4Enable, r5Enable, r6Enable, r7Enable,
				Rselect, Iselect;

	always @(Contador) begin
		// Ciclo 1 ****************************************************
		if (Contador == 0) begin
			Clear = 1'b0;
			regNumSelect = 3'bxxx;
			Imediato = 10'bxxxxxxxxxx;
			Iselect = 1'bx;
			Rselect = 1'bx;
			Renable = 1'bx;
			Aenable = 1'bx;
			r0Enable = 1'bx;
			r1Enable = 1'bx;
			r2Enable = 1'bx;
			r3Enable = 1'bx;
			r4Enable = 1'bx;
			r5Enable = 1'bx;
			r6Enable = 1'bx;
			r7Enable = 1'bx;

			OpSelect = iin[15:13];
		end

		// Ciclo 2 ****************************************************
		if (Contador == 1) begin
			if (OpSelect == 3'b000 || OpSelect == 3'b001 || OpSelect == 3'b010 || OpSelect == 3'b100) begin //add, sub, nand, out
				Aenable = 1'b1;
				regNumSelect = iin[12:10];
			end
			if (OpSelect == 3'b111) begin //rep
				Aenable = 1'b1;
				regNumSelect = iin[9:7];
			end
			if (OpSelect == 3'b101) begin //ldi
				Iselect = 1'b1;
			end
		end

		// Ciclo 3 ****************************************************
		if (Contador == 2) begin
			Renable = 1'b1;
			if (OpSelect == 3'b000 || OpSelect == 3'b001 || OpSelect == 3'b010) begin //add, sub, nand
				Aenable = 1'b0; //Desabilita gravação do registrador A
				regNumSelect = iin[9:7];
			end
		end

		// Ciclo 4 ****************************************************
		if (Contador == 3) begin
			Renable = 1'b0; //Desabilita gravação do registrador R

			if (OpSelect == 3'b000 || OpSelect == 3'b001 || OpSelect == 3'b010 || OpSelect == 3'b100) begin //add, sub, nand, out
				Aenable = 1'bx; //Desabilita gravação do registrador A
				regNumSelect = 3'bxxx; //Desabilita o seletor de registrador do mux
			end
			if (OpSelect == 3'b101) begin //ldi
				Iselect = 1'bx; //Desabilida o seletor de immediate do mux
			end

			Rselect = 1'b1;

			if (OpSelect == 3'b111) begin //rep
				case(iin[12:10]) //Habilita o registrador de destinho para escrita
					3'b000: r0Enable = 1;
			        3'b001: r1Enable = 1;
			        3'b010: r2Enable = 1;
			        3'b011: r3Enable = 1;
			        3'b100: r4Enable = 1;
			        3'b101: r5Enable = 1;
			        3'b110: r6Enable = 1;
			        3'b111: r7Enable = 1;
				endcase
			end
		end
		// ****************************************************
	end

endmodule