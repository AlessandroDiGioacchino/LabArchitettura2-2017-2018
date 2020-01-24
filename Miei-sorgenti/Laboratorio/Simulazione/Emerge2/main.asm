	.data
	V: .word 1 2 3 4 5 6 7

	space: .asciiz "\t"
	
	.text
	.globl main
	
main:
	li $s0, 5
	li $s1, 5
	la $s2, V
	li $s3, 7
	
	move $a0, $s0
	move $a1, $s1
	move $a2, $s2
	move $a3, $s3
	
	jal emerge2

	li $t0, 0
	
	print_array: beq $t0, $s3, continue
	mul $t1, $t0, 4
	add $t1, $t1, $s2
	lw $t1, ($t1)
	
	li $v0, 1
	move $a0, $t1
	syscall
	
	li $v0, 4
	la $a0, space
	syscall
	
	addi $t0, $t0, 1
	j print_array
	 
	continue: li $v0, 10
	syscall 