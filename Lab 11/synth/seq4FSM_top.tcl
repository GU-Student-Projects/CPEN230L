set_location_assignment PIN_Y2 -to CLOCK_50
set_instance_assignment -name IO_STANDARD "2.5 V" -to CLOCK_50

set_location_assignment PIN_M23 -to KEY0
set_instance_assignment -name IO_STANDARD "2.5 V" -to KEY0

set_location_assignment PIN_AC28 -to SW[1]
set_location_assignment PIN_AB28 -to SW[0]
set_instance_assignment -name IO_STANDARD "2.5 V" -to SW

set_location_assignment PIN_E21 -to LEDG0
set_instance_assignment -name IO_STANDARD "2.5 V" -to LEDG0
set_instance_assignment -name CURRENT_STRENGTH_NEW 8MA -to LEDG0
set_instance_assignment -name SLEW_RATE 2 -to LEDG0

set_location_assignment PIN_U24 -to HEX1[6]
set_location_assignment PIN_U23 -to HEX1[5]
set_location_assignment PIN_W25 -to HEX1[4]
set_location_assignment PIN_W22 -to HEX1[3]
set_location_assignment PIN_W21 -to HEX1[2]
set_location_assignment PIN_Y22 -to HEX1[1]
set_location_assignment PIN_M24 -to HEX1[0]
set_instance_assignment -name IO_STANDARD "2.5 V" -to HEX1
set_instance_assignment -name CURRENT_STRENGTH_NEW 8MA -to HEX1
set_instance_assignment -name SLEW_RATE 2 -to HEX1

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
