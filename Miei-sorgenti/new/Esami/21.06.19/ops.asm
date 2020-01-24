# (A) Utilizzando le direttive assembly, si scriva un segmento dati che contenga:
#	• due variabili intere h e k, inizializzate a piacere;
#	• tre stringhe con valore Somma:, Differenza: e Prodotto:, rispettivamente.
# (B) Il programma calcola somma, differenza e prodotto tra h e k e stampa il risultato preceduto dalla stringa corrispondente.
# (In caso si voglia migliorare la leggibilità si stampino dei ritorni a capo).

	.data
	h: .word 2
	k: .word 3
	
	string1: .asciiz "Somma: "
	string2: .asciiz "Differenza: "
	.align 2
	string3: .asciiz "Prodotto: "
	.align 2
	newline: .asciiz "\n"
	
	.text
	.globl main

main:
	la $t0, h
	lw $t0, ($t0)
	
	la $t1, k
	lw $t1, ($t1)
	
	add $s0, $t0, $t1
	sub $s1, $t0, $t1
	mul $s2, $t0, $t1
	
	li $v0, 4
	la $a0, string1
	syscall
	li $v0, 1
	move $a0, $s0
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall
	
	li $v0, 4
	la $a0, string2
	syscall
	li $v0, 1
	move $a0, $s1
	syscall
	
	li $v0, 4
	la $a0, newline
	syscall
	
	li $v0, 4
	la $a0, string3
	syscall
	li $v0, 1
	move $a0, $s2
	syscall
	
	li $v0, 10
	syscall