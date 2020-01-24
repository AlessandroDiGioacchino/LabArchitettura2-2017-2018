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
	
	move $s0, $a0
	move $s1, $a1
	move $t0, $a2
	
	li $v0, 0
	li $t1, 0
	
	for_belongs: beq $t1, $t0, return
	mul $t2, $t1, 4
	add $t2, $t2, $s0
	lw $t2, ($t2)
	
	beq $t2, $s1, found

	addi $t1, $t1, 1
	j for_belongs
		
	found: li $v0, 1
	
	return: lw $ra, ($sp)
	lw $fp, 4($sp)
	lw $s1, 8($sp)
	lw $s0, 12($sp)
	addi $sp, $sp, 16
	
	jr $ra