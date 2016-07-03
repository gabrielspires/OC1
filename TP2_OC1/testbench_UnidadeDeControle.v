`include "Contador.v"
`include "UnidadeDeControle.v"

module testbench_UnidadeDeControle;
	//Contador
	reg clock = 0/*, clear = 0*/; //Entradas do contador
	wire [1:0]out; 			  //Saida do contador

	always #1 clock = !clock; //Inverte o clock

	//Controle
	reg[15:0] iin;
	reg Resetn;

	wire[2:0] OpSelect;
	wire[2:0] regNumSelect;
	wire[9:0] Imediato;
	wire Renable, Aenable, Clear,
		r0Enable, r1Enable, r2Enable, r3Enable,
		r4Enable, r5Enable, r6Enable, r7Enable,
		Rselect, Iselect;

	initial $dumpfile("testbench_UnidadeDeControle.vcd");
	initial $dumpvars(0, testbench_UnidadeDeControle);

	UnidadeDeControle control(iin, out, Resetn, clock,
						 OpSelect, Renable, Aenable, Clear,
						 r0Enable, r1Enable, r2Enable, r3Enable,
						 r4Enable, r5Enable, r6Enable, r7Enable,
						 regNumSelect, Rselect, Iselect);

	Contador contador(clock, Clear, out);

	initial begin

		#8 Resetn = 1'b1; 
		#1 Resetn = 1'b0;
		#8 iin = 16'b1010000000011100;  
		#8 iin = 16'b1010010000001010; 
		#8 iin = 16'b0010000010000000; 
		#8 iin = 16'b1000000000000000; 
		#8 $finish;
	end

endmodule