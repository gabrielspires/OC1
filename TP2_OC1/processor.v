`include "Contador.v"
`include "UnidadeDeControle.v"
`include "ExtensorDeSinal.v"
`include "Multiplexador.v"
`include "ULA.v"
`include "bancoRegistradores.v"

module processor(clock, iin, Resetn, bus);
	
	input[15:0]iin;
	input Resetn;
	input clock;
	output[15:0] bus;

	//Contador
	input clear;
	output [1:0] counterout;

	//Controle
	input[1:0] Contador;
	output [2:0] OpSelect;
	output [2:0] regNumSelect;
	output Renable, Aenable, Clear,
				r0Enable, r1Enable, r2Enable, r3Enable,
				r4Enable, r5Enable, r6Enable, r7Enable,
				Rselect, Iselect;

	//Extensor de sinal
	output[15:0] outExtended;

	//Mux
	input muxRselect, muxIselect;
	input[15:0] r0, r1, r2, r3, r4, r5, r6, r7, signExt, regR;
	input[4:0] muxregNumSelect;
	output[15:0] muxout;

	reg[15:0] muxAux;

	//ULA
	input [0:2]ULAOpSelect;
    input [0:15] A;
    input [0:15] Ry;
    output [0:15] result;
    reg [0:15] aux;

    //Registradores
	input [2:0] regDestino;
	input [15:0] dadosReg;
	output [15:0] dadosRx, dadosRy;

	bancoRegistradores regBank(regNumSelect, regNumSelect, regDestino, dadosReg,
                          r0Enable, r1Enable, r2Enable, r3Enable,
                          r4Enable, r5Enable, r6Enable, r7Enable,
                          dadosRx, dadosRy);

	Contador counter(clock, clear, counterout);
	
	ExtensorDeSinal extsinal(iin, outExtended);

	UnidadeDeControle controle(iin, counterout, Resetn, clock,
								OpSelect, Renable, Aenable, Clear,
								r0Enable, r1Enable, r2Enable, r3Enable,
								r4Enable, r5Enable, r6Enable, r7Enable,
								regNumSelect, Rselect, Iselect);


	Multiplexador mux(r0, r1, r2, r3, r4, r5, r6, r7, regNumSelect, Rselect, Iselect, outExtended, regR, muxout);

	ULA alu(bus, bus, OpSelect, regR);
	
	assign bus = muxAux;
    always @(posedge clock) begin
    	muxAux[15:0] <= muxout[15:0];
    end
	
endmodule