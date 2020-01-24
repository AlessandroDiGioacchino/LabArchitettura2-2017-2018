	.data
	T1: .space 20
	T2: .space 20
	
	.text
	.globl main
	
main:
	li $a0, 1
	la $a2, T1
	la $a3, T2
	
	jal branchy
	
	move $a0, $v0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall