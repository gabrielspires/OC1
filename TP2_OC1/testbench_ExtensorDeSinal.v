`include "ExtensorDeSinal.v"

module testbench_ExtensorDeSinal;
	reg clock = 0;
	reg [15:0]iin;
	wire [15:0]outExtended;

	always #1 clock = !clock;

	initial $dumpfile("testbench_ExtensorDeSinal.vcd");
	initial $dumpvars(0, testbench_ExtensorDeSinal);

	ExtensorDeSinal extensor(iin, outExtended);

	initial begin
		#1 iin = 16'b1110111111111111;
		#1 iin = 16'b1010010000001010;
		#2 $finish;
	end
endmodule