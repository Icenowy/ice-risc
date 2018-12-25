# ice-risc
A simple RV32I main subset implementation by Icenowy. FENCE, FENCE.I, EBREAK, ECALL and CSR-related instructions are missing.

This is part of my project for Sun Yat-Sen University DCS209 "Laboratory of Computer Organization" lesson. The submitted version is at basys3-lesson branch, and is synthesized by Vivado with a strange external design (with key as clock) required by the teacher. In that case ice-risc can cost ~10k LUT on Artix-7.

Normal versions of FPGA designs are at tang (Lichee Tang), de0-nano (Terasic DE0-Nano) and basys3 (Diligent Basys3) branches, corresponding to Anlogic Eagle S20, Altera Cyclone IV E and Xilinx Artix-7 FPGAs.

The design costs 2.5k LUT on Anlogic Eagle S20.

BTW this project may be rewritten.
