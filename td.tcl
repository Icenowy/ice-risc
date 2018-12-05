import_device eagle_s20.db -package BG256
read_verilog full.v -top top
read_adc io.adc
optimize_rtl
map_macro
map
pack
place
route
bitgen -bit ice_risc.bit -version 0X00 -g ucode:00000000000000000000000000000000

