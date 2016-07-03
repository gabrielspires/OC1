`include "Multiplexador.v"

module testbench_Multiplexador;
	reg Rselect, Iselect;
	reg[15:0] r0, r1, r2, r3, r4, r5, r6, r7, signExt, regR;
	reg[2:0] regNumSelect;
	wire[15:0]out;

	initial $dumpfile("testbench_Multiplexador.vcd");
	initial $dumpvars(0, testbench_Multiplexador);

	Multiplexador multiplexador(r0, r1, r2, r3, r4, r5, r6, r7,
					 regNumSelect, Rselect, Iselect,
					 signExt, regR, out);

	initial begin
		//Atribui um valor para cada registrador e seleciona o registrador r3
		#1;
			r0 = 0; r1 = 1;	r2 = 2;	r3 = 3;	r4 = 4;	r5 = 5;	r6 = 6;	r7 = 7;
			regNumSelect = 3;

		/*Atribui um dont care ao select de registradores
		Atribui um valor ao registrador R e habilita o select do R*/
		#1;
			regNumSelect = 3'bxxx;
			
			regR = 9;
			Rselect = 1;

		/*Atribuir dont care aos selects dos registradores e do R
		Atribui um valor à saída do extensor de sinal e habilita o select do Immediate*/
		#1;
			regNumSelect = 4'bxxxx;
			Rselect = 3'bxxx;

			signExt = 16'b0000001111111111;
			Iselect = 1;
			
		#1 $finish;

	end
endmodule