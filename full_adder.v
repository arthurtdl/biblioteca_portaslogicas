`include "or_gate.v"
`include "half_adder.v"

module full_adder(output sum, cout,
                  input A, B, cin);

    wire sum_A_B;
    wire cout_A_B, cout_A_B_cin;
  
  // Primeiro half adder: soma A e B
  half_adder ADD1 (.sum(sum_A_B), .cout(cout_A_B), .A(A), .B(B));

  // Segundo half adder: soma a soma (A+B) com o carryin (cin)
  half_adder ADD2 (.sum(sum), .cout(cout_A_B_cin), .A(sum_A_B), .B(cin));

  // OR entre os dois carrys para gerar o carry final
  or_gate OR (.out(cout), .in1(cout_A_B), .in2(cout_A_B_cin));

endmodule