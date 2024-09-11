#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(void) {
  char *string = (char *)calloc(10, sizeof(unsigned char));
  if (NULL != string) {
    printf("we have leaking memory\n");
  }
  printf("%c", string[20]);

  char *stringer = "Response";
  char *resp = strdup("LIkhResponse");
}
