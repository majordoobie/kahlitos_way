#include <stdio.h>
#include <stdlib.h>

int main(void) {
  printf("Helo world!");
  char *string = (char *)calloc(10, sizeof(unsigned char));
  if (NULL != string) {
    printf("we have leaking memory");
  }
}
