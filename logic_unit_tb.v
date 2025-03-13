`include "logic_unit.v"

module logic_unit_tb();
    reg [7:0] A, B;
    reg [1:0] sel;
    wire [7:0] result;
    wire [3:0] NZVC;

    logic_unit DUT (.result(result), .NZVC(NZVC), .A(A), .B(B), .sel(sel));

    initial begin
    $dumpfile("logic_unit_tb.vcd");
    $dumpvars(0, logic_unit_tb);


    // Teste 1: A & B (sel = 00)
    A = 8'b01010101;
    B = 8'b10101010;
    sel = 2'b00;
    #5;              

    // Teste 2: A | B (sel = 01)
    A = 8'b01010101;
    B = 8'b10101111;
    sel = 2'b01;
    #5;

    // Teste 3: A ^ B (sel = 10)
    A = 8'b01010101;
    B = 8'b10101111;
    sel = 2'b10;
    #5;

    // Teste 4: ~A (sel = 11)
    A = 8'b01010101;
    sel = 2'b11;
    #5;

    end
endmodule