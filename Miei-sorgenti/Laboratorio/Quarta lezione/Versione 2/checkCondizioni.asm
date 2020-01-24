# Si scriva il codice assembly che esegua le seguenti istruzioni:
#
#	a = <intero inserito dall’utente>
#	b = <intero inserito dall’utente>
#	c = <intero inserito dall’utente>
#
#	if ((a >= b) && (c != 0)) {
#		z = c * (a+b);
#		print z
#	} else {
#		print «errore»
#	}

	.data
	string1: .asciiz "Inserisci un intero: "
	string2: .asciiz "z = "
	string3: .asciiz "errore"

	.text
	.globl main
	
main:
	li $v0, 4
	la $a0, string1
	syscall
	
	li $v0, 5
	syscall
	move $s0, $v0
	
	li $v0, 4
	la $a0, string1
	syscall
	
	li $v0, 5
	syscall
	move $s1, $v0
	
	li $v0, 4
	la $a0, string1
	syscall
	
	li $v0, 5
	syscall
	move $s2, $v0
	
	blt $s0, $s1, err
	beqz $s2, err
	
	li $v0, 4
	la $a0, string2
	syscall
	
	li $v0, 1
	add $t0, $s0, $s1
	mul $a0, $t0, $s2
	syscall
	
	j exit
	
	err: li $v0, 4
	la $a0, string3
	syscall
	
	exit: li $v0, 10
	syscall