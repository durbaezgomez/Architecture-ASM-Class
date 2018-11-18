
#include <stdio.h>

int main()
{

  char *s = "Hello, world";
  int y;
  asm volatile(

      ".intel_syntax noprefix;"

      "mov ebx,%1;"
      "xor ecx, ecx;"

      "petla:"
      "mov al,[ebx];"
      "cmp al,0;"
      "jz koniec;"
      "inc ecx;"
      "inc ebx;"
      "jmp petla;"

      "koniec:"
      "mov %0,ecx;"

      ".att_syntax prefix;"

      : "=r"(y)
      : "r"(s)
      : "eax", "ebx", "ecx");
  printf("Dlugosc stringa: = %i\n", y);
  return 0;
}
