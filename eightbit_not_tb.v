`include "eightbit_not.v"

module eightbit_not_tb();
    reg [7:0] entrada;
    wire [7:0] saida;

    eightbit_not DUT (.out(saida), .in(entrada));

    initial begin
    $dumpfile("eightbit_not_tb.vcd");
    $dumpvars(0, eightbit_not_tb);

    entrada = 8'b00000000;
    #5;
    entrada = 8'b00110011;
    #5;

    end
endmodule