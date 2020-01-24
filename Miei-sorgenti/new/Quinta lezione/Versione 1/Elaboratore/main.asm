# Si scriva poi il main dove:
#
#	vengono chiesti all’utente operandi e operatore;
#	il risultato dell’operazione è mostrato a terminale.

	.data
	input1: .asciiz "Inserisci il primo operando: "
	.align 2
	input2: .asciiz "Inserisci il secondo operando: "
	input3: .asciiz "Quale operazione? (0 per somma, 1 per differenza, 2 per moltiplicazione, 3 per divisione) "
	new_line: .asciiz "\n"
	output1: .asciiz "Risultato dell'operazione: "
	output2: .asciiz "Resto della divisione: "
	
	.text
	.globl main
	
main:
	li $v0, 51
	la $a0, input1
	syscall
	
	move $s0, $a0
	
	li $v0, 51
	la $a0, input2
	syscall
	
	move $s1, $a0
	
	li $v0, 51
	la $a0, input3
	syscall
	
	move $s2, $a0
	
	move $a0, $s0
	move $a1, $s1
	move $a2, $s2
	
	jal Elaboratore
			
	move $s0, $v0
	move $s1, $v1
	
	li $v0, 4
	la $a0, output1
	syscall
	
	li $v0, 1
	move $a0, $s0
	syscall
	
	li $v0, 4
	la $a0, new_line
	syscall
	
	bne $s2, 3, exit
	
	li $v0, 4
	la $a0, output2
	syscall
	
	li $v0, 1
	move $a0, $s1
	syscall
	
	li $v0, 4
	la $a0, new_line
	syscall
	
	exit: li $v0, 10
	syscall
