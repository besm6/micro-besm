	NAME NEWRATE
CTC8253HCT      EQU  0B0H
CTC8253LCT      EQU  0B6H
CTC8253MODE     EQU  0B6H

        SIODATAPORT0    EQU  00H
        SIOSTATPORT0    EQU  02H
        CTCDATAPORT0    EQU  030H
        CTCSTATPORT     EQU  036H

;-----  VERIFY THAT TIMER 0 FUNCTIONS OK
CODE	SEGMENT	AT 1000H
ASSUME CS:CODE
;
        MOV     AL,050H         ; RESET
        OUT     SIOSTATPORT0,AL
;
        MOV     AL,36H                  ; SEL TIMER 0,LSB,HSB,MODE 3
        OUT     CTCSTATPORT,AL
	NOP
	NOP
        MOV     CX,0FFFH
        MOV     AL,52;0D1H             ; SET INITIAL TIMER CNT TO 43D1
        OUT     CTCDATAPORT0,AL
	NOP
	NOP
        MOV     AL,0H
        OUT     CTCDATAPORT0,AL
;       1.000.000 mHz / 17361
C12:                                    ; TIMER0_BITS_ON
        NOP                             ; 1 SEC DELAY
        NOP
        LOOP    C12                     ; TIMER0_BITS_ON
;------------------------------------------------
;       INITIALIZE 8251A
;------------------------------------------------
        MOV     AL,0cDH         ; 57600, 8/none, 2 stop
        OUT     SIOSTATPORT0,AL
        MOV     AL,0FFH         ;DELAY
        MOV     CL,0FFH
        SHR     AL,CL
        MOV     AL,27H          ; START 8251A
        OUT     SIOSTATPORT0,AL
        MOV     AL,0FFH         ;DELAY
        MOV     CL,0FFH
        SHR     AL,CL
	INT	3
CODE	ENDS
	END
