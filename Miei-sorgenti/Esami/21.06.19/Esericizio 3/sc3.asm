# (A) Si implementi una procedura chiamata sc3 così definita:
#	• Input: tre valori interi a, b e c e un base address di un array V.
#	• Output: un valore intero z.
# La procedura, come primo step, copia in V gli interi a, b e c in ordine decrescente
# (il numero più alto verrà copiato in V[0], il secondo più alto in V[1], mentre il più piccolo andrà in V[2])
# (B) Successivamente, la procedura calcola e restituisce un intero z come segue.
# 	C1) se a, b e c sono uguali tra loro allora z=0;
# se invece a, b e c non verificano la condizione di C1), z sarà uguale al numero di condizioni che tali valori soddisfano
# nella seguente lista:
# 	C2) almeno due valori sono diversi tra loro;
# 	C3) la differenza tra il massimo e il minimo valore è maggiore di 10;
# 	C4) i tre valori ordinati sono equidistanti tra loro.

	.text
	.globl sc3
	
sc3:
	subu $sp, $sp, 24
	sw $s0, 20($sp)
	sw $s1, 16($sp)
	sw $s2, 12($sp)
	sw $s3, 8($sp)
	sw $fp, 4($sp)
	sw $ra, ($sp)
	addiu $fp, $sp, 20
	
	move $s0, $a0			# $s0 <-- a
	move $s1, $a1			# $s1 <-- b
	move $s2, $a2			# $s2 <-- c
	move $s3, $a3			# $s3 <-- &V
	
	bge $s0, $s1, a_greater_b			# b < a?
	
	bge $s1, $s2, b_greater_c			# c < a?
	
	sw $s2, ($s3)					# (a < c && b < c) => V[0] = c
	
	bge $s0, $s1, first_else			# b < a?
	sw $s1, 4($s3)					# a < b => V[1] = b
	sw $s0, 8($s3)					# V[2] = a
	
	j second_half
	
	first_else: sw $s0, 4($s3)			# b < a => V[1] = a
	sw $s1, 8($s3)					# V[2] = b
	
	j second_half
	
	a_greater_b: bge $s0, $s2, a_greater_c		# c < a?
	sw $s2, ($s3)					# a < c => V[0] = c
	sw $s0, 4($s3)					# V[1] = a
	sw $s1, 8($s3)					# V[2] = b
	
	j second_half
	
	a_greater_c: sw $s0, ($s3)			# (b < a && c < a) => V[0] = a
	bge $s1, $s2, second_else			# c < b?
	sw $s2, 4($s3)					# b < c => V[1] = c
	sw $s1, 8($s3)					# V[2] = b
	
	j second_half
	
	second_else: sw $s1, 4($s3)			# c < b => V[1] = b
	sw $s2, 8($s3)					# V[2] = c
	
	j second_half
	
	b_greater_c: sw $s1, ($s3)			# (c < b && a < b) => V[0] = b
	bge $s0, $s2, third_else			# c < a?
	sw $s2, 4($s3)					# a < c => V[1] = c
	sw $s0, 8($s3)					# V[2] = a
	
	j second_half
	
	third_else: sw $s0, 4($s3)			# c < a => V[1] = a
	sw $s2, 8($s3)					# V[2] = c
	
	second_half: li $v0, 0
	beq $s0, $s1, a_equal_b				# a = b?
	
	addi $v0, $v0, 1				# a != b => z++
	j max_min
	
	a_equal_b: beq $s0, $s2, return			# a = c?
	
	addi $v0, $v0, 1
	
	max_min: lw $t0, ($s3)				# $t0 <-- max
	lw $t1, 4($s3)
	lw $t2, 8($s3)					# $t2 <-- min
	
	sub $t9, $t0, $t2				# $t9 <-- max - min
	bgt $t9, 10, C3					# 10 < max - min?
	
	equidistance: sub $t8, $t0, $t1			# $t8 <-- max - middle
	sub $t7, $t1, $t2				# $t7 <-- middle - min
	beq $t7, $t8, C4				# max - middle = middle - min?
	j return
	
	C3: addi $v0, $v0, 1				# (10 < max - min) => z++
	j equidistance

	C4: addi $v0, $v0, 1				# (max - middle = middle - min) => z++
	
	return: lw $ra, ($sp)
	lw $fp, 4($sp)
	lw $s3, 8($sp)
	lw $s2, 12($sp)
	lw $s1, 16($sp)
	lw $s0, 20($sp)
	addi $sp, $sp, 24
	
	jr $ra
