	.data
	input1: .asciiz "Push = 1, Pop = 2, Print = 3, Esci = 0"
	.align 2
	input2: .asciiz "Inserisci ascissa:"
	.align 2
	input3: .asciiz "Inserisci ordinata:"
	.align 2
	input4: .asciiz "Inserisci angolo:"
	.align 2
	output1: .asciiz "x = "
	.align 2
	output2: .asciiz "y = "
	.align 2
	output3: .asciiz "Angolo = "
	.align 2
	
	return_array: .space 12
	.align 2
	
	.text
	.globl main
	
main:
	loop: li $v0, 51
	la $a0, input1
	syscall
	
	beq $a0, $zero, brk
	beq $a0, 1, push
	beq $a0, 2, pop
	beq $a0, 3, print
	
	j loop
	
	push: li $v0, 51
	la $a0, input2
	syscall
	
	move $s0, $a0
	
	li $v0, 51
	la $a0, input3
	syscall
	
	move $s1, $a0
	
	li $v0, 51
	la $a0, input4
	syscall
	
	move $s2, $a0
	
	move $a0, $s0
	move $a1, $s1
	move $a2, $s2
	
	jal stack_push
	 
	j loop
	
	pop: la $a0, return_array
	
	jal stack_pop
	
	la $s0, return_array
	lw $s1, ($s0)
	lw $s2, 4($s0)
	lw $s3, 8($s0)
	
	li $v0, 56
	la $a0, output1
	move $a1, $s1
	syscall
	
	li $v0, 56
	la $a0, output2
	move $a1, $s2
	syscall
	
	li $v0, 56
	la $a0, output3
	move $a1, $s2
	syscall
	
	j loop
	
	print: jal stack_print
	
	j loop
	
	brk: li $v0, 10
	syscall
