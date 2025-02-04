`include "not_gate.v"
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