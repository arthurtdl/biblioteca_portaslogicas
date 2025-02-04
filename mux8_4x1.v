`include "not_gate.v"
`include "and8_3x1gate.v"
`include "or8_gate.v"

module mux8_4x1(
    output [7:0] out,
    input [7:0] a, b, c, d, input [1:0] sel);

  wire [7:0] and_A, and_B, and_C, and_D;
  wire sel0_neg, sel1_neg;
  wire [7:0] or_1, or_2;

  // Negação dos bits da chave seletora
  not_gate NEG0 (.out(sel0_neg), .in(sel[0]));
  not_gate NEG1 (.out(sel1_neg), .in(sel[1]));

  // Combinando as entradas de 8 bits com as portas AND e as chaves seletoras

  // Para "a" temos 2'b00
  and8_3x1gate AND0 (.out(and_A), .in1(a), .in2(sel1_neg), .in3(sel0_neg));

  // Para "b" temos 2'b01
  and8_3x1gate AND1 (.out(and_B), .in1(b), .in2(sel1_neg), .in3(sel[0]));

  // Para "c" temos 2'b10
  and8_3x1gate AND2 (.out(and_C), .in1(c), .in2(sel[1]), .in3(sel0_neg));

  // Para "d" temos 2'b11
  and8_3x1gate AND3 (.out(and_D), .in1(d), .in2(sel[1]), .in3(sel[0]));

  // Juntando tudo nas portas OR para gerar a saída final para cada bit

  or8_gate OR0 (.out(or_1), .in1(and_A), .in2(and_B));

  or8_gate OR1 (.out(or_2), .in1(and_C), .in2(and_D));

  or8_gate OR2 (.out(out), .in1(or_1), .in2(or_2));

endmodule