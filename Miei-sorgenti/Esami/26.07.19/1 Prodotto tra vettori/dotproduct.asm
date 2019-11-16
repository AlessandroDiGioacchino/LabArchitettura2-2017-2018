# Si implementi la funzione dotproduct invocabile da altri file sorgenti e definita come segue.
#	• Input: nell’ordine, vettore A, intero n, vettore B, intero m; n e m indicano il numero di elementi in A e B,
#	rispettivamente.
#	• Output: intero s.
# Nel caso in cui n e m siano corretti (entrambi non negativi), l’intero s è calcolato come segue:
#
# In caso contrario si adotti un comportamento a piacere.

	.text
	.globl dotproduct
	
dotproduct:
	subu $sp, $sp, 24
	sw $s0, 20($sp)
	sw $s1, 16($sp)
	sw $s2, 12($sp)
	sw $s3, 8($sp)
	sw $fp, 4($sp)
	sw $ra, ($sp)
	addiu $fp, $sp, 20
	
	move $s0, $a0			# $s0 <-- &A
	move $s1, $a1			# $s1 <-- n
	move $s2, $a2			# $s2 <-- &B
	move $s3, $a3			# $s3 <-- m
	
	li $v0, 0
	
	bltz $s1, return
	bltz $s3, return
	
	bge $s1, $s3, n_greater_m
	bge $s3, $s1, m_greater_n
	
	n_greater_m: addi $t0, $s3, -1
	j second_half
	
	m_greater_n: addi $t0, $s1, -1
	
	second_half: li $t1, 0
	for: beq $t0, $t1, return
	
	mul $t2, $t1, 4
	add $t3, $t2, $s0
	add $t4, $t2, $s2
	
	lw $t5, ($t3)
	lw $t6, ($t4)
	
	mul $t7, $t5, $t6
	add $v0, $v0, $t7
	
	addi $t1, $t1, 1
	j for
	
	return: lw $ra, ($sp)
	lw $fp, 4($sp)
	lw $s3, 8($sp)
	lw $s2, 12($sp)
	lw $s1, 16($sp)
	lw $s0, 20($sp)
	addi $sp, $sp, 24
	
	jr $ra