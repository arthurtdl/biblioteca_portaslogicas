`include "and_gate.v"
`include "tflipflop.v"

module counta (output wire [7:0] cnt,
               input wire Clk, Res, En, Load,
               input wire [7:0] cnt_in);

  wire ff0_ff1, ff1_ff2, ff2_ff3, ff3_ff4, ff4_ff5, ff5_ff6, ff6_ff7;

  and_gate AND0 (.out(ff0_ff1), .in1(cnt[0]), .in2(En));
  and_gate AND1 (.out(ff1_ff2), .in1(cnt[1]), .in2(ff0_ff1));
  and_gate AND2 (.out(ff2_ff3), .in1(cnt[2]), .in2(ff1_ff2));
  and_gate AND3 (.out(ff3_ff4), .in1(cnt[3]), .in2(ff2_ff3));
  and_gate AND4 (.out(ff4_ff5), .in1(cnt[4]), .in2(ff3_ff4));
  and_gate AND5 (.out(ff5_ff6), .in1(cnt[5]), .in2(ff4_ff5));
  and_gate AND6 (.out(ff6_ff7), .in1(cnt[6]), .in2(ff5_ff6));

  tflipflop T0 (.Q(cnt[0]), .En(En), .T(Clk), .Res(Res), .Pres());
  tflipflop T1 (.Q(cnt[1]), .En(ff0_ff1), .T(Clk), .Res(Res), .Pres());
  tflipflop T2 (.Q(cnt[2]), .En(ff1_ff2), .T(Clk), .Res(Res), .Pres());
  tflipflop T3 (.Q(cnt[3]), .En(ff2_ff3), .T(Clk), .Res(Res), .Pres());
  tflipflop T4 (.Q(cnt[4]), .En(ff3_ff4), .T(Clk), .Res(Res), .Pres());
  tflipflop T5 (.Q(cnt[5]), .En(ff4_ff5), .T(Clk), .Res(Res), .Pres());
  tflipflop T6 (.Q(cnt[6]), .En(ff5_ff6), .T(Clk), .Res(Res), .Pres());
  tflipflop T7 (.Q(cnt[7]), .En(ff6_ff7), .T(Clk), .Res(Res), .Pres());

endmodule