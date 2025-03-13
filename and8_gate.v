`include "and_gate.v"

module and8_gate(output [7:0] out,
                input [7:0] in1, in2);

  and_gate AND0 (.out(out[0]), .in1(in1[0]), .in2(in2[0]));
  and_gate AND1 (.out(out[1]), .in1(in1[1]), .in2(in2[1]));
  and_gate AND2 (.out(out[2]), .in1(in1[2]), .in2(in2[2]));
  and_gate AND3 (.out(out[3]), .in1(in1[3]), .in2(in2[3]));
  and_gate AND4 (.out(out[4]), .in1(in1[4]), .in2(in2[4]));
  and_gate AND5 (.out(out[5]), .in1(in1[5]), .in2(in2[5]));
  and_gate AND6 (.out(out[6]), .in1(in1[6]), .in2(in2[6]));
  and_gate AND7 (.out(out[7]), .in1(in1[7]), .in2(in2[7]));

endmodule