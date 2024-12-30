`include "or_gate.v"
module or_gate_tb();
    reg entrada1;
    reg entrada2;
    wire saida;

    or_gate DUT(.in1(entrada1), .in2(entrada2), .out(saida));

    initial begin
    $dumpfile("or_gate_tb.vcd");
    $dumpvars(0, or_gate_tb);

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