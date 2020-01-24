# Si implementi infine il main che acquisisca i dati, chiami subseteq e raccolga i risultati

	.data
	A1: .byte 0 0 0 0, 1 0 0 0, 2 0 0 0
	A2: .byte 0 0 0 0, 1 0 0 0, 2 0 0 0, 3 0 0 0
	output: .asciiz "A2 è contenuto in A1? (0 = no, 1 = sì)\n"
	
	.text
	.globl main
	
main:
	la $a0, A1
	la $a1, A2
	li $a2, 3
	li $a3, 4
	
	jal subseteq
	
	la $a0, output
	move $a1, $v0
	li $v0, 56
	syscall
	
	li $v0, 10
	syscall