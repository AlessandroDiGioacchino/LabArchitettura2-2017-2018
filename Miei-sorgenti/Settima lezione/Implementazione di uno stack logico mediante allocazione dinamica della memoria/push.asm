.data

stack :   .word 0   # Puntatore all'ultimo elemento inserito nello stack
stack_n : .word 0   # Nummero di elementi attualmente nello stack

	first_string: .asciiz "Ascissa: "
	second_string: .asciiz "Ordinata: "
	third_string: .asciiz "Angolo: "

# Nodo di esempio:
# struct{
# 	int x;
# 	int y;
# 	int angle;
# 	int *next;
# }

.text

	.globl stack_pop
	.globl stack_print
.globl stack_push
		
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
	
stack_pop:
	la $t0, stack		
	lw $t0, ($t0)		# $t0 <-- puntatore alla cima dello stack
	la $t1, stack_n
	lw $t1, ($t1)
	
	bnez $t1, first_for	# if (len(stack) == 0) then return 0
	
	sw $zero, ($t2)
	sw $zero, 4($t2)
	sw $zero, 8($t2)
	
	jr $ra
	
	# Lo stack dovrebbe essere organizzato così:
	#	int *next;
	#	int angle;
	#	int y;
	#	int x;
	# E l'indirizzo di ogni elemento dovrebbe puntare a int x, quindi l'offset da usare per ottenere il puntatore
	# al prossimo elemento è 12.
	
	first_for: lw $t3, 12($t0)
	beqz $t3, return
	move $t0, $t3
	
	j first_for
	
	# Arrivato qui, ho zero in $t3 e l'indirizzo dell'ultimo elemento dello stack in $t0
	return:	lw $t7, ($t0)		# $t7 <-- x
	lw $t8, 4($t0)			# $t8 <-- y
	lw $t9, 8($t0)			# $t9 <-- angle
	
	# Pulisco un po' i registri
	li $t0, 0
	li $t1, 0
	li $t2, 0
	li $t3, 0
	li $t4, 0
	li $t5, 0
	li $t6, 0
	
	la $t0, stack
	lw $t0, ($t0)
	
	# Aggiorno stack_n
	la $t1, stack_n
	lw $t2, ($t1)
	addi $t2, $t2, -1
	sw $t2, ($t1)
	
	li $t1, 1		# Serve per il ciclo seguente
	
	# Devo fare in modo che adesso l'ultimo elemento abbia zero nel campo int *next: non penso possa evitare di utilizzare
	# un altro ciclo. La condizione è basata su stack_n, perché non sono riuscito a fare diversamente
	second_for: beq $t1, $t2, reset
	beq $zero, $t2, pop_return		# Se stack_n - 1 = 0, ho un unico elemento nello stack. Non serve il ciclo
	lw $t3, 12($t0)
	move $t0, $t3
	addi $t2, $t2, -1
	
	j second_for
	
	# Arrivato qui, ho l'indirizzo da rimpiazzare con zero in [$t3] + 12 (ricorda l'organizzazione degli elementi)
	# A meno che non abbia preso subito la branch di second_for
	reset: beqz $t3, if
	sw $zero, 12($t3)
	
	pop_return: move $t2, $a0		# $t2 <-- base address dell'array in cui memorizzare valori di ritorno
	
	sw $t7, ($t2)
	sw $t8, 4($t2)
	sw $t9, 8($t2)
	
	jr $ra

	# Se arrivo qui, ho fatto il pop di tutti gli elementi dello stack tranne uno. Devo aggiornare il campo *next di quello
	if: sw $zero, 12($t0)
	j pop_return
	

stack_print:
	la $t0, stack
	lw $t0, ($t0)			# $t0 <-- puntatore alla cima dello stack
	
	print_for: beqz $t0, print_return
	lw $t1, ($t0)
	lw $t2, 4($t0)
	lw $t3, 8($t0)
	
	li $v0, 56
	la $a0, first_string
	move $a1, $t1
	syscall
	
	la $a0, second_string
	move $a1, $t2
	syscall
	
	la $a0, third_string
	move $a1, $t3
	syscall
			 		# Metto qui la branch, altrimenti non mi stamperebbe l'ultimo elemento dello stack
	lw $t0, 12($t0)
	j print_for

	print_return: jr $ra

# Input :
# a0 : x value
# a1 : y value
# a2 : angle value
# Output:
# ---------
stack_push:			# Inserisce un elemento nello stack
	move $t0, $a0
	move $t1, $a1
	move $t2, $a2

	la $t8, stack
	lw $t7, 0($t8)
	la $t9, stack_n

	li $a0, 16		# malloc(4*4 bytes)
	li $v0, 9
	syscall
	
	sw $t0, 0($v0)		# inizializza nuovo nodo
	sw $t1, 4($v0)
	sw $t2, 8($v0)
	sw $t7, 12($v0)		# next = *old_stack
	
	lw $t3, 0($t9)		# stack_n++
	addi $t3, $t3, 1	
	
	sw $v0, 0($t8)		# aggiorna lo stack pointer al nodo appena creato
	sw $t3, 0($t9)		# aggiorna il contatore di elementi
	
	jr $ra			# ritorna al chiamante
