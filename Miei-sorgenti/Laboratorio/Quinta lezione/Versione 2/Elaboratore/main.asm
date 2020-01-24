# Si scriva poi il main dove:
#    vengono chiesti all’utente operandi e operatore;
#    il risultato dell’operazione è mostrato a terminale.

	.data
	string1: .asciiz "Inserisci un intero: "
	string2: .asciiz "Inserisci l'operatore\n(+ : 0, - : 1, * = 2, / = 3): "
	string3: .asciiz "Risultato: "
	string4: .asciiz "\nResto della divisione: "
	string5: .asciiz "errore"

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
	la $a0, string2
	syscall
	
	li $v0, 5
	syscall
	move $s2, $v0
	
	move $a0, $s0
	move $a1, $s1
	move $a2, $s2
	
	jal elaboratore
	
	beq $v1, -1, err
	
	move $t0, $v0
	move $t1, $v1
	
	li $v0, 4
	la $a0, string3
	syscall
	
	li $v0, 1
	move $a0, $t0
	syscall
	
	blt $s2, 3, exit
	
	li $v0, 4
	la $a0, string4
	syscall
	
	li $v0, 1
	move $a0, $t1
	syscall
	
	j exit
	
	err: li $v0, 4
	la $a0, string5
	syscall
	
	exit: li $v0, 10
	syscall