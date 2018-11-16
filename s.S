entry:	addi x1, x0, 8
	ori x2, x0, 2
	add x3, x2, x1
	sub x5, x3, x2
	and x4, x5, x2
	or x8, x4, x2
L1:	slli x8, x8, 1
	bne x8, x1, L1
	slti x6, x2, 4
	slti x7, x6, 0
L2:	addi x7, x7, 8
	beq x7, x1, L2
	sw x2, 104(x1)
	lw x9, 104(x1)
	addi x10, x0, -2
L3:	addi x10, x10, 1
	bltz x10, L3
	andi x11, x2, 2
	j L4
	or x8, x4, x2
L4:	ebreak
