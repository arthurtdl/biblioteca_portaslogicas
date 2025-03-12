`include "latchD.v"

module flipflopD (output wire Q, Qn,
                 input wire Clk, D);
  
  wire Q1, Q1n, Clkn;
  
  not_gate NOT (Clkn, Clk);
  
  latchD mestre (.Q(Q1), .Qn(Qn1), .D(D), .C(Clkn));
  latchD escravo (.Q(Q), .Qn(Qn), .D(Q1), .C(Clk));
  
endmodule
