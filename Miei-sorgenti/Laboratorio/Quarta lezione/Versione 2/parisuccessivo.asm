# Si scriva il codice che dato un intero inserito dall’utente restituisca il numero pari successivo.

	.data
	string1: .asciiz "Inserisci un intero: "
	string2: .asciiz "\nIl numero pari successivo è: "
	
	.text
	.globl main
	
main:
	li $v0, 4
	la $a0, string1
	syscall
	
	li $v0, 5
	syscall
	move $s0, $v0
	
	li $v0, 4
	la $a0, string2
	syscall
	
	li $t0, 2
	div $s0, $t0
	
	li $v0, 1
	mfhi $t0
	beqz $t0, pari
	
	addi $a0, $s0, 1
	j os
	
	pari: addi $a0, $s0, 2
	
	os: syscall