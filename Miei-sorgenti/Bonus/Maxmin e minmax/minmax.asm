# Si implementi la procedura minmax così definita:
#	Input: un intero N e una matrice di interi M di dimensione N x N
#	Output: il minimo valore tra i massimi di riga in M

	.text
	.globl minmax
	
minmax:
	subu $sp, $sp, 28
	sw $s0, 24($sp)
	sw $s1, 20($sp)
	sw $s2, 16($sp)
	sw $fp, 12($sp)
	sw $ra, 8($sp)
	addiu $fp, $sp, 24
	
	move $s0, $a0		# $s0 <-- &M
	move $s1, $a1		# $s1 <-- N
	
	move $s2, $a2		# $s2 <-- &arr_max
	
	move $t0, $a2		# $t0 <-- &arr_max // copia del base address in $t0
	move $t1, $a1		# $t1 <-- N // indice del ciclo seguente in $t1
	
	for: beqz $t1, return
	
	move $a0, $s0
	move $a1, $s1
	
	sw $t0, 4($sp)
	sw $t1, ($sp)
	
	jal max
	
	lw $t1, ($sp)
	lw $t0, 4($sp)
	
	sw $v0, ($t0)
	
	addi $t0, $t0, 4
	addi $t1, $t1, -1
	mul $t2, $s1, 4
	add $s0, $s0, $t2
	
	j for
	
	return: move $a0, $s2
	move $a1, $s1
	jal min
	
	lw $ra, 8($sp)
	lw $fp, 12($sp)
	lw $s2, 16($sp)
	lw $s1, 20($sp)
	lw $s0, 24($sp)
	addi $sp, $sp, 28
	
	jr $ra