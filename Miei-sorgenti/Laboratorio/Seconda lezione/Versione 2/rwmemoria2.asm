# Si scriva il codice Assembly che effettui:
#	A[c-1] = c * (B[A[c]] + c) / A[2 * c - 1]
#
# Inizializzazione dei registri indirizzi:
#	i vettori A e B contengono 4 elementi, ogni elemento è un intero a 32 bit;
#	la variabile c è intero a 32 bit.
#
# Inizializzazione dei valori dati in memoria:
#	c = 2
#	A[0] = -1
#	A[1] = -1
#	A[2] = 1
#	A[3] = 4
#	B[0] = -1
#	B[1] = 6
#	B[2] = -1
#	B[3] = -1

	.data
	A: .space 16
	B: .space 16
	c: .space 4
	
	.text
	.globl main
	
main:
	la $s0, c
	li $t0, 2
	sw $t0, ($s0)
	
	la $s1, A
	li $t0, -1
	sw $t0, ($s1)
	
	li $t0, 1
	mul $t0, $t0, 4
	add $t0, $t0, $s1
	li $t1, -1
	sw $t1, ($t0)
	
	li $t0, 2
	mul $t0, $t0, 4
	add $t0, $t0, $s1
	li $t1, 1
	sw $t1, ($t0)
	
	li $t0, 3
	mul $t0, $t0, 4
	add $t0, $t0, $s1
	li $t1, 4
	sw $t1, ($t0)
	
	la $s2, B
	li $t0, -1
	sw $t0, ($s2)
	
	li $t0, 1
	mul $t0, $t0, 4
	add $t0, $t0, $s2
	li $t1, 6
	sw $t1, ($t0)
	
	li $t0, 2
	mul $t0, $t0, 4
	add $t0, $t0, $s2
	li $t1, -1
	sw $t1, ($t0)
	
	li $t0, 3
	mul $t0, $t0, 4
	add $t0, $t0, $s2
	li $t1, -1
	sw $t1, ($t0)
	
	lw $t0, ($s0)
	
	mul $t1, $t0, 4
	add $t1, $t1, $s1
	lw $t1, ($t1)
	mul $t1, $t1, 4
	add $t1, $t1, $s2
	lw $t1, ($t1)
	add $t1, $t1, $t0
	
	mul $t2, $t0, 2
	addi $t2, $t2, -1
	mul $t2, $t2, 4
	add $t2, $t2, $s1
	lw $t2, ($t2)
	
	mul $t1, $t1, $t0
	div $t1, $t1, $t2
	
	addi $t0, $t0, -1
	mul $t0, $t0, 4
	add $t0, $t0, $s1
	sw $t1, ($t0)