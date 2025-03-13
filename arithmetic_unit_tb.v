`include "arithmetic_unit.v"

module arithmetic_unit_tb();
    reg [7:0] A, B;
    reg [1:0] sel;
    wire [7:0] result;
    wire [3:0] NZVC;

    arithmetic_unit DUT (.result(result), .NZVC(NZVC), .A(A), .B(B), .sel(sel));

    initial begin
    $dumpfile("arithmetic_unit_tb.vcd");
    $dumpvars(0, arithmetic_unit_tb);


    // Teste 1: A + B (sel = 00)
    A = 8'b00000010;  // A = 2
    B = 8'b00000011;  // B = 3
    sel = 2'b00;      // A + B
    #5;              

    // Teste 2: A + 1 (sel = 01)
    A = 8'b00000010;  // A = 2
    // B = 1
    sel = 2'b01;      // A + 1
    #5;

    // Teste 3: A - B (sel = 10)
    A = 8'b00000010;  // A = 2
    B = 8'b00000011;  // B = 3
    sel = 2'b10;      // A - B
    #5;

    // Teste 4: A - 1 (sel = 11)
    A = 8'b00000010;  // A = 2
    // B = 0
    sel = 2'b11;      // A - 1
    #5;

    end
endmodule