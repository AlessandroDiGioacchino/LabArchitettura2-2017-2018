# Si implementi infine il main che acquisisca i dati, chiami maxmin e minmax e stampi i risultati.

	.data
	arr_max: .space 400
	.align 2
	arr_min: .space 400
	M: .byte 21 0 0 0, 1 0 0 0, 2 0 0 0, 3 0 0 0, 20 0 0 0, 2 0 0 0, 3 0 0 0, 4 0 0 0, 19 0 0 0, 3 0 0 0, 4 0 0 0, 5 0 0 0, 18 0 0 0, 20 0 0 0, 5 0 0 0, 6 0 0 0
	output: .asciiz "Il minimo dei massimi è: "
	
	.text
	.globl main
	
main:
	la $a0, M
	li $a1, 4
	la $a2, arr_max
	jal minmax
	
	move $s0, $v0
	
	li $v0, 56
	la $a0, output
	move $a1, $s0
	syscall
	
	li $v0, 10
	syscall