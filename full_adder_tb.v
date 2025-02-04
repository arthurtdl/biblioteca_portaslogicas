`include "full_adder.v"

module full_adder_tb();
    reg entrada1, entrada2, carryin;
    wire soma, carryout;

    full_adder DUT (.sum(soma), .cout(carryout), .A(entrada1), .B(entrada2), .cin(carryin));

    initial begin
    $dumpfile("full_adder_tb.vcd");
    $dumpvars(0, full_adder_tb);

    entrada1 = 1'b0;
    entrada2 = 1'b0;
    carryin = 1'b0;
    #5;
    entrada1 = 1'b0;
    entrada2 = 1'b0;
    carryin = 1'b1;
    #5;
    entrada1 = 1'b0;
    entrada2 = 1'b1;
    carryin = 1'b0;
    #5;
    entrada1 = 1'b0;
    entrada2 = 1'b1;
    carryin = 1'b1;
    #5;
    entrada1 = 1'b1;
    entrada2 = 1'b0;
    carryin = 1'b0;
    #5;
    entrada1 = 1'b1;
    entrada2 = 1'b0;
    carryin = 1'b1;
    #5;
    entrada1 = 1'b1;
    entrada2 = 1'b1;
    carryin = 1'b0;
    #5;
    entrada1 = 1'b1;
    entrada2 = 1'b1;
    carryin = 1'b1;
    #5;

    end
endmodule