/*
# Si scriva il codice assembly che esegua le seguenti istruzioni:
#
#	a = <intero inserito dall’utente>
#	b = <intero inserito dall’utente>
#	c = <intero inserito dall’utente>
#
#	if ((a >= b) && (c != 0)) {
#		z = c * (a + b);
#		print z
#	} else {
#		print «errore»
#	}
*/

#include "stdio.h"

int main() {
  int a, b, c, z;

  scanf("%d %d %d", &a, &b, &c);

  if ((a >= b) && (c != 0)) {
    z = c * (a + b);

    printf("%d\n", z);
  } else {
    printf("errore\n");
  }

  return 0;
}
