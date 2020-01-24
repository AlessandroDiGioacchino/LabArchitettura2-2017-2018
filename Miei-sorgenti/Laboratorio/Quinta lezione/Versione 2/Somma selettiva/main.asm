# Si scriva un programma che:
#	chieda all’utente di inserire un array di interi di dimensione arbitraria.
#	invochi una procedura P
#	stampi il valore ritornato da P

	.data
	A: .space 400
	string1: .asciiz "Quanti elementi? "
	string2: .asciiz "Inserisci l'elemento: "
	string3: .asciiz "\n0 : sommo indici dispari, 1 : sommo indici pari\n"
	string4: .asciiz "\nP ha ritornato il seguente: "
	string5: .asciiz "\nerrore"
	
	.text
	.globl main
	
main:
	li $v0, 4
	la $a0, string1
	syscall
	
	li $v0, 5
	syscall
	
	move $s0, $v0
	bltz $s0, err
	
	li $t0, 0
	la $t1, A
	
	scan: beq $t0, $s0, continue
	mul $t2, $t0, 4
	add $t2, $t2, $t1
	
	li $v0, 4
	la $a0, string2
	syscall
	
	li $v0, 5
	syscall
	
	sw $v0, ($t2)
	
	addi $t0, $t0, 1
	j scan
	
	continue: li $v0, 4
	la $a0, string3
	syscall
	
	li $v0, 5
	syscall
	
	move $a1, $v0
	la $a0, A
	move $a2, $s0
	
	jal P
	
	beq $v1, -1, err
	
	move $s1, $v0
	
	li $v0, 4
	la $a0, string4
	syscall
	
	move $a0, $s1
	li $v0, 1
	syscall
	
	j exit
	
	err: li $v0, 4
	la $a0, string5
	syscall
	
	exit: li $v0, 10
	syscall