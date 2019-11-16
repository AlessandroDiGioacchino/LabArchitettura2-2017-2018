# La procedura subseteq dovrà a sua volta utilizzare un’altra procedura belongs così definita
#	Input: un array A e un intero i
#	Output: 1 se i è contenuto in A, 0 altrimenti

	.text
	.globl belongs

belongs:
	subu $sp, $sp, 16
	sw $s0, 12($sp)
	sw $s1, 8($sp)
	sw $fp, 4($sp)
	sw $ra, ($sp)
	addiu $fp, $sp, 12
	
	move $s0, $a0		# $s0 <-- &A
	move $s1, $a1		# $s1 <-- i
	
	move $t0, $a2		# $t0 <-- len(A)
	
	li $v0, 0
	move $t2, $s0
	
	for_b: beqz $t0, return_b
	lw $t1, ($t2)
	beq $t1, $s1, found
	addi $t2, $t2, 4
	addi $t0, $t0, -1
	j for_b
	
	found: li $v0, 1
	
	return_b: lw $ra, ($sp)
	lw $fp, 4($sp)
	lw $s1, 8($sp)
	lw $s0, 12($sp)
	addiu $sp, $sp, 16
	
	jr $ra