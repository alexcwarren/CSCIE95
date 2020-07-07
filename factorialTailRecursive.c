#include <stdio.h>

int factorial(int n);
int factorial_tail_recursive(int n, int product);

int main(void) {
  int n;

  printf("Compute factorial of ");
  scanf("%d", &n);
  printf("Factorial of %d equals %d\n", n, factorial(n));
  fflush(stdout);

  return 0;
}

/* factorial has the usual calling convention */
int factorial(int n) {
  if(n <= 0)
    return 0;
  else
    return factorial_tail_recursive(n, 1);
}

/* factorial_tail_recursive includes the product as it is built */
int factorial_tail_recursive(int n, int product) {
  if(n <= 1)
    return product;
  else
    /* the multiplication is performed when passing the actual argument, so
       that no action needs to be performed after the function returns.  This
       makes the function a candidate for tail recursion elimination
       optimization*/
    return factorial_tail_recursive(n-1, product*n);
}
