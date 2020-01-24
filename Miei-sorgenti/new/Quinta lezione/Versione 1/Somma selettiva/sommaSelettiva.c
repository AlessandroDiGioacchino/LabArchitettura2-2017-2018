/*
Si scriva un programma che:
  chieda all’utente di inserire un array di interi di dimensione arbitraria.
  invochi una procedura P
  stampi il valore ritornato da P
La procedura P è definita come segue:
  Input: l’array inserito dall’utente e un parametro k
  se k = 0 la procedura calcola la somma di tutti gli interi in posizione (indice nell’array) dispari
  se k = 1 sommerà quelli in posizioni pari.

Suggerimento: allocare l’array staticamente in memoria e passare alla procedura
il base address (passaggio per indirizzo).
*/

#include <stdio.h>
#include <stdlib.h>

int main() {
  int *A;
  int elem, i, l, output;

  printf("Inserisci la lunghezza dell'array: ");
  scanf("%d", &l);

  A = (int *) malloc(l * sizeof(int));

  printf("Inserisci il primo elemento dell'array: ");
  for (i = 0; i < l; i++)
  {
    scanf("%d", &elem);
    A[i] = elem;

    if (i != l - 1) 
    {
      printf("Inserisci il prossimo elemento: ");
    }
  }

  output = P(A, 0, l);
  printf("Il risultato è: %d\n", output);
  return 0;
}

int P(int *A, int k, int l) {
  int i, res;

  if (k == 0)
  {
    for (i = 1; i < l; i += 2)
    {
      res += A[i];
    }
  } else {
      for (i = 0; i < l; i += 2)
      {
        res += A[i];
      }
  }

  return res;
}
