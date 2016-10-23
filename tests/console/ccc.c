#include <stdio.h>
FILE *in;
FILE *out;
unsigned char convtab[] = "avs e  n  k m or   t   hu  ";/*ABVGDEXZIJKLMNOPRSTUFHC:WQ+Y\"}{?abvgdexzijklmnoprstufhc;wq=y\'][/ ";*/
main()
{
unsigned char c;
	in=fopen("xapka","rb");
	out=fopen("xapka.txt","w");

while(!feof(in))
	{
	c=fgetc(in);
	if(c >0200)c=040;
	if(c == 0x7e)c = ';';
	if(c == 'q')c ='/';
	if(c == 'b')c = '\'';
	if(c == 'v')c ='x';
	if(c == '|')c = ']';

	if(c == 32)
		{
		fputc(c,out);
		continue;
		}
	if(c >0100 && c <= 0x5a )
		{
		c = convtab[c - 0101];
		}
	fputc(c,out);
	}
fclose(in);
fclose(out);
}
