#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

char *cPtr;
int *iPtr;

int *newInt(int param1, int param2);

int main(void) {
  int *iPtr;

  iPtr = newInt(2, 3);
  printf("Value of *iPtr is %d\n", *iPtr);
  free(iPtr);

  return 0;
}

int *newInt(int param1, int param2) {
  int *p, i;

  i = 17;

  {
    int i;

    {
      int i;

      i = 102;
      (void) i;
    }

    i = 5;
    (void) i;
  }
  {
    int i;

    i = 12;
    (void) i;
  }
  {
    int j = i, i;

    i = 12;
    j = 42;
    (void) i;
    (void) j;
  }

  i = 98;

  assert(p = malloc(sizeof(int)));
  *p = param1 * param2;

  return p;
}
