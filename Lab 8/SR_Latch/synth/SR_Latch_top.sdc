# Avoid warning "No clocks defined in design". KEY[0] picked at random.
create_clock -name {KEY[0]} -period 20 [get_ports {KEY[0]}]
