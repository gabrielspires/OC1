module ExtensorDeSinal(input [15:0]iin, output [15:0]outExtended);

	reg[15:0] reg_data;
	assign outExtended = reg_data;
	always @(iin) begin
		reg_data[15:0] <= iin[15:0];
		reg_data[15] <= 1'b0;
		reg_data[14] <= 1'b0;
		reg_data[13] <= 1'b0;
		reg_data[12] <= 1'b0;
		reg_data[11] <= 1'b0;
		reg_data[10] <= 1'b0;
	end

endmodule