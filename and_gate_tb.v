`include "and_gate.v"
module and_gate_tb();
    reg entrada1;
    reg entrada2;
    wire saida;

    and_gate DUT (.in1(entrada1), .in2(entrada2), .out(saida));

    initial begin
    $dumpfile("and_gate_tb.vcd");
    $dumpvars(0, and_gate_tb);

    entrada1 = 1'b0;
    entrada2 = 1'b0;
    #5;
    entrada1 = 1'b0;
    entrada2 = 1'b1;
    #5;
    entrada1 = 1'b1;
    entrada2 = 1'b0;
    #5;
    entrada1 = 1'b1;
    entrada2 = 1'b1;
    #5;

    end
endmodule