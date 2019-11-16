# Si implementi la procedura maxmin così definita:
#	Input: un intero N e una matrice di interi M di dimensione N x N
#	Output: il massimo valore tra i minimi di riga in M

	.text
	.globl maxmin
	
maxmin:
	subu $sp, $sp, 20
	sw $s0, 12($sp)
	sw $s1, 8($sp)
	sw $fp, 4($sp)
	sw $ra, ($sp)
	addiu $fp, $sp, 16
	
	move $s0, $a0		# $s0 <-- &M // cioè il base address del primo array di M
	move $s1, $a1		# $s1 <-- N
	
	move $s3, $a2		# $s3 <-- &mins // array in cui memorizzo il minimo di ogni riga
	move $t0, $a2		# $t0 <-- &mins // copia del base address di mins; lavoro su questa (sommandogli 4)
	
	move $s2, $s1		# $s2 <-- N // utilizzo N come indice del ciclo seguente
	
	for: beqz $s2, return
	move $a0, $s0
	move $a1, $s1
	
	sw $t0, 16($sp)
	
	jal min
	
	lw $t0, 16($sp)
		
	sw $v0, ($t0)
	
	mul $t1, $s1, 4
	add $s0, $s0, $t1
	addi $s2, $s2, -1
	addi $t0, $t0, 4
	
	j for
	
	return: move $a0, $s3
	move $a1, $s1
	jal max
	
	lw $ra, ($sp)
	lw $fp, 4($sp)
	lw $s1, 8($sp)
	lw $s0, 12($sp)
	addi $sp, $sp, 20
	
	jr $ra