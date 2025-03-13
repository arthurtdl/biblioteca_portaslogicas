`include "and8_3x1gate.v"
`include "not_gate.v"
`include "or8_gate.v"

module mux_4x2 (input   [7:0] in0, in1, // result da arithmetic unit e logic unit
                input   [3:0] in2, in3, // NZVC da arithmetic unit e logic unit
                input   sel,            // Bit seletor
                output  [7:0] out_8,    // result escolhido
                output  [3:0] out_4);   // NZVC escolhido
    
    wire sel_n;
    not_gate NEG (.out(sel_n), .in(sel));
    
    wire [7:0] in0_and, in1_and;
    wire in2_and_0, in2_and_1, in2_and_2, in2_and_3;
    wire in3_and_0, in3_and_1, in3_and_2, in3_and_3;
    
    and8_3x1gate AND0 (.out(in0_and), .in1(in0), .in2(sel_n), .in3(sel_n));
    
    and8_3x1gate AND1 (.out(in1_and), .in1(in1), .in2(sel), .in3(sel));
    
    or8_gate OR0 (.out(out_8), .in1(in0_and), .in2(in1_and));
    
    and_gate AND2 (.out(in2_and_0), .in1(in2[0]), .in2(sel_n));
    and_gate AND3 (.out(in2_and_1), .in1(in2[1]), .in2(sel_n));
    and_gate AND4 (.out(in2_and_2), .in1(in2[2]), .in2(sel_n));
    and_gate AND5 (.out(in2_and_3), .in1(in2[3]), .in2(sel_n));
    
    and_gate AND6 (.out(in3_and_0), .in1(in3[0]), .in2(sel));
    and_gate AND7 (.out(in3_and_1), .in1(in3[1]), .in2(sel));
    and_gate AND8 (.out(in3_and_2), .in1(in3[2]), .in2(sel));
    and_gate AND9 (.out(in3_and_3), .in1(in3[3]), .in2(sel));
    
    or_gate OR1 (.out(out_4[0]), .in1(in2_and_0), .in2(in3_and_0));
    or_gate OR2 (.out(out_4[1]), .in1(in2_and_1), .in2(in3_and_1));
    or_gate OR3 (.out(out_4[2]), .in1(in2_and_2), .in2(in3_and_2));
    or_gate OR4 (.out(out_4[3]), .in1(in2_and_3), .in2(in3_and_3));
    
endmodule
