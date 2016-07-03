module Multiplexador(r0, r1, r2, r3, r4, r5, r6, r7,
					 regNumSelect, Rselect, Iselect,
					 signExt, regR, out);
	
	input Rselect, Iselect;
	input[15:0] r0, r1, r2, r3, r4, r5, r6, r7, signExt, regR;
	input[2:0] regNumSelect;
	output[15:0] out;
	
	reg[15:0] aux;

	always @(regNumSelect, Iselect, Rselect) begin
		if (regNumSelect >= 0 && regNumSelect <= 7) begin
			case(regNumSelect)
				3'b000: aux = r0;
				3'b001: aux = r1;
				3'b010: aux = r2;
				3'b011: aux = r3;
				3'b100: aux = r4;
				3'b101: aux = r5;
				3'b110: aux = r6;
				3'b111: aux = r7;
			endcase
		end
		else begin
			if (Rselect) begin
				aux = regR;
			end

			if (Iselect) begin
				aux = signExt;
			end
		end
	end

	assign out = aux;
endmodule