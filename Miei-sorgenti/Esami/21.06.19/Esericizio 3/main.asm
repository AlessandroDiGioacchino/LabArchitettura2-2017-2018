	.data
	V: .space 12
	
	.text
	.globl main
	
main:
	li $a0, 10
	li $a1, 30
	li $a2, 20
	
	la $a3, V
	
	jal sc3
	
	move $a0, $v0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall
