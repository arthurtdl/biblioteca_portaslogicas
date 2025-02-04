`include "eightbit_adder.v"
`include "eightbit_not.v"
`include "mux8_4x1.v"

  module arithmetic_unit(output [7:0] result, output [3:0] NZVC,
                        input [7:0] A, input [7:0] B, input [1:0] sel);

  wire [7:0] sum, diff, sum_one, diff_one;
  wire [1:0] sel;  // Seletor para o mux
  wire [7:0] B_neg;

  // Invertendo o valor para B_neg
  eightbit_not NEG (.out(B_neg), .in(B));

  // Para sel = 1'b00
  eightbit_adder SUM (.sum(sum), .A(A), .B(B), .cin(1'b0));

  // Para sel = 1'b01
  eightbit_adder SUM_ONE (.sum(sum_one), .A(A), .B(8'b00000001), .cin(1'b0));

  // Para sel = 1'b10
  eightbit_adder DIFF (.diff(diff), .A(A), .B(B_neg), .cin(1'b1));

  // Para sel = 1'b10
  eightbit_adder DIFF_ONE (.diff(diff_one), .A(A), .B(8'b11111110), .cin(1'b1));

  // Aplicação do MUX8_4x1
  mux8_4x1 MUX (.out(result), .a(sum), .b(sum_one), .c(diff), .d(diff_one), .sel(sel));

endmodule