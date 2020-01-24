# Si implementino le seguenti procedure.
#
# somma:
# 	input: due interi a e b
# 	output: a+b

	.text
	.globl somma
	
somma:
	subu $sp, $sp, 8
	sw $fp, 4($sp)
	sw $ra, ($sp)
	addiu $fp, $sp, 4
	
	move $t0, $a0		# $t0 <-- a
	move $t1, $a1		# $t1 <-- b
	
	add $v0, $t0, $t1
	
	lw $ra, ($sp)
	lw $fp, 4($sp)
	addi $sp, $sp, 8

	jr $ra