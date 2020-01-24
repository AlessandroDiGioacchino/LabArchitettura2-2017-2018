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
	subu $sp, $sp, 48
	sw $s0, 44($sp)
	sw $s1, 40($sp)
	sw $s2, 36($sp)
	sw $s3, 32($sp)
	sw $s5, 28($sp)
	sw $s6, 24($sp)
	sw $fp, 20($sp)
	sw $ra, 16($sp)
	addiu $fp, $sp, 36
	
	move $s0, $a0
	move $s1, $a1
	move $s2, $a2
	move $s3, $a3
	
	li $t0, 0				# $t0 <-- indice del ciclo
	li $t1, 12				# $t1 <-- offset per lo stack
	
	# Questo ciclo serve per salvare gli elementi di C nello stack
	first_for: beq $t0, $s3, continue
	mul $t2, $t0, 4
	add $t3, $t2, $s2
	lw $t3, ($t3)
	sub $t4, $t1, $t2
	add $t4, $t4, $sp
	sw $t3, ($t4)
	addi $t0, $t0, 1
	j first_for
	
	continue: li $t0, 0
	li $t1, 0
	li $t2, 0
	li $t3, 0
	li $t4, 0
	
	li $s5, 0				# $s5 <-- indice del ciclo
	move $s6, $sp				# $s6 <-- copia di $sp
	
	second_for: beq $s5, $s3, return
	mul $t0, $s5, 4
	add $t1, $t0, $s0
	add $t0, $t0, $s1
	lw $t1, ($t1)
	lw $t0, ($t0)
	
	lw $t2, ($s6)
	addi $s6, $s6, 4
	
	move $a0, $t1
	move $a1, $t0
	move $a2, $t2
	
	jal combineInt
	
	mul $t0, $s5, 4
	add $t0, $t0, $s2
	sw $v0, ($t0)
	
	addi $s5, $s5, 1
	j second_for
	
	return: lw $ra, 16($sp)
	lw $fp, 20($sp)
	lw $s3, 24($sp)
	lw $s2, 28($sp)
	lw $s1, 32($sp)
	lw $s0, 36($sp)
	addi $sp, $sp, 48
	
	jr $ra
