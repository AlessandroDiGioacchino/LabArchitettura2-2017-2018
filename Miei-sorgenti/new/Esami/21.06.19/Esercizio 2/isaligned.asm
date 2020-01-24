# (A) Si implementi una procedura così definita:
#	• Input: un indirizzo di memoria
#	• Output: un valore binario
# La procedura restituisce 1 se l’indirizzo passato è allineato, 0 altrimenti.
# (B) Si implementi poi un main che invochi tale procedura in entrambi i due casi possibili.

	.text
	.globl is_aligned
	
is_aligned:
	subu $sp, $sp, 8
	sw $fp, 4($sp)
	sw $ra, ($sp)
	addiu $fp, $sp, 4

	move $t0, $a0
	
	andi $t1, $t0, 0x11
	
	li $t0, 1
	sub $v0, $t0, $t1
	
	lw $ra, ($sp)
	lw $fp, 4($sp)
	addi $sp, $sp, 8
	
	jr $ra
