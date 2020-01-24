# Si scriva il codice Assembly che effettui:
#	A[99] = 5 + B[i] + C
#
# Inizializzazione dei registri indirizzi:
#	i vettori A e B contengono 100 elementi, ogni elemento è un intero a 32 bit;
#	variabili C e i sono interi a 32 bit.
#
# Inizializzazione dei valori dati in memoria:
#	i = 3, C = 2, B[i] = 10.

	.data
	A: .space 400
	B: .space 400
	C: .space 4
	i: .space 4
	
	.text
	.globl main
	
main:
	la $s0, i
	li $t0, 3
	sw $t0, ($s0)
	
	la $s1, C
	li $t0, 2
	sw $t0, ($s1)
	
	la $s2, B
	lw $t0, ($s0)
	mul $t0, $t0, 4
	add $t0, $t0, $s2
	li $t1, 10
	sw $t1, ($t0)
	
	li $t0, 5
	lw $t1, ($s0)
	mul $t1, $t1, 4
	add $t1, $t1, $s2
	lw $t1, ($t1)
	lw $t2, ($s1)
	add $t0, $t0, $t1
	add $t0, $t0, $t2
	
	la $s3, A
	li $t1, 99
	mul $t1, $t1, 4
	add $t1, $t1, $s3
	sw $t0, ($t1)