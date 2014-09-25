#include <stdio.h>

extern int fib(int x);

int main(int argc, char **argv)
{
  int number=0;
  int result=0;

  scanf("%d",&number);
  result = fib(number);   
  printf("The fibonacci sequence at %d is: %d\n", number, result);
}

