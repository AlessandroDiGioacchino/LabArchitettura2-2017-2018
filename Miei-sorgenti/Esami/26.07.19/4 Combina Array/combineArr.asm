# La procedura combineArr riceve in input tre array A, B e C (passaggio per
# indirizzo) e un intero N che rappresenta il numero di elementi in ciascun array.
# I parametri vanno passati nell’ordine in cui sono enunciati (A, B, C e N). La
# procedura sovrascrive l’array C in memoria sostituendo ogni emento di C in po-
# sizione i-esima con combineInt(A[i], B[i], C[N-1-i]) Attenzione! L’elemento
# di C passato alla funzione combineInt è sempre quello passato dal chiamante di
# combineArr (il valore presente prima della sovrascrittura).
# L’implementazione di combineArr deve basarsi su chiamate multiple alla fun-
# zione combineInt implementata precedentemente.

	.text
	.globl combineArr
	
combineArr:
	subu $sp, $sp, 80
	sw $s0, 76($sp)
	sw $s1, 72($sp)
	sw $s2, 68($sp)
	sw $s3, 64($sp)
	sw $fp, 60($sp)
	sw $ra, 56($sp)
	addiu $fp, $sp, 76
	
	move $s0, $a0
	move $s1, $a1
	move $s2, $a2
	move $s3, $a3
	
	li $t0, 0
	li $t1, 52
	
	first_for: beq $t0, $s3, continue
	mul $t2, $t0, 4
	mul $t3, $s3, 4
	sub $t4, $t3, $t2
	
	add $t5, $t4, $s2
	lw $t5, ($t5)
	
	addi $t0, $t0, 1
	j first_for
	
	move $t4, $s3
	addi $t4, $t4, -1
	
	for: beq $t0, 4, return
	mul $t1, $t0, 4
	add $t2, $t1, $s0
	add $t3, $t1, $s1
	lw $t2, ($t2)
	lw $t3, ($t3)
	
	sub $t5, $t4, $t0
	mul $t5, $t5, 4
	add $t5, $t5, $s2
	lw $t5, ($t5)
	
	sw $t0, 52($sp)
	sw $t1, 48($sp)
	sw $t2, 44($sp)
	sw $t3, 40($sp)
	sw $t4, 36($sp)
	sw $t5, 32($sp)
	
	move $a0, $t2
	move $a1, $t3
	move $a2, $t5
	
	jal combineInt
	
	lw $t5, 32($sp)
	lw $t4, 36($sp)
	lw $t3, 40($sp)
	lw $t2, 44($sp)
	lw $t1, 48($sp)
	lw $t0, 52($sp)
	
	mul $t6, $t0, 4
	add $t7, $t6, $s2
	sw $v0, ($t7)
	
	addi $t0, $t0, 1
	j for
	
	return: lw $ra, 56($sp)
	lw $fp, 60($sp)
	lw $s3, 64($sp)
	lw $s2, 68($sp)
	lw $s1, 72($sp)
	lw $s0, 76($sp)
	addi $sp, $sp, 80
	
	jr $ra
