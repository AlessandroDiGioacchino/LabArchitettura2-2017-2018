# Si scriva il codice Assembly che:

#	metta il valore 5 nel registro $s1;
#	metta il valore 7 nel registro $s2;
#	metta la somma dei due nel registro $s0.

	.text
	.globl main
	
main:
	li $s1, 5
	li $s2, 7
	add $s0, $s1, $s2