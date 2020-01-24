# Mediante le direttive assembler, si allochi la memoria per un array di dimensione 4 inizializzato in memoria come segue:

#	A[0]=0, 
#	A[1]=4, 
#	A[2]=8, 
#	A[3]=12

	.data
	A: .space 16
	
	.text
	.globl main
	
main:
	la $s0, A
	
	sw $zero, ($s0)		# A[0] <-- 0
	
	li $t0, 4
	add $s0, $s0, $t0	# $s0 <-- &A[1]
	sw $t0, ($s0)		# A[1] <-- 4
	
	li $t1, 8
	add $s0, $s0, $t0	# $s0 <-- &A[2]
	sw $t1, ($s0)		# A[2] <-- 8
	
	add $t1, $t1, $t0
	add $s0, $s0, $t0	# $s0 <-- &A[3]
	sw $t1, ($s0)