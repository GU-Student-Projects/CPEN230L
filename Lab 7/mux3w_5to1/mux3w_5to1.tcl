# Pin assignments, I/O voltage, current drive,
# and slew rate standards.

set_location_assignment PIN_Y23  -to SW[17]
set_location_assignment PIN_Y24  -to SW[16]
set_location_assignment PIN_AA22 -to SW[15]
set_location_assignment PIN_AA23 -to SW[14]
set_location_assignment PIN_AA24 -to SW[13]
set_location_assignment PIN_AB23 -to SW[12]
set_location_assignment PIN_AB24 -to SW[11]
set_location_assignment PIN_AC24 -to SW[10]
set_location_assignment PIN_AB25 -to SW[9]
set_location_assignment PIN_AC25 -to SW[8]
set_location_assignment PIN_AB26 -to SW[7]
set_location_assignment PIN_AD26 -to SW[6]
set_location_assignment PIN_AC26 -to SW[5]
set_location_assignment PIN_AB27 -to SW[4]
set_location_assignment PIN_AD27 -to SW[3]
set_location_assignment PIN_AC27 -to SW[2]
set_location_assignment PIN_AC28 -to SW[1]
set_location_assignment PIN_AB28 -to SW[0]
set_instance_assignment -name IO_STANDARD "2.5 V" -to SW

set_location_assignment PIN_E25 -to LEDG[2]
set_location_assignment PIN_E22 -to LEDG[1]
set_location_assignment PIN_E21 -to LEDG[0]
set_instance_assignment -name IO_STANDARD "2.5 V" -to LEDG
set_instance_assignment -name CURRENT_STRENGTH_NEW 8MA -to LEDG
set_instance_assignment -name SLEW_RATE 2 -to LEDG
