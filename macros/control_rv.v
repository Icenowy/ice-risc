/*
 * 2'b00 - normal next instr
 * 2'b01 - jal (pc + immediate20)
 * 2'b02 - jalr (rs + immediate12)
 * 2'b03 - b* (pc + immediate12)
 */
`define NEXT_PC_SRC_SEQ		2'b00
`define NEXT_PC_SRC_JAL		2'b01
`define NEXT_PC_SRC_JALR	2'b10
`define NEXT_PC_SRC_B		2'b11
