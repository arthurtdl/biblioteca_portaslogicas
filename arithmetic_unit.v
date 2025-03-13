`include "full_adder.v"
`include "not_gate.v"


module eightbit_adder(output [7:0] sum, output overflow, output cout,
                      input [7:0] A, input [7:0] B, input cin);

  wire cout0_1, cout1_2, cout2_3, cout3_4, cout4_5, cout5_6, cout6_7;

  full_adder SUM0 (.sum(sum[0]), .cout(cout0_1), .A(A[0]), .B(B[0]), .cin(cin));
  full_adder SUM1 (.sum(sum[1]), .cout(cout1_2), .A(A[1]), .B(B[1]), .cin(cout0_1));
  full_adder SUM2 (.sum(sum[2]), .cout(cout2_3), .A(A[2]), .B(B[2]), .cin(cout1_2));
  full_adder SUM3 (.sum(sum[3]), .cout(cout3_4), .A(A[3]), .B(B[3]), .cin(cout2_3));
  full_adder SUM4 (.sum(sum[4]), .cout(cout4_5), .A(A[4]), .B(B[4]), .cin(cout3_4));
  full_adder SUM5 (.sum(sum[5]), .cout(cout5_6), .A(A[5]), .B(B[5]), .cin(cout4_5));
  full_adder SUM6 (.sum(sum[6]), .cout(cout6_7), .A(A[6]), .B(B[6]), .cin(cout5_6));
  full_adder SUM7 (.sum(sum[7]), .cout(cout), .A(A[7]), .B(B[7]), .cin(cout6_7));

  // Verificando se houve overflow
  xor_gate XOR (.out(overflow), .in1(cout), .in2(cout6_7));

endmodule


module eightbit_not(output [7:0] out,
                    input [7:0] in);

  not_gate NEG0 (.out(out[0]), .in(in[0]));
  not_gate NEG1 (.out(out[1]), .in(in[1]));
  not_gate NEG2 (.out(out[2]), .in(in[2]));
  not_gate NEG3 (.out(out[3]), .in(in[3]));
  not_gate NEG4 (.out(out[4]), .in(in[4]));
  not_gate NEG5 (.out(out[5]), .in(in[5]));
  not_gate NEG6 (.out(out[6]), .in(in[6]));
  not_gate NEG7 (.out(out[7]), .in(in[7]));

endmodule


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


module or8_gate(output [7:0] out,
                input [7:0] in1, in2);

  or_gate OR0 (.out(out[0]), .in1(in1[0]), .in2(in2[0]));
  or_gate OR1 (.out(out[1]), .in1(in1[1]), .in2(in2[1]));
  or_gate OR2 (.out(out[2]), .in1(in1[2]), .in2(in2[2]));
  or_gate OR3 (.out(out[3]), .in1(in1[3]), .in2(in2[3]));
  or_gate OR4 (.out(out[4]), .in1(in1[4]), .in2(in2[4]));
  or_gate OR5 (.out(out[5]), .in1(in1[5]), .in2(in2[5]));
  or_gate OR6 (.out(out[6]), .in1(in1[6]), .in2(in2[6]));
  or_gate OR7 (.out(out[7]), .in1(in1[7]), .in2(in2[7]));

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


module mux_4x1(output out,
               input wire a, b, c, d, 
               input wire [1:0] sel);

  wire A, B, C, D;
  wire and_A, and_B, and_C, and_D;
  wire sel0_neg, sel1_neg;
  wire or_1, or_2;

  // Fazendo as negações para sel[0] e sel[1]
  not_gate NEG1 (.out(sel0_neg), .in(sel[0]));
  not_gate NEG2 (.out(sel1_neg), .in(sel[1]));

 // Fazendo as combinações com as portas and e a chave seletora
 
 // Para "a" temos 2'b00
  and_gate AND1 (.out(A), .in1(sel1_neg), .in2(sel0_neg));
  and_gate AND_1 (.out(and_A), .in1(A), .in2(a));

// Para "b" temos 2'b01
  and_gate AND2 (.out(B), .in1(sel1_neg), .in2(sel[0]));
  and_gate AND_2 (.out(and_B), .in1(B), .in2(b));

// Para "c" temos 2'b10
  and_gate AND3 (.out(C), .in1(sel[1]), .in2(sel0_neg));
  and_gate AND_3 (.out(and_C), .in1(C), .in2(c));

// Para "d" temos 2'b11
  and_gate AND4 (.out(D), .in1(sel[1]), .in2(sel[0]));
  and_gate AND_4 (.out(and_D), .in1(D), .in2(d));

// Juntando tudo numa porta or

// ("a" ou "b") ou ("c" ou "d")
  or_gate OR1 (.out(or_1), .in1(and_A), .in2(and_B));
  or_gate OR2 (.out(or_2), .in1(and_C), .in2(and_D));
  or_gate OR3 (.out(out), .in1(or_1), .in2(or_2));

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


module arithmetic_unit(output [7:0] result, output [3:0] NZVC,
                      input [7:0] A, input [7:0] B, input [1:0] sel);

  wire [7:0] sum, diff, sum_one, diff_one;
  wire [7:0] B_neg;

  wire bout_diff, bout_diff_one;

  wire cout_sum, cout_diff, cout_sum_one, cout_diff_one;
  wire overflow_sum, overflow_diff, overflow_sum_one, overflow_diff_one;

  // Invertendo o valor para B_neg
  eightbit_not NEG0 (.out(B_neg), .in(B));

  // Para sel = 1'b00
  eightbit_adder SUM (.sum(sum), .overflow(overflow_sum), .cout(cout_sum), .A(A), .B(B), .cin(1'b0));

  // Para sel = 1'b01
  eightbit_adder SUM_ONE (.sum(sum_one), .overflow(overflow_sum_one), .cout(cout_sum_one), .A(A), .B(8'b00000001), .cin(1'b0));

  // Para sel = 1'b10
  eightbit_adder DIFF (.sum(diff), .overflow(overflow_diff), .cout(cout_diff), .A(A), .B(B_neg), .cin(1'b1));
  not_gate NEG1 (.out(bout_diff), .in(cout_diff)); // Invertendo o cout para o bout

  // Para sel = 1'b11
  eightbit_adder DIFF_ONE (.sum(diff_one), .overflow(overflow_diff_one), .cout(cout_diff_one), .A(A), .B(8'b11111110), .cin(1'b1));
  not_gate NEG2 (.out(bout_diff_one), .in(cout_diff_one)); // Invertendo o cout para o bout

  // Aplicação do MUX8_4x1 para relacionar o resultado correto
  mux8_4x1 MUX0 (.out(result), .a(sum), .b(sum_one), .c(diff), .d(diff_one), .sel(sel));

  // Aplicação do NZVC
  and_gate AND (.out(NZVC[3]), .in1(result[7]), .in2(1'b1)); // Para o negative
  comparator8to0 COMP (.out(NZVC[2]), .in(result)); // Para o zero
  mux_4x1 MUX1 (.out(NZVC[1]), .a(overflow_sum), .b(overflow_sum_one), .c(overflow_diff), .d(overflow_diff_one), .sel(sel)); // Para o overflow
  mux_4x1 MUX2 (.out(NZVC[0]), .a(cout_sum), .b(cout_sum_one), .c(bout_diff), .d(bout_diff_one), .sel(sel)); // Para o carry out


endmodule