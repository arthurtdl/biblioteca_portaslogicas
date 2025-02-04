`include "eightbit_not.v"
`include "eightbit_adder.v"

module eightbit_subtractor(output [7:0] diff, output overflow, output cout,
                           input [7:0] A, input [7:0] B);

  wire [7:0] B_neg;
  wire xor1, xor2;

  // Invertendo o B e colocando carry in 1 para conseguir o complemento de 2 para B
  eightbit_not NEG0 (.out(B_neg), .in(B));
  
  // Fazendo A - B (A + complemento de 2 de B)
  eightbit_adder ADD (.sum(diff), .cout(cout), .A(A), .B(B_neg), .cin(1'b1));

  // Verificando se ocorreu overflow
  xor_gate XOR0 (.out(xor1), .in1(A[7]), .in2(B[7]));      // xor1 = A7 ⊕ B7
  xor_gate XOR1 (.out(xor2), .in1(A[7]), .in2(diff[7]));   // xor2 = A7 ⊕ diff7
  and_gate AND (.out(overflow), .in1(xor1), .in2(xor2));   // overflow = xor1 & xor2

endmodule