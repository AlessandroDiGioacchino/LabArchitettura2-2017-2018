# Si scriva il codice Assembly che effettui:
#	A[12] = h + A[8];
#
# Si scriva il codice, senza eseguirlo, supponendo che:
#	la variabile h sia memorizzata all’indirizzo contenuto in $s1;
#	il base address di A sia nel registro $s2.

	.text
	.globl main
	
main:
	lw $t0, ($s1)
	
	li $t1, 8
	mul $t1, $t1, 4
	add $t1, $t1, $s2
	lw $t1, ($t1)
	
	add $t0, $t0, $t1
	
	li $t1, 12
	mul $t1, $t1, 4
	add $t1, $t1, $s2
	sw $t0, ($t1)