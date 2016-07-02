`include "ULA.v"

module testbench_ULA;
	reg clock = 0;
	reg [0:2]OpSelect;
	reg [0:15]A;
	reg [0:15]Ry;

	wire [0:15]result;
	wire zero;

	always #1 clock = !clock;

	initial $dumpfile("testbench_ULA.vcd");
	initial $dumpvars(0, testbench_ULA);

	ULA ula(A, Ry, OpSelect, zero, result);

	initial begin
		#1; //add -> 2+1 = 3
		OpSelect = 3'b000;
		A = 3'b010;
		Ry = 3'b001;

		#1; //sub -> 6-2 = 4
		OpSelect = 3'b001;
		A = 3'b110;
		Ry = 3'b010;

		#1; //nand -> 0~&0 = 1
		OpSelect = 3'b010;
		A = 3'b001;
		Ry = 3'b000;

		#1; //out -> 7
		OpSelect = 3'b100;
		A = 3'b111;
		#20 $finish;
	end

endmodule