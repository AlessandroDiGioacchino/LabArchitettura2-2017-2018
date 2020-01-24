# Si scriva una procedura assembly, chiamata Elaboratore, che esegue la somma, differenza, moltiplicazione e
# divisione tra due numeri interi.
#	Input: i due operandi e un terzo parametro per la selezione dell’operazione.
#	Output: risultato (nel caso della divisione restituisce anche il resto).

	.text
	.globl elaboratore
	
elaboratore:
	subu $sp, $sp, 20
	sw $s0, 16($sp)
	sw $s1, 12($sp)
	sw $s2, 8($sp)
	sw $fp, 4($sp)
	sw $ra, ($sp)
	addiu $fp, $sp, 16
	
	move $s0, $a0
	move $s1, $a1
	move $s2, $a2
	
	beq $s2, 0, somma
	beq $s2, 1, differenza
	beq $s2, 2, moltiplicazione
	beq $s2, 3, divisione
	
	li $v1, -1
	j return
	
	somma: add $v0, $s0, $s1
	j return
	
	differenza: sub $v0, $s0, $s1
	j return
	
	moltiplicazione: mul $v0, $s0, $s1
	j return
	
	divisione: div $s0, $s1
	mfhi $v1
	mflo $v0
	
	return: lw $ra, ($sp)
	lw $fp, 4($sp)
	lw $s2, 8($sp)
	lw $s1, 12($sp)
	lw $s0, 16($sp)
	addi $sp, $sp, 20
	
	jr $ra
