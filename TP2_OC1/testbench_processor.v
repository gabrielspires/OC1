`include "processor.v"

module testbench_processor;
	reg clock = 0;
	reg Resetn = 1;
	reg[15:0] iin;
	wire[15:0] bus;

	always #1 clock = !clock;

	initial $dumpfile("testbench_processor.vcd");
	initial $dumpvars(0, testbench_processor);

	processor p(clock, iin, Resetn, bus);

	initial begin
		#0 Resetn = 1'b0;
		#8 iin = 16'b1010000000011100;
		#8 iin = 16'b1010010000001010;
		#8 iin = 16'b0010000010000000;
		#8 iin = 16'b1000000000000000;
		#8 $finish;
	end
endmodule