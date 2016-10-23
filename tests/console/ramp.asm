	NAME RAMP
code segment at 1000h
assume	cs:code
START:
	MOV	CX,128
	MOV	DX,100H
	NOP
	NOP
C1:	MOV	AX,bx
	OUT 	DX,AX
	INC	DX
;	INC 	DX
	NOP
	LOOP	C1
	JMP	START
;	int	3
code	ends
	end
