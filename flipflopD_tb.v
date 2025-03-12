`include "flipflopD.v"

module flipflopD_tb ();
  
  reg D, Clk;
  wire Q, Qn;

  flipflopD DUT (.Q(Q), .Qn(Qn), .D(D), .Clk(Clk));

  initial begin
  $dumpfile("flipflop_tb.vcd");
  $dumpvars(0, flipflopD_tb);

  // Inicializando os sinais
  D = 0; Clk = 0;
  #10;
    
  // Teste 1: Subida do Clock com D = 1 (Q deve ser 1)
  D = 1; Clk = 1;
  #10;
    
  // Teste 2: Variação do D com o Clock no nivel 1 (Q deve manter o valor anterior)
  D = 0; Clk = 1;
  #10;
    
  // Teste 3: Descida do Clock (Q deve manter o valor anterior)
  D = 0; Clk = 0;
  #10;
    
  // Teste 4: Subida do Clock com D = 0 (Q deve ser 0)
  D = 0; Clk = 1;
  #10;
    
  end
  
endmodule
