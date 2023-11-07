set_location_assignment PIN_Y2 -to CLOCK_50
set_instance_assignment -name IO_STANDARD "2.5 V" -to CLOCK_50

set_location_assignment PIN_M23 -to KEY0
set_instance_assignment -name IO_STANDARD "2.5 V" -to KEY0

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
