module ula(input_A, input_B, op, zero, resultado);
  input [0:2]op;
  input [0:31] input_A, input_B;
  output [0:31] resultado;
  reg [0:31] aux;
  output zero;
  always @(*) begin
    case(op) 
      0: aux <= input_A + input_B;
      1: aux <= input_A - input_B;
      2: aux <= input_A & input_B;
      3: aux <= input_A | input_B;
      4: aux <= input_A ^ input_B;
      5: aux <= input_A * input_B;
      6: aux <= input_A << input_B;
      7: aux <= input_A >> input_B;
    endcase
  end
  assign resultado = aux;
  assign zero = (aux == 0);
endmodule
	