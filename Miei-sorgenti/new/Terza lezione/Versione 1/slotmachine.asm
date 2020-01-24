# Utilizzando le syscall rese disponibili dall'emulatore MARS implementare un programma che:

#	Richieda all'utente attraverso una finestra di dialogo l'inserimento di un numero intero NUM
#	Estragga un numero casuale R nel range [-NUM,NUM], (il seed del generatore di numeri casuali può essere inizializzato
#	con un qualsiasi numero intero)
#	Sommi R al numero inserito NUM : RESULT = NUM + R
#	Mostri all'utente attraverso una nuova finestra di dialogo il nuovo credito dell'utente dopo la scommessa RESULT.
#	Il programma dovrà terminare in maniera "pulita" restituendo il controllo al sistema operativo

	.data
	begin: .asciiz "Inserisci un intero: "
	end: .asciiz "Il nuovo credito è: "
	
	.text
	.globl main
	
main:
	li $v0, 51
	la $a0, begin
	syscall
	
	move $s0, $a0		# $s0 <-- NUM
	
	add $t0, $s0, $s0
	addi $t0, $t0, 1	# $t0 <-- upper bound
	
	li $v0, 42
	li $a0, 0
	move $a1, $t0
	syscall
	
	move $t0, $a0
	
	sub $t0, $t0, $s0	# Ora R è nell'intervallo [-NUM, NUM]
	
	add $s1, $t0, $s0	# $s1 <-- NUM + R
	
	li $v0, 56
	la $a0, end
	move $a1, $s1
	syscall
	
	li $v0, 10
	syscall