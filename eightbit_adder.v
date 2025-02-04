`include "full_adder.v"

module eightbit_adder(output [7:0] sum, output overflow, output cout,
                      input [7:0] A, input [7:0] B, input cin);

  wire cout0_1, cout1_2, cout2_3, cout3_4, cout4_5, cout5_6, cout6_7;

  full_adder SUM0 (.sum(sum[0]), .cout(cout0_1), .A(A[0]), .B(B[0]), .cin(cin));
  full_adder SUM1 (.sum(sum[1]), .cout(cout1_2), .A(A[1]), .B(B[1]), .cin(cout0_1));
  full_adder SUM2 (.sum(sum[2]), .cout(cout2_3), .A(A[2]), .B(B[2]), .cin(cout1_2));
  full_adder SUM3 (.sum(sum[3]), .cout(cout3_4), .A(A[3]), .B(B[3]), .cin(cout2_3));
  full_adder SUM4 (.sum(sum[4]), .cout(cout4_5), .A(A[4]), .B(B[4]), .cin(cout3_4));
  full_adder SUM5 (.sum(sum[5]), .cout(cout5_6), .A(A[5]), .B(B[5]), .cin(cout4_5));
  full_adder SUM6 (.sum(sum[6]), .cout(cout6_7), .A(A[6]), .B(B[6]), .cin(cout5_6));
  full_adder SUM7 (.sum(sum[7]), .cout(cout), .A(A[7]), .B(B[7]), .cin(cout6_7));

  // Verificando se houve overflow
  xor_gate XOR (.out(overflow), .in1(cout), .in2(cout6_7));

endmodule