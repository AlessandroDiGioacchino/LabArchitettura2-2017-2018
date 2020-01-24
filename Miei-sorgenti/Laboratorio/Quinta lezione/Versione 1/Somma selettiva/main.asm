# Si scriva un programma che:
#	chieda all’utente di inserire un array di interi di dimensione arbitraria.
#	invochi una procedura P
#	stampi il valore ritornato da P

	.data
	A: .space 400
	.align 2
	arr: .asciiz "Inserisci un elemento dell'array:"
	len: .asciiz "Inserisci la lunghezza dell'array:"
	output: .asciiz "Il risultato è: "
	
	.text
	.globl main
	
main:
	la $s1, A		# $s1 <-- &A
	move $t0, $s1
	li $t1, 4
	
	li $v0, 51
	la $a0, len
	syscall
	
	move $s0, $a0		# $s0 <-- len(A)
	
	for3: 
	la $a0, arr
	syscall
	
	sw $a0, ($t0)
	addi $t2, $t2, 1
	add $t0, $t0, $t1
	blt $t2, $s0, for3
	
	move $a0, $s1
	li $a1, 0
	move $a2, $s0
	
	jal P
	
	move $a1, $v0
	li $v0, 56
	la $a0, output
	syscall
	
	li $v0, 10
	syscall