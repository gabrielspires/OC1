module bancoRegistradores(readRegA, readRegB, writeReg, writeData, readWrite, dataReadA, dataReadB);
  input [4:0]readRegA, readRegB, writeReg;
  input readWrite;
  input [31:0]writeData;
  output [31:0]dataReadA, dataReadB;
  reg[31:0] R[31:0];
  assign dataReadA = R[readRegA];
  assign dataReadB = R[readRegB];
  always @(readWrite, writeReg) begin
    if (readWrite) begin
      R[writeReg] <= writeData;
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
