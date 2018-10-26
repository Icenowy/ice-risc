#include <stdio.h>

int main()
{
	int i, n = 0;
	while ((i = getchar()) != EOF) {
		n++;
		char c = i;
		printf("rMemory[%d] <= 8'h%x;\n", n, ((int) c) & 0xff);
	}
	return 0;
}
