.intel_syntax noprefix
.global main
.text

main:
        mov eax, [esp+8]
        mov eax, [eax+4]
        xor ebx, ebx
        xor ecx, ecx

        call szukaj

        push eax
        push offset messg
        call printf
        add esp,8

        xor ebx, ebx
        xor eax, eax
        ret

szukaj:

        poczatek:
                mov ebx, eax
                mov cl, [ebx]
                cmp cl, 0
                je koniec
                jmp petla

        zwieksz:
                inc eax
                mov ebx, eax
                mov cl, [ebx]
                cmp cl, 0
                je koniec

        petla:
                cmp cl, 97
                je nieabc
                cmp cl, 98
                je nieabc
                cmp cl, 100
                je nieabc
                jmp zwieksz

        nieabc:
                inc ebx
                mov cl, [ebx]
                cmp cl, 97
                je zwieksz
                cmp cl, 98
                je zwieksz
                cmp cl, 99
                je zwieksz
                jmp  czy1c


        czy1c:
                inc ebx
                mov cl, [ebx]
                cmp cl, 99
                je czy2c
                cmp cl, 97
                je zwieksz
                cmp cl, 98
                je zwieksz
                jmp czy1c


        czy2c:
                inc ebx
                mov cl, [ebx]
                cmp cl, 99
                je koniec
                jmp zwieksz


        koniec:
                inc ebx
                mov cl, 0
                mov [ebx], cl
                ret


.data
                messg: .asciz "Wynik = %s\n"


