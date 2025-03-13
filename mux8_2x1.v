`include "or8_gate.v"
`include "and_gate.v"
`include "not_gate.v"

module mux8_2x1 (output wire [7:0] out,
                 input wire [7:0] in1, in2,
                 input wire sel);
    
  wire sel_n;
  wire [7:0] out_1, out_2;

  // Negação da chave seletora
  not_gate NOT (.out(sel_n), .in(sel));

  // Combinando as entradas de 8 bits com as portas AND e a chave seletora
  and_gate AND0_in1 (.out(out_1[0]), .in1(in1[0]), .in2(sel));
  and_gate AND1_in1 (.out(out_1[1]), .in1(in1[1]), .in2(sel));
  and_gate AND2_in1 (.out(out_1[2]), .in1(in1[2]), .in2(sel));
  and_gate AND3_in1 (.out(out_1[3]), .in1(in1[3]), .in2(sel));
  and_gate AND4_in1 (.out(out_1[4]), .in1(in1[4]), .in2(sel));
  and_gate AND5_in1 (.out(out_1[5]), .in1(in1[5]), .in2(sel));
  and_gate AND6_in1 (.out(out_1[6]), .in1(in1[6]), .in2(sel));
  and_gate AND7_in1 (.out(out_1[7]), .in1(in1[7]), .in2(sel));

  and_gate AND0_in2 (.out(out_2[0]), .in1(in2[0]), .in2(sel_n));
  and_gate AND1_in2 (.out(out_2[1]), .in1(in2[1]), .in2(sel_n));
  and_gate AND2_in2 (.out(out_2[2]), .in1(in2[2]), .in2(sel_n));
  and_gate AND3_in2 (.out(out_2[3]), .in1(in2[3]), .in2(sel_n));
  and_gate AND4_in2 (.out(out_2[4]), .in1(in2[4]), .in2(sel_n));
  and_gate AND5_in2 (.out(out_2[5]), .in1(in2[5]), .in2(sel_n));
  and_gate AND6_in2 (.out(out_2[6]), .in1(in2[6]), .in2(sel_n));
  and_gate AND7_in2 (.out(out_2[7]), .in1(in2[7]), .in2(sel_n));

  // Juntando tudo na porta OR para gerar a saída final
  or8_gate OR (.out(out), .in1(out_1), .in2(out_2));

endmodule