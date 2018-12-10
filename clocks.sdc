create_clock -name iwClk24M -period 41.667 [get_ports {iwClk24M}]
create_generated_clock  -name wNewClk -source [get_ports {iwClk24M}] -divide_by 512 [get_nets {wNewClk}]