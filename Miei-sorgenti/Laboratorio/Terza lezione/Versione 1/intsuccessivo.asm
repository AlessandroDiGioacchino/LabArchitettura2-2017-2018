# Si scriva codice assembly che:

#	chieda all’utente di inserire un intero (messaggio su terminale);
#	acquisisca un intero da terminale;
#	calcoli l’intero successivo;
#	mostri all’utente il risultato (messaggio su terminale).

	.data
	str: .asciiz "Inserisci un intero: "
	end: .asciiz "L'intero successivo è: "

	.text
	.globl main
	
main:
	la $a0, str
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	
	move $s0, $v0
	addi $s0, $s0, 1
	
	la $a0, end
	li $v0, 4
	syscall
	
	move $a0, $s0
	li $v0, 1
	syscall