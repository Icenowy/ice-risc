.text
entry:	jal test
	li sp, 0x1f0
	jal main
	ebreak

test:	lui s0, 64
	auipc s1, 80
	sw s1, 0x1f4(zero)
	lw s2, 0x1f4(zero)
	bne s0, s0, dead
	beq s0, s0, cont
	ebreak
cont:	jr ra

dead:	ebreak
