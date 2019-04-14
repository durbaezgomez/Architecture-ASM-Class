.intel_syntax noprefix
.global main
.text

main:
        mov eax, [esp+8]
        mov eax, [eax+4]
        xor ebx, ebx
        xor ecx, ecx

        call find

        push eax
        push offset messg
        call printf
        add esp,8

        xor ebx, ebx
        xor eax, eax
        ret

find:

        start:
                mov ebx, eax
                mov cl, [ebx]
                cmp cl, 0
                je koniec
                jmp findpqrs

        increment:
                inc eax
                mov ebx, eax
                mov cl, [ebx]
                cmp cl, 0
                je niekoniec

        findpqrs:
                cmp cl, 112     #p
                je notqr
                cmp cl, 113     #q
                je notqr
                cmp cl, 114     #r
                je notqr
                cmp cl, 115     #s
                je notqr
                jmp increment

        notqr:
                inc ebx
                mov cl, [ebx]
cmp cl, 0
je niekoniec
                cmp cl, 113     #q
                je increment
                cmp cl, 114     #r
                je increment
                jmp  finalr


        finalr:
                inc ebx
                mov cl, [ebx]
                cmp cl, 114     #r
                je koniec
                cmp cl, 113     #q
                je increment
                cmp cl, 0
                
        niekoniec:
push eax
                mov ebx, offset aaa
                push aaa
                call printf
                add esp,4               
pop eax
        
                mov cl,'#'
                mov [eax],cl
                ret

        koniec:
push eax
push ebx
mov ebx, offset  bbb
push ebx
call printf
add esp, 4
pop ebx
pop eax
                inc ebx
                mov cl, 0
                mov [ebx], cl
                ret


.data
                messg: .asciz "Wynik =%s\n"
                aaa: .asciz "AAA"
                bbb: .asciz "BBB"

