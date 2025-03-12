`include "latchD.v"

module latchD_tb ();
  
  reg D, C;
  wire Q, Qn;

  latchD DUT (.Q(Q), .Qn(Qn), .D(D), .C(C));

  initial begin
  $dumpfile("latchD_tb.vcd");
  $dumpvars(0, latchD_tb);

  // Inicializando os sinais
  D = 0; C = 1;
  #10;
    
  // Teste 1: D = 0, C = 1 (Q deve ser 0)
  D = 0; C = 1;
  #10;
    
  // Teste 2: D = 1, C = 1 (Q deve ser 1)
  D = 1; C = 1;
  #10;
    
  // Teste 3: D = 1, C = 0 (Q deve manter o valor anterior)
  D = 1; C = 0;
  #10;
    
  // Teste 4: D = 0, C = 0 (Q deve manter o valor anterior)
  D = 0; C = 0;
  #10;
    
  // Teste 5: D = 0, C = 1 (Q deve ser 0 novamente)
  D = 0; C = 1;
  #10;

  end
  
endmodule
