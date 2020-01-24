# (A) Utilizzando le direttive assembly, si scriva un segmento dati che contenga:
#	una variabile intera a, inizializzata con un valore a piacere;
#	una stringa s con valore ``Fine'';
#	un array V di 5 elementi, dove ogni elemento è inizializzato a 1.
#
# (B) Si scriva poi un segmento testo che:
#	per i che va da 0 a 4, memorizzi il valore a+i nella posizione i dell'array;
#	memorizzi nella variabile a l'indirizzo del penultimo elemento dell'array;
#	stampi la stringa s.

	.data
	a: .word 9
	s: .asciiz "Fine"
	.align 2
	V: .word 1 1 1 1 1
	
	.text
	.globl main
	
main:
	la $s0, a
	la $s1, s
	la $s2, V
	
	lw $t0, ($s0)
	li $t1, 0
	
	for: beq $t1, 4, continue
	mul $t2, $t1, 4
	add $t2, $t2, $s2
	lw $t3, ($t2)
	add $t3, $t3, $t0
	sw $t3, ($t2)
	
	addi $t1, $t1, 1
	j for
	
	continue: li $t0, 4
	li $t1, 3
	mul $t0, $t0, $t1
	add $t0, $t0, $s2
	lw $t0, ($t0)
	sw $t0, ($s0)
	
	li $v0, 4
	move $a0, $s1
	syscall
	
	li $v0, 10
	syscall