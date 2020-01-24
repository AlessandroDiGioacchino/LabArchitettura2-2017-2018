# Si scriva il codice Assembly che effettui:

#	A[c-1] = c*(B[A[c]] + c)/A[2*c-1]

# Inizializzazione dei registri indirizzi:

#	i vettori A e B contengono 4 elementi, ogni elemento è un intero a 32 bit;
#	la variabile c è intero a 32 bit.

# Inizializzazione dei valori dati in memoria:

#	c=2
#	A[0]=-1
#	A[1]=-1
#	A[2]= 1
#	A[3]= 4
#	B[0]=-1
#	B[1]= 6
#	B[2]=-1
#	B[3]=-1

	.data
	A: .space 16
	B: .space 16
	c: .word 0
	
	.text
	.globl main
	
main:
	la $s0, A
	la $s1, B
	la $s2, c
	
	li $t0, 2
	sw $t0, ($s2)	# c <-- 2
	
	li $t0, -1
	sw $t0, ($s0)	# A[0] <-- -1
	
	li $t1, 1
	li $t2, 4
	mul $t3, $t1, $t2	# L'offset per accedere a A[1] è in $t3
	
	add $t4, $t3, $s0
	sw $t0, ($t4)		# A[1] <-- -1
	
	sw $t0, ($s1)		# B[0] <-- -1
	
	li $t1, 2
	mul $t3, $t1, $t2
	add $t4, $t3, $s1
	sw $t0, ($t4)		# B[2] <-- -1
	
	li $t1, 3
	mul $t3, $t1, $t2
	add $t4, $t3, $s1
	sw $t0, ($t4)		# B[3] <-- -1
	
	add $t4, $t3, $s0
	sw $t2, ($t4)		# A[3] <-- 4
	
	li $t5, 1
	li $t1, 2
	mul $t3, $t1, $t2
	add $t4, $t3, $s0
	sw $t5, ($t4)		# A[2] <-- 1
	
	li $t1, 6
	mul $t3, $t2, $t5
	add $t4, $t3, $s1
	sw $t1, ($t4)		# B[1] <-- 6
	
	li $t0, 0
	li $t1, 0
	li $t2, 0
	li $t3, 0
	li $t4, 0
	li $t5, 0
	
	lw $t0, ($s2)		# $t0 <-- c
	
	li $t1, 4
	mul $t0, $t0, $t1
	add $t0, $t0, $s0
	lw $t0, ($t0)		# $t0 <-- A[c]
	
	mul $t0, $t0, $t1
	add $t0, $t0, $s1
	lw $t0, ($t0)		# $t0 <-- B[A[c]]
	
	lw $t2, ($s2)		# $t2 <-- c
	
	add $t0, $t0, $t2	# $t0 <-- B[A[c]] + c
	
	mul $t0, $t0, $t2	# $t0 <-- c * (B[A[c]] + c)
	
	li $t3, 2
	mul $t3, $t3, $t2	# $t3 <-- 2 * c
	
	li $t4, -1
	add $t3, $t3, $t4	# $t3 <-- 2 * c - 1
	
	mul $t3, $t3, $t1
	add $t3, $t3, $s0
	lw $t1, ($t3)
	div $t0, $t0, $t1
	move $s3, $t0
	
	li $t0, 0
	li $t1, 0
	li $t2, 0
	li $t3, 0
	li $t4, 0
	li $t5, 0
	
	li $t0, 4
	
	lw $t1, ($s2)		# $t1 <-- c
	
	li $t2, -1
	add $t1, $t1, $t2	# $t1 <-- c - 1
	
	mul $t1, $t1, $t0
	add $t1, $t1, $s0
	sw $s3, ($t1)		# A[c - 1] <-- c*(B[A[c]] + c)/A[2*c-1]