	.data
	A: .byte 1 0 0 0 2 0 0 0 3 0 0 0 4 0 0 0 5 0 0 0 6 0 0 0
	B: .byte 0 0 0 0 1 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 1 0 0 0
	
	.text
	.globl main
	
main:
	la $a0, A
	li $a1, 6
	la $a2, B
	li $a3, 12
	
	jal dotproduct
	
	move $a0, $v0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall