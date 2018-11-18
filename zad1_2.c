// liczy ile jest jedynek w rozwinieciu dwojkowym 

#include <stdio.h>

int main(){

	int x = 2018;
	int y = 0;

	asm volatile(
		".intel_syntax noprefix;"

		"mov eax,%1;"
		"xor ebx,ebx;"
		//"mov ebx,0;"
		//"mov ecx,0;"

		"petla:"
			"shl eax;"
			"jnc skok;"
				// "add ebx, 1;"
				"inc ebx;"
			"skok:" 
				"add ecx,1;"
				"cmp ecx,32;"  // compare - porownuje (odejmowanie bez zapisu wartosci)
				"cmp eax, 0;"
				// "and eax, eax;"
				"jnz petla;"
				"mov %0,ebx;"

		".att_syntax prefix;"

		:"=r" (y) //%1
		:"r" (x)  //%0
		:"eax", "ebx", "ecx"
	);
	printf("Y = %i\n",y);
	return 0;
}
