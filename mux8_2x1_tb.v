`include "mux8_2x1.v"

module mux8_2x1_tb();
    wire [7:0] saida;
    reg [7:0] A, B;
    reg seletor;

    mux8_2x1 DUT (.out(saida), .in1(A), .in2(B), .sel(seletor));

    initial begin
    $dumpfile("mux8_2x1_tb.vcd");
    $dumpvars(0, mux8_2x1_tb);


    // Teste para sel = 0 (selecionando b)
    A = 8'b00000000;
    B = 8'b11111111;
    seletor = 1'b0;
    #5;

    // Teste para sel = 1 (selecionando a)
    A = 8'b00000000;
    B = 8'b11111111;
    seletor = 2'b1;
    #5;

    end
endmodule