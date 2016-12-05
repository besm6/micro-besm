*NAME OC-4 (progint - extracod)
*TIME:24.00
*EXPRESS
*PAGE:999,LIST
*LIBRA:23
*DISC:705/SYSTEM,LCROSS
*FILE:LIB,67
*FILE:MEM,30,W
*PERSO:67
*TAKE TAPE:67
*          *DISC:705/SYSTEM,WORKIN
*          *FILE:LCROSS     - PERSO ACCEMБЛEP+ЗAГPYЗЧИK+ЭMYЛЯTOP
*          *FILE:ASSEM      - OПИCAHИE И TEKCTЫ ACCEMБЛEPA И ЗAГPYЗЧИKA
*          *FILE:EXMEM      - ПAMЯTЬ ДЛЯ MOДYЛEЙ ЗAГPYЗKИ
*          *FILE:EML        - TEKCTЫ ЭMYЛЯTOPA (ЗOHA=1)
*          *FILE:OS         - MAKPOCЫ ( 0 )  И TEKCTЫ  O C  ( 120 )
*CALL FICMEMOR
*NO LIST
*CALL ZMACRO
PROGINT:NAME QF
;*
;***      ДЛЯ OPГAHИЗAЦИИ ПPOГPAMMHO-ИMИTИPOBAHHЫX
;*        ПPEPЫBAHИЙ ИCПOЛЬЗYETCЯ MAKPOC  "PINT" :
;*                 XTA INF
;*                 PINT
;*        1:32 PAЗPЯДЫ CYMMATOPA ЗAДAЮT KOД OПEPAЦИИ
;*       33:64  ---"---  И, BOЗMOЖHO, ДPYГИE PEГИCTPЫ
;*             ЗAДAЮT ДOПOЛHИTEЛЬHYЮ ИHФOPMAЦИЮ.
;*
;*        ПPИ BXOДE PROGINT ЗAXBATЫBAET ГЛOБAЛЬHЫЙ
;*        CEMAФOP ПAMЯTИ.  BЫXOД ПPOИЗBOДИTCЯ OБЫЧHO
;*        HA RETURN, TAM CEMAФOP И OCBOБOЖДAETCЯ.
;*
MAINBLCS:SUBP QF
RETURN:SUBP QF
ACTIVATE:SUBP QF
DESACTIV:SUBP QF
DDACTIV:SUBP QF
SEMDOWN:SUBP QF
SEMUP:SUBP QF
CREVENT:SUBP QF
CLEVENT:SUBP QF
RETGROUP:SUBP QF
RESGROUP:SUBP QF
PUSHGRUP:SUBP QF
POPGRUP:SUBP QF
PAUSE:SUBP QF
DELPAUSE:SUBP QF
GIV_PAGE:SUBP QF
PCW
PCBIT
TPP
IFP
PORT:EQU 3
GROUP
RRBIT
MODIF
;
CMD
;
;MOZY=80954      ;  - PROGINT
;
:NG RMOD ACC+1
ATI I ; K O П
NG RMOD ACC
I JMP *+1
;
:JAEQ DESACTIV ; 0-ДEЗAKT.OБЩAЯ
JMP DDACTIV ; ИЛИ ПO ДИAЛOГY
;
:JAEQ CLEVENT ;1-ЖДY COБЫTИЯ
JMP GEN_EV ; ИЛИ ДEЛAЮ EГO
;
:ATI NP ; 2-AKTИBИЗAЦИЯ
JMP ACTIVATE ; YKAЗ.ПPOЦECCA
;
:ATI IA ; 3-ЗAXBAT CEMAФOPA
JMP SEMDOWN
:ATI IA ; 4-EГO OCBOБOЖДEHИE
JMP SEMUP
;
:TN XTA PCW ; 5-ЗABEPШEHИE
JMP FINISH ; PAБOTЫ ПPOЦECCA
;
:ATI J ; 6-ЗAПOЛHEHИE
JMP POP ; CBOEЙ ГPYППЫ
;
:R VTM RETURN ; 7-ЗAПPOC
JMP RESGROUP ; PEЗEPB.ГPYППЫ
;
:ASN @400-10 ; 8-CДEЛATЬ
JMP PAUSE ; ПAYЗY (MCEK.)
;
:ATI NP ; 9-ПPEPBATЬ
JMP DELPAUSE ; ПAYЗY
;
:ATI NP ; 10-ЗAЯBKA K
JMP GIV_PAGE ; SWING-Y
;
:NP VTM 1 ; 11-ЗAMEHA
JMP PCHANGE ; HOMEPOB CTPAHИЦ
;
;
GEN_EV:15 ATX
AAU @FF
STI NP ; AДPECAT
ASFT 8
ATI IA ; HOM.COБЫTИЯ
JMP CREVENT
;
;        ФИHAЛЬHЫE OПEPAЦИИ ПO ЗABEPШEHИЮ PAБOTЫ
;        ПPOЦECCA.  OCBOБOЖДEHИE BCEX ГPYПП PEГИCTPOB,
;        OTBЯЗKA OT ПPOЦECCOPA, ДEЗAKTИBAЦИЯ.
;        ДЛЯ HECИCTEMHЫX ПPOЦECCOB OCBOБOЖДAETCЯ ЛИCT
;        C ИП И ГACИTCЯ PCW.
;
FINISH:ATI I
AAN P_SYST
JANE FIN_S
TN ATX TABPRT
I MSFT 10
I ATH TPP<<1
NTA READY_
TN ATX PCW
JMP RETGROUP
;
FIN_S:ITA I
AAU @3FF ; ECTЬ ЛИ
ATI I ; EЩE PAБOTA
I XTA IFCTIM+PORT
JANE RETURN ; - ДA
TN MTJ NP
RR VTM RETGROUP
JMP PUSHGRUP
;
;         ЗAПOЛHEHИE AKTИBHOЙ ГPYППЫ COДEPЖИMЫM
;         BEPXYШKИ CTEKA YПPЯTЫBAHИЯ PEГИCTPOB.
;         ECЛИ ЗAДAH HEHYЛEBOЙ AДPEC BOЗBPATA,
;         OH ПOCЫЛAETCЯ B CЧAC И ДOБABЯTCЯ PД+POA
;
POP:TN MTJ NP
RR VJM POPGRUP
J JMEQ MAINBLCS
ITA J
NG WMOD CЧAC
NG RMOD PP
AON 64-PД
AON 64-POA
NG WMOD PP
JMP MAINBLCS
;
;         KOП = 11  : ЗAMEHA HOMEPOB CTPAHИЦ
;         HOMEPA ЗAДAЮTCЯ B 64:49 И 48:33 PAЗPЯДAX
;
PCHANGE:15 ATX
AAU @FFFF
STI J
ASFT 16
ATI I
J QTA TMP<<2
ATI P2
I QTA TMP<<2
PC1:J ATQ TMP<<2
ASFT 4
ATI W
JAEQ PC2
ITA J
ASFT -16
W AEH TPP<<1
AAU @F0000
W AEH TPP<<1
W ATH TPP<<1
AAU @3FF
W MSFT -10
PC2:AOI W
J WMOD @400
ITA P2
I MCJ J
NP VRM PC1
JMP RETURN
END
EXTRACOD:NAME QF
;
KEX:EQU @F ; ЧИCЛO ЭKCTPAKOДOB
;
1:BLOCK B,N,M,A
,E,C,T,I,J
,L,D,R,S,IA
IFP
ASTR:BLOCK DOUT,DIN
FATA
CODE
PACKDATE:SUBP QF
PACKTIME:SUBP QF
DATE:SUBP QF
TIME:SUBP QF
CDEF
;
CONST
;
;           К О Д Ы   О П Е Р А Ц И Й :
;          ============================
;
coldl:
char "20  21  UTC WTC VTM UTM UZA UIA UJ  VJM 32  33  VZM VIM 36  VLM "
colds:
char "ATX STX 002 XTS A+X A-X X-A AMX XTA AAX AEX ARX AVX AOX A/X A*X "
char "APX AUX ACX ANX E+X E-X ASX XTR RTE YTA 032 033 E+N E-N ASN NTR "
char "ATI STI ITA ITS MTJ J+M 046 047 *50 *51 *52 *53 *54 *55 *56 *57 "
char "*60 *61 *62 *63 *64 *65 *66 *67 *70 *71 *72 *73 *74 *75 *76 *77 "
cnewl:
char "ATX STX <02>XTS <04><05><06><07>XTA AAX AEX ARX <0C>AOX A/X <0F>"
char "APX AUX ACX ANX E+X E-X ASX <17>JMP VJM <1A>VLM <1C><1D><1E><1F>"
char "JMEQJMNEJMGEJMLTJMLEJMGT<26><27>*50 *51 *52 *53 *54 *55 *56 *57 "
char "*60 *61 *62 *63 *64 *65 *66 *67 *70 *71 *72 WTC VTM UTM *76 *77 "
char "<40><41><42>UTS <44><45><46><47>UTA AAU AEU <4B><4C>AOU <4E><4F>"
char "<50><51>ACU ANU <54><55><56><57><58><59><5A><5B><5C><5D><5E><5F>"
char "<60><61><62><63><64><65><66><67><68><69><6A><6B><6C><6D><6E><6F>"
char "<70><71><72><73><74><75><76><77><78><79><7A><7B><7C><7D><7E><7F>"
char "FUN A+U A-U U-A <84><85>A/U A*U UTY <89><8A><8B><8C><8D><8E><8F>"
char "UTC <91><92><93>XTY YAX YEX YOX YTX A+L A-L L-A <9C><9D>A/L A*L "
char "VTMHVTMQVTMBVTMFUTCS<A5><A6><A7><A8>VRM UZASU1ASJOVRJCRYJAGTJAGE"
char "JALTJALEJAEQJANEJMPS<B5>ATH STH HTA HTS A+H A-H H-A <BD><BE>A/H "
char "A*H AAH AEH AOH ATQ STQ QTA QTS AEQ AAQ AOQ ATB STB BTA BTS AEB "
char "AAB AOB ATF STF FTA FTS AEF AAF AOF SETFCLRFXTR ATD DTA A+D A-D "
char "D-A <E1><E2>A/D A*D A+X A-X X-A AMX AVX A*X UZA UIA <ED><EE><EF>"
char "RMODWMODSETRCLRRSEMRTTX TTA SEMWSMONCMON<FA><FB><FC><FD><FE><FF>"
cnews:
char "CFUN(01)(02)(03)(04)(05)(06)(07)(08)(09)(0A)(0B)(0C)(0D)(0E)(0F)"
char "(10)(11)(12)(13)(14)(15)ASN (17)(18)(19)(1A)(1B)E+N E-N (1E)(1F)"
char "ATI STI ITS (23)MTJ J+M (26)J-M (28)(29)(2A)(2B)(2C)(2D)(2E)(2F)"
char "(30)(31)(32)(33)(34)(35)(36)(37)(38)(39)(3A)(3B)(3C)(3D)(3E)(3F)"
char "(40)(41)(42)(43)(44)(45)(46)(47)(48)(49)(4A)(4B)(4C)(4D)(4E)(4F)"
char "(50)(51)(52)(53)(54)(55)(56)(57)(58)(59)(5A)(5B)(5C)(5D)(5E)(5F)"
char "(60)(61)(62)(63)(64)(65)(66)(67)(68)(69)(6A)(6B)(6C)(6D)(6E)(6F)"
char "(70)(71)(72)(73)(74)(75)(76)(77)(78)(79)(7A)(7B)(7C)(7D)(7E)(7F)"
char "ITA YTA NTR RTE AAY AEY AOY RETS(88)(89)(8A)(8B)(8C)(8D)(8E)(8F)"
char "MCJ MSN (92)(93)MPACMUNPASNA(97)(98)(99)(9A)(9B)(9C)(9D)(9E)(9F)"
char "(A0)EXTFA+I A-I I-A (A5)(A6)A/I A*I AAI AEI AOI (AC)(AD)(AE)(AF)"
char "NTA NTS AEN AAN AON (B5)(B6)(B7)(B8)(B9)(BA)(BB)(BC)(BD)(BE)(BF)"
char "(C0)(C1)(C2)(C3)(C4)(C5)(C6)(C7)(C8)(C9)(CA)(CB)(CC)(CD)(CE)(CF)"
char "(D0)(D1)(D2)(D3)(D4)(D5)(D6)(D7)(D8)(D9)(DA)(DB)(DC)(DD)(DE)(DF)"
char "(E0)(E1)(E2)(E3)(E4)(E5)(E6)(E7)(E8)(E9)(EA)(EB)(EC)(ED)(EE)(EF)"
char "(F0)(F1)(F2)(F3)(F4)(F5)(F6)(F7)(F8)(F9)(FA)(FB)(FC)IJP RET HLT "
;
CMD
;****************************************************
;
;               ЭKCTPAKOДЫ HOBOГO PEЖИMA:
;              ==========================
;
;   KOД OПEPAЦИИ ЗAДAETCЯ ИCПOЛHИTEЛЬHЫM AДPECOM.
;   ДOП.ИHФOPMAЦИЯ HA CYMMATOPE И ECЛИ HAДO, B PMP.
;   PEЗYЛЬTAT BOЗBPAЩAETCЯ HA CYMMATOPE И, ECЛИ
;   HAДO, B PMP.  PEГИCTPЫ HE ПOPTЯTCЯ, B T.Ч. И 14!
;
;****************************************************
;MOZY=80D8D      ;    - EXTRACOD
;
:IA UTM -KEX
IA JMGT BAD_EXTR
IA JMP EX_SW + KEX
;
;            HECYЩECTBYЮЩИЙ ЭKCTPAKOД:
;
BAD_EXTR:
HLT @80
;
EX_SW:JMP EX_0
;
:IA VTM
JMP INITSTR ; 1 - INITPACK
:IA VTM PACKTEXT
JMP SETT ; 2 - <N>H
:IA VTM PACKCHAR
JMP SETT ; 3 - <N>C
:IA VTM PACKHEX
JMP SETT ; 4 - H<N>.<M>
:IA VTM PACKDEC
JMP SETT ; 5 - G<N>.<M>
:IA VTM PACKCOM
JMP SETT ; 6 - GET COMMAND
;
:IA VTM 2
JMP INITSTR ; 7 - INITUNP
:R VTM OKRET
JMP LEFTBLAN ; 8 - GET CHAR
:R VTM GETIDENT
JMP LEFTBLAN ; 9 - GET IDENT
:R VTM GETFILE
JMP LEFTBLAN ; A - GET FILENAME
:R VTM GETHEX
JMP LEFTBLAN ; B - GET HEXCODE
:B VTM PACKTIME
JMP TIMDAT ; C - GET "TIME"
:B VTM PACKDATE
JMP TIMDAT ; D - GET "DATE"
:R VTM GETNUM
JMP LEFTBLAN ; E - GET NUMBER
;
:JMP EX_1
:UTC 2-3
:J VTM 3
JMP EXCH
:JMP EX_4
:JMP EX_5
;
;    ЭKCTPAKOД-0.  BXOД B ИHTEPПPETATOP ДИPEKTИB.
;    1-32 P. CYMMATOPA ЗAДAЮT БAЙTOBЫЙ AДPEC HAЧAЛA
;    ДИPEKTИBЫ. KOHEЦ ДИPEKTИBЫ - БAЙT "0".
;
EX_0:
;
;    1(7): УСТАНОВКА НАЧАЛА ВЫХОДНОЙ (ВХОДНОЙ)
;          СТРОКИ. АДРЕС ПЕРВОГО СЛОВА СТРОКИ
;          ЗАДАЕТСЯ В МЛ. РАЗР. СУММАТОРА. ЕСЛИ
;          ЗАДАН 0, ИСПОЛЬЗУЕТСЯ СИСТЕМНЫЙ БУФЕР.
;       СТРУКТУРА ДЕСКРИПТОРОВ СТРОК  DOUT И DIN:
;      :--------------------:-------------------:
;      : АДРЕС ПЕРВОГО БАЙТА: АДРЕС ТЕКУЩ.БАЙТА :
;      :--------------------:-------------------:
;
INITSTR:ATI A
A MSFT -3
A JMNE INIT1
A VTMB BUF
IA JMEQ INIT1
A VTMB BUFIN
INIT1:ITA A
IA ATH DOUT<<1
IA ATH DOUT<<1 +1
RET
;
;    2-6 : ЭКСТРАКОДЫ ДЛЯ СБОРКИ ТЕКСТОВОЙ СТРОКИ.
;    ПАРАМЕТРЫ - НА СУMMАТОРЕ И  В   Р М Р :
;                :---------:---------:
;      СУММАТОР  :     B   :     N   :
;                :---------:---------:
;       Р М Р    :     M   :     A   :
;                :---------:---------:
;
;    B  -  ЗАДАЕТ РЕЖИМЫ РАБОТЫ СБОРЩИКА СТРОКИ
;      32 РАЗРЯД - НОРМАЛИЗАЦИЯ G-ФРАГМЕНТА ВЛЕВО
;                  или флаг 8-ричных констант
;                  или флаг правой команды
;      31        - ЗАПИСЬ "CR" В ХВОСТ СТРОКИ
;      30        - ЗАПИСЬ "LF" В ХВОСТ СТРОКИ
;      29        - ЗАПИСЬ "0"  В ХВОСТ СТРОКИ
;    N,M,A - ЗАДАЮТ СЧЕТЧИКИ ПОЗИЦИЙ И АДРЕС
;            ИСХОДНОГО ДВОИЧНОГО ФРАГМЕНТА.
;    ПРИ ВЫХОДЕ ИЗ ЭТИХ ЭКСТРАКОДОВ СУММАТОР
;    СОДЕРЖИТ ТЕКУЩЕЕ ЗНАЧЕНИЕ СЧЕТЧИКА СИМВОЛОВ
;    ЗАПИСАННЫХ В ВЫХОДНОЙ БУФЕР.
;
;----------------------------------------------
;
;
SETT:MUNP B ; CM,MP ==> B,N.M,A
XTS DOUT
ATI T
IA JMP
;
;
;   2 - ПЕРЕПИСЬ В ВЫХОДНОЙ БУФЕР  N+1  БАЙТ
;       ИЗ СТРОКИ, ЗАДАННОЙ СЛОВНЫM АДРЕСОМ  А.
;       М  НЕСУЩЕСТВЕННО. ПРИ  N > 255 ПЕРЕПИСЬ
;       НЕ БОЛЕЕ 256 БАЙТ СТРОКИ А ДО КОДА В
;       1:8 Р. N ВКЛЮЧИТЕЛЬНО.
;
PACKTEXT:C VTM -1
A MSFT -3
ITA N
AAU @FFF00
JAEQ TRAN
AEI N
ATI C
N VTM 255
TRAN:A BTA
A UTM 1
T ATB
T UTM 1
AEI C
JAEQ RETPACK
N VRM TRAN
JMP RETPACK
;
;   3 - ЗАПИСЬ В ВЫХОДНОЙ БУФЕР  N+1  СИМВОЛА,
;       ЗАДАННОГО В ПОЛЕ  А.  М НЕСУЩЕСТВЕННО.
;
PACKCHAR:N JMLT RETPACK
ITA A
:T ATB
T UTM 1
N VRM *-1
JMP RETPACK
;
;   4 - ВЫДАЧА N МЛАДШИХ 16-РИЧНЫХ ЦИФР КОДА
;       ПО АДРЕСУ А СО ВСТАВКОЙ ОДНОГО ПРОБЕЛА
;       ПОСЛЕ КАЖДЫХ М ЦИФР.  Если В<0, выдача
;       мдет в 8-ричном коде (не более 48 бит!)
;
;       ПРИ N=0 ВЫДАЕТСЯ 8-СИМВ.ФРАГМЕНТ "ДАТА",
;       ЗАДАННЫЙ ЦЕЛЫМ ЧИСЛОМ А.  ПРИ N<0 ВЫДАЕТСЯ
;       ФРАГМЕНТ "ВРЕМЯ". ЕСЛИ К ТОМУ ЖЕ  А<0,
;       ИМЕЮТСЯ В ВИДУ ТЕКУЩИЕ ДАТА ИЛИ ВРЕМЯ.
;
DTOUT:L UTC
T ATB
ASFT 8
L VRM DTOUT
T UTM 8
JMP RETPACK
;
TOOCT:UTC 3-4
TOHEX:
ASFT -4
15 ATX
YTA
A-U 10
:JALT *+1
A+U 7
:A+U 10+@30
RETS
;
PACKHEX:L VTM 7
C VTM DTOUT
N JMEQ DATE
N JMLT TIME
N UTM -16
N JMLE PH1
:UTA BL ; LEFT
T ATB ; BLANKS
T UTM 1
N VRM *-1
PH1:A XTA
N ASN @400
N ASN @400
N ASN @400
:B JMLT *+1
N UTC 16
:ASN @400-16
N UTM 15
M MTJ C
C UTM -1
M MTJ B
PH2:B JMGE *+1
UTC TOOCT-TOHEX
:JMPS TOHEX
T STB
C VRM PH3
UTS BL
T STB 1
T UTM 1
M MTJ C
C UTM -1
PH3:T UTM 1
N VRM PH2
;
RETPACK:15 XTA ; "B"
N VTM -16
WRSPC:
ASFT -1
JAGE NOSPC
UTS @0A0D
N ASFT 16 ; CR,LF,"0"
T STB
T UTM 1
NOSPC:N UTM 8
N JMLE WRSPC
;
RETPACK1:ITA T
ATH DOUT<<1 +1
A-H DOUT<<1
RET
;
;   5 - ВЫДАЧА СЛОВА  А  ПО ФОРМАТУ  I<N> (M <=0 )
;       ИЛИ   F<N>.<M>   ИЛИ   E<N>.<M>   (M > 0 )
;
PACKDEC:A XTA ; INT==>FLOAT
15 ATX
ASFT 52
JAEQ FL1
AEU @FFF
JANE FL2
FL1:15 XTA -1
AAX =H001F FFFF FFFF FFFF
AOX ZERO
15 ATX -1
;
FL2:T MTJ I ; OLD POINTER
15 XTA -1
AAN 64-53 ; SIGN
JAEQ FL3 ; -POZITIVE
XTA ZERO
15 A-X ; ABS(A)
UTS @2D
T ATB ; PUT "-"
T UTM 1
N UTM -1
;
FL3:M JMLE IN1 ; I-FORMAT
M UTM -15
:M JMLT *+1
M VTM
:M UTM 15
N UTA -1
A-I M
JALE OVFL
ATI IA
M MTJ C
J VTM ; EXPONENT
;       CALC  10**(-M)
XTA RN10
:A/X RN10
C VRM *
15 ATX 1
15 X-A -1
UIA EXNEG
XTA RN1
:A*X RN10
IA VRM *
15 A-X -1
UZA EXPOZ
;      CALC INT PART AND MANTISS
PD1:NTR 3
15 XTA -1
A+X ZERO
AAX =H001F FFFF FFFF FFFF
15 ATX 2
AOX ZERO
NTR 6
A+X ZERO
15 X-A -1
15 ATX 3
;      ENCODE INT PART
PD2:15 XTA 2
A/U 10
15 ATX 2
YTA
AOU @30 ; "0"
T ATB
T UTM 1
N UTM -1
15 XTA 2
JANE PD2
;
UTA @2E ; "."
T ATB
T UTM 1
N UTM -1
;
;       ENCODE M MANTIS DIGITS
;
M MTJ IA
UTA 1
:IA UTM -1
IA JMLE *+2
A*U 10
JMP *-1
:15 ATX -1 ; 10**(M-1)
15 XTA 3
15 A/X 1
NTR 3
A+X ZERO
AAX =H001F FFFF FFFF FFFF
PD3:M UTM -1
15 A/L -1
AOU @30
T ATB
T UTM 1
N UTM -1
15 XTA -1
A/U 10
15 ATX -1
YTA
M JMGT PD3
;
;       ENCODE EXPONENT
;
J JMEQ PDFIN
ITA J
JAGT PLEX
U-A
UTC @2D - @2B
PLEX:C VTM @2B ; "+"
ATI J
J UTM -19
N UTM -4
J JMGE BIGEXP
UTS @45 ; "E"
T ATB
ITA C
T STB 1
JMP ENDEXP
BIGEXP:ITS C
T STB
A/U 100
AOU @30
T ATB 1
YTA
ENDEXP:A/U 10
AOU @30
T ATB 2
YTA
AOU @30
T ATB 3
T UTM 4
;
PDFIN:N JMLE RETPACK
T MTJ J
N J+M T ; NEW POINTER
B JMLT LNORM
T MTJ M
I J-M M ; ВЫВЕДЕНО
;        СДВИГ ВЫВЕДЕННОГО ВПРАВО НА N ПОЗИЦИЙ
:J UTM -1
J BTA
N UTC
J ATB
M VRM *-2
I MTJ J
;        ВЫДАЧА ОСТАВШИХСЯ N ПРОБЕЛОВ
LNORM:UTA BL
N UTM -1
:J ATB
J UTM 1
N VRM *-1
JMP RETPACK
;
;        ВЫВОД ПО ФОРМАТУ   I<N>
;
IN1:NTR 3
15 XTA
A+X ZERO
AAX =H001F FFFF FFFF FFFF
IN2:N JMLE OVFL
A/U 10
15 ATX
YTA ; NEXT DIGIT
AOU @30 ; "0"
T STB
T UTM 1
N UTM -1
JANE IN2
JMP PDFIN
;
;        NEGATIV EXPONENT
;
EXNEG:15 XTA -1
JAEQ PD1 ; ZERO
E UTM -1
A*X RN10
15 ATX -1
A-X RN1
UIA EXNEG
JMP EXEX
;
;      POZITIV EXPONENT
;
EXPOZ:E UTM 1
15 XTA -1
A/X RN10
15 ATX -1
A-X RN10
UZA EXPOZ
EXEX:N UTA -5
A-I M
JAGT PD1
;
OVFL:UTA @2A ; "*"
T ATB -1
:T ATB
N UTM -1
N JMLE RETPACK
T VLM *-1
;
;
;      6 - ВЫДАЧА КОМАНДНОГО ПОЛУСЛОВА В ФОРМЕ
;          :M КОП  Адрес    (для левой команды)
;           М КОП  Адрес    (для правой)
;         A  - адрес целого командного слова
;        B<0 - признак правой команды
;        N<0 - команда режима БЭСМ-6
;
PACKCOM:L VTM 3 ; Число байт КОП -1
A XTA
:N JMGE *+1
ASNA @400-4
:B JMGE PC1
ASFT -24
:N JMLT *+1
ASFT 24-32
PC1:B JMGE *+1
UTC @3A - BL ; ":"
:UTS BL
T STB
T UTM 3
JMPS TOHEX
T ATB -2 ; код модификатора
UTA BL
T STB -1
;        Выдача   К О П
N JMLT BESMKOP
J VTMH CNEWL
D VTM 4 ; Число байт адреса -1
ASFT -8
15 ATX
YTA
ATI C
AEU @3F
U1AS PC2
J VTMH CNEWS
D VTM 2
ASFT -8
15 ATX
YTA
STI C
PC2:C UTC
J HTS
:L UTC
T ATB
ASFT 8
L VRM *-1
UTA BL
T STB 4
;          Выдача  D+1  младших 16-цифр адреса
PC3:T UTM 1
JMPS TOHEX
T STB 4
D VRM PC3
T UTM 5
JMP RETPACK
;          Режим эмуляции БЭСМ-6
BESMKOP:JAGE BESMKOP1 ; короткий адрес
J VTMH COLDL-8
ASFT -5
15 ATX
YTA
STI C
ASFT 1
JMP PC4
BESMKOP1:J VTMH COLDS+32
ASFT -8
15 ATX
YTA
STI C
C UTM -64
ASFT 4
C JMLT PC4
C UTM -64
AOX =H7000 0000 0000 0000
PC4:D VTM 3
JMP PC2
;
;
;---------------------------------------------------
;      7-E : ЭКСТРАКОДЫ ДЛЯ ИЗВЛЕЧЕНИЯ ФРАГМЕНТОВ
;            ИЗ ВХОДНОЙ ТЕКСТОВОЙ СТОРОКИ.
;            НА СУММАТОРЕ ЗАДАЕТСЯ АДРЕС СЛОВА, КУДА
;            НАДО ЗАПИСАТЬ ВЫБРАННЫЙ ФРАГМЕНТ (1:32)
;            НА ВЫХОД ПОДАЕТСЯ СЛЕДУЮЩАЯ ИНФОРМАЦИЯ:
;                       :----------:----------:
;              СУММАТОР :     Е    :     С    :
;                       :----------:----------:
;               Р М Р   :     Т    :     I    :
;                       :----------:----------:
;          I = АДРЕС ТЕКУЩЕГО БАЙТА ВХОДНОЙ СТРОКИ
;          Т = ДОП.ИНФОРМАЦИЯ О ВЫБРАННОМ ФРАГМЕНТЕ
;          С = ПОСЛЕДНИЙ ВЫБРАННЫЙ СИМВОЛ (РАЗДЕЛИТЕЛЬ)
;          Е = 0, ЕСЛИ ФРАГМЕНТ ВЫБРАН,  -1 ПРИ ОШИБКЕ
;
;           ПРИ ОШИБКАХ ТЕКУЩИЙ УКАЗАТЕЛЬ ПО ВХОДНОЙ
;           СТРОКЕ НЕ ПРОДВИГАЕТСЯ, ЧТО ПОЗВОЛЯЕТ ПО-
;           ВТОРИТЬ ВЫБОРКУ С ДРУГИМ ТИПОМ ФРАГМЕНТА.
;---------------------------------------------------
;
LEFTBLAN:ATI A
WTC DIN
I VTM
D VTM ; - extracod
LEFTBL1:I BTA
AEU BL
JANE CHAR
I VLM LEFTBL1
;
;     BЫБOPKA ИЗ BXOДHOЙ CTPOKИ OЧEPEДHOГO CИMBOЛA
;     НА РЕГИСТР С  И ЕГО ТИПА НА РЕГИСТР  Т.
;
CHAR:I BTA
ATI C
:JAEQ *+1 ; END STRING
I UTM 1
:C BTS CCLASS<<3
EXTF 64-8
STI T
R JMP
;
;
;  9 - ВЫБОРКА ИДЕНТИФИКАТОРА, ДОПОЛНЕНИЕ ПРОБЕЛАМИ
;      ДО ГРАНИЦЫ СЛОВА.  Т = <ДЛИНА ИДЕНТИФИКАТОРА>
;
GETIDENT:XTA ="        "
A ATX
A MSFT -3
T JMLE GID1 ; 1-Й СИМВОЛ НЕ БУКВА
GID2:A ATB
R VJM CHAR
A UTM 1
T JMGE GID2
GID1:I UTA -1
A-H DIN<<1 +1
ATI T ; LENGTH
UTA BL
;
SETTAIL:ITS A
AAU 7
UZAS OKRET
A ATB
A VLM SETTAIL
;
;
;   A - ВЫБОРКА ЛЕКСЕМЫ "ИМЯ ФАЙЛА, ЗАПИСЬ ЕЕ ПО
;       АДРЕСУ  А (если А=0, то в PATHNAME) C
;       ДОБАВКОЙ 2 НУЛЕВЫХ БАЙТОВ В КОНЕЦ.  НА
;       ВЫХОДЕ СУММАТОР = <имя файла>,
;       РМР = РАСШИРЕНИЕ ИМЕНИ ФАЙЛА.
;       При наличии синт.ошибки сумматор=0.
;
GETFILE:A JMNE *+1
A VTM PATHNAME
:XTS MAIN_DIR
A ATX
XTA MAIN_DIR+1
A ATX 1
A MSFT -3
XTA ="        "
15 ATX 1 ; 2-FNAME
15 ATX 2 ; 3-EXT
N VTM -1
I BTA
AEU TWOPOIN
U1AS GF1
T JMLE FERROR ; BAD DISK
A ATB ; Disk is given
I UTM 1
R VJM CHAR
;
GF1:R VTM GF2
A UTM 3 ; D:\ ...
C UTM -DIV ; Change "/"
C JMEQ CHAR  ; to  "\"
C UTM DIV-BSL
C JMEQ CHAR ; Root dIR
:A BTS
A UTM 1
AEU BSL ; Skip F-prefix
UIAS *-1
;            Begin new fragment of PATH
GF2:T JMLT FERROR ; Empty name
R VTM GF3
:N JMNE *+1
UTC 3-8
:L VTM 8
15 MTJ B
N J+M B
B MSFT -3
;
GF3:T JMLT GF4 ; End of PATH
B ATB 24
B UTM 1
A ATB
A UTM 1
L VRM CHAR
;
FERROR:UTA
JMP FRET
;
GF4:R VTM GF2
C UTM -DIV ; Change "/"
C JMEQ GF5  ; to  "\"
C UTM DIV-BSL
C JMEQ GF5
C UTM BSL-POIN
C JMEQ GF6
15 DTA 2 ; Fname+Ext
;
FRET:UTS
A ATB
A STB 1
D UTC ; Internal
D JMNE ; CALL
ITS I
STH DIN<<1 +1
RET
;
GF5:XTA ="        "
15 ATX 2 ; New FNAME
UTA BSL
N VTM -2
GF6:A ATB
A UTM 1
N VLM CHAR
JMP FERROR ; Second "."
;
;
;   B - ВЫБОРКА 16-РИЧНОГО ЧИСЛА. ДОПУСКАЕТСЯ
;       ПРЕФИКС "@" И ВНУТРЕННИЕ ПРОБЕЛЫ.  Для
;       8-ричного числа префикс "#" обязателен.
;
GETHEX:UTS
A STX
R VTM GH1
D VTM 0 ; OCTAL
C UTM -@23 ; "#"
C JMEQ CHAR
D VTM -1 ; HEX
C UTM @23 - @40 ; "@"
C JMEQ CHAR
C UTM @40
;
GH1:C UTM -BL
C JMEQ CHAR
T JMLT OKRET
A-U @38
D JMEQ GH2
A+U @38 - @3A
JALT GH2
A+U @3A - @41
JALT ERROR
A+U @41 - @47
C UTM -7
GH2:JAGE ERROR
A XTA
D ASFT -3
C AOU BL - @30
A ATX
JMP CHAR
;
;
;
;   C,D - ВЫБОРКА ЛЕКСЕМ "ВРЕМЯ" И "ДАТА"
;         РЕЗУЛЬТАТ ( или 0 ) В ПОЛЕ "E".
;
TIMDAT:C VTM TD1
R VJM LEFTBLAN
I MTJ IA
B JMP ; PACKTIME/DATE
TD1:R VTM RETFUN
IA MTJ I
ATI E
I VRM CHAR
;
;
;   Е - ВЫБОРКА ДЕСЯТИЧНОГО ЧИСЛА В I,F,E-ФОРМАТЕ
;       НА ВЫХОДЕ  Т = 0-I, 1-F, 2-E ФОРМАТ
;
GETNUM:
B VTM 1 ;SIGN
R VTM GN1
C UTM -MINUS
C JMEQ CHAR
B VTM
C UTM MINUS-PLUS
C JMEQ CHAR
C UTM PLUS
GN1:T JMNE ERROR ; 1-ST LETTER
C UTA -@30
15 ATX 1 ; INT PART
UTA
15 ATX 2 ; MANTISSA
15 ATX 3 ; EXPONENT
D VTM
UTC 1
;
GINT:N VTM -16 ; MAX N DIGITS
R VJM CHAR
:T JMGE CHEXP
T JMLE CHPOIN
;         ПРИЕМ ОЧЕРЕДНОЙ ЦИФРЫ
D UTC
15 XTA 1
A*U 10
C A+U -@30
D UTC
15 ATX 1
N VLM CHAR
JMP ERROR
;        ПРИШЕЛ РАЗДЕЛИТЕЛЬ
CHPOIN:AEU POIN
D JANE NUMEND
D JMNE ERROR
D VTM 1
JMP GINT
;        ВЫБОРКА ЭКСПОНЕНТЫ
CHEXP:AEU @45 ; "E"
JANE ERROR
D VTM 3
N MTJ M
N VTM -3
J VTM 1
I BTA
AEU MINUS
I UTM 1
JAEQ CHAR
AEU 6 ; "+"
J VTM
JAEQ CHAR
I VRM CHAR
;
;           СБОРКА ЧИСЛА ИЗ 3-Х КОМПОНЕНТ
;
NUMEND:15 XTA 1
JMP INTEGER
:N MTJ M
N VTM
:15 WTC 3
N VTM -301
N JMGT ERROR ; TOO BIG EXP
N UTM 300
XTA RN1
N JMLT REXP
:A*X RN10
N VRM *
J JMEQ REXP
XTS RN1
15 A/X
REXP:15 ATX 3
M UTM 16-1
15 XTA 1
AOX ZERO
15 ATX 1
15 XTA 2
AOX ZERO
M JMLT RMANT
:A/X RN10
M VRM *
RMANT:15 A+X 1
15 A*X 3
B JMEQ RNUM
X-A ZERO
JMP RNUM
;
INTEGER:B JMEQ RNUM
U-A
RNUM:A ATX
D MTJ T
;
OKRET:E VTM
RETFUN:ITA I
ATH DIN<<1 +1
:MPAC E
RET
;
ERROR:E VTM -1
JMP RETFUN+1
;
;
;
;            ЭKCTPAKOДЫ ДЛЯ PAБOTЫ C ФAЙЛAMИ.
;
;         :-----:----------------:------------------:
;   EXCH  :  N  :       L        :         A        :
;         :-----:----------:--:--:------------------:
;   MOVE  :  N  :          :T :D :         A        :
;         :-----:----------:--:--:------------------:
;         64    56         40 36 32                1
;
;
;     1 - ПOЗИЦИOHИPOBAHИE ПO ФAЙЛY.
;         N : ЛOГИЧECKИЙ HOMEP ФAЙЛA
;         T : TИП ЭЛEMEHTA (БAЙT, 1/4, ... ,CTPOKA)
;         D : TИП CMEЩEHИЯ ( 0 - OT TEKYЩEГO YKAЗATEЛЯ
;              1 - OT HAЧAЛA,  2 - OT KOHЦA ФAЙЛA ).
;         A : BEЛИЧИHA CMEЩEHИЯ B ЭЛEMEHTAX.
;       PEЗYЛЬTAT: CYMMATOP=<БИTOBЫЙ TEK.YKAЗATEЛЬ ПO
;                  ФAЙЛY>  ИЛИ -1, ECЛИ OШИБKA.
;
EX_1:
;
;     2 - ЗAПИCЬ ИЗ OЗY B ФAЙЛ
;     3 - ЧTEHИE ИЗ ФAЙЛA B OЗY
;         N : ЛOГИЧECKИЙ HOMEP ФAЙЛA
;         L : KOЛИЧECTBO ПEPEПИCЫBAEMЫX ЭЛEMEHTOB
;         A : HAЧAЛЬHЫЙ AДPEC B OЗY
;
EXCH:
;
;     4 - ЗAПPOC PEЖИMA YCTPOЙCTBA, ГДE HAXOДИTCЯ ФAЙЛ
;     5 - ИЗMEHEHИE PEЖИMA
;         N : ЛOГИЧECKИЙ HOMEP ФAЙЛA
;         A : AДPEC MACCИBA ИHФOPMAЦИИ B OЗY
;
EX_4:
EX_5:
;
END
*END F
