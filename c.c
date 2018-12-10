void main()
{
	register int i, j;
	j = 0;
	while(1) {
		for (int i = 0; i < 2048; i++) i++;
		j++;
		*((int *)0xac) = j;
	}
}
