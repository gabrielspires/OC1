module UnidadeDeControle(iin, OpSelect, Rx, Ry, Imediato, Resetn, Clear, Contador);
	input [15:0]iin;
	input Resetn;
	input [1:0]Contador;
	
	output Clear;
	output [2:0]OpSelect, Rx, Ry;
	output [9:0]Imediato;

	reg [2:0]OpSelectAux, RxAux, RyAux;
	reg [9:0]ImediatoAux;

	always @(*) begin
		OpSelectAux <= iin[15:13];
		RxAux <= iin[12:10]; //out
		//add, sub, nand, rep
		if (OpSelectAux == 3'b000 || OpSelectAux == 3'b001 || OpSelectAux == 3'b010 || OpSelectAux == 3'b111) begin
			RyAux <= iin[9:7];
		end
		//ldi
		else if (OpSelectAux == 3'b101) begin
			ImediatoAux <= iin[9:0];
		end
	end

	assign OpSelect = OpSelectAux;
	assign Rx = RxAux;
	assign Ry = RyAux;
	assign Imediato = ImediatoAux;

endmodule