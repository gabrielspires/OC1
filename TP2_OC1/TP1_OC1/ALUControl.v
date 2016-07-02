module ALUControl(
	input [5:0] funct_code,
	input [1:0] ALUop,
	output [2:0] op
);
	reg [2:0] reg_op;
	assign op = reg_op;
	always@(*) begin
		if (ALUop == 0) begin
			reg_op <= 0;
		end else if (ALUop == 1) begin
			reg_op <= 1;
		end else begin
			if (funct_code == 6'b100000) begin
				reg_op <= 0;
			end else if (funct_code == 6'b100100) begin
				reg_op <= 2;
			end else if (funct_code == 6'b011000) begin
				reg_op <= 5;
			end else if (funct_code == 6'b100101) begin
				reg_op <= 3;
			end else if (funct_code == 6'b000010) begin
				reg_op <= 7;
			end else if (funct_code == 6'b100010) begin
				reg_op <= 1;
			end else if (funct_code == 6'b100110) begin
				reg_op <= 4;
			end
		end
	end
endmodule
