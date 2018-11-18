// liczy ile jest jedynek w rozwinieciu dwojkowym 

#include <stdio.h>

int main(){

	int x = 101;
	int y = 0;

	asm volatile(
		".intel_syntax noprefix;"

		"mov eax,%1;" // eax = x
		"mov ebx,%0;" // ebx = y
		"mov ecx,0;" // ecx, edx = 0
		"mov edx,0;"
		//"xor ebx,ebx;"
		//"mov ebx,0;"
		//"mov ecx,0;"

		"petla:"
			"shl eax;"
			"jnc skok;"
				//"add ebx, 1;
				"cmp ecx,0;"
					"jz cpm edx,1;"
						"jz inc ebx;"
			"skok:" 
				//"add ecx,1;"
				//"cmp ecx,32;"  // compare - porownuje (odejmowanie bez zapisu wartosci)
				//"cmp eax, 0;"
				//"and eax, eax;"
				"mov edx, ecx;"

				"jnz petla;"
				//"mov %0,ebx;"

		".att_syntax prefix;"

		:"=r" (y) //%0
		:"r" (x)  //%1
		:"eax", "ebx", "ecx"
	);
	printf("Y = %i\n",y);
	return 0;
}
