module ULA(A, Ry, OpSelect, result);
    input [0:2]OpSelect;
    input [0:15] A;
    input [0:15] Ry;
    output [0:15] result;
    reg [0:15] aux;
    always @(*) begin
        case(OpSelect) 
            3'b000: aux <= A + Ry;
            3'b001: aux <= A - Ry;
            3'b010: aux <= A ~& Ry;
            3'b100: aux <= A;
            3'b101: aux <= Ry;
            3'b111: aux <= Ry;
        endcase
    end
    assign result = aux;
endmodule