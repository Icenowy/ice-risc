`define RISCV_OPCODE_LOAD	7'b0000011
`define RISCV_OPCODE_LOAD_FP	7'b0000111
`define RISCV_OPCODE_CUSTOM0	7'b0001011
`define RISCV_OPCODE_MISC_MEM	7'b0001111
`define RISCV_OPCODE_OP_IMM	7'b0010011
`define RISCV_OPCODE_AUIPC	7'b0010111
`define RISCV_OPCODE_OP_IMM_32	7'b0011011

`define RISCV_OPCODE_STORE	7'b0100011
`define RISCV_OPCODE_STORE_FP	7'b0100111
`define RISCV_OPCODE_CUSTOM1	7'b0101011
`define RISCV_OPCODE_AMO	7'b0101111
`define RISCV_OPCODE_OP		7'b0110011
`define RISCV_OPCODE_LUI	7'b0110111
`define RISCV_OPCODE_OP_32	7'b0111011

`define RISCV_OPCODE_NADD	7'b1000011
`define RISCV_OPCODE_MSUB	7'b1000111
`define RISCV_OPCODE_NMSUB	7'b1001011
`define RISCV_OPCODE_NMADD	7'b1001111
`define RISCV_OPCODE_OP_FP	7'b1010011
/* `define RISCV_OPCODE_RSVD	7'b1010111 */
`define RISCV_OPCODE_CUSTOM2	7'b1011011

`define RISCV_OPCODE_BRANCH	7'b1100011
`define RISCV_OPCODE_JALR	7'b1100111
/* `define RISCV_OPCODE_RSVD	7'b1101011 */
`define RISCV_OPCODE_JAL	7'b1101111
`define RISCV_OPCODE_SYSTEM	7'b1110011
/* `define RISCV_OPCODE_RSVD	7'b1110111 */
`define RISCV_OPCODE_CUSTOM3	7'b1111011

