`include "and_gate.v"

module counta (output wire [7:0] cnt,
               input wire Clk, Res, En, Load,
               input wire [7:0] cnt_in);

