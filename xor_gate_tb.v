`include "xor_gate.v"
module xor_gate_tb();
    reg entrada1;
    reg entrada2;
    wire saida;

    xor_gate DUT (.in1(entrada1), .in2(entrada2), .out(saida));

    initial begin
    $dumpfile("xor_gate_tb.vcd");
    $dumpvars(0, xor_gate_tb);

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