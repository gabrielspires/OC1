counter: testbench_Contador.v
	iverilog -o counter.out testbench_Contador.v
	vvp counter.out
	gtkwave testbench_Contador.vcd

ula: testbench_ULA.v
	iverilog -o ula.out testbench_ULA.v
	vvp ula.out
	gtkwave testbench_ULA.vcd

mux: testbench_Multiplexador.v
	iverilog -o mux.out testbench_Multiplexador.v
	vvp mux.out
	gtkwave testbench_Multiplexador.vcd

control: testbench_UnidadeDeControle.v
	iverilog -o control.out testbench_UnidadeDeControle.v
	vvp control.out
	gtkwave testbench_UnidadeDeControle.vcd

clean:
	rm *.out
	rm *.vcd