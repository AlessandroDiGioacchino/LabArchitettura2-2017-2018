# prodotto_s:
#	input: due interi a e b -output: a*b
# la procedura prodotto_s NON utilizzi istruzioni di moltiplicazione (mult et simila),
# ma calcoli il prodotto effettuando chiamate multiple alla procedura somma

	.text
	.globl prodotto_s
	
prodotto_s:
	subu $sp, $sp, 24
	sw $s0, 20($sp)
	sw $s1, 16($sp)
	sw $s3, 12($sp)
	sw $s4, 8($sp)
	sw $fp, 4($sp)
	sw $ra, ($sp)
	addiu $fp, $sp, 4
	
	move $s0, $a0		# $s0 <-- a
	move $s1, $a0		# $s1 <-- b
	
	addi $s3, $a1, -1	# $s3 <-- i
	
	for: beqz $s3, return
	
	move $a0, $s0
	move $a1, $s1
	jal somma
	
	move $s0, $v0
	addi $s3, $s3, -1
	j for
	
	return: lw $ra, ($sp)
	lw $fp, 4($sp)
	lw $s4, 8($sp)
	lw $s3, 12($sp)
	lw $s1, 16($sp)
	lw $s0, 20($sp)
	addi $sp, $sp, 20
	
	jr $ra