# Si scriva il codice Assembly che effettui:

#	A[12] = h + A[8];

# Si scriva il codice, senza eseguirlo, supponendo che:

# 	la variabile h sia memorizzata all’indirizzo contenuto in $s1;
# 	il base address di A sia nel registro $s2.

	.text
	.globl main
	
main:
	li $t1, 4		# La costante per indirizzare al byte è contenuta in $t1

	li $t0, 8
	mul $t0, $t0, $t1	# L'offset per accedere a A[8] è contenuto in $t0
	
	add $t3, $s2, $t0
	lw $t4, ($t3)		# Accesso ad A[8]
	
	lw $s0, ($s1)		# La variabile h è contenuta in $s0
	
	add $s0, $s0, $t4	# $s0 <-- h + A[8]
	
	li $t0, 12		
	mul $t0, $t0, $t1	# L'offset per accedere a A[12] è contenuto in $t0
	
	add $t0, $t0, $s2
	sw $s0, ($t0)		# A[12] = h + A[8]