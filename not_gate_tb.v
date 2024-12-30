`include "not_gate.v"
module not_gate_tb();
    reg entrada;
    wire saida;

    not_gate DUT (.in(entrada), .out(saida));

    initial begin
      $dumpfile("not_gate_tb.vcd");
      $dumpvars(0, not_gate_tb);

      entrada = 1'b0;
      #5;
      entrada = 1'b1;
      #5;
    end
endmodule