module ULA(A, Ry, OpSelect, result);
  input [0:2]OpSelect;
  input [0:15] A;
  input [0:15] Ry;
  output [0:15] result;
  reg [0:15] aux;
  always @(*) begin
    case(OpSelect) 
      3'b000: aux <= A + Ry; //add
      3'b001: aux <= A - Ry; //sub
      3'b010: aux <= A ~& Ry; //nand
      
      3'b100: aux <= A; //Out
      // 3'b101: ; //ldi

      // 3'b111: ; //rep
    endcase
  end
  assign result = aux;
endmodule
	