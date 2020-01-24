# Si scriva un programma che dato un array di interi stampi l’array al contrario (dall’ultimo numero nell’array al primo).
# Il programma faccia uso di una procedura ricorsiva.

	.text
	.globl stampa_contrario
	
stampa_contrario:
	subu $sp, $sp, 20
	sw $s0, 16($sp)
	sw $s1, 12($sp)
	sw $s2, 8($sp)
	sw $fp, 4($sp)
	sw $ra, ($sp)
	addiu $fp, $sp, 16
	
	move $s0, $a0		# $s0 <-- &A
	move $s1, $a1		# $s1 <-- len(A)
	move $s2, $a2
	
	beq $s1, $s2, return
	
	addi $a2, $s2, 1
	jal stampa_contrario
	
	mul $t0, $s2, 4
	add $t0, $t0, $s0
	lw $t1, ($t0)
	
	li $v0, 1
	move $a0, $t1
	syscall
	
	return: lw $ra, ($sp)
	lw $fp, 4($sp)
	lw $s2, 8($sp)
	lw $s1, 12($sp)
	lw $s0, 16($sp)
	addi $sp, $sp, 20
	
	jr $ra
