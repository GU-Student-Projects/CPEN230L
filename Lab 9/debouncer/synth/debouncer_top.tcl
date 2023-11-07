set_location_assignment PIN_Y2 -to CLOCK_50
set_instance_assignment -name IO_STANDARD "2.5 V" -to CLOCK_50

set_location_assignment PIN_M23 -to KEY0;
set_instance_assignment -name IO_STANDARD "2.5 V" -to KEY0

set_location_assignment PIN_E21 -to LEDG0
set_instance_assignment -name IO_STANDARD "2.5 V" -to LEDG0
set_instance_assignment -name CURRENT_STRENGTH_NEW 8MA -to LEDG0
set_instance_assignment -name SLEW_RATE 2 -to LEDG0
