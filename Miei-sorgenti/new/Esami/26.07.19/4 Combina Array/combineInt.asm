# Si implementino la funzione combineInt e la procedura combineArr, entrambe
# invocabili da sorgenti diversi da quello in cui sono definite.
# La funzione combineInt riceve in input tre valori interi a, b e k (da passare in
# tale ordine) e restituisce un intero c:
#	• se k è uguale a 0 allora c è il massimo tra a e b;
#	• se k è uguale a 1 allora c è il minimo tra a e b;
#	• se k è uguale a 2 allora c è la differenza tra il massimo e il minimo (entrambi
#	tra a e b);
#	• in ogni altro caso c è pari a 0.

	.text
	.globl combineInt
	
combineInt:
	subu $sp, $sp, 20
	sw $s0, 16($sp)
	sw $s1, 12($sp)
	sw $s2, 8($sp)
	sw $fp, 4($sp)
	sw $ra, ($sp)
	addiu $fp, $sp, 16
	
	move $s0, $a0
	move $s1, $a1
	move $s2, $a2
	
	li $v0, 0
	
	beqz $s2, zero
	beq $s2, 1, one
	beq $s2, 2, two
	j return
	
	zero: ble $s0, $s1, first_else
	move $v0, $s0
	j return
	
	first_else: move $v0, $s1
	j return	
	
	one: bge $s0, $s1, second_else
	move $v0, $s0
	j return
	
	second_else: move $v0, $s1
	j return
	
	two: bge $s0, $s1, third_else
	sub $v0, $s1, $s0
	j return
	
	third_else: sub $v0, $s0, $s1
	
	return: lw $ra, ($sp)
	lw $fp, 4($sp)
	lw $s2, 8($sp)
	lw $s1, 12($sp)
	lw $s0, 16($sp)
	addi $sp, $sp, 20
	
	jr $ra
