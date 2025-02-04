`include "half_adder.v"

module half_adder_tb();
    reg entrada1, entrada2;
    wire soma, carryout;

    half_adder DUT (.sum(soma), .cout(carryout), .A(entrada1), .B(entrada2));

    initial begin
    $dumpfile("half_adder_tb.vcd");
    $dumpvars(0, half_adder_tb);

    entrada1 = 1'b0;
    entrada2 = 1'b0;
    #5;
    entrada1 = 1'b0;
    entrada2 = 1'b1;
    #5;
    entrada1 = 1'b1;
    entrada2 = 1'b0;
    #5;
    entrada1 = 1'b1;
    entrada2 = 1'b1;
    #5;

    end
endmodule