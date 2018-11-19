.intel_syntax noprefix
.global main

.text

main:
    mov eax, offset msg
    push eax
    call printf
    add esp, 4
    
    # xor eax, eax
    ret

.data

msg: .asciz "Hello, world\n"  


# zadanie domowe: wyznaczyc wartosc ciagu fibonacciego dla wyrazu, ktory podaje jako argument
# ciag fibonacciego wyliczac rekurencyjnie 
# ./a.out 5 -> wywoluje program z argumentem