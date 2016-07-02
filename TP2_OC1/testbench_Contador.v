`include "Contador.v"
module testbench_Contador;
	reg clock = 0, clear = 0; //Entradas do contador
	wire [1:0]out; 			  //Saida do contador

	always #1 clock = !clock; //Inverte o clock

	initial $dumpfile("testbench_Contador.vcd");
	initial $dumpvars(0, testbench_Contador);

	Contador contador(clock, clear, out);

	initial begin
		#5 clear = 1;
		#1 clear = 0;
		#20 $finish;
	end
endmodule