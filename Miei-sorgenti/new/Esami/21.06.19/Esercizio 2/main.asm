	.text
	.globl main
	
main:
	li $a0, 40
	
	jal is_aligned
	
	move $a0, $v0
	li $v0, 1
	syscall
	
	li $a0, 39
	
	jal is_aligned
	
	move $a0, $v0
	li $v0, 1
	syscall

	li $v0, 10
	syscall