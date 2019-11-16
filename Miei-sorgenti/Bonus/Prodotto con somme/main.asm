	.data
	input_first: .asciiz "Moltiplicando?"
	.align 2
	input_second: .asciiz "Moltiplicatore?"
	output: .asciiz "Il prodotto è: "
	
	.text
	.globl main
	
main:
	li $v0, 51
	la $a0, input_first
	syscall
	
	move $s0, $a0
	
	li $v0, 51
	la $a0, input_second
	syscall
	
	move $a1, $a0
	move $a0, $s0
	jal prodotto_s
	
	move $a1, $v0
	li $v0, 56
	la $a0, output
	syscall
	
	li $v0, 10
	syscall