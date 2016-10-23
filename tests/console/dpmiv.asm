        ASSUME  CS:CODE,DS:CODE,SS:NOTHING
ROMSIZE         EQU  4096       ;TOW CHIP BY 2KB

CODE    SEGMENT at 3000h
reset label far
start:
	cli
	cld
HOW_BIG:
        MOV     DX,0E000H                ; SET POINT TO JUST>16KB
        MOV     cx,0                   ; BASIC COUNT OF 16K
FILL_LOOP:
	mov	bx,cx
        MOV     ES,DX                   ; SET SEG. REG.
        SUB     DI,DI
        MOV     AX,0AA55H               ; TEST PATTERN
        MOV     CX,2000H                ; SET COUNT FOR 32K WORDS
        REP     STOSW                   ; FILL 32K WORDS
        ADD     DX,01000H               ; POINT TO NEXT 64KB BLOCK
	mov	cx,bx
;	loop	fill_loop
	mov	cx,0
	mov	dx,0E000h
check1:
	mov	bx,cx
	mov	ds,dx
	mov	cx,2000h
	mov	si,0
check_loop:
	mov	ax,0ffh
	lodsw
	cmp	ax,0aa55h
	jz next
	MOV	AL,'x'
	NOP
	NOP
	OUT	00,AL
next:	loop	check_loop
	add	dx,1000h
	mov	cx,bx
	MOV AL,'.'
	OUT	00,AL
;	loop	check1;
	jmp	start


        DB      '02/27/89'
CODE    ENDS
        END
