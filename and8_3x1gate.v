`include "and_gate.v"

module and8_3x1gate(output [7:0] out,
                  input [7:0] in1, input in2, in3);

  wire in2_and_in3;

  // And para uma entrada de 8 bits e duas de 1 bit (usada em mux8_4x1)
  
  and_gate AND0_0 (.out(in2_and_in3), .in1(in2), .in2(in3));

  and_gate AND1 (.out(out[0]), .in1(in1[0]), .in2(in2_and_in3));
  and_gate AND2 (.out(out[1]), .in1(in1[1]), .in2(in2_and_in3));
  and_gate AND3 (.out(out[2]), .in1(in1[2]), .in2(in2_and_in3));
  and_gate AND4 (.out(out[3]), .in1(in1[3]), .in2(in2_and_in3));
  and_gate AND5 (.out(out[4]), .in1(in1[4]), .in2(in2_and_in3));
  and_gate AND6 (.out(out[5]), .in1(in1[5]), .in2(in2_and_in3));
  and_gate AND7 (.out(out[6]), .in1(in1[6]), .in2(in2_and_in3));
  and_gate AND8 (.out(out[7]), .in1(in1[7]), .in2(in2_and_in3));

endmodule