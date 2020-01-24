# Si scriva il codice Assembly che effettui:

#	A[99] = 5 + B[i] + C

# Inizializzazione dei registri indirizzi:

# 	i vettori A e B contengono 100 elementi, ogni elemento è un intero a 32 bit;
# 	variabili C e i sono interi a 32 bit.

# Inizializzazione dei valori dati in memoria:

#	i=3, C=2, B[i]=10.

	.data
	A: .space 400
	B: .space 400
	C: .word 0
	i: .word 0
	
	.text
	.globl main
	
main:
	la $s0, i
	li $t0, 3
	sw $t0, ($s0)		# i <-- 3
	
	la $s1, C
	li $t0, 2
	sw $t0, ($s1)		# C <-- 2
	
	lw $t0, i
	li $t1, 4
	mul $t0, $t0, $t1	# Offset per accedere a B[i] in $t0
	
	la $s2, B
	add $t2, $t0, $s2
	li $t3, 10
	sw $t3, ($t2)		# B[i] <-- 10
	
	lw $s3, ($t2)
	lw $t4, C
	addi $s3, $s3, 5
	add $s3, $s3, $t4	# $s3 <-- 5 + B[i] + C
	
	li $t0, 99
	mul $t0, $t0, $t1	# Offset per accedere a A[99] in $t0
	
	la $s4, A
	add $s4, $s4, $t0
	sw $s3, ($s4)		# A[99] <-- 5 + B[i] + C