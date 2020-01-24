# Si traduca in Assembly la seguente riga di codice:
#	A = B + C - (D + E)
#
# assegnando alle variabili
#	A, B, C, D, E
#
# i registri
#	$s0, ..., $s4.
#
# Si assumano valori iniziali
#	1, 2, 3, 4

	.text
	.globl main
	
main:
	li $s1, 1
	li $s2, 2
	li $s3, 3
	li $s4, 4
	
	add $t0, $s1, $s2
	add $t1, $s3, $s4
	sub $s0, $t0, $t1