`include "mux8_4x1.v"

module mux8_4x1_tb();
    wire [7:0] saida;
    reg [7:0] A, B, C, D;
    reg [1:0] seletor;

    mux8_4x1 DUT (.out(saida), .a(A), .b(B), .c(C), .d(D), .sel(seletor));

    initial begin
    $dumpfile("mux8_4x1_tb.vcd");
    $dumpvars(0, mux8_4x1_tb);


    // Teste para sel = 00 (selecionando a)
    A = 8'b00000000;
    B = 8'b11111111;
    C = 8'b10101010;
    D = 8'b01010101;
    seletor = 2'b00;
    #5;

    // Teste para sel = 01 (selecionando b)
    A = 8'b00000000;
    B = 8'b11111111;
    C = 8'b10101010;
    D = 8'b01010101;
    seletor = 2'b01;
    #5;

    // Teste para sel = 10 (selecionando c)
    A = 8'b00000000;
    B = 8'b11111111;
    C = 8'b10101010;
    D = 8'b01010101;
    seletor = 2'b10;
    #5;

    // Teste para sel = 11 (selecionando d)
    A = 8'b00000000;
    B = 8'b11111111;
    C = 8'b10101010;
    D = 8'b01010101;
    seletor = 2'b11;
    #5;

    end
endmodule