`include "mux_2x1.v"

module mux_2x1_tb();
    wire saida;
    reg A, B;
    reg seletor;

    mux_2x1 DUT (.out(saida), .in1(A), .in2(B), .sel(seletor));

    initial begin
    $dumpfile("mux_2x1_tb.vcd");
    $dumpvars(0, mux_2x1_tb);


    // Teste para sel = 1 (selecionando b)
    A = 1'b0;
    B = 1'b1;
    seletor = 1'b0;
    #5;

    // Teste para sel = 0 (selecionando a)
    A = 1'b0;
    B = 1'b1;
    seletor = 1'b1;
    #5;

    end
endmodule