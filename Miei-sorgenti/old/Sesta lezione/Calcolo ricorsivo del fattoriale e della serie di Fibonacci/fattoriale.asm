	.text
	.globl fattoriale

fattoriale:
	subu $sp, $sp, 12
	sw $fp, 8($sp)
	sw $ra, 4($sp)
	addiu $fp, $sp, 8
	
	bnez $a0, else
	li $v0, 1
	j return
	
	else: sw $a0, ($sp)
	addi $a0, $a0, -1
	
	jal fattoriale
	
	lw $t0, ($sp)
	mul $v0, $v0, $t0
	
	return: lw $ra, 4($sp)
	lw $fp, 8($sp)
	addi $sp, $sp, 12
	
	jr $ra