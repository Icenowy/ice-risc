`define RISCV_FUNCT3_JALR		3'b000

`define RISCV_FUNCT3_BRANCH_BEQ		3'b000
`define RISCV_FUNCT3_BRANCH_BNE		3'b001
`define RISCV_FUNCT3_BRANCH_BLT		3'b100
`define RISCV_FUNCT3_BRANCH_BGE		3'b101
`define RISCV_FUNCT3_BRANCH_BLTU	3'b110
`define RISCV_FUNCT3_BRANCH_BGEU	3'b111

`define RISCV_FUNCT3_OP_IMM_ADDI	3'b000
`define RISCV_FUNCT3_OP_IMM_SLTI	3'b010
`define RISCV_FUNCT3_OP_IMM_SLTIU	3'b011
`define RISCV_FUNCT3_OP_IMM_XORI	3'b100
`define RISCV_FUNCT3_OP_IMM_ORI		3'b110
`define RISCV_FUNCT3_OP_IMM_ANDI	3'b111

`define RISCV_FUNCT3_OP_IMM_SLLI	3'b001
`define RISCV_FUNCT7_OP_IMM_SLLI	7'b0000000

`define RISCV_FUNCT3_OP_IMM_SRLI_SRAI	3'b101
`define RISCV_FUNCT7_OP_IMM_SRLI	7'b0000000
`define RISCV_FUNCT7_OP_IMM_SRAI	7'b0100000

`define RISCV_FUNCT3_OP_ADD_SUB		3'b000
`define RISCV_FUNCT7_OP_ADD		7'b0000000
`define RISCV_FUNCT7_OP_SUB		7'b0100000

`define RISCV_FUNCT3_OP_SLL		3'b001
`define RISCV_FUNCT7_OP_SLL		7'b0000000

`define RISCV_FUNCT3_OP_SLT		3'b010
`define RISCV_FUNCT7_OP_SLT		7'b0000000

`define RISCV_FUNCT3_OP_SLTU		3'b011
`define RISCV_FUNCT7_OP_SLTU		7'b0000000

`define RISCV_FUNCT3_OP_XOR		3'b100
`define RISCV_FUNCT7_OP_XOR		7'b0000000

`define RISCV_FUNCT3_OP_SRL_SRA		3'b101
`define RISCV_FUNCT7_OP_SRL		7'b0000000
`define RISCV_FUNCT7_OP_SRA		7'b0000000

`define RISCV_FUNCT3_OP_OR		3'b110
`define RISCV_FUNCT7_OP_OR		7'b0000000

`define RISCV_FUNCT3_OP_AND		3'b111
`define RISCV_FUNCT7_OP_AND		7'b0000000

`define RISCV_FUNCT3_LOAD_LB		3'b000
`define RISCV_FUNCT3_LOAD_LH		3'b001
`define RISCV_FUNCT3_LOAD_LW		3'b010
`define RISCV_FUNCT3_LOAD_LBU		3'b100
`define RISCV_FUNCT3_LOAD_LHU		3'b101

`define RISCV_FUNCT3_STORE_SB		3'b000
`define RISCV_FUNCT3_STORE_SH		3'b001
`define RISCV_FUNCT3_STORE_SW		3'b010

