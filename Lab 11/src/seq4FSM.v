// CPEN230L lab 11, convert binary 1..9 to A..I on a 7-segment display
// Gabe DiMartino 12/5/23

module seq4FSM (
  input        Clock,  // posedge triggered
  input        nReset, // active low synchronous reset
  input        w,      // main FSM input
  output       z,      // main output, 1 indicates a w seq of 4
  output [3:0] curr_state,    // for demo/diagnostics
  output [3:0] next_state );  // for demo/diagnostics

  parameter  // state assignment (minimum flip-flops, not one-hot)
    A = 4'd0, B = 4'd1, C = 4'd2, D = 4'd3, E = 4'd4,
    F = 4'd5, G = 4'd6, H = 4'd7, I = 4'd8;

  // registers for use in "always" block procedural assignments
  reg [3:0] curr_state_r;
  reg [3:0] next_state_r;

  always @(curr_state_r, w) begin
    case (curr_state_r)
      A: if (!w) next_state_r = B; else next_state_r = F;
      B: if (!w) next_state_r = C; else next_state_r = F;
      C: if (!w) next_state_r = D; else next_state_r = F;
      D: if (!w) next_state_r = E; else next_state_r = F; 
      E: if (!w) next_state_r = E; else next_state_r = F;
      F: if (!w) next_state_r = B; else next_state_r = G;
      G: if (!w) next_state_r = B; else next_state_r = H;
      H: if (!w) next_state_r = B; else next_state_r = I;
      I: if (!w) next_state_r = B; else next_state_r = I;
      default:   next_state_r = 4'bxxxx;  // required, not all 16 used
    endcase
  end

  always @(posedge Clock or negedge nReset) begin
    if (!nReset) begin
      curr_state_r <= A;
    end else begin
      curr_state_r <= next_state_r;
    end
  end

  // Define the *combinational* circuit that sets outputs based on the
  // current state of the FSM.
  assign z = ((curr_state_r == E) || (curr_state_r == I));
  assign curr_state = curr_state_r;
  assign next_state = next_state_r;

endmodule
