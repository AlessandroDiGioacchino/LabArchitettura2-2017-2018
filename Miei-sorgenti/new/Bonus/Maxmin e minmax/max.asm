# Si implementi la procedura max così definita:
#	Input: un intero N e un array A di N interi
#	Output: il valore massimo in A

	.text
	.globl max
	
max:
	subu $sp, $sp, 16
	sw $s0, 12($sp)
	sw $s1, 8($sp)
	sw $fp, 4($sp)
	sw $ra, ($sp)
	addiu $fp, $sp, 12
	
	move $s0, $a0		# $s0 <-- &A
	move $s1, $a1		# $s1 <-- len(A)
	
	move $t1, $s0
	lw $t0, ($t1)
	move $v0, $t0
	addi $t1, $t1, 4
	addi $s1, $s1, -1
	
	for: beqz $s1, return
	lw $t0, ($t1)
	ble $v0, $t0, if
	
	addi $t1, $t1, 4
	addi $s1, $s1, -1
	
	j for
	
	if: move $v0, $t0
	addi $t1, $t1, 4
	addi $s1, $s1, -1
	
	j for
	
	return: lw $ra, ($sp)
	lw $fp, 4($sp)
	lw $s1, 8($sp)
	lw $s0, 12($sp)
	addi $sp, $sp, 16
	
	jr $ra