/*
 * 2'b00 - Write immediate to register.
 * 2'b01 - Write ALU result to register.
 * 2'b02 - Write memory access result to register
 */
`define REG_SOURCE_IMMEDIATE	2'b00
`define REG_SOURCE_ALU		2'b01
`define REG_SOURCE_MEMORY	2'b10

/*
 * 1'b0 - ALU B port is from immediate.
 * 1'b1 - ALU B port is from register file read port 2.
 */
`define ALU_B_SOURCE_IMMEDIATE	1'b0
`define ALU_B_SOURCE_REG	1'b1

/*
 * 2'b00 - Access a byte
 * 2'b01 - Access a half word
 * 2'b10 - Access a word
 */
`define MEM_ACCESS_BYTE		2'b00
`define MEM_ACCESS_HALF_WORD	2'b01
`define MEM_ACCESS_WORD		2'b10

/*
 * 4'b0000 - Success
 * 4'b0001 - Illegal instruction
 * 4'b0010 - Unaligned memory access
 * 4'b0011 - Intended halt
 */
`define EXCEPTION_SUCCESS	4'b0000
`define EXCEPTION_ILLEGAL_INSTR	4'b0001
`define EXCEPTION_UNALIGNED	4'b0010
`define EXCEPTION_HALT		4'b0011
