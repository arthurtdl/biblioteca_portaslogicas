`include "xor_gate.v"

module xor8_gate(output [7:0] out,
                input [7:0] in1, in2);

  xor_gate XOR0 (.out(out[0]), .in1(in1[0]), .in2(in2[0]));
  xor_gate XOR1 (.out(out[1]), .in1(in1[1]), .in2(in2[1]));
  xor_gate XOR2 (.out(out[2]), .in1(in1[2]), .in2(in2[2]));
  xor_gate XOR3 (.out(out[3]), .in1(in1[3]), .in2(in2[3]));
  xor_gate XOR4 (.out(out[4]), .in1(in1[4]), .in2(in2[4]));
  xor_gate XOR5 (.out(out[5]), .in1(in1[5]), .in2(in2[5]));
  xor_gate XOR6 (.out(out[6]), .in1(in1[6]), .in2(in2[6]));
  xor_gate XOR7 (.out(out[7]), .in1(in1[7]), .in2(in2[7]));

endmodule