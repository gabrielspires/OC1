module banco_registradores(
	reg_a_ser_lido_a,
	reg_a_ser_lido_b,
	reg_a_ser_escrito,
	dado_de_escrita,
	esc_reg,
	dado_lido_a,
	dado_lido_b
);
  input [4:0]reg_a_ser_lido_a, reg_a_ser_lido_b, reg_a_ser_escrito;
  input esc_reg;
  input [31:0]dado_de_escrita;
  output [31:0]dado_lido_a, dado_lido_b;
  reg[31:0] R[31:0];
  assign dado_lido_a = R[reg_a_ser_lido_a];
  assign dado_lido_b = R[reg_a_ser_lido_b];
  always @(esc_reg, reg_a_ser_escrito) begin
    if (esc_reg) begin
      R[reg_a_ser_escrito] <= dado_de_escrita;
    end
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
	R[8] <= 8;
	R[9] <= 9;
	R[10] <= 0;
	R[11] <= 1;
	R[12] <= 2;
	R[13] <= 3;
	R[14] <= 4;
	R[15] <= 5;
	R[16] <= 6;
	R[17] <= 7;
	R[18] <= 8;
	R[19] <= 9;
	R[20] <= 0;
	R[21] <= 1;
	R[22] <= 2;
	R[23] <= 3;
	R[24] <= 4;
	R[25] <= 5;
	R[26] <= 6;
	R[27] <= 7;
	R[28] <= 8;
	R[29] <= 9;
	R[30] <= 0;
	R[31] <= 1;
  end
endmodule
