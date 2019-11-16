	.data
	A: .word 10 -4 6 91
	B: .word 21 2 -1 15
	C: .word 2 0 1 7
	
	space: .asciiz " "
	
	.text
	.globl main
	
main:
	la $a0, A
	la $a1, B
	la $a2, C
	li $a3, 4
	
	jal combineArr
		
	move $a0, $v0
	li $v0, 1
	syscall
	
	la $s0, C
	lw $a0, ($s0)
	li $v0, 1
	syscall
	
	li $v0, 4
	la $a0, space
	syscall
	
	li $v0, 1
	lw $a0, 4($s0)
	syscall
	
	li $v0, 4
	la $a0, space
	syscall
	
	li $v0, 1
	lw $a0, 8($s0)
	syscall
	
	li $v0, 4
	la $a0, space
	syscall
	
	li $v0, 1
	lw $a0, 12($s0)
	syscall
	
	li $v0, 10
	syscall
