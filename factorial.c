#include <stdio.h>
#include <stdlib.h>

/* Built-in syscalls */
void syscall_print_int(int integer);
void syscall_print_string(char *string);
int syscall_read_int(void);
void syscall_read_string(char *buffer, int length);
void syscall_exit(void);

char *strcpy(char *dest, char *src);
int factorial(int n);

int main(void) {
  char prompt[80];
  int n, f;

  strcpy(prompt, "Factorial of ");
  syscall_print_string(prompt);

  n = syscall_read_int();

  strcpy(prompt, " equals ");
  syscall_print_string(prompt);

  f = factorial(n);

  syscall_print_int(f);

  strcpy(prompt, "\n");
  syscall_print_string(prompt);

  return 0;
}

char *strcpy(char *dest, char *src) {
  char *initial_dest;

  initial_dest = dest;
  do {
    *dest++ = *src;
  } while(*src++);
  return initial_dest;
}

int factorial(int n) {
  if(n <= 1)
    return 1;
  else
    return n*factorial(n-1);
}

/* The functions below allow execution in a standard Posix environment */

void syscall_print_int(int integer) {
  printf("%d", integer);
}

void syscall_print_string(char *string) {
  while(*string) {
    putchar(*string++);
  }
}

int syscall_read_int(void) {
  int i;

  scanf("%d", &i);

  return i;
}

void syscall_read_string(char *buffer, int length) {
  fgets(buffer, length, stdin);
}

void syscall_exit(void) {
  exit(0);
}
