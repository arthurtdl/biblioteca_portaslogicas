`include "tflipflop.v"

module tflipflop_tb();

    reg Toggle;
    reg Enable;
    reg Reset;
    reg Load;
    reg Din;
    wire Q;

    tflipflop DUT(.Q(Q), .En(Enable), .T(Toggle), .Res(Reset), .Load(Load), .Din(Din));

    initial begin

    $dumpfile("tflipflop_tb.vcd");
    $dumpvars(0, tflipflop_tb);

    // Inicializando com o valor 0 armazenado
    Reset = 1'b0;
    Load = 1'b0;
    Din = 1'b0;
    Toggle = 1'b0;
    Enable = 1'b0;
    #5;

    // Forçando o valor 1
    Reset = 1'b1;
    Load = 1'b1;
    Din = 1'b1;
    Enable = 1'b0;
    Toggle = 1'b0;
    #5;

    // Desligando o Load e tentativa de Toggle
    Load = 1'b0;
    Enable = 1'b0;
    Toggle = 1'b1;
    #5;

    Enable = 1'b1;
    Toggle = 1'b0;
    #5;

    Enable = 1'b1;
    Toggle = 1'b1;
    #5;

    end
endmodule