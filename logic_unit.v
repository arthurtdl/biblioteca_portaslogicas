`include "and8_gate.v"
`include "or8_gate.v"
`include "xor8_gate.v"
`include "eightbit_not.v"


module and8_3x1gate(output [7:0] out,
                  input [7:0] in1, input in2, in3);

  wire in2_and_in3;

  // And para uma entrada de 8 bits e duas de 1 bit (usada em mux8_4x1)
  
  and_gate AND0_0 (.out(in2_and_in3), .in1(in2), .in2(in3));

  and_gate AND1 (.out(out[0]), .in1(in1[0]), .in2(in2_and_in3));
  and_gate AND2 (.out(out[1]), .in1(in1[1]), .in2(in2_and_in3));
  and_gate AND3 (.out(out[2]), .in1(in1[2]), .in2(in2_and_in3));
  and_gate AND4 (.out(out[3]), .in1(in1[3]), .in2(in2_and_in3));
  and_gate AND5 (.out(out[4]), .in1(in1[4]), .in2(in2_and_in3));
  and_gate AND6 (.out(out[5]), .in1(in1[5]), .in2(in2_and_in3));
  and_gate AND7 (.out(out[6]), .in1(in1[6]), .in2(in2_and_in3));
  and_gate AND8 (.out(out[7]), .in1(in1[7]), .in2(in2_and_in3));

endmodule


module comparator8to0(output out,
                input [7:0] in);

  wire out0_1, out1_2, out2_3, out3_4, out4_5, out5_6, out6_7;
  wire out_neg;

  or_gate OR0 (.out(out0_1), .in1(in[1]), .in2(in[0]));
  or_gate OR1 (.out(out2_3), .in1(in[2]), .in2(out0_1));
  or_gate OR2 (.out(out3_4), .in1(in[3]), .in2(out2_3));
  or_gate OR3 (.out(out4_5), .in1(in[4]), .in2(out3_4));
  or_gate OR4 (.out(out5_6), .in1(in[5]), .in2(out4_5));
  or_gate OR5 (.out(out6_7), .in1(in[6]), .in2(out5_6));
  or_gate OR6 (.out(out_neg), .in1(in[7]), .in2(out6_7));

  // Invertendo o valor da saída
  not_gate NEG (.out(out), .in(out_neg));

endmodule


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


module logic_unit(output [7:0] result, output [3:0] NZVC,
                      input [7:0] A, input [7:0] B, input [1:0] sel);

  wire [7:0] A_and_B, A_or_B, A_xor_B, inv_A;

  // Para sel = 1'b00
  and8_gate AND (.out(A_and_B), .in1(A), .in2(B));

  // Para sel = 1'b01
  or8_gate OR (.out(A_or_B), .in1(A), .in2(B));

  // Para sel = 1'b10
  xor8_gate XOR (.out(A_xor_B), .in1(A), .in2(B));

  // Para sel = 1'b11
  eightbit_not NEG (.out(inv_A), .in(A));

  // Aplicação do MUX8_4x1
  mux8_4x1 MUX (.out(result), .a(A_and_B), .b(A_or_B), .c(A_xor_B), .d(inv_A), .sel(sel));

  // Aplicação do NZVC
  and_gate AND_0 (.out(NZVC[3]), .in1(result[7]), .in2(1'b1)); // Para o negative
  comparator8to0 COMP (.out(NZVC[2]), .in(result)); // Para o zero
  not_gate NOT_1 (.out(NZVC[1]), .in(1'b1)); // Para o overflow sempre ser 0
  not_gate NOT_2 (.out(NZVC[0]), .in(1'b1)); // Para o carry out sempre ser 0

endmodule