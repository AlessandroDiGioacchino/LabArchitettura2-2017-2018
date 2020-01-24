# Si scriva codice assembly che:
#	chieda all’utente di inserire un intero (messaggio su terminale);
#	acquisisca un intero da terminale;
#	calcoli l’intero successivo;
#	mostri all’utente il risultato (messaggio su terminale).

	.data
	string1: .asciiz "Inserisci un intero: "
	.align 2
	string2: .asciiz "\nL'intero successivo è: "

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
	
	li $v0, 1
	addi $a0, $s0, 1
	syscall