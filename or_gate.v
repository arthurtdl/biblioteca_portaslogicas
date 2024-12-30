module or_gate(output out,
               input in1, in2);

  wire A, B;

  nand(A, in1, in1); //Invertendo o sinal de in1
  nand(B, in2, in2); //Invertendo o sinal de in2
  
  nand(out, A, B);

endmodule
