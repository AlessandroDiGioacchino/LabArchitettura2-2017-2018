# Si scriva il codice che calcola la somma dei primi N-1 numeri elevati al quadrato.
# Nel caso in cui l’i-esimo numero da aggiungere sia multiplo del valore iniziale della somma, si termini il ciclo for.
#
# 	V = <intero inserito dall’utente>;
#	N = <intero inserito dall’utente>;
#
#	Sum = V;
#	for (i = 1; i < N; i++)
#	{
#	if ((i * i) % V == 0) {
#		print «break»;
#		break;
#	}
#
#	Sum += i * i;
#	}
#	print Sum

	.data
	begin: .asciiz "Inserisci un intero: "
	.align 2
	err: .asciiz "break\n\n"
	
	.text
	.globl main

main:
	li $v0, 51
	la $a0, begin
	syscall
	
	move $s0, $a0			# $s0 <-- V
	
	la $a0, begin
	syscall
	
	move $s1, $a0			# $s1 <-- N
	move $s2, $s0			# $s2 <-- Sum
	
	li $t0, 1			# i = 1
	
	for: bge $t0, $s1, end		# i <? N
	mul $t1, $t0, $t0
	div $t1, $s0
	mfhi $t2
	
	beqz $t2, interrupt
	
	add $s2, $s2, $t1		# Sum += i * i
	addi $t0, $t0, 1		# i++
	
	bne $t0, $s1, for		# i ?< N
	
	j end
	
	interrupt: li $v0, 4
	la $a0, err
	syscall
	
	end: li $v0, 1
	move $a0, $s2
	syscall