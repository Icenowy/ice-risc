#include <stdio.h>
#include <stdint.h>

int main(int argc, char **argv)
{
	if (argc != 2) return 1;
	int depth;
	sscanf(argv[1], "%d", &depth);
	printf("DEPTH\t\t=\t%d;\n", depth);
	printf("WIDTH\t\t=\t32;\n");
	printf("ADDRESS_RADIX\t=\tHEX;\n");
	printf("DATA_RADIX\t=\tHEX;\n");
	printf("CONTENT\t BEGIN\n");
	uint32_t content;
	size_t index;
	while (fread(&content, 1, sizeof(uint32_t), stdin) == sizeof(uint32_t)) {
		printf("%x\t\t:%08x;\n", (unsigned int) index, (unsigned int)content);
		index++;
	}
	if (index == depth - 1)
		printf("%x\t\t:%08x;\n", (unsigned int) (depth - 1), (unsigned int) 0);
	else if (index < depth - 1)
		printf("[%x..%x]\t:%08x;\n", (unsigned int) index, (unsigned int) (depth - 1), (unsigned int) 0);
	printf("END;\n");
}
