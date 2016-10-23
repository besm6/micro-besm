	NAME RS
code segment at 1000h
assume	cs:code

        MOV     AL,36H                  ; SEL TIMER 0,LSB,HSB,MODE 3
        OUT     36h,AL
	NOP
	NOP
        MOV     CX,0FFFH
        MOV     AL,0cH                  ; SET INITIAL TIMER CNT TO 12
        OUT     30h,AL
	NOP
	NOP
        MOV     AL,00
        OUT     30h,AL
;       1.000.000 mHz / 13 = 76923 kHz
C12:                                    ; TIMER0_BITS_ON
        NOP                             ; 1 SEC DELAY
        NOP
        LOOP    C12                     ; TIMER0_BITS_ON
;------------------------------------------------
;       INITIALIZE 8251A
;------------------------------------------------

        MOV     AL,040H         ; reset port
        OUT     02,AL
        MOV     AL,0FFH         ;DELAY
        MOV     CL,0FFH
        SHR     AL,CL
        MOV     AL,0cBH         ; 1200, 7/E, 1 stop
        OUT     02,AL
        MOV     AL,0FFH         ;DELAY
        MOV     CL,0FFH
        SHR     AL,CL
        MOV     AL,37H          ; START 8251A
        OUT     02,AL
        MOV     AL,0FFH         ;DELAY
        MOV     CL,0FFH
        SHR     AL,CL
	int	3
code	ends
	end  RS
