#include <stdio.h>

int factorial(int n);

int main(void) {
  int n;

  printf("Compute factorial of ");
  scanf("%d", &n);
  printf("Factorial of %d equals %d\n", n, factorial(n));
  fflush(stdout);

  return 0;
}

int factorial(int n) {
  if(n <= 1)
    return 1;
  else
    /* because multiplication is performed after the recursive call returns,
       this function is not a candidate for tail recursion elimination
       optimization*/
    return n*factorial(n-1);
}
