void main()
{
	register int i, j;
	j = 0;
	while(1) {
		for (int i = 0; i < 2; i++) i++;
		j++;
		if (j > 7) j = 0;
		*((int *)0x1fc) = j;
	}
}
