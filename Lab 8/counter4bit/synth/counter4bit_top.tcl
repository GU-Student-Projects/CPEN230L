# CPEN 230L lab 8 part 3, ripple counter pin assignments
# Gabe DiMartino 10/30/2023

set_location_assignment PIN_N21 -to KEY[2];
set_location_assignment PIN_M21 -to KEY[1];
set_location_assignment PIN_M23 -to KEY[0];
set_instance_assignment -name IO_STANDARD "2.5 V" -to KEY

set_location_assignment PIN_F21 -to LEDR[3];
set_location_assignment PIN_E19 -to LEDR[2];
set_location_assignment PIN_F19 -to LEDR[1];
set_location_assignment PIN_G19 -to LEDR[0];
set_instance_assignment -name IO_STANDARD "2.5 V" -to LEDR
set_instance_assignment -name CURRENT_STRENGTH_NEW 8MA -to LEDR
set_instance_assignment -name SLEW_RATE 2 -to LEDR

set_location_assignment PIN_H22 -to HEX0[6]
set_location_assignment PIN_J22 -to HEX0[5]
set_location_assignment PIN_L25 -to HEX0[4]
set_location_assignment PIN_L26 -to HEX0[3]
set_location_assignment PIN_E17 -to HEX0[2]
set_location_assignment PIN_F22 -to HEX0[1]
set_location_assignment PIN_G18 -to HEX0[0]
set_instance_assignment -name IO_STANDARD "2.5 V" -to HEX0
set_instance_assignment -name CURRENT_STRENGTH_NEW 8MA -to HEX0
set_instance_assignment -name SLEW_RATE 2 -to HEX0
