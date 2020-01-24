# Si scriva codice assembly che:

#	chieda all’utente di inserire un intero (messaggio su terminale);
#	acquisisca un intero da terminale;
#	calcoli l’intero successivo;
#	memorizzi l’intero ed il successivo in un array di dimensione 2 in memoria;
#	mostri all’utente i due numeri (messaggio su terminale).

	.data
	A: .space 8
	begin: .asciiz "Inserisci un intero: "
	end1: .asciiz "L'intero inserito è: "
	end2: .asciiz "\nIl suo successivo è: "
	
	.text
	.globl main
	
main:
	la $a0, begin
	li $v0, 4
	syscall
	
	li $v0, 5
	syscall
	move $t0, $v0		# $t0 <-- intero letto
	
	addi $t1, $t0, 1
	la $s0, A
	sw $t0, ($s0)		# A[0] <-- intero letto
	
	li $t2, 1
	li $t3, 4
	mul $t2, $t2, $t3
	add $t2, $t2, $s0
	sw $t1, ($t2)		# A[1] <-- intero successivo
	
	la $a0, end1
	li $v0, 4
	syscall
	
	lw $a0, ($s0)
	li $v0, 1
	syscall
	
	la $a0, end2
	li $v0, 4
	syscall
	
	lw $a0, ($t2)
	li $v0, 1
	syscall