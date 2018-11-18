// liczy ile jest jedynek w rozwinieciu dwojkowym

#include <stdio.h>

int main()
{

    int x = 5;
    int y = 0;

    asm volatile(
        ".intel_syntax noprefix;"

        "mov eax,%1;" // eax = x
        "mov ebx,%0;" // ebx = y
        "xor ecx,ecx;"
        // "xor edx,edx;"

        "petla:"
        "test eax,0x00000001;"
        "jz skok"
        "test eax,0x00000002;"
        "jz skok"
        "test eax,0x00000004;"
        "jz skok"
        "inc ebx;"
        "shr eax,1;"

        "skok:"
        "inc ecx;"
        "cmp ecx, 32;"
        "jnz petla;"
        "mov %0,ebx;"

        ".att_syntax prefix;"

        : "=r"(y) //%0
        : "r"(x)  //%1
        : "eax", "ebx", "ecx");
    printf("Y = %i\n", y);
    return 0;
}
