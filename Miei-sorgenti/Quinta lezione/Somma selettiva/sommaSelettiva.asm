# La procedura P è definita come segue:
#	Input: l’array inserito dall’utente e un parametro k
#	se k = 0 la procedura calcola la somma di tutti gli interi in posizione (indice nell’array) dispari
#	se k = 1 sommerà quelli in posizioni pari.
#
# Suggerimento: allocare l’array staticamente in memoria e passare alla procedura il base address (passaggio per indirizzo).
	
	.text
	.globl P

P:	subu $sp, $sp, 20
	sw $s0, 16($sp)
	sw $s1, 12($sp)
	sw $s2, 8($sp)
	sw $fp, 4($sp)
	sw $ra, ($sp)
	addiu $fp, $sp, 16
	
	move $s0, $a0			# $s0 <-- &A
	move $s1, $a1			# $s1 <-- k
	move $s2, $a2			# $s2 <-- len(A)
	
	li $v0, 0
	li $t0, 0			# $t0 <-- i
	li $t1, 2
	li $t2, 4
	move $t4, $s0
	
	beqz $s1, dispari
	
	for: div $t0, $t1
	mfhi $t3			# $t3 <-- i % k
	
	beqz $t3, if1

	j mid1
	
	if1: lw $t5, ($t4)
	add $v0, $v0, $t5
	
	mid1: addi $t0, $t0, 1		# i++
	add $t4, $s0, $t2		# Incremento l'offset per accedere ad A
	blt $t0, $s2, for		# i <? len(A)
	
	j return 
	
	dispari: div $t0, $t1
	mfhi $t3
	
	bnez $t3, if2
	
	j mid2
	
	if2: lw $t5, ($t4)
	add $v0, $v0, $t5
	
	mid2: addi $t0, $t0, 1
	add $t4, $t4, $t2
	blt $t0, $s2, dispari
	
	return: lw $ra, ($sp)
	lw $fp, 4($sp)
	lw $s2, 8($sp)
	lw $s1, 12($sp)
	lw $s0, 16($sp)
	addiu $sp, $sp, 8
	
	jr $ra