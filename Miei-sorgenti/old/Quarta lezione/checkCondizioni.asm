# Si scriva il codice assembly che esegua le seguenti istruzioni:
#
#	a = <intero inserito dall’utente>
#	b = <intero inserito dall’utente>
#	c = <intero inserito dall’utente>
#
#	if ((a >= b) && (c != 0)) {
#		z = c(a+b);
#		print z
#	}
#	else {
#		print «errore»
#	}

	.data
	begin: .asciiz "Inserisci un intero: "
	.align 2
	err: .asciiz "Errore"
	end: .asciiz "c * (a + b) = "
	
	.text
	.globl main
	
main:
	li $v0, 51
	la $a0, begin
	syscall
	
	move $s0, $a0		# $s0 <-- a
	
	li $v0, 51
	la $a0, begin
	syscall
	
	move $s1, $a0		# $s1 <-- b
	
	li $v0, 51
	la $a0, begin
	syscall
	
	move $s2, $a0		# $s2 <-- c
	
	blt $s0, $s1, print
	beqz $s2, print
	
	add $t0, $s0, $s1	# $t0 <-- a + b
	mul $t0, $t0, $s2	# $t0 <-- c * (a + b)
	
	li $v0, 56
	la $a0, end
	move $a1, $t0
	syscall
	
	li $v0, 10
	syscall
	
	print: li $v0, 4
	la $a0, err
	syscall