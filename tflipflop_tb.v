`include "tflipflop.v"

module tflipflop_tb();

    reg Toggle;
    reg Enable;
    reg Reset;
    reg Preset;
    wire Q;

    tflipflop DUT(.Q(Q), .En(Enable), .T(Toggle), .Res(Reset), .Pres(Preset));

    initial begin

    $dumpfile("tflipflop_tb.vcd");
    $dumpvars(0, tflipflop_tb);

    // Inicializando com o valor 0 armazenado
    Reset = 1'b0;
    Preset = 1'b1;
    Toggle = 1'b0;
    Enable = 1'b0;
    #5;

    Reset = 1'b1;
    Enable = 1'b0;
    Toggle = 1'b0;
    #5;

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