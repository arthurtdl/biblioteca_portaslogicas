`include "and_gate.v"
`include "or_gate.v"
`include "not_gate.v"

module mux_2x1 (output wire out,
                input wire in1, in2, sel);

  wire sel_n;
  wire out_0, out_1;

  not_gate NOT (.out(sel_n), .in(sel));

  and_gate AND0 (.out(out_0), .in1(sel_n), .in2(in1));
  and_gate AND1 (.out(out_1), .in1(sel), .in2(in2));

  or_gate OR (.out(out), .in1(out_0), .in2(out_1));

endmodule