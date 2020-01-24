# Si implementi il codice Assembly che effettui la moltiplicazione e la divisione tra i numeri 100 e 45,
# utilizzando le istruzioni dell’ISA e le pseudoistruzioni.

	.text
	.globl main
	
main:
	li $s0, 100
	li $s1, 45
	
	# ISA
	mult $s0, $s1
	mfhi $t0
	mflo $t1
	
	div $s0, $s1
	mfhi $t2
	mflo $t3
	
	# Pseudoistruzioni
	mul $t4, $s0, $s1
	div $t5, $s0, $s1