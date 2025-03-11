module latchD (output wire Q, Qn,
              input wire D, C);
  
  wire Sn, Rn, Dn;
  
  not(Dn, D);
  
  nand(Sn, D, C);
  nand(Rn, Dn, C);
  
  nand(Q, Qn, Sn);
  nand(Qn, Q, Rn);
  
endmodule

module flipflopD (output wire Q, Qn,
                 input wire Clk, D);
  
  wire Q1, Clkn;
  
  not(Clkn, Clk);
  
  latchD mestre (.Q(Q1), .Qn(Qn1), .D(D), .C(Clk));
  latch escravo (.Q(Q), .Qn(Qn), .D(Q1), .C(Clkn));
  
endmodule
