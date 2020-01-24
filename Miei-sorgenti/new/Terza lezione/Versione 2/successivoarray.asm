# Si scriva codice assembly che:
#	chieda all’utente di inserire un intero (messaggio su terminale);
#	acquisisca un intero da terminale;
#	calcoli l’intero successivo;
#	memorizzi l’intero ed il successivo in un array di dimensione 2 in memoria;
#	mostri all’utente i due numeri (messaggio su terminale).

	.data
	A: .space 8
	string1: .asciiz "Inserisci un intero: "
	string2: .asciiz "\nL'intero inserito è: "
	string3: .asciiz "\nL'intero successivo è: "

	.text
	.globl main
	
main:
	li $v0, 4
	la $a0, string1
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0
	
	addi $t1, $t0, 1
	
	la $t2, A
	sw $t0, ($t2)
	sw $t1, 4($t2)
	
	li $v0, 4
	la $a0, string2
	syscall
	
	li $v0, 1
	move $a0, $t0
	syscall
	
	li $v0, 4
	la $a0, string3
	syscall
	
	li $v0, 1
	move $a0, $t1
	syscall