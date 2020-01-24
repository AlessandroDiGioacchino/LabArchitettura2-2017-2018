# La procedura P è definita come segue:
#	Input: l’array inserito dall’utente e un parametro k
#	se k=0 la procedura calcola la somma di tutti gli interi in posizione (indice nell’array) dispari
#	se k=1 sommerà quelli in posizioni pari.
#
# Suggerimento: allocare l’array staticamente in memoria e passare alla procedura
# il base address (passaggio per indirizzo).

	.text
	.globl P
	
P:
	subu $sp, $sp, 16
	sw $s0, 12($sp)
	sw $s1, 8($sp)
	sw $fp, 4($sp)
	sw $ra, ($sp)
	addiu $fp, $sp, 12
	
	move $s0, $a0
	move $s1, $a1
	move $t0, $a2
	
	li $v0, 0
	
	beqz $s1, dispari
	beq $s1, 1, pari
	
	li $v1, -1
	j return
	
	dispari: li $t1, 1
	j for
	
	pari: li $t1, 0
	
	for: bge $t1, $t0, return
	mul $t2, $t1, 4
	add $t2, $t2, $s0
	lw $t2, ($t2)
	add $v0, $v0, $t2
	
	addi $t1, $t1, 2
	j for
	
	return: lw $ra, ($sp)
	lw $fp, 4($sp)
	lw $s1, 8($sp)
	lw $s0, 12($sp)
	addi $sp, $sp, 16
	
	jr $ra	