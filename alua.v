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


module half_adder(output sum, cout,
                  input A, B);

  xor_gate XOR (.out(sum), .in1(A), .in2(B));
  and_gate AND (.out(cout), .in1(A), .in2(B));

endmodule


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


module mux_4x2 (input   [7:0] in0, in1, // result da arithmetic unit e logic unit
                input   [3:0] in2, in3, // NZVC da arithmetic unit e logic unit
                input   sel,            // Bit seletor
                output  [7:0] out_8,    // result escolhido
                output  [3:0] out_4);   // NZVC escolhido
    
    wire sel_n;
    not_gate NEG (.out(sel_n), .in(sel));
    
    wire [7:0] in0_and, in1_and;
    wire in2_and_0, in2_and_1, in2_and_2, in2_and_3;
    wire in3_and_0, in3_and_1, in3_and_2, in3_and_3;
    
    and8_3x1gate AND0 (.out(in0_and), .in1(in0), .in2(sel_n), .in3(sel_n));
    
    and8_3x1gate AND1 (.out(in1_and), .in1(in1), .in2(sel), .in3(sel));
    
    or8_gate OR0 (.out(out_8), .in1(in0_and), .in2(in1_and));
    
    and_gate AND2 (.out(in2_and_0), .in1(in2[0]), .in2(sel_n));
    and_gate AND3 (.out(in2_and_1), .in1(in2[1]), .in2(sel_n));
    and_gate AND4 (.out(in2_and_2), .in1(in2[2]), .in2(sel_n));
    and_gate AND5 (.out(in2_and_3), .in1(in2[3]), .in2(sel_n));
    
    and_gate AND6 (.out(in3_and_0), .in1(in3[0]), .in2(sel));
    and_gate AND7 (.out(in3_and_1), .in1(in3[1]), .in2(sel));
    and_gate AND8 (.out(in3_and_2), .in1(in3[2]), .in2(sel));
    and_gate AND9 (.out(in3_and_3), .in1(in3[3]), .in2(sel));
    
    or_gate OR1 (.out(out_4[0]), .in1(in2_and_0), .in2(in3_and_0));
    or_gate OR2 (.out(out_4[1]), .in1(in2_and_1), .in2(in3_and_1));
    or_gate OR3 (.out(out_4[2]), .in1(in2_and_2), .in2(in3_and_2));
    or_gate OR4 (.out(out_4[3]), .in1(in2_and_3), .in2(in3_and_3));
    
endmodule


module alua(output [7:0] result, output [3:0] NZVC,
            input [7:0] A, B,
            input [2:0] sel);

  wire [7:0] ar_result, lo_result;
  wire [3:0] ar_NZVC, lo_NZVC;

  // Transformando os dois bits menos significativos do sel em um wire de 2 bits
  wire [1:0] sel_2b;
  and_gate AND_SEL0 (.out(sel_2b[0]), .in1(sel[0]), .in2(1'b1)); // Mantém o valor de sel[0]
  and_gate AND_SEL1 (.out(sel_2b[1]), .in1(sel[1]), .in2(1'b1)); // Mantém o valor de sel[1]

  arithmetic_unit AR_UNIT (.result(ar_result), .NZVC(ar_NZVC), .A(A), .B(B), .sel(sel_2b));
  logic_unit LO_UNIT (.result(lo_result), .NZVC(lo_NZVC), .A(A), .B(B), .sel(sel_2b));

  // Aplicando o bit mais significativo para escolher entre o arithmetic e o logic através do mux_4x2
  mux_4x2 MUX (.out_8(result), .out_4(NZVC), .in0(ar_result), .in1(lo_result), .in2(ar_NZVC), .in3(lo_NZVC), .sel(sel[2]));

endmodule