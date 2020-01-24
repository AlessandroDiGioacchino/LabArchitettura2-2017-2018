# Si implementi una procedura ricorsiva S che prenda in input un array e il numero di elementi di quell’array
# e restituisca la somma di tutti gli elementi dell’array. Si usi come riferimento il seguente codice sorgente C:
#
# int S(int arr[], int dim) {
#	if (dim == 0) // caso base: array vuoto
#		return 0;
#	else // step ricorsivo
#		return S(arr, dim - 1) + arr[dim - 1];
# }

	.text
	.globl S

S:
	subu $sp, $sp, 20
	sw $s0, 16($sp)
	sw $s1, 12($sp)
	sw $fp, 8($sp)
	sw $ra, 4($sp)
	addiu $fp, $sp, 16
	
	move $s0, $a0
	move $s1, $a1
	
	bnez $s1, else
	
	li $v0, 0
	j return
	
	else: addi $a1, $s1, -1
	sw $a1, ($sp)
	
	jal S
	
	lw $a1, ($sp)
	mul $t0, $a1, 4
	add $t0, $t0, $s0
	lw $t1, ($t0)
	
	add $v0, $v0, $t1
	
	move $a0, $s0
	
	return: lw $ra, 4($sp)
	lw $fp, 8($sp)
	lw $s1, 12($sp)
	lw $s0, 16($sp)
	addi $sp, $sp, 20
	
	jr $ra

# Per prima cosa, si scrive il caso base.
# 	Durante la prima parte del caso ricorsivo, bisogna unicamente salvare il dato su cui è basata la ricorsione nello stack.
# 	In questo caso si tratta della lunghezza dell'array, che viene memorizzata nella linea 31. Fatto questo si può procedere
# alla chiamata della procedura.
#	Da questo momento in poi devi supporre di avere tutti i dati pronti in $v0, tranne l'ultimo. Nell'esempio sopra,
# 	ciò si traduce in: la somma di tutti gli elementi dell'array tranne quello in posizione (len - 1) è disponibile in $v0
# 	a partire dalla linea 35; c'è quindi bisogno di:
# - caricare dallo stack (len - 1), memorizzata nella linea 31;
# - prendere l'elemento dell'array in tale posizione;
# - sommarlo agli altri in $v0.
#	Grazie a come il codice è stato strutturato, l'istruzione jr $ra nella linea 50 permetterà al tutto
#	di funzionare correttamente: il PC tornerà all'istruzione di load word nella linea 35, verrà calcolato l'offset per
# accedere all'array, eccetera.