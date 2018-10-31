.text
entry:
jal basic_test
addi s0, zero, 0x1f0
add sp, sp, s0
jal main
ebreak

basic_test:
nop
jr ra
