`include "not_gate.v"

module latchD (output wire Q, Qn,
              input wire D, C);
  
  wire Sn, Rn, Dn;
  
  not_gate NOT (Dn, D);
  
  nand(Sn, D, C);
  nand(Rn, Dn, C);
  
  nand(Q, Qn, Sn);
  nand(Qn, Q, Rn);
  
endmodule
