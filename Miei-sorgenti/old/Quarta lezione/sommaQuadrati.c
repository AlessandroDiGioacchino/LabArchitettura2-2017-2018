// Si scriva il codice che calcola la somma dei primi N-1 numeri elevati al quadrato.
// Nel caso in cui l’i-esimo numero da aggiungere sia multiplo del valore iniziale della somma, si termini il ciclo for.

#include <stdio.h>

int main() {
  int V, N, Sum, i;

  scanf("%d", &V);
  scanf("%d", &N);

  Sum = V;

  for (i = 1; i < N; i++)
  {
    if ((i * i) % V == 0)
    {
      printf("\nbreak\n");
      break;
    }

    Sum += i * i;
  }

  printf("\n%d\n", Sum);
  return 0;
}
