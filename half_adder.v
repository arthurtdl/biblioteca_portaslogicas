`include "and_gate.v"
`include "xor_gate.v"

module half_adder(output sum, cout,
                  input A, B);

  xor_gate XOR (.out(sum), .in1(A), .in2(B));
  and_gate AND (.out(cout), .in1(A), .in2(B));

endmodule