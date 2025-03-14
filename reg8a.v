`include "components_new.v"
`include "and_gate.v"

module reg8a (output wire [7:0] reg_out,
              input wire Clk, Res, En,
              input wire [7:0] reg_in);

  wire enabled_clk;

  and_gate AND0 (.out(enabled_clk), .in1(Clk), .in2(En));

  dflipflop ff0 (.Q(reg_out[0]), .Qn(), .Clock(enabled_clk), .Reset(Res), .Preset(), .D(reg_in[0]));
  dflipflop ff1 (.Q(reg_out[1]), .Qn(), .Clock(enabled_clk), .Reset(Res), .Preset(), .D(reg_in[1]));
  dflipflop ff2 (.Q(reg_out[2]), .Qn(), .Clock(enabled_clk), .Reset(Res), .Preset(), .D(reg_in[2]));
  dflipflop ff3 (.Q(reg_out[3]), .Qn(), .Clock(enabled_clk), .Reset(Res), .Preset(), .D(reg_in[3]));
  dflipflop ff4 (.Q(reg_out[4]), .Qn(), .Clock(enabled_clk), .Reset(Res), .Preset(), .D(reg_in[4]));
  dflipflop ff5 (.Q(reg_out[5]), .Qn(), .Clock(enabled_clk), .Reset(Res), .Preset(), .D(reg_in[5]));
  dflipflop ff6 (.Q(reg_out[6]), .Qn(), .Clock(enabled_clk), .Reset(Res), .Preset(), .D(reg_in[6]));
  dflipflop ff7 (.Q(reg_out[7]), .Qn(), .Clock(enabled_clk), .Reset(Res), .Preset(), .D(reg_in[7]));

endmodule