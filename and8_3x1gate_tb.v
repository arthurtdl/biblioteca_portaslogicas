`include "and8_3x1gate.v"

module and8_3x1gate_tb();
    reg [7:0] entrada1;
    reg entrada2;
    reg entrada3;
    wire [7:0] saida;


    and8_3x1gate DUT (.out(saida), .in1(entrada1), .in2(entrada2), .in3(entrada3));

    initial begin
    $dumpfile("and8_3x1gate_tb.vcd");
    $dumpvars(0, and8_3x1gate_tb);

    entrada1 = 8'b00110011;
    entrada2 = 1'b0;
    entrada3 = 1'b0;
    #5;

    entrada1 = 8'b00110011;
    entrada2 = 1'b1;
    entrada3 = 1'b0;
    #5;

    entrada1 = 8'b00110011;
    entrada2 = 1'b0;
    entrada3 = 1'b1;
    #5;

    entrada1 = 8'b00110011;
    entrada2 = 1'b1;
    entrada3 = 1'b1;
    #5;

    end
endmodule