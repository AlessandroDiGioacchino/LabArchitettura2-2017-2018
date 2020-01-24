# Si scriva un programma che, dato un intero positivo n, stampi a video il fattoriale di n e l’n-esimo numero di Fibonacci F(n)
# dove F(n)=
# 	F(n-2) + F(n-1), se n > 2;
# 	1, se n=2;
# 	0, se n=1.
#
# Il calcolo del fattoriale e del numero di Fibonacci venga operato con l’uso di procedure ricorsive
	
	.text
	.globl Fibonacci
	
Fibonacci:
	subu $sp, $sp, 16
	sw $s0, 12($sp)
	sw $s1, 8($sp)
	sw $fp, 4($sp)
	sw $ra, ($sp)
	addiu $fp, $sp, 12
	
	move $s0, $a0			# $s0 <-- n
	
	li $t0, 1
	beq $t0, $s0, caso_base_uno	# F(1) = 0
	
	li $t0, 2
	beq $t0, $s0, caso_base_due	# F(2) = 1
	
	addi $s0, $s0, -1		# $s0 <-- n - 1
	move $a0, $s0
	
	jal Fibonacci			# Ora ho F(n - 1) in $v0. Devo calcolare F(n - 2) e sommarglielo
	
	move $s1, $v0			# Se mettessi $v0 in $s0 perderei n - 1; se non lo facessi potrei conservarlo, perché
					# è un registro salvato
	
	addi $s0, $s0, -1		# $s0 <-- n - 2
	move $a0, $s0
	
	jal Fibonacci			# Ora ho F(n - 2) in $v0
	
	add $v0, $v0, $s1
	j return
	
	caso_base_uno: li $v0, 0
	j return
	
	caso_base_due: li $v0, 1
	j return
	
	return: lw $ra, ($sp)
	lw $fp, 4($sp)
	lw $s1, 8($sp)
	lw $s0, 12($sp)
	addi $sp, $sp, 16
	
	jr $ra
