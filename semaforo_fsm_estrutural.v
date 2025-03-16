`include "and_gate.v"
`include "not_gate.v"
`include "or_gate.v"
`include "components_new.v"

module fsm_estrutural (output wire red, ylw, grn,
                       input wire CAR, timeout, Clock);

  wire and0_ff1, and1_ff1;
  wire and_ff2, or_ff2, not_ff2;
  wire y1n, y2n;

  // Lógica de entrada para o próximo estado do flip-flop 1
  and_gate AND0 (.out(and0_ff1), .in1(y1n), .in2(y2n));
  and_gate AND1 (.out(and1_ff1), .in1(and0_ff1), .in2(CAR));

  // Lógica de entrada para o próximo estado do flip-flop 2
  not_gate NOT0 (.out(not_ff2), .in(timeout));
  and_gate AND2 (.out(and_ff2), .in1(red), .in2(not_ff2));
  or_gate OR0 (.out(or_ff2), .in1(and_ff2), .in2(ylw));

  // Memoria/flip-flop's
  dflipflop FF1 (.Q(ylw), .Qn(y1n), .Clock(Clock), .Reset(), .Preset(), .D(and1_ff1));
  dflipflop FF2 (.Q(red), .Qn(y2n), .Clock(Clock), .Reset(), .Preset(), .D(or_ff2));

  // Lógica de saída para o grn
  and_gate AND3 (.out(grn), .in1(y1n), .in2(y2n));

endmodule