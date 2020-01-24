# Si implementi la procedura subseteq così definita:
#	Input: due array di interi A1 e A2
#	Output: 1 se ogni elemento di A1 è presente in A2, 0 altrimenti

	.text
	.globl subseteq
	
subseteq:
	subu $sp, $sp, 28
	sw $s0, 12($sp)
	sw $s1, 8($sp)
	sw $fp, 4($sp)
	sw $ra, ($sp)
	addiu $fp, $sp, 24
	
	move $s0, $a0		# $s0 <-- &A1
	move $s1, $a1		# $s1 <-- &A2
	
	move $t0, $a2		# $t0 <-- len(A1)
	move $t1, $a3		# $t1 <-- len(A2)
	
	li $v0, 1
	move $t3, $s1
	
	for_s: beqz $t1, return_s
	lw $t2, ($t3)
	sw $t0, 24($sp)
	sw $t1, 20($sp)
	sw $t3, 16($sp)
	
	move $a0, $s0
	move $a1, $t2
	move $a2, $t0
	jal belongs
	
	lw $t3, 16($sp)
	lw $t1, 20($sp)
	lw $t0, 24($sp)
	
	addi $t1, $t1, -1
	addi $t3, $t3, 4
	bnez $v0, for_s
	
	li $v0, 0
	
	return_s: lw $ra, ($sp)
	lw $fp, 4($sp)
	lw $s1, 8($sp)
	lw $s0, 12($sp)
	addiu $sp, $sp, 28
	
	jr $ra