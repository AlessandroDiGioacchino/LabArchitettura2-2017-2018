# Si scriva il codice che dato un intero inserito dall’utente restituisca il numero pari successivo.

	.data
	begin: .asciiz "Inserisci un intero: "
	.align 2
	end: .asciiz "Il numero pari successivo è: "
	
	.text
	.globl main
	
main:
	li $v0, 51
	la $a0, begin
	syscall
	
	move $s0, $a0
	
	li $t0, 2
	div $s0, $t0
	mfhi $t1
	
	beqz $t1, pari
	bnez $t1, dispari
	
	pari: add $s1, $t0, $s0
	j print
	
	dispari: addi $s1, $s0, 1
	
	print: li $v0, 56
	la $a0, end
	move $a1, $s1
	syscall