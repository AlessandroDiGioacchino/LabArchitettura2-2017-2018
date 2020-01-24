	.data
	A: .byte 0 0 0 0, 1 0 0 0, 2 0 0 0, 3 0 0 0, 4 0 0 0, 5 0 0 0
	.align 2
	output: .asciiz "La somma è: "
	
	.text
	.globl main
	
main:
	la $a0, A
	li $a1, 6
	jal S
	
	move $s0, $v0
	
	li $v0, 56
	la $a0, output
	move $a1, $s0
	syscall
	
	li $v0, 10
	syscall