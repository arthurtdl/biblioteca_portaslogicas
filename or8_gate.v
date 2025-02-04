`include "or_gate.v"

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