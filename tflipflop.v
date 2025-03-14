`include "components_new.v"
`include "xor_gate.v"

module tflipflop (output wire Q,
                  input wire En, T, Res, Load, Din);

  wire xor_out;

  xor_gate XOR (.out(xor_out), .in1(En), .in2(Q));

  dflipflop DFF (.Q(Q), .Qn(), .Clock(T), .Reset(Res), .Preset(), .D(xor_out));

endmodule