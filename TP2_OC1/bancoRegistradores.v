module bancoRegistradores(Rx, Ry, regDestino, dadosReg,
                          r0Enable, r1Enable, r2Enable, r3Enable,
                          r4Enable, r5Enable, r6Enable, r7Enable,
                          dadosRx, dadosRy);
  input [2:0]Rx, Ry, regDestino;
  input r0Enable, r1Enable, r2Enable, r3Enable,
        r4Enable, r5Enable, r6Enable, r7Enable;
  input [15:0]dadosReg;
  output [15:0]dadosRx, dadosRy;
  reg[15:0] R[15:0];
  
  assign dadosRx = R[Rx];
  assign dadosRy = R[Ry];

  always @(regDestino) begin
    if(r0Enable) R[0] <= dadosReg;
    if(r1Enable) R[1] <= dadosReg;
    if(r2Enable) R[2] <= dadosReg;
    if(r3Enable) R[3] <= dadosReg;
    if(r4Enable) R[4] <= dadosReg;
    if(r5Enable) R[5] <= dadosReg;
    if(r6Enable) R[6] <= dadosReg;
    if(r7Enable) R[7] <= dadosReg;
  end
  initial begin
	R[0] <= 0;
	R[1] <= 1;
	R[2] <= 2;
	R[3] <= 3;
	R[4] <= 4;
	R[5] <= 5;
	R[6] <= 6;
	R[7] <= 7;
  end
endmodule
