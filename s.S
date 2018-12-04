entry:	addi x1, x0, 8
	ori x2, x0, 2
	xori x3, x2, 8
	sub x4, x3, x1
	and x5, x4, x2
L1:	sll x5, x5, 2
	beq x5, x1, L1
	jal x31, L2
	slt x8, x13, x1
	addi x14, x0, -2
	slt x9, x8, x14
	slti x10, x9, 2
	slti x11, x10, 0
L3:	add x11, x11, x10
	bne x11, x2, L3
	addi x12, x0, -2
L4:	addi x12, x12, 1
	bltz x12, L4
	andi x12, x2, 2
	j L5
L2:	sw x2, 104(x1)
	lw x13, 104(x1)
	jr x31
L5:	ebreak
