module latchD (output reg Q, Qn,
              input wire D, C);
  
  wire Sn, Rn, Dn;
  
  nand(Sn, D, C);
  nand(Rn, Dn, C);
  
  nand(Q, Qn, Sn);
  nand(Qn, Q, Rn);
  
endmodule
