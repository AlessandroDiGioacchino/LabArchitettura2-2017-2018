	.data
	A: .byte 0 0 0 0, 1 0 0 0, 2 0 0 0, 3 0 0 0, 4 0 0 0, 5 0 0 0
	
	.text
	.globl main
	
main:
	la $a0, A
	li $a1, 6
	li $a2, 0
	jal stampa_contrario
	
	li $v0, 10
	syscall
