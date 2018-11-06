IVERILOG = iverilog

IVFLAGS = -y .

RISCV_CROSS_COMPILE ?= /opt/abcross/riscv64/bin/riscv64-aosc-linux-gnu-

RISCV_AS = $(RISCV_CROSS_COMPILE)as
RISCV_GCC = $(RISCV_CROSS_COMPILE)gcc
RISCV_LD = $(RISCV_CROSS_COMPILE)ld
RISCV_OBJCOPY = $(RISCV_CROSS_COMPILE)objcopy

VVP = vvp

%.vvp: %.v
	$(IVERILOG) $(IVFLAGS) $< -o $@

%.vcd: %.vvp
	$(VVP) $(VVPFLAGS) -n $<

sim: regfile_32_tb.vcd alu_tb.vcd sim.vcd

regfile_32_tb.vvp: regfile_32_tb.v regfile_32.vvp
alu_tb.vvp: alu_tb.v alu.vvp
sim.vvp: sim.v simple_memory.vvp ice_risc_rv.vvp
simple_memory.vvp: simple_memory.v simple_memory_rom.v
ice_risc_rv.vvp: ice_risc_rv.v control_rv.vvp
control_rv.vvp: control_rv.v alu.vvp regfile_32.vvp next_pc_rv.vvp pc.vvp sub_word_d_mem_read_rv.vvp instr_exec_rv.vvp
instr_exec_rv.vvp: instr_exec_rv.v instr_split_rv.vvp

c.o: c.c
	$(RISCV_GCC) -march=rv32i -mabi=ilp32 -c $< -o $@

s.o: s.S
	$(RISCV_AS) -march=rv32i $< -o $@

test.elf: c.o s.o test.lds
	$(RISCV_LD) s.o c.o -m elf32lriscv -T test.lds -o $@

test.bin: test.elf
	$(RISCV_OBJCOPY) -O binary $< $@

gen_simple_memory_rom: gen_simple_memory_rom.o

simple_memory_rom.v: test.bin gen_simple_memory_rom
	./gen_simple_memory_rom < test.bin > simple_memory_rom.v

clean:
	rm -f *.vvp *.vcd c.o s.o test.elf test.bin gen_simple_memory_rom gen_simple_memory_rom.o
