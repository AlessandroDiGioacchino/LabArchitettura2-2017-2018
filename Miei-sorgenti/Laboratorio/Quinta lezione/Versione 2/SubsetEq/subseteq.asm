# Si implementi la procedura subseteq così definita:
#	Input: due array di interi A1 e A2
#	Output: 1 se ogni elemento di A1 è presente in A2, 0 altrimenti

	.text
	.globl subseteq
	
subseteq:
	subu $sp, $sp, 16
	sw $s0, 12($sp)
	sw $s1, 8($sp)
	sw $fp, 4($sp)
	sw $ra, ($sp)
	addiu $fp, $sp, 12
	
	move $s0, $a0
	move $s1, $a1
	move $t0, $a2
	move $t1, $a3
	
	li $v0, 1
	li $t2, 0
	
	for_subseteq: beq $t2, $t0, return
	mul $t3, $t2, 4
	add $t3, $t3, $s0
	lw $t3, ($t3)
	
	move $a0, $s1
	move $a1, $t3
	
	jal belongs
	
	beqz $v0, not_found
	
	addi $t2, $t2, 1
	j for_subseteq 
	
	not_found: li $v0, 0
	
	return: lw $ra, ($sp)
	lw $fp, 4($sp)
	lw $s1, 8($sp)
	lw $s0, 12($sp)
	addi $sp, $sp, 16
	
	jr $ra