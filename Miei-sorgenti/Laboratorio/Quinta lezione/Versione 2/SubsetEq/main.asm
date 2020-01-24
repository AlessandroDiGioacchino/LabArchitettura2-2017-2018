# Si implementi infine il main che acquisisca i dati, chiami subseteq e raccolga i risultati

	.data
	A1: .word 0 14 2 3 4 5 6 7 7 9
	A2: .word 0 1 2 3 4 5 6 7 7 9 10 11 12 13 
	
	.text
	.globl main
	
main:
	la $a0, A1
	la $a1, A2
	li $a2, 10
	li $a3, 14
	
	jal subseteq
	
	move $a0, $v0
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall