# Si scriva il codice che calcola la somma dei primi N-1 numeri elevati al quadrato.
# Nel caso in cui l’i-esimo numero da aggiungere sia multiplo del valore iniziale della somma, si termini il ciclo for.
#
#	V = <intero inserito dall’utente>;
#	N = <intero inserito dall’utente>;
#
#	Sum = V;
#	for (i = 1; i < N; i++) {
#		if ((i * i) % V == 0){
#			print «break»;
#			break;
#		}
#
#		Sum += i * i;
#	}
#	print Sum

	.data
	string1: .asciiz "Inserisci un intero: "
	string2: .asciiz "break"
	string3: .asciiz "\nSum = "

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
	
	li $t0, 1
	move $s2, $s0
	for: beq $t0, $s1, print
	mul $t1, $t0, $t0
	div $t1, $s0
	mfhi $t2
	beqz $t2, brk
	
	add $s2, $s2, $t1
	addi $t0, $t0, 1
	j for
	
	brk: li $v0, 4
	la $a0, string2
	syscall
	
	print: li $v0, 4
	la $a0, string3
	syscall
	
	li $v0, 1
	move $a0, $s2
	syscall
	
	li $v0, 10
	syscall
	