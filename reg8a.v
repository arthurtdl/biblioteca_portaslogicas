`include "components_new.v"
`include "mux8_2x1.v"

module reg8a (
    output wire [7:0] reg_out,
    input  wire       Clk,
    input  wire       Res,
    input  wire       En,
    input  wire [7:0] reg_in);

  wire [7:0] mux_out;

  mux8_2x1 mux_inst (.out(mux_out), .in1(reg_in), .in2(reg_out), .sel(En));

  // Cada flipflop captura o respectivo bit da saída do mux na borda de subida do clock
  dflipflop ff0 (.Q(reg_out[0]), .Qn(), .Clock(Clk), .Reset(Res), .Preset(), .D(mux_out[0]));
  dflipflop ff1 (.Q(reg_out[1]), .Qn(), .Clock(Clk), .Reset(Res), .Preset(), .D(mux_out[1]));
  dflipflop ff2 (.Q(reg_out[2]), .Qn(), .Clock(Clk), .Reset(Res), .Preset(), .D(mux_out[2]));
  dflipflop ff3 (.Q(reg_out[3]), .Qn(), .Clock(Clk), .Reset(Res), .Preset(), .D(mux_out[3]));
  dflipflop ff4 (.Q(reg_out[4]), .Qn(), .Clock(Clk), .Reset(Res), .Preset(), .D(mux_out[4]));
  dflipflop ff5 (.Q(reg_out[5]), .Qn(), .Clock(Clk), .Reset(Res), .Preset(), .D(mux_out[5]));
  dflipflop ff6 (.Q(reg_out[6]), .Qn(), .Clock(Clk), .Reset(Res), .Preset(), .D(mux_out[6]));
  dflipflop ff7 (.Q(reg_out[7]), .Qn(), .Clock(Clk), .Reset(Res), .Preset(), .D(mux_out[7]));

endmodule