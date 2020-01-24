# Si scriva una procedura assembly, chiamata Elaboratore, che esegue la somma, differenza, moltiplicazione e divisione
# tra due numeri interi.
#
# Input: i due operandi e un terzo parametro per la selezione dell’operazione.
# Output: risultato (nel caso della divisione restituisce anche il resto).
	
	.text
	.globl Elaboratore
	
Elaboratore:
	subu $sp, $sp, 8
	sw $fp, 4($sp)
	sw $ra, ($sp)
	addiu $fp, $sp, 4

	move $t0, $a0
	move $t1, $a1
	move $t2, $a2
	
	beq $t2, 1, differenza
	beq $t2, 2, moltiplicazione
	beq $t2, 3, divisione
	
	somma: add $v0, $t0, $t1
	j return
	
	differenza: sub $v0, $t0, $t1
	j return
	
	moltiplicazione: mul $v0, $t0, $t1
	j return
	
	divisione: div $t0, $t1
	mfhi $v1
	mflo $v0
	
	return: lw $ra, ($sp)
	lw $fp, 4($sp)
	addi $sp, $sp, 8
	
	jr $ra
