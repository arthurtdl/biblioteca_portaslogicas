module count8fsm (output reg [7:0] cnt,
                  input wire Clk, Res, En, Load,
                  input wire [7:0] cnt_in);

  reg [7:0] current_state, next_state;

  // State Memory Block
  always @ (posedge Clk, negedge Res)
    begin: STATE_MEMORY

      if (!Res)
        current_state <= 8'b00000000;
      else
        current_state <= next_state;

    end

  // Next State Logic Block
  always @ (*)
    begin: NEXT_STATE_LOGIC
      
      next_state = current_state;

      if (En)
        if (Load)
          next_state = cnt_in;
        else
          next_state = current_state + 8'b00000001;

    end

  // Output Logic
  always @ (current_state)
    begin: OUTPUT_LOGIC
      
      cnt = current_state;
    
    end

endmodule