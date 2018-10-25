IVERILOG = iverilog

IVFLAGS = -y .

VVP = vvp

%.vvp: %.v
	$(IVERILOG) $(IVFLAGS) $< -o $@

%.vcd: %.vvp
	$(VVP) $(VVPFLAGS) -n $<

sim: regfile_32_tb.vcd

regfile_32_tb.vvp: regfile_32_tb.v regfile_32.v

clean:
	rm -f *.vvp *.vcd
