	NAME DPM
BOOT	SEGMENT AT 0FFFFH
STR	LABEL	WORD
BOOT	ENDS
code segment at 03000h
assume	cs:code
START:
	MOV	DX,4096
	MOV	AX,0E000H
	MOV	ES,AX
	MOV	AX,0FC00H
	MOV	DS,AX
	MOV	CX,DX
	STD
	MOV	SI,03FFEH
	MOV	DI,03FFEH
C123:
	XOR	BX,BX
	MOV	AX,DS:[SI]
	SUB	SI,2
	MOV	ES:[DI],AX
	SUB	DI,2
;	MOVSW
	NOP
	NOP
	NOP
	NOP
	NOP
	NOP
	LOOP C123
;	MOV	BX,01FF1H
;	MOV	AX,0C7CH
;	MOV	ES:[BX],AX
	MOV	CX,127

	MOV	DX,100H
	MOV	AX,800H
	XOR BX,BX
C1:
	OUT 	DX,AX
	ADD	DX,2
	INC AX
	NOP
	LOOP	C1
	MOV	DX,01FEH
	MOV	AX,873H
	OUT	DX,AX
	NOP
	NOP
	NOP
	CLI
	MOV	AX,1
	OUT	0AAH,AX
	NOP
	NOP
	NOP
	NOP
	NOP
starTE:
	cli
	cld
HOW_BIG:
        MOV     DX,0E000H                ; SET POINT TO JUST>16KB
        MOV     cx,0                   ; BASIC COUNT OF 16K
FILL_LOOP:
	mov	bx,cx
        MOV     ES,DX                   ; SET SEG. REG.
        SUB     DI,DI
;        MOV     AX,0AA55H               ; TEST PATTERN
;        MOV     CX,2000H                ; SET COUNT FOR 32K WORDS
;        REP     STOSW                   ; FILL 32K WORDS
        MOV     AX,0H               ; TEST PATTERN
        MOV     CX,4000H                ; SET COUNT FOR 32K WORDS
FIADR:
          STOSB                   ; FILL 32K WORDS
	ADD AX,1
	LOOP FIADR
        ADD     DX,01000H               ; POINT TO NEXT 64KB BLOCK
	mov	cx,bx
;	loop	fill_loop
	mov	cx,0
	mov	dx,0E000h
check1:
	mov	bx,cx
	mov	ds,dx
	mov	cx,4000h
	mov	si,0
	MOV	BX,0
check_loop:
	mov	ax,0ffh
	lodsB
	cmp	aL,BL
	jz next
	MOV	AL,'x'
	NOP
	NOP
	OUT	00,AL
	JMP 	starTE
next:	ADD	BX,1
	loop	check_loop
	add	dx,1000h
	mov	cx,bx
	MOV AL,'.'
	OUT	00,AL
;	loop	check1;
	jmp	starTE
;	DB	0EAH
;	DW 	0
;	DW	0FFFFH
	int	3
code	ends
	end
