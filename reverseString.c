#include <stdio.h>
int main()
{
    char string[] = "Hello";
    asm volatile(

        ".intel_syntax noprefix;"
        "mov ebx, %1;"
        "xor ecx, ecx;"

        "setLen:"
            "mov al, [ebx];"
            "cmp al, 0;"
            "je findChars;"
            "inc ecx;"
            "inc ebx;"
            "jmp setLen;"

        "findChars:"
            "mov ebx, %1;"
            "mov esi, ebx;"
            "add ebx, ecx;"
            "mov edi, ebx;"
            "dec edi;"

        "reverseString:"
            "mov al, [esi];"
            "mov bl, [edi];"
            "mov [esi], bl;"
            "mov [edi], al;"
            "inc esi;"
            "dec edi;"
            "dec ecx;"
            "dec ecx;"
            "cmp ecx,0;"
            "jg reverseString;"

        ".att_syntax prefix;"
        : "=r"(string)
        : "r"(string)
        : "eax", "ebx", "ecx");
    printf("s = %s\n", string);
    return 0;
}