`include "eightbit_adder.v"

module eightbit_adder_tb();
    reg [7:0] entrada1;
    reg [7:0] entrada2;
    reg carryin;
    wire [7:0] soma;
    wire carryout;
    wire overflow;

    eightbit_adder DUT (.sum(soma), .cout(carryout), .overflow(overflow), .A(entrada1), .B(entrada2), .cin(carryin));

    initial begin
    $dumpfile("eightbit_adder_tb.vcd");
    $dumpvars(0, eightbit_adder_tb);

    // Somando os números 54 e 15
    entrada1 = 8'b00110110;
    entrada2 = 8'b00001111;
    carryin = 1'b0;
    #5;

    // 64 + 64 (overflow esperado)
    entrada1 = 8'b01000000;
    entrada2 = 8'b01000000;
    carryin = 1'b0;
    #5;

    // 77 - 77
    entrada1 = 8'b10110011;
    entrada2 = 8'b01001101;
    carryin = 1'b0;
    #5;

    end
endmodule