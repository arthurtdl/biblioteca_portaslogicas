`include "mux_4x2.v"
    
module mux_4x2_tb();
    reg [7:0] entrada_arithmetic, entrada_logic;
    reg [3:0] arithmetic_NZVC, logic_NZVC;
    reg sel;
    wire [7:0] out_8;
    wire [3:0] out_4;
    
    mux_4x2 DUT (.in0(entrada_arithmetic), .in1(entrada_logic), .in2(arithmetic_NZVC), .in3(logic_NZVC), .sel(sel), .out_8(out_8), .out_4(out_4));

    initial begin
    $dumpfile("mux_4x2_tb.vcd"); // Arquivo para waveform
    $dumpvars(0, mux_4x2_tb);
        
    // Teste 1: sel = 0, deve selecionar in0 e in2
    entrada_arithmetic = 8'b10101010;
    entrada_logic = 8'b01010101;
    arithmetic_NZVC = 4'b1100;
    logic_NZVC = 4'b0011;
    sel = 0;
    #5;
        
    // Teste 2: sel = 1, deve selecionar in1 e in3
    entrada_arithmetic = 8'b10101010;
    entrada_logic = 8'b01010101;
    arithmetic_NZVC = 4'b1100;
    logic_NZVC = 4'b0011;
    sel = 1;
    #5;

    end
endmodule