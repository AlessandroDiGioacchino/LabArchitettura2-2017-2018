# (A) Si implementi, senza fare uso di pseudo-istruzioni, una procedura chiamata ``branchy'' così definita:
# 	Input: due valori interi a e b, due indirizzi del segmento testo T1 e T2.
# 	Output: un indirizzo del segmento testo.
# La procedura restituisce un indirizzo determinato da queste condizioni:
# 	se a>b viene restituito T1;
# 	se a<b viene restituito T2;
# 	(B) se a=b viene restituito l'indirizzo dell'istruzione che, nel chiamante, precede la chiamata
# 	alla procedura.

	.text
	.globl branchy

branchy:
	subu $sp, $sp, 24
	sw $s0, 20($sp)
	sw $s1, 16($sp)
	sw $s2, 12($sp)
	sw $s3, 8($sp)
	sw $fp, 4($sp)
	sw $ra, ($sp)
	addiu $fp, $sp, 20
	
	add $s0, $a0, $zero
	add $s1, $a1, $zero
	add $s2, $a2, $zero
	add $s3, $a3, $zero
	
	slt $t0, $s0, $s1
	addi $t1, $zero, 1
	
	beq $t0, $t1, a_less_b
	beq $s0, $s1, a_equal_b
	
	# a_greater_b
	add $v0, $s2, $zero
	j return
	
	a_less_b: add $v0, $s3, $zero
	j return
	
	a_equal_b: add $v0, $ra, $zero
	addi $v0, $v0, -8		# In $ra viene inserito l'indirizzo della chiamata più 4, quindi
					# devo sottrarre 8
	
	return: lw $ra, ($sp)
	lw $fp, 4($sp)
	lw $s3, 8($sp)
	lw $s2, 12($sp)
	lw $s1, 16($sp)
	lw $s0, 20($sp)
	addi $sp, $sp, 24
	
	jr $ra