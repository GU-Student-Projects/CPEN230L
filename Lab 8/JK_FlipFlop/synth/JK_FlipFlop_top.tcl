# CPEN 230L Lab 9 part 2, JK Flip-Flop, pin assignments
# Rick Nungester 3/6/16

set_location_assignment PIN_AC28 -to SW[1]
set_location_assignment PIN_AB28 -to SW[0]
set_instance_assignment -name IO_STANDARD "2.5 V" -to SW

set_location_assignment PIN_N21 -to KEY[2];
set_location_assignment PIN_M21 -to KEY[1];
set_location_assignment PIN_M23 -to KEY[0];
set_instance_assignment -name IO_STANDARD "2.5 V" -to KEY

set_location_assignment PIN_E22 -to LEDG[1];
set_location_assignment PIN_E21 -to LEDG[0];
set_instance_assignment -name IO_STANDARD "2.5 V" -to LEDG
set_instance_assignment -name CURRENT_STRENGTH_NEW 8MA -to LEDG
set_instance_assignment -name SLEW_RATE 2 -to LEDG
