`include "components_new.v"
`include "xor_gate.v"
`include "mux_2x1.v"

module tflipflop (output wire Q,
                  input wire En, T, Res, Load, Din);

  wire xor_out;
  wire mux_out;

  xor_gate XOR (.out(xor_out), .in1(En), .in2(Q));

  mux_2x1 MUX (.out(mux_out), .sel(Load), .in1(xor_out), .in2(Din));

  dflipflop DFF (.Q(Q), .Qn(), .Clock(T), .Reset(Res), .Preset(), .D(mux_out));

endmodule