`include "xor8_gate.v"

module xor8_gate_tb();
    reg [7:0] entrada1;
    reg [7:0] entrada2;
    wire [7:0] saida;


    xor8_gate DUT (.out(saida), .in1(entrada1), .in2(entrada2));

    initial begin
    $dumpfile("xor8_gate_tb.vcd");
    $dumpvars(0, xor8_gate_tb);

    entrada1 = 8'b00110011;
    entrada2 = 8'b11001100;
    #5;

    entrada1 = 8'b10101010;
    entrada2 = 8'b11110000;
    #5;

    end
endmodule