	.data
	# La direttiva align non funziona né qui ...
	string: .asciiz "Ciao"
	.align 2
	A: .space 8
	# ... né qui. Significa forse che va messa dopo ogni dichiarazione? Non lo so, ma la stringa "Ciao" occupa 5 byte:
	# uno per ciascuna lettera, e un quinto per il terminatore di stringhe. Quindi è necessario allineare
	# la successiva dichiarazione di A se si vuole accedervi in lettura o scrittura.
	# Ma poiché A è già allineato e lo spazio ad esso riservato è un multiplo di 4, un'eventuale dichiarazione
	# seguente a quella di A non avrebbe bisogno della direttiva align perché sia allineata.
	
	.text
	.globl main
	
main:
	la $t0, A
	li $t1, 5
	sw $t1, ($t0)