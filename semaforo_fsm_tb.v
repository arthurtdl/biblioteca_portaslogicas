`timescale 1ns/1ps

`include "semaforo_fsm_estrutural.v"

module tb_fsm_estrutural;

  reg CAR;
  reg timeout;
  reg Clock;
  reg Reset;
  wire red, ylw, grn;
  
  fsm_estrutural DUT (.red(red), .ylw(ylw), .grn(grn), .CAR(CAR), .timeout(timeout), .Clock(Clock), .Reset(Reset));
  
  // Geração de clock: período de 10 ns (5 ns high, 5 ns low)
  always #5 Clock = ~Clock;
  
  initial begin
    $dumpfile("fsm_waveform.vcd");
    $dumpvars(0, tb_fsm_estrutural);

    // Inicia com reset ativo (Reset = 0) para definir o estado inicial
    Clock = 1'b0;
    Reset  = 1'b0;
    CAR     = 1'b0;
    timeout = 1'b0;    
    #15;  // Mantém o reset ativo por 15 ns
    
    Reset = 1'b1;  // Libera o reset (Reset sobe para 1), iniciando o FSM em estado definido (verde)
    #10;       // Espera para estabilizar
    
    // Estímulo: transição de verde para amarelo ao detectar carro.
    #20;

    CAR = 1'b1;
    #10;
    CAR = 1'b0;
    #15;
    
    // Estímulo: transição do estado vermelho para verde via timeout.
    timeout = 1'b1;
    #10;
    timeout = 1'b0;
    #20;
    
    $finish;
  end
  
endmodule