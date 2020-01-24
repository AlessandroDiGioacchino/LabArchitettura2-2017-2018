# Si implementi il codice Assembly che effettui la moltiplicazione e la divisione tra i numeri 100 e 45,
# utilizzando le istruzioni dell’ISA e le pseudoistruzioni.

	.text
	.globl main
	
main:
	# Usando solo istruzioni dell'ISA
	addi $t0, $zero, 100
	addi $t1, $zero, 45
	
	mult $t0, $t1
	mfhi $s0
	mflo $s1
	
	div $t0, $t1
	mfhi $s3
	mflo $s4
	
	# Usando anche pseudoistruzioni
	li $s0, 0
	li $s1, 0
	li $s3, 0
	li $s4, 0
	
	li $t0, 100
	li $t1, 45
	
	mul $s0, $t0, $t1
	
	div $t0, $t1
	mfhi $s2
	mflo $s3