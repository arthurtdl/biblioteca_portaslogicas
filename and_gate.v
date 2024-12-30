module and_gate(output out,
                input in1, in2);
    wire A;

  	nand(A, in1, in2);
    nand(out, A, A); // Mesma lógica da porta NOT

endmodule
