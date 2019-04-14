.intel_syntax noprefix
.global main
.text

main:
        mov eax, [esp+8]        #wczytuje argument
        mov eax, [eax+4]
        push eax                #wysylam eax do printf

        add esp,4

        push offset messg
        call printf             #wysylam argument do printf
        add esp,8

      
.data
        messg: .asciz "GIVEN STRING: \n%i\n"