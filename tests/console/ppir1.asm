	NAME PPI
BOOT	SEGMENT AT 0FFFFH
STR	LABEL	WORD
BOOT	ENDS
code segment at 01000h
assume	cs:code
;	ACTIVATE 8255 PPI
	MOV	AL,0A6H
	OUT	046H,AL
C3:
c5:	in	al,044h
	and	al,1h
	jz	c5
	in	al,42h
	out	0,al
	JMP C3
	END
