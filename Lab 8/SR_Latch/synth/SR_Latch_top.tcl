# CPEN 230L Lab 8 part 1, SR Latch, pin assignments
# Gabe DiMartino 10/30/2023

set_location_assignment PIN_M21 -to KEY[1];
set_location_assignment PIN_M23 -to KEY[0];
set_instance_assignment -name IO_STANDARD "2.5 V" -to KEY

set_location_assignment PIN_E22 -to LEDG[1];
set_location_assignment PIN_E21 -to LEDG[0];
set_instance_assignment -name IO_STANDARD "2.5 V" -to LEDG
set_instance_assignment -name CURRENT_STRENGTH_NEW 8MA -to LEDG
set_instance_assignment -name SLEW_RATE 2 -to LEDG
