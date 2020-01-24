# Utilizzando le syscall rese disponibili dall'emulatore MARS implementare un programma che:
#	Richieda all'utente attraverso una finestra di dialogo l'inserimento di un numero intero NUM
#	Estragga un numero casuale R nel range [-NUM,NUM], (il seed del generatore di numeri casuali
#	può essere inizializzato con un qualsiasi numero intero)
#	Sommi R al numero inserito NUM : RESULT = NUM + R
#	Mostri all'utente attraverso una nuova finestra di dialogo il nuovo credito dell'utente
#	dopo la scommessa RESULT.
# 
# Il programma dovrà terminare in maniera "pulita" restituendo il controllo al sistema operativo

	.data
	string1: .asciiz "Inserisci un intero:"
	string2: .asciiz "Il nuovo credito è: "

	.text
	.globl main
	
main:
	li $v0, 51
	la $a0, string1
	syscall
	move $s0, $a0
	
	li $v0, 42
	add $a1, $s0, $s0
	addi $a1, $a1, 1
	syscall
	
	sub $t0, $a0, $s0
	add $s0, $s0, $t0
	
	li $v0, 56
	la $a0, string2
	move $a1, $s0
	syscall
	
	li $v0, 10
	syscall