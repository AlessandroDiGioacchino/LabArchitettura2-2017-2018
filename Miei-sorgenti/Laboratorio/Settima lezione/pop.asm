# Si implementi una struttura dati di tipo stack (LIFO) che permetta di salvare in memoria dinamicamente strutture del tipo:
#	struct {
#		int x;
#		int y;
#		int angle;
#		int *next;
#	}
#	
# Si implementino in particolare le funzioni:
#	stack_push(x,y,angle) che inserisca un elemento nello stack
#	stack_pop() che rimuova un elemento dallo stack e lo restituisca all'utente (si restituisca 0 nel caso di stack vuoto)
#	stack_print() che stampi l'intero contenuto dello stack
#	
# Suggerimento: si utilizzi la syscall sbrk per l'allocazione dinamica della memoria.

	.text
	.globl stack_pop
	
stack_pop:
	move $t0, $a0		# $t0 <-- puntatore alla cima dello stack
	move $t1, $a1		# $t1 <-- numero degli elemento nello stack
	move $t2, $a2		# $t2 <-- base address dell'array in cui memorizzare valori di ritorno
	
	bnez $t1, for1		# if (len(stack) == 0) then return 0
	
	li $v0, 0
	li $v1, 0
	
	jr $ra
	
	# Lo stack dovrebbe essere organizzato così:
	#	int *next;
	#	int angle;
	#	int y;
	#	int x;
	# E l'indirizzo di ogni elemento dovrebbe puntare a int x, quindi l'offset da usare per ottenere il puntatore
	# al prossimo elemento è 12.
	
	lw $t3, 12($t0)
	move $t4, $t0
	
	for1: lw $t3, 12($t4)
	beqz $t3, return
	move $t4, $t3
	
	j for1
	
	# Arrivato qui, ho zero in $t3 e l'indirizzo dell'ultimo elemento dello stack in $t4
	return: lw $t7, ($t0)		# $t7 <-- x
	lw $t8, 4($t0)			# $t8 <-- y
	lw $t9, 8($t0)			# $t9 <-- angle
	
	# Devo fare in modo che adesso l'ultimo elemento abbia zero nel campo int *next: non penso possa evitare di utilizzare
	# un altro ciclo. La condizione è basata su $t0, perché lì c'è l'indirizzo contenuto nell'ultimo elemento dello stack
	
	move $t5, $t0
	
	for2: lw $t6, 12($t5)
	beq $t6, $t4, reset
	move $t5, $t6
	
	j for2
	
	# Arrivato qui, ho l'indirizzo da rimpiazzare con zero in $t6 e l'indirizzo dell'elemento dello stack in $t5
	reset: sw $zero, ($t5)
	
	sw $t7, ($t2)
	sw $t8, 4($t2)
	sw $t9, 8($t2)
	
	move $v0, $t2			# Restituisco il base address dell'array
	
	jr $ra
