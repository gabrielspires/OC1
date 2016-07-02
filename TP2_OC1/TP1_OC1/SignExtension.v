module SignExtension(
	input[15:0] in_data,
	output [31:0] out_data
);
	reg[31:0] reg_data;
	assign out_data = reg_data;
	always @(in_data) begin
		reg_data[15:0] <= in_data[15:0];
		reg_data[16] <= in_data[15];
		reg_data[17] <= in_data[15];
		reg_data[18] <= in_data[15];
		reg_data[19] <= in_data[15];
		reg_data[20] <= in_data[15];
		reg_data[21] <= in_data[15];
		reg_data[22] <= in_data[15];
		reg_data[23] <= in_data[15];
		reg_data[24] <= in_data[15];
		reg_data[25] <= in_data[15];
		reg_data[26] <= in_data[15];
		reg_data[27] <= in_data[15];
		reg_data[28] <= in_data[15];
		reg_data[29] <= in_data[15];
		reg_data[30] <= in_data[15];
		reg_data[31] <= in_data[15];
	end
endmodule
