# Avoid critical warning "Timing requirements not met"
create_clock -name {KEY[2]} -period 20 [get_ports {KEY[2]}]
derive_clock_uncertainty
