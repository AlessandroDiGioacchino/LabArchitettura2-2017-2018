	.data
	input: .asciiz "Inserisci un intero:"
	.align 2
	output1: .asciiz "Il suo fattoriale è: "
	output2: .asciiz "Il suo Fibonacci è: "
	
	.text
	.globl main
	
main:
	li $v0, 51
	la $a0, input
	syscall
	
	move $s0, $a0
	
	jal fattoriale
	
	move $s1, $v0
	move $a0, $s0
	
	jal Fibonacci
	
	move $s2, $v0
	
	li $v0, 56
	la $a0, output1
	move $a1, $s1
	syscall
	
	li $v0, 56
	la $a0, output2
	move $a1, $s2
	syscall
	
	li $v0, 10
	syscall
