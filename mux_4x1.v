`include "and_gate.v"
`include "not_gate.v"
`include "or_gate.v"



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