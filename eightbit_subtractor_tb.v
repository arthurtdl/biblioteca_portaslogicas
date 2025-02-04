`include "eightbit_subtractor.v"

module eightbit_subtractor_tb();
    reg [7:0] entrada1;
    reg [7:0] entrada2;
    wire [7:0] diferenca;
    wire overflow;
    wire cout;

    eightbit_subtractor DUT (.diff(diferenca), .overflow(overflow), .cout(cout), .A(entrada1), .B(entrada2));

    initial begin
    $dumpfile("eightbit_subtractor_tb.vcd");
    $dumpvars(0, eightbit_subtractor_tb);

    // 54 - 15
    entrada1 = 8'b00110110;
    entrada2 = 8'b00001111;
    #5;

    // -128 - 1 (overflow esperado)
        entrada1 = 8'b10000000; // -128 (complemento de dois)
        entrada2 = 8'b00000001; // 1
        #5;

    // 127 - (-1) (overflow esperado)
        entrada1 = 8'b01111111; // 127
        entrada2 = 8'b11111111; // -1 (complemento de dois)
        #5;

    end
endmodule