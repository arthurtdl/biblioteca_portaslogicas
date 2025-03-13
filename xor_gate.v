module xor_gate(output out,
               input in1, in2);
  wire A, B, C;
  
  nand(A, in1, in2);
  nand(B, in1, A);
  nand(C, in2, A);
  nand(out, B, C);
  
endmodule