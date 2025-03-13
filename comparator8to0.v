`include "or_gate.v"
`include "not_gate.v"

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