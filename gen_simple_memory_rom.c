#include <stdio.h>

int main()
{
	int i, n = 0;
	while ((i = getchar()) != EOF) {
		char c = i;
		printf("rMemory[%d] <= 8'h%x;\n", n, ((int) c) & 0xff);
		n++;
	}
	return 0;
}
