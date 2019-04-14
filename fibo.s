.intel_syntax noprefix
	.global main
	.text
main:
	mov eax, [esp+8] 
	mov eax, [eax+4]
	push eax
	call atoi
	add esp, 4

	push eax
	call fibo
	add esp, 4

	push eax
	push offset messg
	call printf
	add esp, 8
	xor eax,eax
	ret

fibo:
	mov eax, [esp+4]
	cmp eax, 2
	jg skok
	mov eax, 1
	ret

	skok:
		dec eax
		push eax  // wrzucenie wartosci na stos
		push eax //n-1
		call fibo
		add esp, 4
		pop ebx //zdjecie wartosci ze stosu
		push eax //wrzucenie wyniku fib(n-1) na stos
		dec ebx //n-2
		push ebx //wrzucenie n-2 na stos
		call fibo
		add esp, 4
		pop ebx //zdjecie fib(n-1)
		add eax, ebx //dodanie fib(n-1)+fib(n-2)
		ret
	.data
messg:	.asciz "Wynik = %i\n"