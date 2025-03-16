module fsm_comportamental (output reg grn, ylw, red,
        input wire CAR, timeout, Clock, Reset);

  reg [1:0] current_state, next_state;

  parameter GREEN = 2'b00,
            YELLOW = 2'b01,
            RED = 2'b10;

  // State Memory Block
  always @ (posedge Clock or negedge Reset)
    begin: STATE_MEMORY
      if (!Reset)
        current_state <= GREEN;
      else
        current_state <= next_state;
    end

  // Next State Logic Block
  always @ (current_state or CAR or timeout)
    begin: NEXT_STATE_LOGIC
      case (current_state)

        GREEN : if (CAR == 1'b1)
                    next_state = YELLOW;
                else
                    next_state = GREEN;

        YELLOW : next_state = RED;

        RED : if (timeout == 1'b1)
                    next_state = GREEN;
              else
                    next_state = RED;

        default : next_state = GREEN;

      endcase
    end

  always @ (current_state)
    begin: OUTPUT_LOGIC
      case (current_state)

        GREEN : begin
                    grn = 1'b1;
                    ylw = 1'b0;
                    red = 1'b0;
                end

        YELLOW : begin
                    grn = 1'b0;
                    ylw = 1'b1;
                    red = 1'b0;
                 end

        RED : begin
                    grn = 1'b0;
                    ylw = 1'b0;
                    red = 1'b1;
              end

        default : begin
                    grn = 1'b1;
                    ylw = 1'b0;
                    red = 1'b0;
                  end

      endcase
    end

endmodule