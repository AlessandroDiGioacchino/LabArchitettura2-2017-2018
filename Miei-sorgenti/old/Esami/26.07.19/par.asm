# Si implementi la funzione par che riceve in input una stringa S e restitiusce 1 se questa è ben parentesizza o 0
# se questa non lo è. Con stringa ben parentesizzata si intenda una stringa che soddisfi queste due condizioni:
#	• in ogni suo prefisso il numero di parentesi tonde aperte è maggiore o uguale al numero di parentesi tonde chiuse;
#	• il numero totale di parentesi tonde aperte è uguale al numero totale di parentesi tonde chiuse.
# La funzione deve essere invocabile da file sorgenti diversi da quello in cui è definita.
#
#	• Il codice ASCII del carattere di fine stringa è 0.
# 	• Il codice ASCII del carattere "(" è 40.
#	• Il codice ASCII del carattere ")" è 41.

	.text
	.globl par
	
par:
	