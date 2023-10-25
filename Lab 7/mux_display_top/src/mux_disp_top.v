// CPEN 230L lab 7 part 3, mux3w_5to1 and oct7seg complete circuit
// Gabe DiMartino, 10/23/2023

module mux_disp_top (
  input  [17:0] SW,      // 18 switches
  output [6:0] HEX0);    // 7-seg display

  wire [2:0] dispDrv;

  mux3w_5to1 mux (
    .SW(SW),           // input all switches
    .LEDG(dispDrv)     // output disp wire
  );

  // Instantiate the 7-segment display controller
  oct7seg char0 (
    .c_i(dispDrv),      // input dispDrv 3bit
    .disp_o(HEX0)       // 7 segment hex
  );


endmodule
