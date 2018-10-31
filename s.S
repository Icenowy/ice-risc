.text
entry:
jal basic_test
addi s0, zero, 0x1f0
add sp, sp, s0
jal main
ebreak

basic_test:
lui s0, 64
auipc s1, 80
jr ra
