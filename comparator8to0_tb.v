`include "comparator8to0.v"

module comparator8to0_tb();
    reg [7:0] entrada;
    wire saida;


    comparator8to0 DUT (.out(saida), .in(entrada));

    initial begin
    $dumpfile("comparator8to0_tb.vcd");
    $dumpvars(0, comparator8to0_tb);

    entrada = 8'b00000000;
    #5;

    entrada = 8'b10101010;
    #5;

    entrada = 8'b00000001;
    #5;

    end
endmodule