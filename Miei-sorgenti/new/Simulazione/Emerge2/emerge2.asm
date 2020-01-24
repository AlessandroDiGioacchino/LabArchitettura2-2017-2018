# Si implementi una procedura chiamata ``emerge2'' così definita:
#	Input: due interi i e j, un array V (base address) e un intero k che rappresenta il numero di elementi in V.
#	Output: un valore booleano.
# Si assuma che i <= j.
# (A) In caso in cui i o j non corrispondano ad indici ammissibili di V, la procedura termina immediatamente
# restituendo 0.
# (B) In caso contrario, la procedura modifica l'ordine degli elementi in V in modo tale che gli elementi
# in posizione i e j vadano ad occpuare la prima e seconda posizione, rispettivamente.
# Tutti i restanti elementi di V vengono shiftati verso il fondo.
# Al ritorno di una chiamata a emerge2, l'elemento originariamente in posizione i occuperà
# la posizione 0 (primo elemento); l'elemento originariamente in posizione j, se j è diverso da i,
# occuperà la posizione 1 (secondo elemento); lo shift verso il fondo di ogni elemento che occupava
# una posizione diversa da i e da j garantirà che nessun elemento di V venga sovrascritto e perso.
# Dopo aver effettuato questa operazione sull'array, la procedura termina restituendo 1.

	.text
	.globl emerge2
	
emerge2:
	subu $sp, $sp, 24
	sw $s0, 20($sp)
	sw $s1, 16($sp)
	sw $s2, 12($sp)
	sw $s3, 8($sp)
	sw $fp, 4($sp)
	sw $ra, ($sp)
	addiu $fp, $sp, 20
	
	move $s0, $a0
	move $s1, $a1
	move $s2, $a2
	move $s3, $a3
	
	li $v0, 0
	
	bge $s0, $s3, return
	bge $s1, $s3, return
	beq $s0, $s1, i_equal_j
	
	move $t0, $s3
	move $t1, $s3
	
	first_for: beqz $t0, first_continue
	addi $t1, $t1, -1		# $t1 <-- len(V) - 1
	mul $t2, $t1, 4			# $t1 <-- offset per accedere all'ultimo elemento di V
	add $t3, $t2, $s2
	lw $t4, ($t3)			# $t3 <-- elemento da shiftare di due posizioni
	addi $t5, $t3, 8
	sw $t4, ($t5)
	
	addi $t0, $t0, -1
	j first_for
	
	# Sposto l'elemento V[i] in prima posizione
	first_continue: addi $t0, $s0, 2
	mul $t0, $t0, 4
	add $t0, $t0, $s2
	lw $t0, ($t0)
	sw $t0, ($s2)
	beq $s0, $s1, i_equal_j
	
	# Sposto l'elemento in V[j] in seconda posizione
	addi $t0, $s1, 2
	mul $t0, $t0, 4
	add $t0, $t0, $s2
	lw $t0, ($t0)
	sw $t0, 4($s2)
	
	# Gli elementi da i a j - i vanno spostati di una posizione verso sinistra
	addi $t0, $s0, 3
	addi $t1, $s1, 2
	
	second_for: beq $t0, $t1, second_continue
	mul $t2, $t0, 4
	add $t2, $t2, $s2
	lw $t3, ($t2)
	sw $t3, -4($t2)
	
	addi $t0, $t0, 1
	j second_for
	
	# Gli elementi da len(V) - 1 a j vanno spostati di due posizioni verso sinistra
	second_continue: addi $t0, $s1, 3
	addi $t1, $s3, 2
	
	third_for: beq $t0, $t1, return_true
	mul $t2, $t0, 4
	add $t2, $t2, $s2
	lw $t3, ($t2)
	sw $t3, -8($t2)
	
	addi $t0, $t0, 1
	j third_for
	
	# Sposto tutti gli elementi di una posizione verso destra
	i_equal_j: addi $t0, $s3, -1
	
	fourth_for: beq $t0, -1, third_continue
	mul $t1, $t0, 4
	add $t1, $t1, $s2
	lw $t2, ($t1)
	sw $t2, 4($t1)
	
	addi $t0, $t0, -1
	j fourth_for
	
	# Metto in prima posizione l'elemento in posizione i + 1
	third_continue: addi $t0, $s0, 1
	mul $t0, $t0, 4
	add $t0, $t0, $s2
	lw $t0, ($t0)
	sw $t0, ($s2)
	
	# Sposto tutti gli elementi dalla posizione i in poi di una posizione verso sinistra
	addi $t0, $s0, 2
	addi $t1, $s3, 1
	
	fifth_for: beq $t0, $t1, return_true
	mul $t2, $t0, 4
	add $t2, $t2, $s2
	lw $t3, ($t2)
	sw $t3, -4($t2)
	
	addi $t0, $t0, 1
	j fifth_for
	
	return_true: li $v0, 1
	
	return: lw $ra, ($sp)
	lw $fp, 4($sp)
	lw $s3, 8($sp)
	lw $s2, 12($sp)
	lw $s1, 16($sp)
	lw $s0, 20($sp)
	addi $sp, $sp, 24
	
	jr $ra
