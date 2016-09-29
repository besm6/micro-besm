*NAME MACROS
*     Это исходники программы-диспетчера МКБ-8601.
*     Текст написан на макроассемблере. Некоторые программы
*     снабжены эпиграфами. Много внутреннего комментария.
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
*CALL LIBINIT:300000,200, O S   R E T R O
*NO LIST
*FTN
      SUBROUTINE Z
      DIMENSION M(10)
      DATA M/10(0)/
      CALL EXLIB(300000B)
      CALL ELNAME(' MACR ') $ CALL ELMOVE(0)
      CALL ELWRIT(M,10)
      CALL ELCLOS
      RETURN
      END
*CALL Z
*STAND
*CALL ZMACRO:PRINT
TEMP1:MACRO
;/     ЗATЫЧKA ДЛЯ ПPOЧИCTKИ CTAPШИX PAЗPЯДOB
;/     CЧAC И ИAOП B ПPEPЫBAHИЯX OT PEЖ.ЭMYЛЯЦИИ
XTA REGSCAL
JAGE Ь0000END
ITA RI
AAU @7FFF
ATI RI
ITA IA
AAU @7FFF
ATI IA
Ь0000END:
ENDM
TEMP2:MACRO
;/     ЗATЫЧKA ДЛЯ OЖИДAHИЯ KOHЦA ПPИ ЧTEHИИ C ДИCKA
;/     И ПPИ BBOДE C TEPMИHAЛA ЮЗEPA
W MSN @400-1
BTA LAST_JOB<<3 +1
ATI J
W XTA JOB-1
ASN @400+56
J JMP Ь0000SWC
Ь0000SWC:JMP Ь0000END
:JAEQ Ь0000END
JMP Ь0000END ;  UTA 3
:AEU 3
JANE Ь0000END
Ь0000WE1:
CMON @FFF7F ; CБPOC БBП
J VTM 0
Ь0000WEX:W XTA JOB-2
J AAN 64-39 ; ЖДEM KOHЦA
J JAEQ Ь0000WEX ; ЧTEHИЯ
Ь0000END:
ENDM
TEMP3:MACRO
;/      BPEMЯHKA :  ПPOBEPKA ПPABИЛЬHOCTИ ПPИПИCKИ
UTA
I VTM 15
:I ATX IFCTIM+@3F0
I VRM *
CMON @FFF7F
I VTM 513
:I RMOD @400
ASN @400+10
:JAEQ *+3
ATI J
J FTA IFCTIM+@3F0 <<6
J SETF IFCTIM+@3F0 <<6
:JAEQ *+1
HLT -2
:I VRM *-4
I VTM @3FD
RMOD @7FE
ATI IA
XTA PCW+@7F
JAEQ Ь0000END
AOU @3FF
WMOD @7FE
Ь0000TMP:I QTA TMP<<2
ATI J
AAU 3
JANE *+2
I QTA DTMP<<2
ATI J
:J MTJ W
W MSN @400+4
W HTA TPP<<1
ATI NP
ASN @400+16
AEI I
JAEQ *+2
:W JMEQ *+1
W HLT
:I RMOD @400
ASN @400+10
AEI W
JAEQ *+3
:W JMEQ *+2
AEI W
JAEQ *+1
I HLT
:I VRM Ь0000TMP
ITA IA
WMOD @7FE
Ь0000END:
ENDM
TEMP4:MACRO
;/      ПPOBEPKA БPEДOBOCTИ HOMEPA ПPOЦECCA
/ JMLE Ь0000HLT
/ UTA
A-U QPROC
JALT Ь0000OKP
Ь0000HLT:
/ HLT -1
Ь0000OKP:
ENDM
TEMP5:MACRO
;/      ЗAПOMИHAHИE CИTYAЦИИ ПPИ BOЗBPATE B "PЭ"
RMOD @1818
ATI NG
NG RMOD PPP
ASN @403
AAU @3E0
ATI NG
NG RMOD CЧAC
ATI RI
ASN @400+10
AAU @3FF
ATI NP
NP QTA TMP<<2
ATI J
ASN @400+4
ATI PA
NP RMOD @400
ATI W
PA HTA TPP<<1
ATI PA
ENDM
  NCPU:MACRO ; <<< KAHДИДAT B MИKPOПPOГPAMЫ >>>
;/
;/   YCTAHOBKA HA CYMMATOP HOMEPA ПPOЦECCOPA = 1,2,...
;/
RMOD @1C1A
A+U 1
  ENDM
  ICPU:MACRO ; <<< KAHДИДAT B MИKPOПPOГPAMMЫ >>>
;/
;/     ПOCЫЛKA ПPEPЫBAHИЯ CPU, HOMEP KOTOPOГO
;/     ЗAДAH COДEPЖИMЫM MOДИФИKATOPA.
;/     KAK ЭTO CДEЛATЬ, EЩE HE ЯCHO. ПPEPЫBAHИE
;/     MOЖET "ПOЙMATЬ" HE TOT ПPOЦECCOP !
;/     HEOБXOДИMO BПИCATЬ B OБЩYЮ ПAMЯTЬ ДOП.ИHФOP.
;/
  / BTA -1
  ATX
  ENDM
CPUSH:MACRO
WMOD @1C19 ; CБPOC KЭШA
ENDM
GROUP:MACRO
@11:BLOCK PP,PPP ; PEЖИMЫ
 ,SPRADR ; YK.CTEKA BOЗBP.
 ,TIMER,CTIME(2)
 ,ACC(2),PMP(2)
 ,CЧAC,POП
 ,PAПY
 ,GRBOSS
 ,TAIL ; PEЗEPBHЫЙ
ENDM
KTOЯ:MACRO
;/
;/   OПPEДEЛEHИE HOMEPA TEKYЩEГO ПPOЦECCA
;/
RMOD @1819 ; PHП
ENDM
ГHOM:MACRO
;/
;/   OПPEДEЛEHИE HOMEPA TEKYЩEЙ ГPYППЫ PEГИCTPOB
;/
RMOD @1818 ; PHГ
ENDM
YTA64:MACRO
UTA
AOY
ENDM
START:MACRO ; <<< MИKPOПPOГPAMMA >>>
;/
;          KOMAHДA    "CMEHA ПPOЦECCA".
;    NG = HOMEP ГPYППЫ. HOMEP ПPOЦECCA ЗAПИCAH B
;    PEГИCTPE GRBOSS ЭTOЙ ГPYППЫ.  ECЛИ ИCП.AДPEC=0, TO
;    BCE PEГИCTPЫ BOCCTAHABЛИBAЮTCЯ ИЗ ГPYППЫ NG.
;    ECЛИ AДPEC ЗAДAH ЯBHO, TO OH ПEPECЫЛAETCЯ B CЧAC
;    (ПPOЦECC CTAPTYET C ЗAДAHHOГO AДPECA).  B PP ПPИ
;    ЭTOM ПPИHYДИTEЛЬHO YCTAHABЛИBAETCЯ OДИH ИЗ ДBYX
;    PEЖИMOB: MAT.PEЖИM ПPИ CЧAC > 0    ИЛИ
;            ДИCП.PEЖИM ПPИ CЧAC < 0
;/   P.S. HAДO БЫ EЩE BПИCЫBATЬ HOMEP ПPOЦECCA
;/        B PП(512), ДЛЯ ЧECTHOЙ ПPИПИCKИ ИП.
;/   P.P.S. ЗAПYCKAЮЩИЙ ПPOЦECC PAHEE BЫДABAЛ KOMAHДY
;/        "ЖYЖ.CEMAФOP", ПOЭTOMY ПEPEД BXOДOM B ЗAПY-
;/        CKAEMЫЙ ПPOЦECC HAДO CHЯTЬ CEMAФOP.  HO HE
;/        BCEГДA, A TOЛЬKO ECЛИ ЗAПYCKAEMЫЙ HE ПPEPЫ-
;/        BAЛCЯ B KPИT.ИHTEPBAЛE !!!
;/
ENDM
BRAN:MACRO ; <<< MИKPOПPOГPAMMA >>>
;/
;           KOMAHДA  "BETBЛEHИE"
;   ПPOЦECC PAБOTAET HA PEЗEPBHOЙ ГPYППE, ECЛИ OHA ECTЬ,
;   ИHAЧE - HA OCHOBHOЙ, ПPEДBAPИTEЛЬHO YПPЯTAB EE B
;   CTEK, T.E. TOЧHO TAK ЖE, KAK ECЛИ БЫ ПPOЦECC BЫДAЛ
;   ЭKCTPAKOД. ИCП.AДPEC KOMAHДЫ ПEPEДAETCЯ B CЧAC,  PP
;   YCTAHABЛИBAETCЯ B MAT. ИЛИ  ДИCП. PEЖИM B ЗABИCИMO-
;   CTИ OT CЧAC.  PEГИCTP IA ИЗ 0-Й ГPYППЫ ПEPEДAETCЯ
;   B PEГИCTP IA ГPYППЫ  NG.
;
ENDM
BRET:MACRO ; <<< MИKPOПPOГPAMMA >>>
;
;        KOMAHДA "BOЗBPAT ИЗ BETBИ"
;
ENDM
 PCW:MACRO
 QCPU:EQU 2 ; ЧИCЛO ПPOЦECCOPOB
;/
;/        TAБЛИЦA YПPABЛЯЮЩИX CЛOB ПPOЦECCOB
;/        ==================================
;/        ЗAMEЧAHИE:  QPROC ДOЛЖHO БЫTЬ KPATHO 8 !
;/
  QPROC:EQU 128 ; ЧИCЛO ПPOЦECCOB
  PCW:LCB (QPROC); TAБЛ.ПPOЦECCOB
  TABPRT:LCB (QPROC);ИX ПPИOPИTETЫ
;/
;/  PCW(N)  - YПPABЛЯЮЩEE CЛOB0 ПPOЦECCA N
;/      64                 48   40    32         1
;/      :------------------:----:----:-----------:
;/      : П P И З H A K И  :NFSW: NS :    ADR    :
;/      :------------------:----:----:-----------:
;/
;/   NFSW - HOMEP ФAЙЛA, KYДA YKAЧИBAETCЯ ПPOЦECC.
;/     NS - HOMEP ПPИЧИHЫ HEAKTИBHOCTИ (ECЛИ  C0:FF, TO
;/          ЭTO HOMEP CEMAФOPA, K KOEMY CTOИM B OЧEPEДИ)
;/     ADR - ФИЗИЧECKИЙ AДPEC ИП (F=0)
;/          ДЛЯ ПPOЦECCOB-ЮЗEPOB ADR YKAЗЫBAET HA HAЧAЛO
;/          ЛИCTA. Y CИCTEMHЫX ПPOЦECCOB BCE ИП COБPAHЫ
;/          B БЛOKE "IF_DISP".
;/
;/            K O Д Ы   ПPИЧИH HEAKTИBHOCTИ :
;/    1 -
;/
EVENTS:LCB (QPROC) ; ШKAЛЫ COБЫTИЙ
M_EVENTS:LCB (QPROC) ; ИX MACKИ
Q_MESS:LCB (QPROC) ; OЧEPEДИ COOБЩ.
;
Q3:EQU QPROC>>3
RDQUE_:LCB (Q3) ; OЧEPEДЬ ПPOЦECCOB
EX_PRI_:LCB (Q3) ; BHEШH.ПPИOPИTETЫ
Q_NORM_:LCB (Q3) ; HOPM.KBAHTЫ
NCPU_:LCB (Q3) ; HOMEPA CPU
NGROUP_:LCB (Q3) ; HOMEPA ГPYПП
RDQUE:EQU RDQUE_<<3
EX_PRI:EQU EX_PRI_<<3
Q_NORM:EQU Q_NORM_<<3
NCPU:EQU NCPU_<<3
NGROUP:EQU NGROUP_<<3
;
ENDM
PCBIT:MACRO ; CMЫCЛ БИTOB PCW
IF_ABS:EQU 64-64 ; ИП YKAЧAHO
IF_FIX:EQU 64-63 ; БЛOK.YKAЧKИ ИП
PG_FIX:EQU 64-62 ; БЛOK.YKAЧKИ ЛИCTOB
B_BRAN:EQU 64-61 ; БЛOK.BETBЛEHИЯ
W_EVEN:EQU 64-60 ; ЖДET COБЫTИЯ
W_SWIN:EQU 64-59 ; ЖДET ПOДKAЧKИ
W_EXCH:EQU 64-58 ; ЖДET OБMEHA
BL_SEL:EQU 64-57 ; БЛOK."SELECT"
READY_:EQU 64-56 ;  Г O T O B
P_SYST:EQU 64-55 ; CИCTEMHЫЙ ПPOЦECC
W_AST:EQU 64-54 ; ПPOЦECC HA ПAYЗE
W_TERM:EQU 64-53 ; ЖДET TEPM.OБMEHA
  ENDM
SEMAF:MACRO ; BCE, CBЯЗAHHOE C CEMAФOPAMИ
;/       ЧИCЛO CEMAФOPOB - HE БOЛEE 64 !
;
;        HAЗHAЧEHИE CEMAФOPOB :
;        ======================
;        0 - OПEPATOPCKAЯ KOHCOЛЬ
;        1 - ЗAKAЗ ГPYППЫ ФAЙЛOB
;
QSEM:EQU 8 ; ЧИCЛO CEMAФOPOB
QS3:EQU QSEM>>3
SEMAFOR:LCB SCSEM ; ИX TИПЫ
 ,SEMBOSS(QS3) ; BЛAДEЛЬЦЫ
 ,SEMWAIT(QS3) ; OЧEPEДИ
ENDM
MODIF:MACRO
;/
;/   ИCПOЛЬЗOBAHИE MOДИФИKATOPOB ПPИ BXOДE
;/    B ПPEPЫBAHИЯ И BXOДE B ЭKCTPAKOДЫ :
;/
;/  15. AДPEC HAЧAЛA PAБOЧEГO CTEKA (ДЛИHA=6 CЛOB)
;/      B ИП ПPOЦECCA, ПOДABШEГO ЭKCTPAKOД
;/      ПPИ BXOДE B ПPEPЫBAHИЯ И15 HE ФOPMИPYETCЯ.
S:EQU 15 ; CTEK
;/  14. MAT.AДPEC OПEPAHДA ИЛИ KOMAHДЫ, BЫЗBABШEЙ
;/      ПPEPЫBAHИE.  ИЛИ ЖE ИCП.AДPEC ЭKCTPAKOДA.
IA:EQU 14 ; ИAOП
;/  13. MATEM.AДPEC MECTA ПPEPЫBAHИЯ (ЭKCTPAKOДA)
RI:EQU 13 ; CЧAC
;/  12. ФИЗ.AДPEC KOMAHДЫ ИЛИ OПEPAHДA, BЫЗBABШEГO
;/      ПPEPЫBAHИE
PA:EQU 12 ; ФИЗ.AДP.ПPEP.
;/  11. HOMEP ПPEPBAHHOГO ПPOЦECCA ИЛИ HOMEP ПPOЦECCA,
;/      ПOДABШEГO ЭKCTPAKOД.
TN:EQU 11 ; PHП
;/  10. KOПИЯ PEГИCTPA PEЖИMOB :
;/       1 : БЛOKИPOBKA HOPMAЛИЗAЦИИ            БHOP
;/       2 : БЛOKИPOBKA OKPYГЛEHИЯ              БOKP
;/       3 : ЛOГИЧECKAЯ ГPYППA                  ГЛ
;/       4 : ГPYППA YMHOЖEHИЯ                   ГY
;/       5 : ГPYППA CЛOЖEHИЯ                    ГC
;/       6 : БЛOK.ПPEP.ПPИ ПEPEПOЛHEHИИ         БПП
;/       7 : ИHДИKATOP ПEPEПOЛHEHИЯ             ИП
;/       8 : ИHДИKATOP ПEPEHOCA                 ИПC
;/       9 : ИHДИKATOP ЗHAKA                    ИЗ
;/      10 : ИHДИKATOP HYЛЯ                     ИH
;/      11 : БЛOK.BЫXOДA ЗA ДИAПAЗOH БЭCM-6     ББЧ
;/      12 : БЛOK.ПPOB.ПEPEП.ПOЛЯ YПPЯT.        БППY
;/      13 : PEЖИM ДИCПETЧEPA                   PД
;/      14 : БЛOK.PEAKЦИИ HA ЧYЖOЙ OПEPAHД      БЧOП
;/      15 : БЛOK.ПPOB.TEГA ПPИ ЧTEHИИ          БПTЧ
;/      16 : БЛOK.PEAKЦИИ HA ЧYЖOЙ CYMMATOP     БЧC
;/      17 : БЛOK.ПPOГP.ИHTEPПPETAЦИИ TEГA      БПИHT
;/      18 : БЛOKИPOBKA BHEШHИX ПPEPЫBAHИЙ      БBП
;/      19 : БЛOK.ПPOB.TEГA ПPИ ЗAПИCИ          БПTЗ
;/      20 : PEЖИM ЭMYЛЯЦИИ  C B C              PЭC
;/      21 : PEЖИM  " Ш A Г "                   PШ
;/      22 : ПPИЗHAK OCT.ПO ПPEPЫBAHИЮ          ПOП
;/      23 : БЛOK.ЗAЩ.CTPAHИЦ ПO ЗAПИCИ         БЗЗ
;/      24 : БЛOK.ЗAЩ.CTPAHИЦ ПO OБPAЩEHИЮ      БЗO
;/      25 : PEЖИM OTPИЦATEЛЬHЫX AДPECOB        POA
;/      26 : БЛOK.ПPOB.HOMEPA ПPOЦECCA          БПHП
;/      27 : БЛOKИPOBKA ПPИПИCKИ                БП
;/      28 : ПPИЗHAK ИЗMEHEHИЯ AДPECA           ПИA
;/      29 : ПPИЗHAK ПPABOЙ KOMAHДЫ             ППK
;/      30 : ПPИЗH.KOMAHДЫ ПEPEДAЧИ YПPABЛEHИЯ  ППY
P1:EQU 10 ; PEГИCTP PEЖИMOB
;/   9. KOПИЯ PACШИPEHИЯ PEГИCTPA PEЖИMOB :
;/       1 : ПPИЗHAK KOMAHДЫ             ---\
;/       2 : PEЖ.ЭMYЛЯЦИИ БЭCM-6          ---\
;/       3 : ЗAПPET ЧTEHИЯ OПEPAHДA        ---\
;/       4 : ЗAПPET ЗAПИCИ OПEPAHДA         ---\ T E Г
;/       5 : ЗAПPET BЫБOPKИ KOMAHДЫ         ---/
;/       6 : ЗAПPET ПEPEДAЧИ YПPABЛEHИЯ    ---/
;/       7 : PEЗEPB                       ---/
;/       8 : ПPOГP.ИHTEPПP. TEГA         ---/
;/       9-16  : HOMEP ПPEДЫДYЩEЙ ГPYППЫ PEГИCTPOB
;/       17-24 : HOMEP PEЗEPBHOЙ ГPYППЫ PEГИCTPOB
P2:EQU 9 ; PPP
;/   8. HOMEP ГPYППЫ B 6-10 PAЗPЯДAX
NG:EQU 8 ; HOMEP ГPYППЫ
;/   7. KOД OПEPAЦИИ APБИTPA
CA:EQU 7 ; KOП APБИTPA
CP:EQU 7 ; HOMEP ПPOЦECCOPA
;/  6-1 :   PAБOЧИE PEГИCTPЫ :
1:BLOCK I,J,W,R,NP,RR
ENDM
RRBIT:MACRO
;        ---  БИTЫ PEГИCTPA PEЖИMOB  ---
11:BLOCK ББЧ,БППY,PД,БЧOП
,БПTЧ,БЧC,БПИHT,БBП,БПTЗ
,PЭC,PШ,ПOП,БЗЗ,БЗO
,POA,БПHП,БП,ПИA,ППK,ППY
ENDM
ASFT:MACRO
/ ASN / +@400
ENDM
MSFT:MACRO
/ MSN / +@400
ENDM
ASLN:MACRO
;/
;/       KOMAHДA "OБPATHЫЙ CДBИГ"
;/       ПOKA EЩE HE CДEЛAHA !!!
;/
  / ASN /
ENDM
MULT6:MACRO
;/         BMECTO:  A*U 6
ASN @400-1 ; *2
15 ATX
ASN @400-1 ; *4
15 A+L
ENDM
CODE:MACRO
;
;         TAБЛИЦЫ ДЛЯ ПEPEKOДИPOBOK CИMBOЛOB:
;
CODE:LCB ALTISO(32) ; MKБ ===> ISO
 ,ISOALT(32) ; ISO ===> MKБ
 ,GOSTALT(32); GOST ===> MKБ
BL:EQU @20 ; ПPOБEЛ
CR:EQU @0D ; BOЗBPAT KAPETKИ
ETX:EQU @1A ; KOHEЦ TEKCTA
LF:EQU @0A ; ПEPEBOД CTPOKИ
PLUS:EQU @2B
MINUS:EQU @2D
MUL:EQU @2A ; "*"
DIV:EQU @2F ; "/"
COMMA:EQU @2C
POIN:EQU @2E
ENDM
FIRST:MACRO
;/
;/    N FIRST SCAL  - ПOЛYЧEHИE B N HOMEPA ПEPBOЙ "1"
;/
/ VTM -1
L VTM -3
:L XTA /+3
JANE *+3
/ UTM 64
L VLM *-1
/ VTM -1
JMP Ь0000FRT
:ANX
ATI L
/ UTC
L J+M
Ь0000FRT:
ENDM
CLEAR:MACRO
;/
;/   N CLEAR SCAL  - ГAШEHИE "1" B ШKAЛE SCAL
;/
L VTMF /
/ UTC
L CLRF
ENDM
 IFP:MACRO
;/
;/      ИHФOPMAЦИOHHOE ПOЛE ПPOЦECCA :
;/      ==============================
;/      1022 И 1023  MAT.ЛИCTЫ
;/
 IF_LIST:EQU @3FE ; ИП=1022 ЛИCT
 @FF800:BLOCK IFCTIM ; BPEMЯ CЧETA
 ,IFTIMER ; TAЙMEP+MOД.31
 ,ASTECR(0) ;YK.CTEKA BOЗBP.
 ,ASTEC ; AДPEC ПYПP
,KVANT(0) ; OCTATOK KBAHTA
,NTERM(0) ; HOM.TEPMИHAЛA
,PCNT ; CЧ.CTP. B OЗY
,REGSCAL ; ИHДИBИД.OCOБOCTИ
,TCLOSE ; T.ДEЗAKTИBAЦИИ
,TQUE(6) ; OЧEPEДЬ TAЙMEPOB
,VECTOR(32) ; BEKT.COБЫTИЙ
,TMP(256) ; TAБЛ.MAT.ЛИCTOB
,ASTR(2) ; CTP. BB/BЫB.
,INFERR(0) ; ИHФ.OБ OШИБKAX
,BUF(20) ; БУФEP ВЫВОДА
,BUFIN(20)  ; БУФЕР ВВОДА
,FDB(64) ; Ф-ДECKPИПTOPЫ
,PATHNAME(10) ; Ф-ПPEФИKC
,(288) ; РЕЗЕРВ
,RETSTEC(64),SAVREG
;/
;/     64         48        32          16         1
;/    :----------:---------:-----------:------------:
;/   0: C Ч E T H O E   B P E M Я   П P O Ц E C C A :
;/   1: TAЙMEP ПPOЦECCA    :     PEГИCTP @1F        :
;/   2: YK.CTEKA BOЗBPATOB : KOHEЦ CTEKA YПPЯTЫBAHИЯ:
;/   3: OCTATOK TEK.KBAHTA : HOM.TEPM. : CTP.B OЗY  :
;/   4: БИTOBAЯ ШKAЛA ИHДИBИДYAЛЬHЫX OCOБEHHOCTEЙ   :
;/   5: ACTPOHOMИЧECKOE BPEMЯ ДEЗAKTИBAЦИИ ПPOЦECCA :
;/   6: OЧEPEДЬ TAЙMEPOB CЧETHOГO BPEMEHИ (6 CЛOB)  :
;/   C: BEKTOP AДPECOB BXOДA ПO COБЫT.(64 ПOЛYCЛOBA):
;/  2C:    TAБЛИЦA MAT.ЛИCTOB (1024 ЧETBEPTYШKИ)    :
;/ 12C: ДECKPИПTOPЫ PAЗБOPЩИKA И CБOPЩИKA CTPOK     :
;/ 12E: СИСТЕМНЫЕ БYФEPА ВЫХОДНОЙ И ВХОДНОЙ СТРОК   :
;/ 156:         ДECKPИПTOPЫ ФAЙЛOB  0:63            :
;/ 196: ПOЛHOE ИMЯ TEKYЩEГO ФAЙЛA ИЛИ CПPABOЧHИKA   :
;/ 1A0:          Р Е З Е Р В                        :
;/ 2C0: CTEK BOЗBPATOB ДЛЯ KOMAHД: "JMPS" И "RETS"  :
;/ 300: CTEK ДЛЯ YПPЯTЫBAHИЯ PEГИCTPOB ПPИ ЭKCTPA-  :
;/    : KOДAX И BETBЛEHИЯX. MOЖET ПEPEXOДИTЬ HA     :
;/    : CЛEДYЮЩYЮ (1023) CTPAHИЦY.                  :
;/    :---------------------------------------------:
;/
;/       IF_DISP - OБЩAЯ CTPAHИЦA ДЛЯ BCEX  И П
;/       CИCTEMHЫX ПPOЦECCOB. HAЧAЛO - KAK Y ЮЗEPOB
;/       (CM.BЫШE).  ДAЛEE :
;/    :---------------------------------------------:
;/ 1C0: MAГAЗИHЫ ДЛЯ  P  CPU (ПO 8 CЛOB HA PЫЛO).   :
;/    : CTEKИ BOЗBPATOB ДЛЯ  P  CPU (ПO 8 CЛOB).    :
;/ 200: COБCTBEHHO  И П  ДЛЯ 8 CИCTEMHЫX ПPOЦECCOB  :
;/    :  P "ЖДY" + "OKHO" + "SWING" + "DRIVER"      :
;/    :   + "TTANAL" + ...  ( ПO 64 CЛOBA HA БPATA) :
;/    :---------------------------------------------:
;/   0:     CЧETHOE BPEMЯ ПPOЦECCA                  :
;/   1:     TAЙMEP            :   MOДИФИKATOP  @1F  :
;/   2: YK.CTEKA BOЗBPATOB    : KOHEЦ CTEKA YПPЯTЫB.:
;/   3: ПOPT ДЛЯ ПPИEMA ЗAЯBOK OT ДPYГИX ПPOЦECCOB  :
;/   4:    CTEK  JMPS,RETS-BOЗBPATOB (12 CЛOB)      :
;/  16: CTEK ДЛЯ YПPЯTЫBAHИЯ PEГИCTPOB (3 KBAHTA ПO :
;/    : 16 CЛOB). 11:16 CЛOBA KAЖДOГO KBAHTA ИCПOЛЬ-:
;/    : ЗYЮTCЯ KAK OБЫЧHO B CИCTEME, ПOД MAГAЗИH.   :
;/    :---------------------------------------------:
;/
;/        CTPYKTYPA ЭЛEMEHTA TAБЛИЦЫ MAT.ЛИCTOB:
;/           16                   4    2  1
;/           :-------------------:----:----:
;/           :      N P P        : PR :  T :
;/           :-------------------:----:----:
;/      PR - COДEPЖИMOE БИTOB ЗAЩИTЫ ДЛЯ MAT.ЛИCTA;
;/       T - TИП MAT.ЛИCTA:  3 - ЛИЧHЫЙ (PRIVATE),
;/              1 - ЗAГOЛOBOK OБЬEKTA (HEADER),
;/              2 - БYФEPHЫЙ ЛИCT ФAЙЛA (BUFFER),
;/              0 - OБЩИЙ (COMMON) ЛИCT.
;/     NPP - ФИЗ.HOMEP ЛИCTA, KYДA ПPИПИCAH MAT.ЛИCT;
;/           ECЛИ ЛИCT YKAЧAH, ПOЛE NPP=0.
;/   ECЛИ ЛИCT HE PAЗPEШEHO ИCПOЛЬЗOBATЬ, BECЬ ЭЛEMEHT
;/   TMP PABEH 0.  ЛИCT, EЩE HE БЫBШИЙ B YПOTPEБЛEHИ,
;/   ИMEET PR=1 (ЗAПИCЬ PAЗPEШEHA, OБPAЩEHИE-HET)
;/   BHИMAHИE: ДOCTOBEPHYЮ ИHФOPMAЦИЮ O ПPИПИCKE OБЩИX
;/   ЛИCTOB CЛEДYET БPATЬ ИЗ TMP ДИCПETЧEPA, A HE ЮЗEPA!
;/
;/        CTPYKTYPA KBAHTA B CTEKE YПPЯTЫBAHИЯ :
;/
;/     64                   32    24    16    8    1
;/    :--------------------:-----:-----:-----:------:
;/   0:       И.P.-1       :          И.P.-2        :
;/    :       ......       :          ......        :
;/   7:      И.P.-15       :          И.P.-16       :
;/   8:       C Ч A C      :          P O П         :
;/    :--------------------:-----:-----:-----:------:
;/   9:   PEГИCTP PEЖИMOB  :XXXXX: ==> : <== :  TEГ :
;/    :--------------------:-----:-----:-----:------:
;/  10:              C Y M M A T O P                :
;/  11:         PEГИCTP MЛAДШИX PAЗPЯДOB            :
;/    :---------------------------------------------:
;/    : 12:15 -   PAБOЧИE  ЯЧEЙKИ (ДЛЯ ЭKCTPAKOДOB) :
;/    :---------------------------------------------:
;/
;/  "XXX" - CBOБOДHЫE ПOЛЯ (PEЗEPB).
;/  "==>" И "<=="  - HOMEPA CЛEДYЮЩEЙ И ПPEДЫДYЩEЙ
;/  ГPYПП PEГИCTPOB ИЛИ 0, ECЛИ ГPYППЫ HET.  B ПOCЛEД-
;/  HEM CЛYЧAE COДEPЖИMOE COOTB.PEГИCTPOB HAXOДИTCЯ B
;/  COCEДHEM KBAHTE CTEKA YПPЯTЫBAHИЯ.
;/  PAПY (KOHEЦ CTEKA YПPЯTЫBAHИЯ) BCEГДA YKAЗЫBAET
;/  HA HAЧAЛO ПEPBOГO CBOБOДHOГO KBAHTA.
;/  HOBЫЙ KBAHT B CTEKE ЗAДEЙCTBYETCЯ B ДBYX CЛYЧAЯX:
;/    A) ПPИ ЭKCTPAKOДAX;   Б) ПPИ BETBЛEHИЯX.
;/  B ЭKCTPAKOДAX B KAЧECTBE PAБ.ЯЧEEK MOЖHO ИCПOЛЬ-
;/  ЗOBATЬ HE TOЛЬKO ПOCЛEДHИE 4 CЛOBA KBAHTA, HO И
;/  MECTA XPAHEHИЯ CYMMATOPA И PMP, T.K. OHИ HE BOC-
;/  CTAHABЛИBAЮTCЯ ПPИ BOЗBPATE.
;/
;/           ЗHAЧEHИЯ PAЗPЯДOB "REGSCAL" :
;/           -----------------------------
;/    64 - ПPOЦECC B PEЖИME ЭMYЛЯЦИИ БЭCM-6
;/    63 - ЗAKAЗAHA TPACCИPOBKA ЭKCTPAKOДOB
;/    62 - ПAPAЛЛEЛЬHAЯ BЫДAЧA OT Э064 HA TEPMИHAЛ
;/    61 - ABTOMATИЧECKAЯ ЗAMEHA "000" HA "075"
;/    24 - БЛOKИPOBKA TPACCИPOBKИ Э050
;/            ..............
;/     1 - БЛOKИPOBKA TPACCИPOBKИ Э077
;/
  ENDM
 TPP:MACRO
;/
;/             TAБЛИЦA ФИЗ.CTPAHИЦ
;/             ===================
;/   MAKC.PAЗMEP ПAMЯTИ = 960K,  TAK KAK AДPECA
;/   BHEШHИX YCTPOЙCTB BCEГДA ЗAHИMAЮT ПOCЛEДHИE 64K.
;/   B TAБЛИЦE KAЖДЫЙ ЛИCT ПPEДCTABЛEH ПOЛYCЛOBOM :
;/
 PAGES:LCB QPAGE ; К-ВО СТРАНИЦ
 ,BLK_16P ; БЛОК.16-СТР.СЕГМ.
 ,RES_PAGE ; РЕЗЕРВ. ЛИСТ
,TPP(512) ; ТАБЛ.СТРАНИЦ
;/
;/     32             16 15   12  10    8     1
;/     :--------------:-:-:---:---:----:-------:
;/     :    N M P     :E:F:   : T : PR :   NP  :
;/     :--------------:-:-:---:---:----:-------:
;/    E - CTPAHИЦA ЗAKPЫTA ПO OБMEHY
;/    F - CTPAHИЦA HE ПOДЛEЖИT YKAЧKE
;/    T - TИП (3-PRIVATE,1-HEADER,2-BUFFER,0-COMMON);
;/    NMP - BИPTYAЛЬHЫЙ HOMEP CTPAHИЦЫ;
;/    PR  - ATPИБYTЫ ЗAЩИTЫ ПO OБPAЩEHИЮ И ЗAПИCИ;
;/    NP  - HOMEP ПPOЦECCA-BЛAДEЛЬЦA ИЛИ FF ПPИ T=0;
;/
 ENDM
FATA:MACRO
;/        ФAЙЛOBAЯ TAБЛИЦA
FATA:PCB NAMES(2048);ИMEHA ФAЙЛOB
,HNDLSC(4)
,FNPC(32),FPCN(32)
,FBOSS(32);BЛAДEЛЬЦЫ ФАЙЛОВ
,FNUM(32);ЛOГ.HOMEPA Y HИX
,FATR(32);ATPИБYTЫ ФAЙЛOB
,FSTAT(128);CЧ-KИ OБM.И OШ.
,FCOOR(128);TEK.KOOPДИHATЫ
,SFNUM(8);HOMEPA CПEЦФAЙЛOB
,SFATR(8);ИX CTAHД.ATPИБYTЫ
ENDM
CDEF:MACRO
;/
;/       OПИCAHИE БЛOKA KOHCTAHT :
;/
;
CONSTANS:SUBP QF ; БЛOK KOHCTAHT :
CONSTANS:BLOCK FULWOR ; BCE "1"
 ,WELL_INT
;
ENDM
FDEF:MACRO
;
;          ИMEHA CИCTEMHЫX ФAЙЛOB :
;    (PACШИPEHИEM "**" ПOMEЧEHЫ ЛИЧHЫE ФAЙЛЫ)
;      0 - ДИCПETЧEP,    1 - MOHИT.CИCTEMA
;      2 - ФAЙЛ YKAЧKИ,  3 - ФAЙЛ ЛИCTИHГA
;      4,5 - ФOPTPAHHЫE БИБЛИOTEKИ  01:12
;
MAINFILE:CHARZ "D:\BESM6\RETROS.BIN"
:CHARZ "D:\BESM6\MONSYS.9  "
:CHARZ "D:\BESM6\MEMORY.** "
:CHARZ "D:\BESM6\OUTPUT.** "
:CHARZ "D:\BESM6\LIBRAR.12 "
:CHARZ "D:\BESM6\LIBRAR.37 "
;
ENDM
SFATR:MACRO
;
;        БAЙTЫ ATPИБYTOB ДЛЯ CИCTEMHЫX ФAЙЛOB:
;
SF_ATR:HEX 8685 C2E0 8585 0000
HEX 0
HEX 0
HEX 0
HEX 0
HEX 0
HEX 0
HEX 0102 0304 0403 0201
;
ENDM
SETR:MACRO
;/
;/    KOMAHДЫ ДЛЯ PAБOTЫ C PEГИCTPOM PEЖИMOB (PP).
;/    ============================================
;/  SETR, CLRR - ПOXOЖИ HA KOMAHДY  ,24,
;/  "1" B J-M PAЗPЯДE ИCП.AДPECA YCTAHABЛИBAET/ГACИT
;/  J+10 -Й ПPИЗHAK PP.  "0" - HE MEHЯET ПPИЗHAK :
;/   1 - ББЧ     2 - БППY     3 - PД       4 - БЧOП
;/   5 - БПTЧ    6 - БЧC      7 - БПИHT    8 - БBП
;/   9 - БПTЗ   10 - PЭC     11 - PШAГ    12 - ПOП
;/  13 - БЗЗ    14 - БЗO     15 - POA     16 - БПHП
;/  17 - БП
;/  CYMMATOP, PMP, ПPИЗHAKИ ГPYПП - HE MEHЯЮTCЯ.
;/  ПPИMEP:  SETR @10110  - БЛOK.ПPИПИCKИ И ПPOB.TEГA
;/           CLRR @FFF7F  - PAЗPEШ. BHEШH.ПPEPЫBAHИЙ
;/
/ SETR /
  ENDM
CLRR:MACRO
/ CLRR /
  ENDM
SMON:MACRO
/ SMON /
ENDM
CMON:MACRO
/ CMON /
ENDM
PINT:MACRO
;/
;/   OPГAHИЗAЦИЯ ПPOГPAMMHO-ИMИTИPOBAHHOГO ПPEPЫBAHИЯ
;/   ЧTO ЭTO TAKOE - CM. П/П "PROGINT".  ЗДECЬ OTMETИM
;/   ЧTO ЭTA ШTYKA AHAЛOГИЧHA ЭKCTPAKOДY, ГДE ДOПOЛHИ-
;/   TEЛЬHAЯ ИHФOPMAЦИЯ ЗAДAETCЯ HA CYMMATOPE.
;/
CMON @FFF7F ; CHЯTЬ "БBП"
WMOD @1C13 ; ИMИTAЦИЯ ПPEP.
ENDM
ПPИП:MACRO ; <<< KAHДИДAT B MИKPOПPOГPAMMЫ >>>
;/
;/   ПPИПИCKA  И П  ЗAДAHHOГO ПPOЦECCA
;/      K EГO ЗAKOHHOMY MATEM.ЛИCTY.
;/
/ XTA PCW
AAU @FFC00 ; ПPИПИCKA ИП
/ AOU @300 ; ПPOЦECCA
WMOD @7FE
ENDM
ПPИП1:MACRO
;/      TO ЖE, ECЛИ  PCW  YЖE HA CYMMATOPE
AAU @FFC00
/ AOU @300 ; ПPИПИCKA ИП
WMOD @7FE ; ПPOЦECCA
ENDM
EVENT:MACRO
;*           CПИCOK BOЗMOЖHЫX COБЫTИЙ :
;*           ==========================
;*   1 - ФATAЛЬHAЯ OШИБKA B ПPOГPAMME
;*   2 - ПPИШЛO COOБЩEHИE OT COCEДHEГO ПPOЦECCA
;*   3 - TAЙMEP ACTPOHOMИЧECKOГO BPEMEHИ
;*   4 - TAЙMEP CЧETHOГO BPEMEHИ
;*   5 - OKOHЧEH OБMEH C BHEШHИM YCTPOЙCTBOM
;*   6 - ПPИШEЛ ЗAПPOC HA YБИEHИE ПPOЦECCA
;*
 1:BLOCK E_FAT,E_MESS,E_AST,E_CPT
 ,E_EXCH,E_STOP
ENDM
LOG2:MACRO
;/
;/    ДЛЯ ЗAДAHHOГO HA CYMMATOPE ЦEЛOГO  N
;/    BЫЧИCЛЯETCЯ MИHИMAЛЬHOE  K, TAKOE, ЧTO
;/    2**K > N
;/
JAEQ Ь0000ZER
ANU
U-A 65
Ь0000ZER:
ENDM
CREL:MACRO
;/
;/           PAБOTA C ДBYCBЯЗHЫMИ CПИCKAMИ
;/           =============================
;/
;/   KAЖДЫЙ ЭЛEMEHT EL CПИCKA ЗAHИMAET 2**K (K=1,2,...)
;/   ПOCЛEДOBATEЛЬHЫX CЛOB ПAMЯTИ. ПPИЧEM ПEPBOE CЛOBO
;/   ИCПOЛЬЗYETCЯ ДЛЯ XPAHEHИЯ ДBYX CCЫЛOK:
;/     64                    32                   1
;/    :---------------------:-----------------------:
;/    :      F(EL)          :        B(EL)          :
;/    :---------------------:-----------------------:
;/   F - YKAЗATEЛЬ HA ЭЛEMEHT, ПPEДШECTBYЮЩИЙ EL,
;/       ИЛИ HA ЗAГOЛOBOK H CПИCKA;
;/   B - YKAЗATEЛЬ HA ЭЛEMEHT, CЛEДYЮЩИЙ ЗA EL,
;/       ИЛИ HA ЗAГOЛOBOK H CПИCKA;
;/     CПИCOK "ЗAЦИKЛEH" TAKИM OБPAЗOM, ЧTO F(H)
;/     YKAЗЫBAET HA ПOCЛEДHИЙ ЭЛEMEHT,  A   B(H)
;/     YKAЗЫBAET HA ПEPBЫЙ ЭЛEMEHT CПИCKA.  ECЛИ
;/     CПИCOK ПYCT (COДEPЖИT TOЛЬKO ЗAГOЛOBOK H),
;/     TO F(H) И B(H) YKAЗЫBAЮT HA H.
;/     YKAЗATEЛИ ПOЛYCЛOBHЫE, 32-PAЗPЯДHЫE.  CPAЗY ЖE
;/     ДOГOBOPИMCЯ, ЧTO YKAЗATEЛИ HA OБЫЧHЫЙ ЭЛEMEHT
;/     CПИCKA ДOЛЖHЫ БЫTЬ ЧETHЫE,  A YKAЗATEЛИ HA
;/     ЗAГOЛOBOK - HEЧETHЫE.
;/
;/        MAKPOC "/ CREL" CЛYЖИT ДЛЯ ЗABEДEHИЯ
;/        ПEPBOHAЧAЛЬHO ПYCTOГO CПИCKA.  PEГИCTP
;/        / COДEPЖИT AДPEC ЗAГOЛOBKA (ПOЛYCЛOBHЫЙ!).
;/
/ UTA
/ ATH
/ ATH 1
ENDM
DELL:MACRO
;/
;/    MAKPOC "/ DELL" CЛYЖИT ДЛЯ ИCKЛЮЧEHИЯ ИЗ CПИCKA
;/    ЭЛEMEHTA, ЗAДAHHOГO AДPECOM CBOEГO ПEPBOГO
;/    ПOЛYCЛOBA B PEГИCTPE /.  ПOPTЯTCЯ :  F,B.
;/    ИCKЛЮЧEHИE ИЗ ПYCTOГO CПИCKA HE MEHЯET HИЧEГO.
;/    ЗAMEЧAHИE:   "/" HE ДOЛЖHO COBПAДATЬ C  F !
;/
/ HTA
ATI F
/ HTS 1
ATI B
F STH 1
B ATH
ENDM
INSL:MACRO
;/
;/    MAKPOC "/ INSL" CЛYЖИT ДЛЯ BCTABKИ HOBOГO ЭЛ-TA
;/    (ЗAДAETCЯ B PEГИCTPE /)  ПOCЛE TEKYЩEГO (PEГ.B)
;/    ПOPTИTCЯ PEГИCTP F.
;/
ITA B
/ ATH
B HTA 1
ATI F
/ ATH 1
/ UTA
B ATH 1
F ATH
ENDM
OБMOЧ:MACRO
;*
MAXCHAN:EQU 40 ; KAHAЛЫ
MAXJOB:EQU 64 ; ЗAЯBKИ
LO:EQU 512 ; PAЗMEP BЫB.БYФ.
;*
OБM_OЧ:PCB REFERS(6) ; ПOCT.YKAЗ.
 ,LAST_JOB ; ПOCЛ.ЗAЯBKA
 ,PPINF ; CЛOBO ПPEP.ПП
 ,HEADS(MAXCHAN>>3) ; ГOЛOBЫ
 ,QUE(MAXJOB>>3) ; CПИCKИ
 ,JOB(2*MAXJOB) ; ЗAЯBKИ
 ,CON_IN(16) ;БYФEP BBOДA
 ,CON_OUT(LO+1);И BЫBOДA
 ,LAST_OUT(2) ; PAБ.ЯЧ.
 ,SC_MEM(16) ; ШKAЛA ПAMЯTИ
 ,BTER(32),BUF71(32)
 ,DUBJOB(2*MAXJOB)
PP_BUF:PCB (1024) ;
PP_ADR:PCB (1024-8)
,CLOCK ; ЧACЫ ACTP.BPEMEHИ
,RG1,RG2,ASTIMER ; TAЙMEP ---"---
,PP_MASK ; MACKA ПYЛЬT-ПPOЦECCOPA
;
PP_LIST:EQU @3C0 ; ФИЗ.ЛИCT ДЛЯ ПП
BUZY_V:PCB (0) ; HAЧAЛO V-OБЛ.
;*
ENDM
PSYS:MACRO
;    ---   HOMEPA CИCTEMHЫX ПPOЦECCOB И ИX ИMEHA  ---
N_WAIT:EQU QCPU ; ЖДYЩИЙ TECT
WAITTEST:SUBP QF ; (ИX QCPU ШTYK!)
N_WINDOW:EQU QCPU<<1 ; "OKHO"
;/      NEW_PRT:SUBP QF
N_SWING:EQU N_WINDOW+1 ; ПOДKAЧKA
SWING:SUBP QF
N_DRIV:EQU N_SWING+1 ; ДPAЙBEP ДИCKOB
D_DRIVER:SUBP QF
N_TTAN:EQU N_DRIV+1 ; "TTANAL"
TTANAL:SUBP QF
LAST_SYS:EQU N_TTAN ; ПOCЛ.CИCT.
ENDM
SPORT:MACRO
;     ----  BXOДHЫE ПOPTЫ CИCTEMHЫX ПPOЦECCOB  ----
IF_DISP:PCB (44),DTMP(256)
,(80*QCPU+39)
,RECALC(QCPU<<6) ; - "OKHO"
,SWPORT(QCPU<<6) ;-ПOДKAЧKA
,DDPORT(QCPU<<6) ;-ДPAЙBEP
ENDM
VMD:MACRO
;         BИPTYAЛЬHAЯ ПAMЯTЬ ДИCПETЧEPA
MAIN_SW:SUBP QF ; HAЧAЛO BCEГO
DISPAGE0:EQU MAIN_SW>>10 &@3FF
S_MEM:EQU MAIN_SW+@40
OSDATE:EQU MAIN_SW+@45
OSFILE:EQU MAIN_SW+@46
OSCSUM:EQU MAIN_SW+@5F
NONRSDNT:PCCB (0) ; HEPEЗИДEHTЫ
FREE_C:PCCB (0) ; KOHEЦ C-OБЛ.
FREE_V:PCB (0) ; KOHEЦ V-OБЛ.
LOADLIST:EQU FREE_C ; CПИCOK ЗAГPYЗKИ
EXTOLD:EQU LOADLIST+@400 ; ЭK.Б-6
TECTAY:EQU EXTOLD+@800 ; TECT AY/YY
;        WMSP - PAБOЧAЯ ПAMЯTЬ CИCTEMHЫX ПPOЦECCOB
;        ПO OДHOMY ЛИCTY HA ПPOЦECC.  ПO CYЩECTBY,
;        ЭTO COГЛAШEHИE O PACПPEДEЛEHИИ PEГ.ПPИПИCKИ.
WMSP:EQU TECTAY+@400 ;
WSPAG:EQU WMSP>>10 & @3FF
BFPOOL:EQU @380 ; БYФEPA ФAЙЛOB
ENDM
ДД89:MACRO
;/
;/         CПPABOЧHИK ИHTEPПPETATOPA ДД-89
;/
LINT:EQU 512 ; ЛИCT ИHTEPПPETATOPA
INTERP:EQU LINT<<10
INTERP:BLOCK (@740),T1MT(48),T2MT(48)
,TNAMT(48),I_DNAM(16),I_FATA(32)
CAT:EQU 40 ; ЛИCT CПPABOЧHИKA
TABS:EQU CAT<<10 ; ШK.S-ФAЙЛOB
LT:EQU 511-CAT
TABS:BLOCK (1),RETM67,OCT67(3)
,IW70,IW72,WS(15)
,Ю_ЭKCT,Ю_CЧAC,ПEPE74
,MODEL(8),TABDRU(LT)
ENDM
CONSTANS:NAME QF
;*
;****      БЛOK KOHCTAHT CИCTEMЫ      *******
;*           (MAKPOC "CDEF")
;*
CONST
WELL_INT:HEX 0000 0180 0000 001E
;
CMD
;        ПEPBAЯ KOHCTAHTA ЗAПИCAHA KOMAHДOЙ, T.K.
;         A.Л.ДABЫДOB HE TEPПИT ПYCTЫX ПPOГPAMM
;
:15 REF -1 ; FULWOR
 15 REF -1
;
END
MAIN_SW:NAME QF
;
;****************************************************
;*                                                  *
;*          BXOДЫ B OПEPAЦИOHHYЮ CИCTEMY            *
;*                И BЫXOДЫ ИЗ HEE                   *
;*          OT ПPEPЫBAHИЙ И ЭKCTPAKOДOB             *
;*                                                  *
;****************************************************
;*
;*   AДPEC HAЧAЛA ПEPEKЛЮЧATEЛЯ ПPEPЫBAHИЙ ФИKCИPOBAH
;*   B COOTBETCTBYЮЩИX MИKPOПPOГPAMMAX.    CEЙЧAC OH
;*   PABEH  FFF8 0800  ( 514-Й MAT.ЛИCT ).  ДAЛEE
;*   ДAETCЯ PACПPEДEЛEHИE B OTHOCИTEЛЬHЫX AДPECAX :
;*
;*     00:3F - ПPEPЫBAHИЯ  1:64
;*      40   - ГЛOБAЛЬHЫЙ CEMAФOP ПAMЯTИ
;*      50   - ЭKCTPAKOДЫ HOBOГO PEЖИMA
;*      51   - ЭKCTPAKOДЫ CTAPOГO PEЖИMA (БЭCM-6)
;*      52   - ЭKCTPAKOДЫ И HEKOTOPЫE KOMAHДЫ  CBC
;*      53   - ЗAПPEЩEHHЫE KOMAHДЫ (OCH.ФOPMAT)
;*      5F   - KOHTPOЛЬHAЯ CYMMA ДИCПETЧEPA
;*      60   - BXOД ПOCЛE OБЩEГO CБPOCA MAШИHЫ
;*
;*
;*   K A P T A   B И P T Y A Л Ь H O Й   П A M Я T И
;*   ===============================================
;*
;*  AДPEC  CTP.         HAЗHAЧEHИE                ФИЗ.
;*  -----:------:--------------------------------:
;*  00000  000  : ПAMЯTЬ БЭCM-ЗAДAЧИ (32K)       :
;*  07FFF  01F  :                                :
;*         027  : БЫBШИE ФOPMAЛЬHЫE ЛИCTЫ DD-89  :
;*         028  : KATAЛOГ "БAPAБAHOB" И S-ФAЙЛOB :
;*         029  : ПAMЯTЬ ДЛЯ "MБ" И S-ФAЙЛOB     :
;*  7FFFF  1FF  :                                :
;*              :--------------------------------:
;*  80000  200  : ПPИHAДЛEЖAЩИЙ ПOЛЬЗOBATEЛЮ     :
;*         201  : ЭKЗEMПЛЯP ЭKCTPAKOДOB 50 И 64  :
;*              :--------------------------------:
;*  80800  202  : BXOДЫ B CИCTEMY OT ПPEPЫBAHИЙ  : 0
;*              : ДAЛEE - PEЗИДEHTHAЯ ЧACTЬ  OC  :
;*              :         ( C-OБЛACTЬ )          :
;*              :           .........            :C-1
;*              :--------------------------------:
;*              : БЛOK ИHИЦИAЛИЗAЦИИ CИCTEMЫ     :C+V
;*              : ДAЛEE - HEPEЗИДEHT  OC, CПИCOK :
;*              : ЗAГPYЗKИ(1), ЭKCTPAKOДЫ БЭCM(2):
;*              : TECTAY(1), ДA MAЛO ЛИ EЩE ЧTO. :
;*              : PAБOЧИE ЛИCTЫ CИCT.ПPOЦECCOB   :
;*              :--------------------------------:
;*  E0000  380  : ЛИЧHЫЙ БYФEPHЫЙ ПYЛ ПPOЦECCA   :
;*              : БYФEPA ДЛЯ PAБOTЫ C ФAЙЛAMИ.   :
;*              :--------------------------------:
;*  F0000  3C0  : ЗOHA CBЯЗИ C ПYЛЬT.ПPOЦECCOPOM :3C0
;*              :--------------------------------:
;*  F0C00  3C3  : ПAMЯTЬ ДЛЯ БAЙTOBЫX MACCИBOB   : C
;*              : ( V-OБЛACTЬ PEЗИДEHTA  OC )    :C+V-1
;*              :--------------------------------:
;*  FE000  3F8  : ПAMЯTЬ ДЛЯ CYГYБO БИTOBЫX ШKAЛ :
;*              : (ИCПOЛЬЗYETCЯ HEPEЗИДEHTAMИ)   :
;*              :--------------------------------:
;*  FF800  3FE  : ИHФOPMAЦИOHHOE ПOЛE ПPOЦECCA И :
;*              : EГO BOЗMOЖHOE ПPOДOЛЖEHИE      :
;*  FFFFF  3FF  :--------------------------------:
;
;
CHEKSUMM:ENTRY QF
;
IFP
;
;........     COCTAB PEЗИДEHTA OC :
;             =====================
;    CHAЧAЛA OПИCЫBAEM  COMMON-БЛOKИ,  ЧTOБЫ PAБOЧИE
;    ЯЧEЙKИ ПOДПPOГPAMM ПPИXOДИЛИCЬ HA KOHEЦ  V-OБЛ.
;    COMMON-Ы ГPYЗЯTCЯ HAЧИHAЯ C MAT.AДPECA F0000 И
;    B COBOKYПHOCTИ COCTABЛЯЮT V-OБЛACTЬ PEЗИДEHTA.
;
;    ЗATEM OПИCЫBAEM ПOДПPOГPAMMЫ, KOTOPЫE COCTABЛЯ-
;    ЮT C-OБЛACTЬ. OHИ ГPYЗЯTCЯ C @80800.  C METKИ
;    "NONRSDNT" HAЧИHAETCЯ HEPEЗИДEHTHAЯ ЧACTЬ.
;    ПOCЛEДHИMИ OПИCAHЫ  FREE_C  - KOHEЦ C-OБЛACTИ
;    И FREE_V  - KOHEЦ V-OБЛACTИ.
;
ЫЫ_ЫЫ:LCB (65000) ; BЫXOД HA F0000
OБMOЧ
;
IF_DISP:PCB (1024)
INTSTAK:EQU IF_DISP + @1C0
FATA
;
PCW
SEMAF
TPP
TIMESTD:LCB (1) ; BPEMЯ ЗAПYCKA
ATQUE:LCB (QPROC-QCPU-QCPU) ; OЧ. AB-TAЙMEPOB
CODE
;
MAINBLCS:SUBP QF ;  Я Д P O
EXTINTER:SUBP QF ; BHEШ.ПPEP.
PROGINT:SUBP QF ; ПPOГP.ПPEP.
STEPINT:SUBP QF ; ШAГOBЫE ПPEP.
INTERMEM:SUBP QF ; ПPEP: 1:4
INTERTIM:SUBP QF ; ПPEP.ПO TAЙMEPY
INT8:SUBP QF
INT10:SUBP QF
INT11:SUBP QF
INT12:SUBP QF
INT13:SUBP QF
INT15:SUBP QF
INT16:SUBP QF
INT19:SUBP QF
INT20:SUBP QF
INT21:SUBP QF
INT22:SUBP QF
INT23:SUBP QF
ERROR:SUBP QF
GIVGROUP:SUBP QF
OЧEPEДЬ:SUBP QF
HEAP:SUBP QF
CREVENT:SUBP QF
KOHCOЛЬ:SUBP QF
TCPQUE:SUBP QF
CDEF
POPGRUP:SUBP QF
SEMDOWN:SUBP QF
DATE:SUBP QF
DHEX8:SUBP QF
WAITTEST:SUBP QF ; "ЖДY"
SWING:SUBP QF
D_DRIVER:SUBP QF
EXTRACOD:SUBP QF ; ЭKCTPAKOДЫ HOBЫE
BESMEXTR:SUBP QF ; ЭKCTPAKOДЫ CTAPЫE
ERRMACRO:SUBP QF ; ДИAГHOCTИKA
RES_END:CCB (0)
;
RSDNT2:PCCB (0)
STARTER:SUBP QF ; ПYCK ПPOЦECCOPA
TTANAL:SUBP QF ;
SERVER:SUBP QF
NONRSDNT:PCCB (0)
;
FREE_C:PCCB (0) ; KOHEЦ C-OБЛ.
FREE_V:PCB (0) ; KOHEЦ V-OБЛ.
;
GROUP
MODIF
N:EQU 1 ; HOM.ПPEP.
VOL_C:EQU FREE_C-BEGIN>>10
VOL_V:EQU FREE_V-BUZY_V>>10
;
CMD
;
;
;                 П P E P Ы B A H И Я :
;                 *********************
;
;     ПPOЦECCOP ПEPEKЛЮЧAETCЯ HA  0-Ю ГPYППY PEГИCTPOB
;     ПPEЖHEE COCTOЯHИE ЭTИX PEГИCTPOB HECYЩECTBEHHO.
;     YCTAHABЛИBAЮTCЯ: БПHП,БBП,PД,POA,БЗO,БЗЗ,ПOП.
;     YCTAHABЛИBAЮTCЯ ЗAHOBO CЛEДYЮЩИE PEГИCTPЫ :
;
;      TN - HOMEP ПPEPBAHHOГO ПPOЦECCA
;      NG - HOMEP AKTИBHOЙ ГPYППЫ EГO PEГИCTPOB
;      P1 - KOПИЯ PEГИCTPA PEЖИMOB ПPEPB.ПPOЦECCA
;      P2 - KOПИЯ PACШИPEHИЯ PEГИCTPA PEЖИMOB
;      RI - MAT.AДPEC KOMAHДЫ, BЫЗBABШEЙ ПPEPЫBAHИE
;      PA - ФИЗ.AДPEC KOMAHДЫ, BЫЗBABШEЙ ПPEPЫBAHИE
;      IA - MAT.AДPEC OПEPAHДA, BЫЗBABШEГO ПPEPЫBAHИE
;      CA - KOД OПEPAЦИИ APБИTPA
;      S  - YKAЗATEЛЬ CTEKA B PAБ.ПOЛE ПPEPB.ПPOЦECCA.
;
;          HOMEPA И ПPИЧИHЫ ПPEPЫBAHИЙ :
;          =============================
; (*) - ПPEPЫBAHИЯ OTPAБATЫBAЮTCЯ БEЗ BMEШATEЛЬCTBA OC.
;
;     01 (01) - OTCYTCTBYЮЩИЙ БЛOK ПAMЯTИ
;     02 (02) - MHOГOKPATHAЯ OШИБKA
;     03 (03) - TIME-OUT ПPИ OБPAЩEHИИ K OЗY
;     04 (04) - TIME-OUT ПPИ OБPAЩEHИИ K ШИHE ДAHHЫX
;     05 (05) - ПPOГPAMMHOE ПPEPЫBAHИE
;
;     07 (07) - OTCYTCTBYЮЩИЙ AДPEC ПAMЯTИ
;     08 (08) - OTPИЦATEЛЬHЫЙ HOMEP CTPAHИЦЫ Y KOMAHДЫ
;     09 (09) - OTPИЦATEЛЬHЫЙ HOMEP CTPAHИЦЫ Y OПEPAHДA
;     0A (10) - ПPOГPAMMHAЯ ИHTEPПPETAЦИЯ TEГA KOMAHДЫ
;     0B (11) - ПPOГPAMMHAЯ ИHTEPПPETAЦИЯ TEГA OПEPAHДA
;     0C (12) - ЗAЩИTA AДPECA ПPИ ЧTEHИИ
;     0D (13) - KOHTPOЛЬ KOMAHДЫ
;  *  0E (14) - MATEMATИЧECKИЙ AДPEC = 0
;     0F (15) - ЧYЖOЙ PП ПPИ ЧTEHИИ/ЗAПИCИ OПEPAHДA
;     10 (16) - ЧYЖOЙ PП ПPИ BЫБOPKE KOMAHДЫ
;     11 (17) - ЗAЩИTA CTPAHИЦЫ ПO OБPAЩEHИЮ
;     12 (18) - ЗAЩИTA CTPAHИЦЫ ПO ЗAПИCИ
;     13 (19) - ЗAЩИTA BЫБOPKИ KOMAHДЫ
;     14 (20) - ЗAЩИTA ПEPEДAЧИ YПPABЛEHИЯ
;     15 (21) - ЗAЩИTA AДPECA ПPИ ЗAПИCИ
;     16 (22) - ЧYЖOЙ CYMMATOP
;     17 (23) - ЧYЖOЙ OПEPAHД
;  *  18 (24) - ЗAПPOC MOДИФИKAЦИИ ПPИOPИTETOB CTPAHИЦ
;  *  19 (25) - OCTAHOB ПPИ COBПAДEHИИ AДPECOB (ПП)
;  *  1A (26) - TIME-OUT ПPИ БЛOKИPOBKE BHEШ.ПPEPЫBAHИЙ
;     1B (27) - BHEШHИE ПPEPЫBAHИЯ
;  *  1C (28) - HALT ПO KOMAHДE ИЛИ ЗAПPOCY OT ПП
;     1D (29) - ШAГOBOE ПPEPЫBAHИE
;  *  1E (30) - OБPAЩEHИE БЛOKA CBЯЗИ C ПП
;  *  1F (31) - MЛAДШИE PAЗPЯДЫ CB-ЧACOB PABHЫ 0
;  *  20 (32) - MЛAДШИE PAЗPЯДЫ CB-TAЙMEPA PABHЫ 0
;     21 (33) - ПEPEПOЛHEHИE
;     22 (34) - ПEPEПOЛHEHИE ПOPЯДKA БЭCM-6
;     23 (35) - ДEЛEHИE HA 0
;     24 (36) - ПEPEПOЛHEHИE ПOЛЯ YПPЯTЫBAHИЯ
;     25 (37) - HEЗAKOHHЫЙ OПEPAHД
;     26 (38) - BЫБOPKA KOMAHДЫ ПO MAT.AДPECY 0
;
;MOZY=80800        ;  - MAIN_SW
;
 BEGIN:N VTM 1
 JMP INTERMEM
 :N VTM 2
 JMP INTERMEM
 :N VTM 3
 JMP INTERMEM
 :N VTM 4
 JMP INTERMEM
 :N VTM 5
 JMP EXTINTER
 :HLT 6 ; - PEЗEPB
  IJP
 :N VTM 7
 JMP ERROR
 :N VTM 8
 JMP INT8
 :N VTM 9
 JMP ERROR
 :N VTM 10
 JMP INT10
 :N VTM 11
 JMP INT11
 :N VTM 12
 JMP INT12
 :N VTM 13
 JMP INT13
 :HLT 14 ; - ПCEBДO
 IJP
 :N VTM 15
 JMP INT15
 :N VTM 16
 JMP INT16
 :N VTM 17
 JMP ERROR
 :N VTM 18
 JMP ERROR
 :N VTM 19
 JMP INT19
 :N VTM 20
 JMP INT20
 :N VTM 21
 JMP INT21
 :N VTM 22
 JMP INT22
 :N VTM 23
 JMP INT23
 :HLT 24 ; - ПCEBДO
  IJP
 :HLT 25 ; - ПCEBДO
  IJP
 :HLT 26 ; - ПCEBДO
  IJP
 :N VTM 27
 JMP EXTINTER
 :HLT 28
  IJP
 :N VTM 29
 JMP STEPINT
 :HLT 30 ; - ПCEBДO
  IJP
 :HLT 31 ; - ПCEBДO
  IJP
 :HLT 32 ; - ПCEBДO
  IJP
 :N VTM 33
 JMP ERROR
 :N VTM 34
 JMP ERROR
 :N VTM 35
 JMP ERROR
 :N VTM 36
 JMP ERROR
 :N VTM 37
 JMP ERROR
 :N VTM 38
 JMP ERROR
 :HLT 39 ; - PEЗEPB
 :HLT 40
 :HLT 41
 :HLT 42
 :HLT 43
 :HLT 44
 :HLT 45
 :HLT 46
 :HLT 47
 :HLT 48
 :HLT 49
 :HLT 50
 :HLT 51
 :HLT 52
 :HLT 53
 :HLT 54
 :HLT 55
 :HLT 56
 :HLT 57
 :HLT 58
 :HLT 59
 :HLT 60
 :HLT 61
 :HLT 62
 :HLT 63
 :HLT 64
  IJP
;
S_MEM:ATX ; CEMAФOP
ATX ; ПAMЯTИ
;
:ATX 0
 ATX @A2
;
:ATX 0 ; ДЛИHA PEЗИДEHTA
ATX RES_END - BEGIN
:ATX 0 ; PAЗMEP C-OБЛ.
ATX FREE_C - BEGIN
:ATX 0 ; PAЗMEP C+V
ATX FREE_V-BUZY_V + FREE_C-BEGIN
;
:ATX 0 ; 45 - ДATA OC
:ATX 0 ; 46:48 - ПOЛHOE
:ATX 0 ;      ИMЯ ФAЙЛA
:ATX 0 ;   C ДИCПETЧEPOM
;
:ATX 0 ; 49 - PEЗEPB
:ATX 0 ; 4A
:ATX 0 ; 4B
:ATX 0 ; 4C
:ATX 0 ; 4D
:ATX 0 ; 4E
:ATX 0 ; 4F
;
;
;             Э K C T P A K O Д Ы :
;             *********************
;
:JMP EXTRACOD ; HOBЫE
:JMP BESMEXTR ; CTAPЫE
:JMP BESMEXTR ;  CBC
:JMP BESMEXTR ; ЗAПP.KOM.
:ATX ; 54 - PEЗEPB
:ATX ; 55
:ATX ; 56
:ATX ; 57
:ATX ; 58
:ATX ; 59
:ATX ; 5A
;
CHEKSUMM:
UTA
14 VTM FREE_C-BEGIN-1
:14 ARX BEGIN
14 VRM *
AEU -1
13 JAEQ
HLT -1
13 JMP
;
:ATX 0 ; 5F ; - KOHTP.CYMMA
ATX 0
;
;              O Б Щ И Й   C T A P T   C И C T E M Ы :
;              =======================================
;
;              ПEPBЫM CTAPTYET ПPOЦECCOP C HOMEPOM N=0.
;              OH И ПOДГOTABЛИBAET K PAБOTE BCЮ ПAMЯTЬ.
;              OCTAЛЬHЫE ПPOЦECCOPЫ ПPИBOДЯT B ПOPЯДOK
;              TOЛЬKO CBOИ COБCTBEHHЫE PEГИCTPЫ.
;
;              CTAPTOBЫЙ ПPOЦECC ПOЛYЧAET TOT ЖE HOMEP
;              (N+QCPU) И TY ЖE ГPYППY PEГИCTPOB (1-Ю),
;              ЧTO И ЖДYЩИЙ TECT HA  N-M  ПPOЦECCOPE.
;
;
:UTA 1<<5
WMOD @1818 ; ГPYППA=1
ATI NG
UTA @F1FC
ASFT -10
NG WMOD PP
SETR PД+БЧOП+БПTЧ+БЧC+БПИHT+БBП+БПTЗ+БЗЗ+БЗO+POA+БПHП
CLRR ББЧ+БППY+PШ+ПOП+БП
UTA 0 ; TEГ PEЗ-TA
NG WMOD PPP
RMOD @1C1A
ATI CP ; N CPU
CP UTA QCPU
WMOD @1819 ; ПPOЦECC = N+QCPU
NG WMOD GRBOSS ; И B ГPYППY
ATI TN
UTA PP_LIST<<10 +@3FF
WMOD REFERS>>10 & @3FF + @400
UTA -1 ; ПOCЛ."ФИЗ.AДP."
WMOD PP_MASK>>10 & @3FF + @400
WMOD @1C15 ; TAЙMEP
ASFT 32+3 ; CBOБ.ГPYППЫ:
WMOD TAIL ; 3:32
CP MSFT -3
CP UTA INTSTAK ; MAГAЗИH
CP MSFT 3 ; ДЛЯ ПPEPЫBAHИЙ
WMOD 15 ;
A+U QCPU<<3
WMOD SPRADR
UTA
14 VTM GRBOSS-TIMER ; MИHИM.
:14 WMOD TIMER ; ПOДГOTOBKA
14 VRM * ; 0-Й  ГPYППЫ
WMOD @1802 ; ГAШ.ГPП
CP JMNE ZR
;
;          БЛOKИPOBAHИE ПYЛЬT-ПPOЦECCOPA
;
ATX PP_MASK
ATX HEADS
ATX HEADS+1
ATX HEADS+2
ATX HEADS+3
ATX S_MEM
;
;        OБHYЛEHИE ГPYПП 2:31, PП, OЗYПC
;
ZR:1 VTM 64-@17FF
CLRR БBП
:1 WMOD @17FF
1 VLM *
;
;        ПPИПИCKA PEЗИДEHTA И БЛOKA CBЯЗИ C ПП
;
UTA PP_LIST<<10 +@3FF
WMOD OБM_OЧ>>10 +@400
A+U @400
WMOD OБM_OЧ>>10 +@401
UTA -1
WMOD OБM_OЧ>>10 +@402
2 VTM 1-VOL_C
UTA @2FF ; ЗAПPET ЗAПИCИ
:2 WMOD FREE_C>>10 +@3FF
A+U @400
2 VLM *-1
2 VTM 1-VOL_V
AOU @3FF ; PAЗP.ЗAПИCИ
:2 WMOD FREE_V>>10 +@3FF
A+U @400
2 VLM *-1
CPUSH
13 VTM STARTER
JMP CHEKSUMM
;
END
STARTER:NAME QF
;
PCW
NEW_PRT:SUBP QF
KOHCOЛЬ:SUBP QF
SETQ:SUBP QF
ERRMACRO:SUBP QF
CHEKSUMM:SUBP QF
DATE:SUBP QF
TIME:SUBP QF
WEEKDAY:SUBP QF
VMD
OБMOЧ
CODE
TPP
FATA
TIMESTD:LCB (1) ; BPEMЯ ЗAПYCKA
RES_END:CCB (0)
VOL_C:EQU FREE_C-MAIN_SW>>10
VOL_V:EQU FREE_V-BUZY_V>>10
PSYS
SPORT
IFP
GROUP
MODIF
PCBIT
RRBIT
;
CONST
;
SFATR
;
;            TEГИ PEЗYЛЬTATA ДЛЯ CИCT.ПPOЦECCOB:
;
TEGS:HEX 0000 0010 2040 0000
;
CTABLES:
;
;              ПEPEKOДИPOBOЧHЫE TAБЛИЦЫ :
;
;     ПPЯMЫE TAБЛИЦЫ C BXOДOM ПO KOДY ИCXOДHOГO БAЙTA
;     HECYЩECTBYЮЩИE CИMBOЛЫ ЗAMEHЯЮTCЯ HA CИMBOЛ "!"
;     KOДИPOBKA MKБ COBПAДAET C AЛЬTEPHATИBHЫM ASCII.
;
;              I.   M K Б ---> I S O
;                   ================
;                     000-137 (1:1)
HEX 0001 0203 0405 0607
HEX 0809 0A0B 0C0D 0E0F
HEX 1011 1213 1415 1617
HEX 1819 1A1B 1C1D 1E1F
;
HEX 2021 2223 2425 2627
HEX 2829 2A2B 2C2D 2E2F
HEX 3031 3233 3435 3637
HEX 3839 3A3B 3C3D 3E3F
;
HEX 4041 4243 4445 4647
HEX 4849 4A4B 4C4D 4E4F
HEX 5051 5253 5455 5657
HEX 5859 5A5B 5C5D 5E5F
;                     140-177 (MAЛЫE ЛAT.)
HEX 2741 4243 4445 4647
HEX 4849 4A4B 4C4D 4E4F
HEX 5051 5253 5455 5657
HEX 5859 5A5B 3A5D 5E5F
;                     200-237 (БOЛЬШИE PYCCKИE)
HEX 4162 4267 6445 767A
HEX 696A 4B6C 4D48 4F70
HEX 5043 5459 6658 637E
HEX 7B7D 7879 787C 6071
;                     240-277 (MAЛЫE PYCCKИE 1)
HEX 4162 4267 6445 767A
HEX 696A 4B6C 4D48 4F70
HEX 2121 2121 2121 2121
HEX 2121 2121 2121 2121
;                     300-337 (ПCEBДOГPAФИKA)
HEX 2121 2121 2121 2121
HEX 2121 2121 2121 2121
HEX 2121 2121 2121 2121
HEX 2121 2121 2121 2121
;                     340-377 (MAЛЫE PYCCKИE 2)
HEX 5043 5459 6658 637E
HEX 7B7D 7879 787C 6071
HEX 4545 2121 2121 2121
HEX 2121 2121 2121 2121
;
;                II.  I S O ---> M K Б
;                     =================
;                     000-137  (1:1)
HEX 0001 0203 0405 0607
HEX 0809 0A0B 0C0D 0E0F
HEX 1011 0013 1415 1617
HEX 1819 1A1B 1C1D 1E1F
;
HEX 2021 2223 2425 2627
HEX 2829 2A2B 2C2D 2E2F
HEX 3031 3233 3435 3637
HEX 3839 3A3B 3C3D 3E3F
;
HEX 4041 4243 4445 4647
HEX 4849 4A4B 4C4D 4E4F
HEX 5051 5253 5455 5657
HEX 5859 5A5B 5C5D 5E5F
;                     140-177 (PYCCKИE-->БOЛЬШИE)
HEX 9E41 8196 8445 9483
HEX 5888 894B 8B4D 484F
HEX 8F9F 5043 5459 8642
HEX 9C9B 8798 9D99 977F
;                     200-377 (OTCYTCTBYЮT)
HEX 2121 2121 2121 2121
HEX 2121 2121 2121 2121
HEX 2121 2121 2121 2121
HEX 2121 2121 2121 2121
;
HEX 2121 2121 2121 2121
HEX 2121 2121 2121 2121
HEX 2121 2121 2121 2121
HEX 2121 2121 2121 2121
;
HEX 2121 2121 2121 2121
HEX 2121 2121 2121 2121
HEX 2121 2121 2121 2121
HEX 2121 2121 2121 2121
;
HEX 2121 2121 2121 2121
HEX 2121 2121 2121 2121
HEX 2121 2121 2121 2121
HEX 2121 2121 2121 2121
;
;               III.   Г O C T  --->  M K Б
;                      ====================
;                      000-037  (ЦИФPЫ И ЗHAKИ)
HEX 3031 3233 3435 3637
HEX 3839 2B2D 2F2C 2E20
HEX 4521 2829 2A3D 3B5B
HEX 5D2A 2727 233C 3E3A
;                      040-077  (PYCCKИE И "D")
HEX 4181 4283 8445 8687
HEX 8889 4B8B 4D48 4F8F
HEX 5043 5459 9458 9697
HEX 9899 9B9C 9D9E 9F44
;                      100-137  (ЛATЫHЬ И ЗHAKИ)
HEX 4647 494A 4C4E 5152
HEX 5355 5657 5A5C 7B7D
HEX 225E 29BF 2BDB 2524
HEX B37E 5F21 229A 4027
;                      140-377  (OTCYTCTBYЮЩИE)
HEX 2121 2121 2121 2121
HEX 2121 2121 2121 2121
HEX 2121 2121 2121 2121
HEX 2121 2121 2121 2121
;
HEX 2121 2121 2121 2121
HEX 2121 2121 2121 2121
HEX 2121 2121 2121 2121
HEX 2121 2121 2121 2121
;
HEX 2121 2121 2121 2121
HEX 2121 2121 2121 2121
HEX 2121 2121 2121 2121
HEX 2121 2121 2121 2121
;
HEX 2121 2121 2121 2121
HEX 2121 2121 2121 2121
HEX 2121 2121 2121 2121
HEX 2121 2121 2121 2121
;
HEX 2121 2121 2121 2121
HEX 2121 2121 2121 2121
HEX 2121 2121 2121 2121
HEX 2121 2121 2121 2121
;
CMD
;
;MOZY=81400        ;  - STARTER
;
;        OБHYЛEHИE ПAMЯTИ.  ЗAOДHO BЫЯCHИM EE PAЗMEP.
;
STARTER:CP JMNE READYMEM
UTA
ATX S_MEM
ATX OSCSUM
XTA NEWCSUM ; ДЛЯ CYMMИPO-
UTY 9 ; BAHИЯ TOЛЬKO
TTX CHEKSUMM ; PEЗИДEHTA
CPUSH
NEWCSUM:UTA
14 VTM RES_END-MAIN_SW-1
:14 ARX MAIN_SW
14 VRM *
AEU -1
ATX OSCSUM
;
;       HNDLSC1 - ШKAЛA "UN", OCTABШИXCЯ
;           OTKPЫTЫMИ ПPИ ПEPEBЫЗOBE CИCTEMЫ.
;
1 VTM VOL_C - 1023+64
2 VTM 3
:XTA SFATR+7
AEX SF_ATR+7
:JANE *+1 ; 1-Й BЫЗOB
2 UTC HNDLSC
:XTA
2 ATX HNDLSC1
:2 VRM *-3
2 VTMF TEMPO ; BPEM.ШKAЛA
2 UTM VOL_C
UTA NOMEM ; ПEPEXBAT
WMOD PAПY ; ПPEP: 1-4
UTA -1
ATX TEMPO
LZPAG:1 UTA 1023-64
ASFT -10
AOU @3FF
WMOD @401 ; 1 MAT.ЛИCT
UTA
14 VTM 1023
:14 ATX 1024
14 VRM *
WMOD @401
2 SETF ; ЛИCT ECTЬ
ELZPAG:2 UTM 1
1 VLM LZPAG
UTA
WMOD @401
WMOD PAПY
;
;        ИHИЦИAЛИЗAЦИЯ БЛOKA CBЯЗИ C  П П :
;
2 VTM 1023
:2 ATX REFERS
2 VRM *
2 VTM 2-MAXJOB
15 VTM REFERS
:A+U 1
2 ATB QUE<<3 +MAXJOB-2
2 VLM *-1
UTA HEADS-REFERS
UTS QUE-REFERS
UTS JOB-REFERS
UTS CON_IN-REFERS
UTS CON_OUT-REFERS
UTS LO
UTS
ATX ASTIMER
;
;        ШKAЛY ПAMЯTИ - HA CBOE MECTO
;
1 VTM 15
MOVSCM:1 XTA TEMPO
1 ATX SC_MEM
:JAEQ *+3
2 JMNE *+2
1 MTJ 2
2 MSFT -6
:UTA
1 ATX TEMPO
:1 VRM MOVSCM
2 UTA 64
ATX QPAGE ; ЧИСЛО ЛИСТОВ
2 UTA 63
ATX RES_PAGE ; РЕЗЕРВ
JMP ITPR
;
NOMEM:2 CLRF ; ЛИCTA HET !
UTA NOMEM
WMOD PAПY ; ПOДЗAKAЗ
JMP ELZPAG
;
;        HAЧAЛЬHAЯ TAБЛИЦA ПPИOPИTETOB ПPOЦECCOB :
;        (Y ПEPBЫX QCPU ПPOЦECCOB OHИ HYЛEBЫE !)
;
ITPR:UTA
1 VTM QPROC-QCPU-1
:A+U @10000
1 ATX TABPRT+QCPU
1 VRM *-1
1 VTM LAST_SYS-N_WINDOW
:1 XTA TABPRT+N_WINDOW
AON 64-51 ; KЛACC = 4
1 ATX TABPRT+N_WINDOW
1 VRM *-1
;
;        ПPИBЯЗKA ЖДYЩИX TECTOB K ПPOЦECCOPAM :
;
1 VTM QCPU-1
:1 UTA 1
1 ATB NCPU+N_WAIT
UTA 1
1 ATB NGROUP+N_WAIT
1 VRM *-2
;
;       ИHИЦИAЛИЗAЦИЯ YПPABЛЯЮЩИX CЛOB :
;
15 VTM PCW
1 VTM QCPU-1
NTA IF_ABS
:15 ATX ; ПPOЦECCOPЫ
1 VRM *
RMOD IF_DISP>>10 + @400
AAU @7FC00
A+U @200
AON P_SYST
AON B_BRAN
1 VTM LAST_SYS-N_WAIT
:15 ATX
A+U 64
1 VRM *-1
;
;         ИHИЦИAЛИЗAЦИЯ PAБOЧИX OБЛACTEЙ ИП ДИCПETЧEPA
;
1 VTM LAST_SYS-N_WAIT
IFINIT:1 XTA PCW+QCPU
AAU @3FF
A+U IF_DISP
ATI 2
UTA -1
2 ATX 1 ; TAЙMEP
2 UTA 32
AAX =H0000 0000 FFFF FFFF
2 ATX 2 ; PAПY
2 UTA 4
ASFT -32
2 AOX 2
2 ATX 2 ; SPRADR
2 UTA 32-6
ASFT -32
2 ATX 16+7 ; И15
NTA 32-PД
AON 32-POA
14 VTMB TEGS
1 J+M 14
14 AOB ; + TEГ PEЗ-TA
2 ATX 16+9 ; PP,PPP
1 XTA ADR
2 ATX 16+8 ; CЧAC
1 VRM IFINIT
JMP IFINIT1
;
ADR:15 REF WAITTEST
:15 REF WAITTEST
;     ECЛИ QCPU>2 - ДOБABИTЬ ЗДECЬ ЖДYЩИX TECTOB !!!
:15 REF NEW_PRT
:15 REF SWING
:15 REF D_DRIVER
:15 REF TTANAL
;
A2S:15 REF RETSTEC
15 REF SAVREG+16
;
;
;        ИHИЦИAЛИЗAЦИЯ OБЩEЙ ЧACTИ  IF_DISP:
;
IFINIT1:
TN ПPИП
XTA =HFFFF FFFF 0000 0000
ATX IFTIMER
XTA A2S
ATX ASTEC
XTA =H7FFF FFFF 0000 0000
ATX KVANT
UTA ERRMACRO
1 VTM 63
:1 ATH VECTOR<<1
1 VRM *
UTA @FFF00
1 VTM -5
:1 ATX TQUE+5
A+U 1
1 VLM *-1
;
;      HAЧ.COCT.  TMP,TPP  COOTBETCTBYЮT ПPИПИCKE
;
1 VTM @3FF
INITMP:1 RMOD @400
ASFT 8
ASFT -2
1 ATQ DTMP<<2
ASFT 4
ATI W
A-L QPAGE
JAGE EINITMP
1 RMOD @400
AAU @300
ATI NP
ITA 1
ASFT -16
NP AOU @FF
W ATH TPP<<1
EINITMP:1 VRM INITMP
;     HEPEЗИДEHTЫ + LOADLIST + ЭKCTPAKOДЫ БЭCM + TECT
UTA 8
NP VTM NONRSDNT>>10 & @3FF
1 VTM WMSP-NONRSDNT>>10 -1
:NP ATQ DTMP<<2
NP UTM 1
1 VRM *-1
;        PAБOЧИE ЛИCTЫ CИCTEMHЫX ПPOЦECCOB
UTA @F ; OHИ ЛИЧHЫE!
1 VTM LAST_SYS
NP VTM WSPAG
:NP ATQ DTMP<<2
NP UTM 1
1 VRM *-1
;
;          HAЧAЛЬHOE COCTOЯHИE OЧEPEДИ ГOTOBЫX ПPOЦECCOB
;
UTA N_WAIT
ATB RDQUE
NP VTM N_SWING+1
RDQ0:NP UTM -1
NP XTA PCW
AON READY_
NP ATX PCW
I VTM
RR VTM RDQ0
ITA NP
AEU N_WAIT
JANE SETQ
;
;             ПEPEПИCЬ TAБЛИЦ KOДИPOBOK :
;
1 VTM 95
:1 XTA CTABLES
UTY 8 ; ЗAПPET ЗAПИCИ
1 ATX CODE
1 VRM *-1
;
;             ATPИБYTЫ CПEЦ-ФAЙЛOB :
;
1 VTM 7
:1 XTA SF_ATR
1 ATX SFATR
1 VRM *-1
;
;             GET DATE AND TIME FROM IBM/PC
;             RETURN  IBM/PC  HANDLES 6-11 :
;
1 VTMF HNDLSC1
XTA =H0102 0000 0000 0000
AOU TEMPO-MAIN_SW
ATX JOB
XTA =H0084 0006 0000 0000
ATX JOB+1
UTA
ATX PP_MASK
ATB QUE<<3 +2
XTA =Z"CLOCK$"
ATX TEMPO
XTA MAIN_SW+@1A
ATX OLDVECT
XTA NEWVECT
UTY 9
TTX MAIN_SW+@1A
CPUSH
UTA 1
13 VJM TODIS
UTA 3
13 VJM TODIS
BTA JOB<<3 +2
A+I 1 ; ЭTOT ФAЙЛ
ATI 13 ; TOЖE OTMETИM
13 SETF ; B HNDLSC !
13 VTMB TEMPO
13 BTA 4
ATI 3 ; CEKYHДЫ
13 BTA 1
ASFT -8
13 AOB ; ДEHЬ
A+U 18993
A*U 24
ATI 14
13 BTA 3 ; ЧACЫ
A+I 14
A*U 60
ATI 14
13 BTA 2 ; MИHYTЫ
A+I 14
A*U 60
A+I 3
A*L =1000000
ATX TIMESTD
AEU -1 ; ПOЛH.ВРЕМЯ
ATX CLOCK ; (B MKCEK.)
UTA
ATX TEMPO
;
2 VTM 255
13 VTM ERHAND
RHAND:2 UTC
1 FTA
13 JAEQ
2 UTC
1 CLRF ; - ГAШEHИE
ITA 2
ATB JOB<<3 +2
UTA
;
TODIS:ATB JOB<<3 +8 ; KOП
UTA @80
ATB JOB<<3 +3 ; READY
UTA
WMOD @1802
14 VTM
UTA 1
ATB HEADS<<3 +2
:14 XTA JOB
14 AAN 64-39
14 JAEQ *-1
14 UTA
14 ATB HEADS<<3 +2
14 WMOD @1802
14 ATX PPINF
13 JMP
OLDVECT:ATX
NEWVECT:UTA
JMP *+1
:WMOD @1802
CPUSH
IJP
;
ERHAND:2 VRM RHAND
XTA OLDVECT
UTY 9
TTX MAIN_SW+@1A
UTA 3
ATB QUE<<3 +2
UTA @E
ATX PP_MASK
CPUSH
;
;
;   CTPYKTYPA CПИCKOB ПPИOPИTETOB ФИЗ.ЛИCTOB:
;
;           1000:13FF   1400:17FF
;            OЗYПC-0     OЗYПC-1
;         :-----------:-----------:
;       0 : MINP( L ) : MAXP( F ) :
;         :-----------:-----------:
;       1 : NC  ( 0 ) :     0     :
;         :-----------:-----------:
;         :     0  .......  0     :
;         :-----------:-----------:
;       F :     0     :    F+1    :
;         :-----------:-----------:
;      F+1:     F     :    F+2    :
;         :-----------:-----------:
;      F+2:    F+1    :    F+3    :
;         :-----------:-----------
;                ...........
;         :-----------:-----------:
;      L-1:    L-2    :     L     :
;         :-----------:-----------:
;       L :    L-1    :     0     :
;         :-----------:-----------:
;   ЗДECЬ  F - HOMEP ПEPBOГO CBOБOДHOГO ФИЗ.ЛИCTA,
;          L - HOMEP ПOCЛEДHEГO CYЩECTBYЮЩEГO ФИЗ.ЛИCTA
;              ПPOЧИE CЛOBA OЗYПC ЗAПOЛHEHЫ HYЛЯMИ.
;
;
;         ИHИЦИAЛИЗAЦИЯ TAБЛИЦ ФИЗ.ПAMЯTИ
;         ЛИCTЫ, ЗAHЯTЫE PEЗИДEHTOM, ИЗЫMAЮTCЯ ИЗ ШKAЛЫ
;
READYMEM:
14 VTMF SC_MEM
1 VTM NONRSDNT-MAIN_SW>>10 -1
:1 UTC
14 CLRF
1 VRM *-1
1 VTM VOL_V -1
:1 UTC VOL_C
14 CLRF
1 VRM *-1
14 CLRF PP_LIST
14 CLRF PP_LIST+1
WTC QPAGE
5 VTM -1
2 VTM
3 VTM
;
LPAG:14 FTA
JANE FREE
3 HTA TPP<<1
:AON 64-15 ; - ФИKCAЦИЯ
CP JMEQ *+3 ; БЫЛ "0"
3 AEH TPP<<1
JAEQ ELPAG ; HE ИЗM.
3 HTA TPP<<1
HLT 1 ;
:3 ATH TPP<<1
JMP ELPAG
;
FREE:ITA 1
ASFT -10
2 WMOD @1000 ; LOW
UTA
3 ATH TPP<<1
ITA 3
ASFT -10
2 WMOD @1400 ; HIGH
2 MTJ 1
3 MTJ 2
ELPAG:3 UTM 1
14 UTM 1
5 VRM LPAG
ITA 1
ASFT -10
2 WMOD @1000
ITA 2
ASFT -10
WMOD @1000 ; MINP
UTA
2 WMOD @1400
WMOD PAПY
;
CPUSH
TN ПPИП
15 VTM BUF
XTA ="'@0A''@0D'OC ДYБ"
XTS ="HA  OT  "
XTS OSDATE
ITS CP
ASFT -16
AOX =". ЦП-0. "
XTS ="CEГOДHЯ "
UTS -1
RR VJM WEEKDAY
UTS -1
RR VJM DATE
UTS -1
RR VJM TIME
ASFT 8
AAU @F0000
AOX =" '0''0''0''0''0''@0A''@0D'"
UTS
15 ATX
I VTM BUF
J VTM
RR VJM KOHCOЛЬ
UTA 6 ; YXOД B "ЖДY"
PINT
;
TEMPO:ATX ; 16*24 = 1024
ATX
:ATX
ATX
:ATX
ATX
:ATX
ATX
:ATX
ATX
:ATX
ATX
:ATX
ATX
:ATX
ATX
:ATX ; 9
ATX
:ATX
ATX
:ATX
ATX
:ATX
ATX
:ATX
ATX
:ATX
ATX
:ATX
ATX
:ATX
ATX
:ATX
ATX
HNDLSC1:ATX ; 4*64 = 256
ATX
:ATX
ATX
:ATX
ATX
:ATX
ATX
;
END
INTERTAG:NAME QF ; TEГOBCKИE ПPEPЫBAHИЯ
INT10:ENTRY QF
INT11:ENTRY QF
INT12:ENTRY QF
INT13:ENTRY QF
INT19:ENTRY QF
INT20:ENTRY QF
INT21:ENTRY QF
INT22:ENTRY QF
INT23:ENTRY QF
ERROR:SUBP QF
;
GROUP
MODIF
;
IFP
ДД89
;
CMD
;
;                   ПPEPЫBAHИЯ ПPИ ЗAПИCИ B OЗY:
;                   ============================
;
;     21 - ЗAЩИTA AДPECA ПPИ ЗAПИCИ.
;          BOЗHИKAET ПPИ "0" БПTЗ, ECЛИ ПPИ ЗAПИCИ B
;          ПAMЯTЬ CЛOBO ПO ИCП.AДPECY COДEPЖИT "1" B
;          68 PAЗPЯДE TEГA. (CИГHAЛ PWRI ШИHЫ ДAHHЫX).
;
;MOZY=809C2         ;   - INTERTAG
;
INT21:W VTM 1
JMP PROTECT
;
;                  ПPEPЫBAHИЯ ПO TEГY:
;                  ===================
;
;    10 - ПPOГPAMMHAЯ ИHTEPПPETAЦИЯ TEГA KOMAHДЫ.
;         ПPOИCXOДИT BO BPEMЯ BЫБOPKИ KOMAHДHOГO CЛOBA
;         ИЗ OЗY ПPИ "0" БПИHT И "1" 72 PAЗPЯДA TEГA.
;
INT10:RI MTJ IA ; CЧAC => ИAOП
JMP ERROR
;
;    11 - ПPOГPAMMHAЯ ИHTEPПPETAЦИЯ TEГA OПEPAHДA.
;         ПPOИCXOДИT BO BPEMЯ BЫБOPKИ OПEPAHДA ИЗ OЗY
;         ПPИ "0" БПИHT И "1" 72 PAЗPЯДA TEГA OПEPAHДA
INT11:JMP ERROR
;
;    22 - ЧYЖOЙ CYMMATOP.  BOЗHИKAET B OTCYTCTBИE БЧC
;         ПPИ HECOBПAДEHИИ 66 БИTA TEГA TEKYЩEГO KOMA-
;         HДHOГO CЛOBA C ПPИЗHAKOM "PЭ" B  PP.
;
INT22:JMP ERROR
;
;    23 - ЧYЖOЙ OПEPAHД. BOЗHИKAET B OTCYTCTBИE БЧOП
;         ПPИ HECOBПAДEHИИ 66 БИTA TEГA OПEPAHДA C
;         ПPИЗHAKOM "PЭ" B  PP.
;
INT23:JMP ERROR
;
;    12 - ЗAЩИTA AДPECA ПPИ ЧTEHИИ.
;
INT12:W VTM 2
JMP PROTECT
;
;    13 - KOHTPOЛЬ KOMAHДЫ.
;
INT13:JMP ERROR
;
;    19 - ЗAЩИTA BЫБOPKИ KOMAHДЫ.
;
INT19:W VTM 0
RI MTJ IA ; CЧAC ===> ИAOП
;
PROTECT:XTA REGSCAL
JAGE ERROR
AAN 64-61
JAEQ CHM67
W JMNE CHM67
;
;         ДЛЯ ПPOГPAMM, ЗAHИMAЮЩИXCЯ CAMOMOДИФИKAЦИEЙ
;         ДEЛAETCЯ ЗAMEHA KOMAHДЫ "000" HA "075".
;
SETR БЗO+БЗЗ+БПTЗ+БПTЧ+БПИHT
IA XTA
AAX =H0000 0000 BF00 0000
:JANE *+2
IA XTA
AOX =H0000 0000 3D00 0000
IA ATX
:IA XTA
AAX =H00BF 0000 0000 0000
:JANE *+1
UTC =H003D 0000 0000 0000
:XTA
IA AOX
UTY 3
IA TTX
CPUSH
IJP
;
;         ПPOЦECC БЫЛ B "PЭ".  ПPOБA HA ЭKCTPAKOД-67
;
CHM67:
ITA IA ; TKHYЛИCЬ B
W AEX OCT67 ; ЗAЩИTY Э67
JANE ERROR ; - HET
XTA RETM67
JAEQ ERROR
JAGT NOPR67
;         ЗДECЬ - OPГAHИЗAЦИЯ ПEЧATИ
HLT @67
;
NOPR67:XTA RETM67
NG WMOD CЧAC
NG XTA PP
AAX =H0000 0000 E7FF FFFF
NG WMOD PP ; ПИA,ППK = 0
IJP
;
;    20 - ЗAЩИTA ПEPEДAЧИ YПPABЛEHИЯ.
;
INT20:JMP ERROR
;
END
INTERMEM:NAME QF ; CБOИ ПAMЯTИ
;
ERROR:SUBP QF
GROUP
MODIF
CMD
;
;         ПPEPЫBAHИЯ ПPИ OБPAЩEHИИ K OЗY И ШИHE ДAHHЫX
;         ============================================
;
;     2 - MHOГOKPATHAЯ OШИБKA. (CИГHAЛ DERI ШИHЫ).
;     1 - OTCYTCTBYЮЩИЙ БЛOK ПAMЯTИ. (CИГHAЛ AMBI).
;     3 - "TIME-OUT" ПPИ OБPAЩEHИИ K OЗY.
;         BЫPAБATЫBAETCЯ ПPИ OTCYTCTBИИ OTBETA OЗY
;         B TEЧEHИE 100 MИKPOCEKYHД.
;     4 - "TIME-OUT" ПPИ OБPAЩEHИИ K ШИHE.
;         BЫPAБATЫBAETCЯ APБИTPOM ПPИ OTCYTCTBИИ OTBE-
;         TA OT ШИHЫ B TEЧEHИE 100 MИKPOCEKYHД.
;
;     PEГИCTP "PAПY" 0-Й ГPYППЫ ИCПOЛЬЗYETCЯ KAK AДPEC
;     ПEPEXBATA ПPEPЫBAHИЙ ПO OШИБKAM ПAMЯTИ.
;
;MOZY=80981        ;  - INTERMEM
;
:RMOD PAПY
JAEQ ERROR
NG WMOD CЧAC ; AДP.ПEPEXBATA
NG RMOD PP
AAX =H0000 0000 C7FF FFFF
NG WMOD PP ; ГAШ. ПИA,ППK,ППY
UTA ; OTMEHA CЛEД.
WMOD PAПY ; ПEPEXBATA
IJP
;
END
INTERPAG:NAME QF ; CTPAHИЧHЫE ПPEPЫBAHИЯ
FIX_PAGE:ENTRY QF ; ФИKCAЦИЯ ЛИCTA
GIV_PAGE:ENTRY QF ; ЗAЯBKA K SWING
INT8:ENTRY QF
INT15:ENTRY QF
INT16:ENTRY QF
ERROR:ENTRY QF
;
PCW
MAINBLCS:SUBP QF
ACTIVATE:SUBP QF
DESACTIV:SUBP QF
RETURN:SUBP QF
BRANCH1:SUBP QF
KOHCOЛЬ:SUBP QF
DHEX8:SUBP QF
IFP
TPP
PCBIT
PSYS
SPORT
GROUP
EVENT
MODIF
;
CMD
;
;
;                 ПPEPЫBAHИЯ ПO ПPИПИCKE:
;                 =======================
;
;    15 - ЧYЖOЙ PEГИCTP ПPИПИCKИ ПPИ ЧTEHИИ/ЗAПИCИ.
;         BOЗHИKAET ПPИ HECOBПAДEHИИ ПOЛЯ HOMEPA
;         ПPOЦECCA B PEГИCTPE ПPИПИCKИ C HOMEPOM
;         TEKYЩEГO ПPOЦECCA. (ПPИ ПHП=255 CTPAHИЦA
;         ДOCTYПHA BCEM ПPOЦECCAM).
;
;    16 - ЧYЖOЙ PEГИCTP ПPИПИCKИ ПPИ BЫБOPKE KOMAHД.
;         AHAЛOГИЧHO ПPEДЫДYЩEMY.
;
;MOZY=80988     ;   - INTERPAG
;
INT16:RI MTJ IA ; CЧAC => ИAOП
INT15:
SMON БBП
ITA IA
ASFT 10
AAU @3FF
ATI NP ; MAT.ЛИCT
NP QTA TMP<<2
JAEQ ERROR ; ЧYЖOЙ ЛИCT
ATI W
W MSFT 2
AAU 3
JANE PRIVATE
;       ДOCTOBEPHAЯ ИHФOPMAЦИЯ O ПPИПИCKE
;       OБЩИX CTPAHИЦ XPAHИTCЯ B  DTMP !!!
NP QTA DTMP<<2
JAEQ ERROR ; ЧYЖOЙ ЛИCT
ASFT 2
AEI W ; ATPИБYTЫ
AAU @FFFFC ; ЗAЩИTЫ
AEI W ; БEPYTCЯ
ATI W ; ИЗ  TMP !!!
;
PRIVATE:W MTJ J
J MSFT 2
J JMEQ GIV_PAGE
;
;        ЛИCT B ПAMЯTИ.  ЛИБO OH ЗAKPЫT ПO OБMEHY,
;        ЛИБO ПPOCTO Y HAC ЗAБИPAЛИ PEГИCTP ПPИПИCKИ.
;
J HTA TPP<<1
AAU @8000
JAEQ RESTRP
NTA W_EXCH ; ЗAKPЫTИE
TN AOX PCW ; "ПO OБMEHY"
TN ATX PCW
JMP DESACTIV
;
RESTRP:
W MSFT -8
TN J+M W
ITA W
NP WMOD @400
CMON -1
IJP
;
;      BXOД OT ПPEPЫBAHИЙ: OБPAЩEHИE K ПOДKAЧKE.
;      TN - HOMEP ПPOЦECCA, NP - MAT.HOMEP ЛИCTA,
;      BOЗMOЖHO YKPAШEHHЫЙ  FIX- ИЛИ PUSH-БИTAMИ.
;      BHИMAHИE: ПPИ BXOДE OT ЮЗEPA ЧEPEЗ ПPOГPAMMHOE
;      ПPEPЫBAHИE-10 BOЗMOЖEH OTЛYП ПO ЗAHЯTOCTИ
;      ПOДKAЧKИ. TOГДA ЮЗEP ПOЛYЧAET HA CYMMATOPE 0.
;
GIV_PAGE:XTA SWPORT
JAEQ FREE_SW
R VTM MAINBLCS
ITA NP ; OБЫЧHAЯ
AAU @FF000 ; ПOДKAЧKA
JAEQ BL_USER ; -ДA
UTA
NG WMOD ACC ; ЮЗEPY-OTЛYП
NG WMOD ACC+1
JMP RETURN
FREE_SW:ITA TN
ASFT -32
ITS NP
AAX =H0000 0000 FFFF FFFF
15 AOX
ATX SWPORT
NP VTM N_SWING
R VTM ACTIVATE
BL_USER:NTA BL_SEL
TN AOX PCW
TN ATX PCW
R JMP
;
;      BXOД OT ИMEHИ ЮЗEPA: ДEPГAHЬE ЛИCTA И
;      ФИKCAЦИЯ EГO B "TPP" ИЛИ ЗAKPЫTИE ПO OБMEHY.
;        TN - HOMEP ПPOЦECCA
;        NP - MATEMATИЧECKИЙ HOMEP ЛИCTA
;        IA=0, ECЛИ ЗAKPЫTИE.  IA=1, ECЛИ ФИKCAЦИЯ.
;        IA=-1, ECЛИ OTKAЗ OT ЛИCTA.
;        HA BЫXOДE  W=<ФИЗ.HOMEP ЛИCTA>
;
ДEPГAEM:ITA NP
ASFT -10
EXTF 64-20
ATI W
CMON БBП
W XTA @3FF
;
FIX_PAGE:
SMON БBП+БПTЧ+БПИHT
CLRR БЗO+БПHП
NP QTA TMP<<2
ATI W
JAEQ PHYSPAG ; HE ЗAKAЗAH
:AAU 3
JANE PHYSPAG ; ЛИЧHЫЙ ЛИCT
NP QTA DTMP<<2
ATI W ; OБЩИЙ
PHYSPAG:W MSN @400+4
IA JMGE CHFIX
W HTA TPP<<1 ; ПEPEД OTKAЗOM
AAN 64-16 ; HAДO ЖДATЬ
JANE ДEPГAEM ; KOHЦA OБMEHA
NP ATQ TMP<<2
W JMEQ RETFIX ; HE ПPИПИCAH
W HTA TPP<<1
AEI TN
AAU @FF
:JANE *+1
W ATH TPP<<1
:QTA PCNT<<2 +3
A-U 1
ATQ PCNT<<2 +3
JMP RETFIX
;
CHFIX:W JMEQ ДEPГAEM
W HTA TPP<<1
IA AON 64-16 ; + БИT 16 ИЛИ 15
W ATH TPP<<1
;
RETFIX:IA JMGT RET1FIX
NP RMOD @400
AEI TN
AAU @FF
:JANE *+1
NP WMOD @400 ; ГACИM PП
RET1FIX:
CMON БBП+БПTЧ+БПИHT
RETS
;
;       BCЯ CTPAHИЧHAЯ ЗAЩИTA B CИCTEME BEДETCЯ
;       ПO HOMEPY ПPOЦECCA B PEГИCTPAX ПPИПИCKИ.
;       ФAKT ПEPBOГO OБPAЩEHИЯ K CTPAHИЦE PEГИCTPИ-
;       PYETCЯ SWING-OM ПO ЗHAЧEHИЮ ATPИБYTA PR=1
;       (ЗAПИCЬ - PAЗPEШEHA, A ЧTEHИE - HET).
;       TAK ЧTO BCE OCTAЛЬHЫE CTPAHИЧHЫE ПPEPЫBAHИЯ
;       BOЗHИKAЮT B CЛYЧAE OШИБOK.  ПPИ OШИБKAX
;       OPГAHИЗYETCЯ ПPИHYДИTEЛЬHOE BETBЛEHИE.
;
;    17 - ЗAЩИTA CTPAHИЦЫ ПPИ OБPAЩEHИИ. BOЗHИKAET
;         B OTCYTCTBИE БП И БЗO, ECЛИ OПEPAHД KOMAHДЫ
;         ЧTEHИЯ/ЗAПИCИ HAXOДИTCЯ B ЗAЩИЩEHHOЙ CTPAHИ-
;         ЦE ("0" 10-ГO PAЗPЯДA COOTB. PП).    ПPИ
;         BЫБOPKE KOMAHДЫ ЭTOГO ПPEPЫBAHИЯ HE БЫBAET.
;
;    18 - ЗAЩИTA CTPAHИЦЫ ПPИ ЗAПИCИ.  BOЗHИKAET B
;         OTCYTCTBИE БП И БЗЗ И "0" 9-ГO PAЗPЯДA PП.
;
;     8 - OTPИЦATEЛЬHЫЙ HOMEP CTPAHИЦЫ Y KOMAHДЫ.
;         БЛOKИPYETCЯ ПPИЗHAKAMИ БП ИЛИ POA.
;
INT8:RI MTJ IA ; CЧAC => ИAOП
JMP ERROR
;
;     9 - OTPИЦATEЛЬHЫЙ HOMEP CTPAHИЦЫ Y OПEPAHДA.
;
;     7 - OTCYTCTBYЮЩИЙ AДPEC ПAMЯTИ. BOЗHИKAET TOЛЬKO
;         B HOBOM PEЖИME ПPИ HECOBПAДEHИИ 21-32  И 20
;         PAЗPЯДOB MATEMATИЧECKOГO (ИЛИ ФИЗИЧECKOГO,
;         ECЛИ БП) AДPECA OПEPAHДA.
;
; ****   BXOД OT ПPEPЫBAHИЙ: ФATAЛЬHAЯ OШИБKA
;
ERROR:
ITA IA ; И A O П.
ASFT -32
AOI I ; + HOM.OШИБKИ
ATX INFERR
IA VTM E_FAT
TN XTA PCW
AAN P_SYST
JAEQ BRANCH1
I HLT
JMP BRANCH1
;
END
INTERTIM:NAME QF
;*
;*      OБPAБOTKA ПPEPЫBAHИЯ: "ЛOПHYЛ CB-TAЙMEP"
;*
:HLT 63
IJP
END
STEPINT:NAME QF
;*
;***      29 -  ШAГOBOE ПPEPЫBAHИE
;*
:HLT 29
IJP ;
END
EXTINTER:NAME QF
PAUSE:ENTRY QF
DELPAUSE:ENTRY QF
;
PROGINT:SUBP QF
INTERTIM:SUBP QF
ACTIVATE:SUBP QF
DESACTIV:SUBP QF
RETURN:SUBP QF
ИЗOЧEP:SUBP QF
PCW
PCBIT
PSYS
SPORT
;
MODIF
;
MIR:EQU @1802 ; Г P П
OБMOЧ
ATQUE:LCB LTQ,ATQ(2)
CDEF
;
CMD
;
;    27 - BHEШHИE ПPEPЫBAHИЯ.
;
;MOZY=8090F      ;   - EXTINTER
;
RMOD MIR
AAX WELL_INT
15 ATX
ANU -1
STI I
I AEN
WMOD MIR ; ГAШEHИE "1"
CPUSH
I NTA
APX WELL_INT
ANU -1
ATI R
SMON БBП+БПTЧ
R JMP *+2
:JMP RETURN ; BAD INT
;
:JMP PROGINT
;
:JMP INTERTIM
;
:I VTM ; ЛOПHYЛ TAЙMEP
JMP ASTIMINT ; ACTP.BPEMEHИ
;
:I VTM 4
JMP BHИMAHИE ; ЗAПPOCЫ OT ПП
:I VTM 3
JMP BHИMAHИE
:I VTM 2
JMP BHИMAHИE
;
ASTIMINT:XTA ATQ
AAU @FF
ATI NP
JAEQ RETURN
;
DEL2:I XTA ATQ+1
I ATX ATQ
I UTM 1
JANE DEL2
XTA LTQ
A-U 1
ATX LTQ
NP XTA PCW
AEN W_AST
NP ATX PCW
XTA ATQ
ATX ASTIMER
A-L CLOCK
JALT ACTIVATE
XTA CLOCK
A-U @100
ATX ASTIMER
JMP ACTIVATE
;
PAUSE:L-A CLOCK
AAU @FFF00
AOI TN
XTS LTQ
ATI I
A+U 1
ATX LTQ
TN XTA PCW
AON W_AST
TN ATX PCW
;
ATSORT:I XTA ATQ
I ATX ATQ+1
15 A-L -1
JALE ATSET
I VRM ATSORT
I VTM -1
;
ATSET:15 XTA
I ATX ATQ+1
XTA ATQ
ATX ASTIMER
JMP DESACTIV
;
DELPAUSE:WTC LTQ
I VTM
DEL1:I XTA ATQ
AEI NP
AAU @FF
JAEQ DEL2
I VRM DEL1
JMP RETURN
;
;           ЗAПPOC OT ПYЛЬTOBOГO ПPOЦECCOPA
;
BHИMAHИE:
RMOD MIR ; ДO BЫЯCHEHИЯ
AAU @FFFF1 ; ГACИM BCE
WMOD MIR ; 3 БИTA
;
XTA PPINF
ASFT 8
JANE NONINPUT
ATX PPINF
NP VTM N_TTAN ; BBOД C
JMP ACTIVATE ; KOHCOЛИ
;
NONINPUT:ATI J ; HOM.ЗAЯBKИ
ASFT -1
ATI W
W XTA JOB-2
W AEX DUBJOB-2
AAX =HFFFF 0000 FFFF FFFF
JANE DPMERR
W XTA JOB-1
W AEX DUBJOB-1
AAX =HFFFF 0000 FFFF FFFF
JANE DPMERR
J UTC -1
J XTA JOB-1
ASFT 48
AAU @FF
ATI CP ; KAHAЛ OБMEHA
A-U 2
CP JALT CHAN01
CP NTA
AOX DDPORT
ATX DDPORT
NP VTM N_DRIV
JMP ACTIVATE
;
CHAN01:R VTM RETURN ; BЫBOД
JMP ИЗOЧEP ; HA KOHCOЛЬ
:J UTC -1
J XTA JOB-1 ; Э071
ASFT 56
ATI NP
NP XTA PCW
AON W_TERM ; "KOHEЦ OБMEHA"
AEN W_TERM
AON IF_FIX ; PACФИKCAЦИЯ
AEN IF_FIX ;   И П
NP ATX PCW
OP_USER:R VTM ACTIVATE
JMP ИЗOЧEP
;
DPMERR:W XTA DUBJOB-2
W HLT
W ATX JOB-2
W XTA DUBJOB-1
W ATX JOB-1
UTA
ATX PPINF
JMP RETURN
END
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
;
CONST
C1:HEX 8028 0000 0000 0000
C10:HEX 810A 0000 0000 0000
ZERO:HEX 8640 0000 0000 0000
LETTERS:HEX 0
:HEX 7FFF FFE1 7FFF FFE0
:HEX FFFF FFFF FFFF 0000
:HEX 0000 0000 FFFF C000
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
:JMP BAD_EXTR
;
:IA VTM 2
JMP INITSTR ; 7 - INITUNP
:T VTM GETCHAR
JMP SETI ; 8 - GET CHAR
:T VTM GETIDENT
JMP SETI ; 9 - GET IDENT
:T VTM GETFILE
JMP SETI ; A - GET FILENAME
:T VTM GETHEX
JMP SETI ; B - GET HEXCODE
:B VTM PACKTIME
JMP TIMDAT ; C - GET "TIME"
:B VTM PACKDATE
JMP TIMDAT ; D - GET "DATE"
:T VTM GETNUM
JMP SETI ; E - GET NUMBER
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
;    2-5 : ЭКСТРАКОДЫ ДЛЯ СБОРКИ ТЕКСТОВОЙ СТРОКИ.
;    ПАРАМЕТРЫ - НА СУMMАТОРЕ И  В   Р М Р :
;                :---------:---------:
;      СУММАТОР  :     B   :     N   :
;                :---------:---------:
;       Р М Р    :     M   :     A   :
;                :---------:---------:
;
;    B  -  ЗАДАЕТ РЕЖИМЫ РАБОТЫ СБОРЩИКА СТРОКИ
;      32 РАЗРЯД - НОРМАЛИЗАЦИЯ ФРАГМЕНТА ВЛЕВО
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
;       ПОСЛЕ КАЖДЫХ М ЦИФР.
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
N MSFT -4
N ASN @400
N MSFT 4
N UTM 15
M MTJ B
PH2:
ASFT -4
15 ATX
YTA
A-U 10
:JALT *+1
A+U 7
:A+U 10+@30
T STB
B UTM -1
B JMNE PH3
UTS BL
T UTM 1
T STB
M MTJ B
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
XTA C10
:A/X C10
C VRM *
15 ATX 1
15 X-A -1
UIA EXNEG
XTA C1
:A*X C10
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
A*X C10
15 ATX -1
A-X C1
UIA EXNEG
JMP EXEX
;
;      POZITIV EXPONENT
;
EXPOZ:E UTM 1
15 XTA -1
A/X C10
15 ATX -1
A-X C10
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
;---------------------------------------------------
;      7-F : ЭКСТРАКОДЫ ДЛЯ ИЗВЛЕЧЕНИЯ ФРАГМЕНТОВ
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
SETI:ATI A
S VTMF LETTERS
WTC DIN
I VTM
T MTJ D
T MTJ L
L UTM 1
R VTM BLEFT
;
;     BЫБOPKA ИЗ BXOДHOЙ CTPOKИ OЧEPEДHOГO CИMBOЛA
;     НА РЕГИСТР С.  ВЫХОД ПО D(ЦИФРА), L(БУКВА),
;     R(РАЗДЕЛИТЕЛЬ).
CHAR:I BTA
ATI C
:JAEQ *+1 ; END STRING
I UTM 1
:A-U @30
R JALT ;
A-U 9
D JALE ;
S UTC
C FTA
L JANE ;
R JMP
BLEFT:ITA C
AEU BL
JAEQ CHAR ; LEFT BLANKS
T JMP 2
;
;
;   8 - ВЫБОРКА ОДИНОЧНОГО СИМВОЛА В ПОЛЕ С.
;       ПОЛЕ Т = 0(РАЗДЕЛИТЕЛЬ), 1(ЦИФРА), 2(БУКВА)
;
GETCHAR:T VTM 1
JMP OKRET
:T VTM 2
JMP OKRET
:T VTM 0
JMP OKRET
;
;
;  9 - ВЫБОРКА ИДЕНТИФИКАТОРА, ДОПОЛНЕНИЕ ПРОБЕЛАМИ
;      ДО ГРАНИЦЫ СЛОВА.  Т = <ДЛИНА ИДЕНТИФИКАТОРА>
;
GETIDENT:JMP ERROR ; 1-ST DIGIT !
:A MSN @400-3
JMP GID1
:JMP ERROR
GID1:L VTM GID2
D VTM GID2
GID2:ITA C
A ATB
A UTM 1
R VJM CHAR
ITA I
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
;   A - ВЫБОРКА СПЕЦИФИКАЦИИ ФАЙЛА, ПРИСОЕДИНЕНИЕ
;       K PATHNAME, ДОПОЛНЕНИЕ "0" ДО КРАЯ СЛОВА.
;       ВХОДНОЙ СУММАТОР НЕСУЩЕСТВЕН.  НА ВЫХОДЕ
;       Т = РАСШИРЕНИЕ ИМЕНИ ФАЙЛА.
;
GETFILE:JMP ERROR ; 1-ST DIGIT!
:A VTMB PATHNAME
JMP GF2
:ITA C
AEU @5C ; "\"
JANE ERROR
A VTM PATHNAME<<3 +2 ; ROOT DIR
;
GF1:L VTM GF12
D VTM GF12
GF12:ITA C
A ATB
A UTM 1
R VJM CHAR
ITA C
AEU @5C ; "\"
JAEQ GF1
AEU @72 ; "."
JAEQ GF1
R VTM -3
:ASN @400-8
R UTC -1
A AOB
R VLM *-1
ATI T
UTA
A ATB
A VLM SETTAIL
;
GF2:I BTA ; 2-ND CHAR
AEU @3A ; ":"
JAEQ GF1 ; FULL PATH
A MTJ B
GF3:B BTA
JAEQ GF1
B UTM 1
AEU @5C ; "\"
JANE GF3
B MTJ A
JMP GF3
;
;
;   B - ВЫБОРКА 16-РИЧНОГО ЧИСЛА. ДОПУСКАЕТСЯ
;       ПРЕФИКС "@" И ВНУТРЕННИЕ ПРОБЕЛЫ.
;       НА ВЫХОДЕ  Т = ЧИСЛО ПРИНЯТЫХ ЦИФР.
;
GETHEX:C UTM -@30 -15
JMP GH1
:C UTM -@46 ; "F"
C JMLE GH1
:ITA C
AEU @40 ; "@"
JAEQ CHAR
JMP ERROR
;
GH1:C UTA 15
A ATX
L VTM GH2
D VTM GH3
T VTM -15
R VJM CHAR
ITA C
AEU BL
JAEQ CHAR
T UTM 15
;
OKRET:ITA I
ATH DIN<<1 +1
E VTM
MPAC E
RET
;
GH3:C UTM -@46
C JMGT ERROR
C UTM @30+15
GH2:A XTA
ASFT -4
C AOU -@30
A ATX
T VLM CHAR
;
ERROR:E VTM -1
MPAC E
RET
;
;
;   C,D - ВЫБОРКА ЛЕКСЕМ "ВРЕМЯ" И "ДАТА"
;         РЕЗУЛЬТАТ В ПОЛЕ "Т".
;
TIMDAT:WTC DIN
IA VTM -1
:IA UTM 1
IA BTA
AEU BL
JAEQ *-1
B UTC
C VJM ; PACKTIME/DATE
IA MTJ I
ATI T
I BTA
ATI C
T JMEQ ERROR
I VLM OKRET
;
;
;   Е - ВЫБОРКА ДЕСЯТИЧНОГО ЧИСЛА В I,F,E-ФОРМАТЕ
;       НА ВЫХОДЕ  Т = 0-I, 1-F, 2-E ФОРМАТ
;
GETNUM:I VRM POZ ; "+"
:JMP ERROR ; 1-ST LETTER
:ITA C
AEU @2B ; "+"
JAEQ POZ
AEU 6 ; "-"
JANE ERROR
UTC 1
POZ:B VTM ; -SIGN
UTA
15 ATX 1 ; INT PART
15 ATX 2 ; MANTISSA
15 ATX 3 ; EXPONENT
T VTM
L VTM CHEXP
R VTM CHPOIN
;
GINT:N VTM -16 ; MAX N DIGITS
D VJM CHAR
;         ПРИЕМ ОЧЕРЕДНОЙ ЦИФРЫ
:T UTC
15 XTA 1
A*U 10
C A+U -@30
T UTC
15 ATX 1
N VLM CHAR
JMP ERROR
;        ПРИШЕЛ РАЗДЕЛИТЕЛЬ
CHPOIN:ITA C
AEU @2E ; "."
T JANE NUMEND
T JMNE ERROR
T VTM 1
JMP GINT
;        ВЫБОРКА ЭКСПОНЕНТЫ
CHEXP:ITA C
AEU @45 ; "E"
JANE ERROR
L VTM ERROR
N MTJ M
N UTM 16
N JMNE CHSEXP
T JMNE CHSEXP
XTA C1 ; +-E...
15 ATX 1
CHSEXP:T VTM 3
N VTM -3
J VTM 1
I BTA
AEU @2D ; "-"
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
:N UTM 3
N JMEQ ERROR
15 WTC 3
N VTM -301
N JMGT ERROR ; TOO BIG EXP
N UTM 300
XTA C1
N JMLT REXP
:A*X C10
N VRM *
J JMEQ REXP
XTS C1
15 A/X
REXP:15 ATX 3
M UTM 16-1
15 XTA 1
AOX ZERO
15 ATX 1
15 XTA 2
AOX ZERO
M JMLT RMANT
:A/X C10
M VRM *
RMANT:15 A+X 1
15 A*X 3
B JMEQ RNUM
X-A ZERO
RNUM:A ATX
JMP OKRET
INTEGER:B JMEQ *+1
U-A
:A ATX
JMP OKRET
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
HEAP:NAME QF
GIVBLOCK:ENTRY QF
RETBLOCK:ENTRY QF
;*
;***************************************************
;*                                                 *
;*       ДИHAMИЧECKOE PACПPEДEЛEHИE ПAMЯTИ         *
;*    БЛOKAMИ ДЛИHOЙ 2**K CЛOB (K=1,2,...,MAX)     *
;*    ИCПOЛЬЗYETCЯ METOД "БЛИЗHEЦOB",  KOTOPЫЙ     *
;*    ЛYЧШE BCEГO OПИCAH B KHИГE  Д.KHYTA.         *
;*                                                 *
;***************************************************
;*      6.7.88.   A.П.CAПOЖHИKOB
;
1:BLOCK K,L,F,B,E,R,H
;
CMD
;
;                CTPYKTYPA ДECKPИПTOPA KYЧИ :
;
;               64            32             1
;               :-------------:---------------:
;          0    :    MAX      :      AHEAP    :
;               :-------------:---------------:
;          1    :             :      F(1)     :
;               :-------------:---------------:
;          2    :    B(1)     :      F(2)     :
;               :-------------:---------------:
;          3    :    B(2)     :       ...     :
;               :-------------:---------------:
;                          .......
;               :-------------:---------------:
;          MAX  :    B(MAX-1) :      F(MAX)   :
;               :-------------:---------------:
;          MAX+1:    B(MAX)   :      0        :
;               :-------------:---------------:
;
;        MAX   - MAKCИMAЛЬHAЯ PAЗMEPHOCTЬ KYЧИ
;        AHEAP - AДPEC HAЧAЛA KYЧИ ДЛИHOЙ 2**MAX CЛOB.
;        [ F(K),B(K) ] - ЗAГOЛOBOK CПИCKA CBOБOДHЫX
;                БЛOKOB ДЛИHOЙ  2**K
;
;        B HAЧAЛЬHЫЙ MOMEHT KYЧA COДEPЖИT POBHO OДИH
;        CBOБOДHЫЙ БЛOK ДЛИHOЙ 2**MAX CЛOB. B KAЖДOM
;        CBOБOДHOM БЛOKE ПEPBOE CЛOBO COДEPЖИT F- И
;        B-YKAЗATEЛИ.  BTOPOE CЛOBO COДEPЖИT B MЛAД-
;        ШИX PAЗPЯДAX ДBOИЧHЫЙ ЛOГAPИФM ДЛИHЫ БЛOKA.
;    ЗAMEЧAHИE: "0" B 64-9 PAЗPЯДAX 2-ГO CЛOBA ЛЮБOГO
;        БЛOKA ИCПOЛЬЗYETCЯ KAK ПPИЗHAK, ЧTO БЛOK
;        CBOБOДEH. ПOMHИTE OБ ЭTOM, PAБOTAЯ C KYЧEЙ !!!
;
;    1.  ИHИЦИИPYЮЩEE OБPAЩEHИE:   R VJM HEAP
;        ПPИ ЭTOM  H = <AДPEC ДECKPИПTOPA KYЧИ>
;        ПOPTЯTCЯ: L,F,B,E.
;
;MOZY=80A35      ;   - HEAP
;
HEAP:
H XTS
ATI E
ASFT 32
ATI L
E ATX 1
H MTJ B
B MSFT -1
B UTM 1 ; ДЛЯ HEЧETA
L UTM -1
E MSFT -1
LCR:B UTM 2
B CREL
L VRM LCR
E INSL
UTA
B STH 2
R JMP
;
;
;   2.  ЗAПPOC БЛOKA ДЛИHOЙ 2**K CЛOB ИЗ KYЧИ  H.
;       ПOPTЯTCЯ: F,B,E,L.  BЫXOД: R.  ПPИ ЭTOM
;       L COДEPЖИT AДPEC ПEPBOГO CЛOBA БЛOKA.
;
GIVBLOCK:H MTJ E
K J+M E
E MSFT -1
E UTM -1
GB1:E UTM 2
E HTA
ATI L
AAU 1
JANE GB1 ; - CПИCOK ПYCT
L JMEQ NOMEMOR
L DELL
L MSFT 1
L XTA 1
GB2:ATI B
AEI K ; CBOЙ PAЗMEP
JAEQ GRET ; - ДA
;       PACЩEПЛEHИE.  BTOPYЮ ПOЛOBИHY BHECEM
;       B CПИCOK CBOБOДHЫX.  ПEPBYЮ БEPEM CEБE,
;       HO BOЗMOЖHO, EЩE PACЩEПAEM.
B UTM -1
B NTA @400-1
A+I L
ASFT -1
ATI F ; 2-Я ПOЛOBИHA
ASFT -1
E ATH -1 ; B-CПИCOK
E ATH -2 ; БЫЛ ПYCT !
E UTM -2
ITA E
ASFT -32
E AOU
F ATX
ITA B
F ATX 1
JMP GB2
;
NOMEMOR:HLT
GRET:L ATX 1
R JMP
;
;
;  3.  BOЗBPAT B KYЧY  H  БЛOKA L ДЛИHOЙ 2**K
;      ПOPTЯTCЯ: CYMMATOP, K,L,F,B,E.   BЫXOД: R.
;
RETBLOCK:H WTC
E VTM
;
RB1:E J-M L
ITA L
K AEN @400
ATI B ; БЛИЗHEЦ
E J+M B
E J+M L
ITA K
B AEX 1 ; CBOБOДEH
JANE RB2 ; - HET
ITA K
A-U 10 ; ЦEЛЫE ЛИCTЫ YЖE
JAGE RB2 ; HE OБЬEДИHЯEM !
;          CЛИЯHИE БЛOKOB-БЛИЗHEЦOB
ITA L
A-I B
:JALE *+1
B MTJ L
:B MSFT -1
B DELL
K VLM RB1
;
RB2:
ITA K
L ATX 1
L MSFT -1
K UTC
H XTA
ATI B
L INSL
R JMP
END
MAINBLCS:NAME QF
NEW_PRT:ENTRY QF ; ПEPECЧET ПPИOPИTETOB
ACTIVATE:ENTRY QF ; AKTИBИЗAЦИЯ ПPOЦECCA
DESACTIV:ENTRY QF ; ДEЗAKTИBAЦИЯ ПPOЦECCA
DDACTIV:ENTRY QF ; ДEЗAKT.ДИAЛ.ПPOЦECCA
RETURN:ENTRY QF ; BOЗBPAT ИЗ ПPEPЫBAHИЯ
SETQ:ENTRY QF ; ПOCTAHOBKA B OЧEPEДЬ
DELQ:ENTRY QF ; ИЗЬЯTИE ИЗ OЧEPEДИ
ACTIV1:ENTRY QF ; ПOБYДKA ПPOЦECCOPA
;*
;****************************************************
;*                                                  *
;*           ПPOЦECCЫ.  CЧETHЫE KAHAЛЫ.             *
;*              PAЗДEЛEHИE BPEMEHИ.                 *
;*                                                  *
;****************************************************
;*
;*   ПYCTЬ  N - ЧИCЛO ПPOЦECCOPOB. OHИ HYMEPYЮTCЯ
;*                 OT 0 ДO N-1.
;*
;*   B CИCTEME CYЩECTBYET 255 CЧETHЫX KAHAЛOB, ПPOHY-
;*   MEPOBAHHЫX OT 0 ДO 254.  KAЖДЫЙ ИЗ KAHAЛOB MOЖET
;*   БЫTЬ ЛИБO CBOБOДEH, ЛИБO ЗAHЯT ПPOЦECCOM. ПPOЦECC
;*   ЗAHИMAET POBHO OДИH KAHAЛ, ПOЭTOMY B ДAЛЬHEЙШEM
;*   MЫ ЧACTO БYДEM OTOЖДECTBЛЯTЬ ЭTИ ДBA ПOHЯTИЯ.
;*
;*   KAHAЛЫ 0:N-1 OTBEДEHЫ ДЛЯ ПPOЦECCOB OБPAБOTKИ
;*   ПPEPЫBAHИЙ HA ПPOЦECCOPAX C HOMEPAMИ 0:N-1.
;*   ЭTИ ПPOЦECCЫ ИMEЮT AБCOЛЮTHO BЫCШИЙ ПPИOPИTET,
;*   T.K. ЗAПYCKAЮTCЯ AППAPATHO.  BCE OCTAЛЬHЫE
;*   ПPOЦECCЫ ЗAПYCKAЮTCЯ ПPOГPAMMHO, ИX ПPИOPИTETЫ
;*   BЫЧИCЛЯЮTCЯ ДИHAMИЧECKИ И ПOЧTИ HE ЗABИCЯT OT
;*   HOMEPA KAHAЛA (ПPИ ПPOЧИX PABHЫX YCЛOBИЯX ПPEД-
;*   ПOЧTEHИE OTДAETCЯ KAHAЛY C MEHЬШИM HOMEPOM).
;*
;*   KAHAЛЫ N:2N-1 ЗAKPEПЛEHЫ ЗA T.H. "ЖДYЩИM TECTOM".
;*   ЭTИ ПPOЦECCЫ XAPAKTEPHЫ TEM, ЧTO HИKOГДA HE ДEЗ-
;*   AKTИBИPYЮTCЯ И BCEГДA ГOTOBЫ "ПOДXBATИTЬ"
;*   ПPOCTAИBAЮЩИЙ ПPOЦECCOP.
;*
;*   KAHAЛ 2N ЗAKPEПЛEH ЗA ПPOЦECCOM ПEPECЧETA ПPИOPИ-
;*   TETOB (YCЛOBHOE ИMЯ - NEWPRT).   ЭTOT ПPOЦECC
;*   AKTИBИЗИPYETCЯ ПPИ ИCЧEPПAHИИ YЧETHOГO KBAHTA
;*   ЛЮБЫM ПPOЦECCOM, YЧACTBYЮЩИM B PAЗДEЛEHИИ BPEMEHИ.
;*
;*   KAHAЛ 2N+1 ЗAKPEПЛEH ЗA ПPOЦECCOM YПPABЛEHИЯ
;*   ПAMЯTЬЮ (YCЛOBHOE ИMЯ - SWING ИЛИ ПOДKAЧKA). ЭTOT
;*   ПPOЦECC AKTИBИЗИPYETCЯ ПPИ CTPAHИЧHЫX ПPEPЫBAHИЯX
;*   ИЛИ ПO CПEЦИAЛЬHЫM ЗAПPOCAM OT ДPYГИX ПPOЦECCOB.
;*
;*   KAHAЛ 2N+2 ЗAKPEПЛEH ЗA ПPOЦECCOM YПPABЛEHИЯ
;*   ДИCKAMИ (YCЛOBHOE ИMЯ - D_DRIVER). OH AKTИBИЗИ-
;*   PYETCЯ ПO ЗAПPOCAM ПPOЦECCOB-ПOЛЬЗOBATEЛEЙ И OT
;*   ПPEPЫBAHИЙ ПO KOHЦY ДИCKOBЫX OБMEHOB.
;*
;*   KAHAЛ 2N+3 ЗAKPEПЛEH ЗA ПPOЦECCOM AHAЛИЗA CИCTEM-
;*   HЫX COOБЩEHИЙ C OПEPATOPCKOЙ KOHCOЛИ  (YCЛOBHOE
;*   ИMЯ - TTANAL). ЭTOT ПPOЦECC, И BOOБЩE BCE C ПPИO-
;*   PИTETOM HИЖE D_DRIVER, MOГYT БЫTЬ HEPEЗИДEHTAMИ.
;*
;*   ФAKTИЧECKИ, BЫШE MЫ ПEPEЧИCЛИЛИ BCE ПOCTOЯHHO
;*   ЖИBYЩИE B CИCTEME ПPOЦECCЫ, T.H. CИCTEMHHЫE.
;*   BCE OCTAЛЬHЫE ПPOЦECCЫ - CMEPTHЫ.  ЗAPOЖДAЯCЬ,
;*   ПPOЦECC ЗAXBATЫBAET ПEPBЫЙ CBOБOДHЫЙ KAHAЛ, A ПO
;*   OKOHЧAHИИ - OCBOБOЖДAET EГO.  TAKИM OБPAЗOM, ПPO-
;*   ЦECC OДHOЗHAЧHO ИДEHTИФИЦИPYETCЯ B CИCTEME PAЗДE-
;*   ЛEHИЯ BPEMEHИ HOMEPOM CBOEГO KAHAЛA.
;*
;*               HEMHOГO TEPMИHOЛOГИИ
;*               ====================
;*
;*   ПPOЦECC CЧИTAETCЯ  AKTИBHЫM, ECЛИ HET ПPИЧИH,
;*   (KPOME HAЛИЧИЯ БOЛEE ПPИOPИTETHЫX KOHKYPEHTOB)
;*   MEШAЮЩИX EMY ЗAXBATИTЬ ПPOЦECCOP.  TAKИM OБPAЗOM,
;*   ЛЮБOЙ ПPOЦECCOP B CИCTEME BCEГДA ЗAHЯT OДHИM ИЗ
;*   AKTИBHЫX B ДAHHЫЙ MOMEHT ПPOЦECCOB.  MHOЖECTBO
;*   AKTИBHЫX ПPOЦECCOB OБPAЗYET OЧEPEДЬ, YПOPЯДOЧEHHYЮ
;*   ПO YБЫBAHИЮ ПPИOPИTETOB.
;*
;*   AKTИBИЗAЦИЯ ПPOЦECCA - BHECEHИE B OЧEPEДЬ.  ECЛИ
;*      HEAKTИBHOCTЬ БЫЛA "ПO BИHE CAMOГO ПPOЦECCA",
;*      TO OHA BЛИЯET HA BEЛИЧИHY EГO ПPИOPИTETA.
;*
;*   ДEЗAKTИBAЦИЯ ПPOЦECCA - ИЗЬЯTИE ИЗ OЧEPEДИ. ЭTИM
;*      ЗAHИMAETCЯ БЛOK PEAKЦИИ HA ПPEPЫBAHИE, OБЫЧHO
;*      ПO ИHИЦИATИBE CAMOГO ПPOЦECCA.
;*
;*   CMEHA ПPOЦECCOB HA ПPOЦECCOPE - MEPOПPИЯTИE, HE
;*      CBЯЗAHHOE C MOДИФИKAЦИEЙ OЧEPEДИ AKTИBHЫX ПPO-
;*      ЦECCOB.  TEKYЩИЙ ПPOЦECC ЛИБO YЖE БЫЛ ПPEPBAH
;*      (BHEШHEE ПPEPЫBAHИE), ЛИБO CAM ИHИЦИИPOBAЛ
;*      ПPOГPAMMHOE ПPEPЫBAHИE, B PEЗYЛЬTATE ЧEГO
;*      ПPOЦECCOP ДOCTAЛCЯ БЛOKY OБPAБOTKИ ПPEPЫBAHИЯ.
;*      ПOCЛEДHИЙ MOЖET ПPИHЯTЬ PEШEHИE OTДATЬ ПPOЦEC-
;*      COP HAИБOЛEE ПPИOPИTETHOMY ИЗ OЧEPEДИ AKTИBHЫX
;*      ПPOЦECCOB (B ЧACTHOCTИ, TOMY ЖE CAMOMY).
;*
;*
;*             ПAPAMETPЫ CИCTEMЫ PAЗДEЛEHИЯ BPEMEHИ.
;*             =====================================
;*
;*      ГЛOБAЛЬHЫM ПAPAMETPOM CИCTEMЫ ЯBЛЯETCЯ  E -
;*   MИHИMAЛЬHЫЙ KBAHT. OH PABEH BPEMEHИ ПOДKAЧKИ OДHOЙ
;*   CTPAHИЦЫ, OKPYГЛEHHOMY ДO БЛИЖAЙШEЙ CTEПEHИ 2.
;*   EДИHИЦЫ ИЗMEPEHИЯ ДЛЯ  E, TAK ЖE KAK И ДЛЯ ПPOЧИX
;*   ПAPAMETPOB, ИЗOБPAЖAЮЩИX BPEMЯ, COBПAДAЮT C EДИHИ-
;*   ЦAMИ PAБOTЫ CИCTEMHOГO TAЙMEPA ( 1 MKCEK.).
;*
;*   ПPOЦECCЫ ДEЛЯTCЯ HA KЛACCЫ, TAK ЧTO ПPEДCTABИTEЛЬ
;*   KЛACCA C БOЛЬШИM HOMEPOM БEЗYCЛOBHO ПPИOPИTETHEE
;*   ПPEДCTABИTEЛЯ KЛACCA C MEHЬШИM HOMEPOM.  HAПPИMEP
;*
;*      0 - ЖДYЩИЙ TECT,    1 - PEЗEPBHЫE ЗAДAЧИ,
;*      2 - ЗAДAЧИ ЮЗEPOB,  3 - CЛYЖEБHЫE,
;*               4 - ДИCПETЧEPCKИE.
;*
;*   KAЖДOMY KЛACCY  K  COOTBETCTBYET CBOЯ BEЛИЧИHA
;*   YЧETHOГO KBAHTA  NK,  HE ИЗMEHЯЮЩAЯCЯ BO BPEMЯ
;*   PAБOTЫ OПEPAЦИOHHOЙ CИCTEMЫ.
;*
;*             ПAPAMETPЫ OДHOГO ПPOЦECCA.
;*             ==========================
;*
;*   P - BHEШHИЙ ПPИOPИTET. MEHЯETCЯ OПEPATOPOM ИЛИ
;*       ПЛAHИPOBЩИKOM BЫCOKOГO YPOBHЯ.  BPEMЯ ДEЛИTCЯ
;*       MEЖДY ПPOЦECCAMИ ПPЯMO ПPOПOPЦИOHAЛЬHO ИX
;*       BHEШHИM ПPИOPИTETAM.
;*
;*   Q - HOPMИPOBAHHЫЙ KBAHT. YCTAHABЛИBAETCЯ ПPИ CAMOЙ
;*       ПEPBOЙ AKTИBИЗAЦИИ ПPOЦECCA (POЖДEHИE ПPOЦECCA)
;*       A TAKЖE ПPИ BXOДE B ДИAЛOГ C ДEЗAKTИBAЦИEЙ.
;*       MOЖET ИЗMEHИTЬCЯ B MOMEHT ЗAXBATA ПPOЦECCOPA.
;*
;*   T = P*Q*E  - AБCOЛЮTHAЯ BEЛИЧИHA KBAHTA. OПPEДE-
;*       ЛЯET HAЧAЛЬHOE ЗHAЧEHИE TAЙMEPA, YПPABЛЯЮЩEГO
;*       PAЗДEЛEHИEM BPEMEHИ.  MEHЯETCЯ ПPИ ИЗMEHEHИЯX
;*       P ИЛИ Q.
;*
;*   C - CЧETЧИK BPEMEHИ, OCTABШEГOCЯ ДO KOHЦA KBAHTA.
;*       ПOKA ПPOЦECC PAБOTAET HA ПPOЦECCOPE, CЧETЧИK
;*       COOTBETCTBYET TAЙMEPY.  B ПEPИOД HEAKTИBHOCTИ
;*       C MOГYT YMEHЬШИTЬ (ШTPAФ ЗA ПPOCTOЙ PECYPCOB).
;*
;*   N - ДИHAMИЧECKAЯ XAPAKTEPИCTИKA ИCПOЛЬЗOBAHИЯ BPE-
;*       MEHИ.  CЮДA ДOБABЛЯETCЯ Q ИЛИ EГO ДOЛЯ, ECЛИ
;*       KBAHT ИCПOЛЬЗOBAH HE ПOЛHOCTЬЮ.  B CИTYAЦИИ
;*       N => NK  N-XAPAKTEPИCTИKИ ПEPECЧИTЫBAЮTCЯ Y
;*       BCEX ПPOЦECCOB ДAHHOГO KЛACCA K.
;*
;*   DP = [ (NK-N)/Q ]   - ДИHAMИЧECKИЙ ПPИOPИTET ПPO-
;*       ЦECCA.  ПPOЦECCOP ПPEДOCTABЛЯETCЯ AKTИBHOMY
;*       ПPOЦECCY C MAKCИMAЛЬHЫM DP.
;*
;*   TD - ACTPOHOMИЧECKOE BPEMЯ ДEЗAKTИBAЦИИ ПPOЦECCA.
;*   AT - TEKYЩEE ACTPOHOMИЧECKOE BPEMЯ.
;*
;*
PCW
PCBIT
TCPQUE:SUBP QF
GIVGROUP:SUBP QF
EXTINTER:SUBP QF
BRANCH:SUBP QF
CDEF
;
TPP
PP_ADR:LCB (1024-8),CLOCK ; ЧACЫ
;
PSYS
SPORT
IFP
;
GROUP
;
;        TEKYЩEE ЗHAЧEHИE TAЙMEPA PAЗДEЛEHИЯ BPEMEHИ
;        ДЛЯ KAЖДOГO ПPOЦECCOPA XPAHИTCЯ B PEГИCTPE
;        "TIMER" 0-Й ГPYППЫ PEГИCTPOB ЭTOГO ПPOЦECCOPA
;
MODIF
;
P:EQU P1 ; ЛOГ.BHEШ.ПPИOP.
Q:EQU P2 ; ЛOГ.HOPM.KBAHTA
T:EQU NP ; AБC.BEЛ.KBAHTA
C:EQU RI ; OCTATOK KBAHTA
N:EQU PA ; XAPAKTEPИCTИKA
K:EQU IA ; KЛACC ПPOЦECCA
;
MAX_CL:EQU 8 ; ЧИCЛO KЛACCOB
EMIN:EQU @80000 ; MИH.KBAHT
ELOG:EQU 19 ; EГO ЛOГAPИФM
CONST
;
;        YЧETHЫE KBAHTЫ ДЛЯ  MAX_CL  KЛACCOB
;
;  NK:INTQ @8000,@4000,@2000,@1000,@800,@400,@200,@100
;
DPMASK:HEX 0000 00FF FF00 FFFF
;
CMD
;
;MOZY=80881     ;  - MAINBLCS
;*
;*         TEKYЩИЙ ПPOЦECC CЛEЗAET C ПPOЦECCOPA
;*         ====================================
;*
MAINBLCS:
CMEHA:
NCPU
ATI CP
ITA NG ; ЗAПOMHИM HOMEP
ASFT 5 ; ПOCЛ.ГPYППЫ
TN ATB NGROUP
JAEQ REFCPU
ITA CP
REFCPU:TN ATB NCPU
TN VTM
JAEQ SELECT
RMOD TIMER
JAEQ SELECT ; ПOBTOPHO
ATI T
NG RMOD TIMER ; KOPPEKЦИЯ
A+H KVANT<<1 ; OCTATKA KBAHTA:
A-I T
ATH KVANT<<1 ; C = C - (T1-T2)
UTA
WMOD TIMER
;*
;*
;*              BЫБOP ПPOЦECCA HA ПPOЦECCOP.
;*              ============================
;*
;*   PAБOTA ПPOИЗBOДИTCЯ OT ИMEHИ БЛOKA PEAKЦИИ HA ПPE-
;*   PЫBAHИE. ПOCЛEДOBATEЛЬHO CKAHИPYETCЯ OБЩAЯ OЧEPEДЬ
;*   AKTИBHЫX ПPOЦECCOB  RDQUE.   ПPИ ЭTOM HE ПOДЛEЖAT
;*   PACCMOTPEHИЮ ПPOЦECCЫ :
;*     - ПPИBЯЗAHHЫE K ЧYЖOMY ПPOЦECCOPY ;
;*     - ЖДYЩИE ПOДKAЧKИ, ECЛИ SWING B ЭTO BPEMЯ ЗAHЯT;
;*   Y BЫБPAHHOГO ПPOЦECCA PACCMOTPИM CЧETЧИK  C  BPE-
;*   MEHИ, OCTABШEГOCЯ ДO KOHЦA KBAHTA.
;*
;*  S1. ECЛИ C > 0, TO ПPOЦECC ИMEET ПPABO ДEPЖATЬ ПPO-
;*      ЦECCOP EЩE C EДИHИЦ BPEMEHИ. KOHEЦ PAБOTЫ БЛOKA.
;*  S2. C <= 0, Q < NK/4.  (KBAHT ЛOПHYЛ).  YДBAИBAEM
;*      KBAHT:  C=C+T; T=2*T; Q=2*Q  И CHOBA HA  S1.
;*  S3. C <= 0, Q => NK/4. (БOЛЬШOЙ ПEPEPACXOД BPEMEHИ).
;*      HEOБXOДИM ПEPECЧET DP :  C=C+T; N=N+Q;
;*      DP=[(NK-N)/Q].    ПPOДOЛЖAEM S3, ПOKA  C <= 0 .
;*  S4. ECЛИ B ИTOГE ПOЛYЧИЛOCЬ  N => NK , YЙДEM HA S5.
;*      ИHAЧE ПEPECTABИM HAШ ПPOЦECC B RDQUE COOTBETCT-
;*      BEHHO EГO HOBOMY  DP  И BEPHEMCЯ B HAЧAЛO БЛOKA
;*      BЫБOPA ПPOЦECCA.
;*  S5. ЗAПYCK CПEЦ.ПPOЦECCA ПEPECЧETA ПPИOPИTETOB.
;*      ПPOCTABИM B ШKAЛY  RECALC  "1", COOTBETCTBYЮЩYЮ
;*      KЛACCY K. ECЛИ NEWPRT HEAKTИBEH, BHECEM EГO B
;*      RDQUE И BEPHEMCЯ B HAЧAЛO БЛOKA BЫБOPA ПPOЦECCA.
;*      ECЛИ NEWPRT AKTИBEH (HAПPИMEP, HA COCEДHEM ПPO-
;*      ЦECCOPE) - KOHEЦ PAБOTЫ БЛOKA.
;*
;*  ЗAMEЧAHИE: BEЛИЧИHЫ P И Q ПPEДCTABЛEHЫ CBOИMИ
;*    ДBOИЧHЫMИ ЛOГAPИФMAMИ И ЗAHИMAЮT ПO 1 БAЙTY,
;*    ACCOЦИИPOBAHHOMY C HOMEPOM ПPOЦECCA.
;*
;*
SELECT:TN BTA RDQUE
ATI TN ; CЛEД.ЭЛ-T
XTA SWPORT
JAEQ SEL20 ; FREE SWING
TN XTA PCW
AAN BL_SEL
JANE SELECT ; ЖДET ПOДKAЧKИ
;
SEL20:TN BTA NCPU
JAEQ SEL30 ; HE ПPИBЯЗAH
AEI CP
JANE SELECT ; ЧYЖOЙ CPU
;
SEL30:TN XTA PCW
JALT IFABS ; - HET ИП
TN ПPИП1
R VJM GIVGROUP ; ЗA ГPYППOЙ
NG JMEQ SELECT ; - HE ДAЛИ
HTA KVANT<<1
ATI C
C JMGT RETURN ; - HE ЛOПHYЛ
;
TN BTA EX_PRI
ATI P
TN BTA Q_NORM
ATI Q
TN XTA TABPRT
ATI N
ASFT 48
AAU @FF
ATI K
ITA N
AAU @FFFF
ATI N
P UTC ELOG-1
Q NTA @400
ATI T
R VTM RETURN
;
;          SEL40:K QTA NK
SEL40:K NTA 64-16
Q ASFT 2
JAEQ SEL50 ; Q=> NK/4
T J+M C
T MSFT -1
Q UTM 1
C JMLE SEL40
JMP CALCPRT1
;
SEL50:Q NTA @400
A+I N
ATI N
T J+M C
C JMLE SEL50
;
CALCPRT1:
TN BTA RDQUE
ATI NP
;         K QTA NK
K NTA 64-16
A-I N
:JAGT *+1
R VTM INITCALC ; N => NK
:Q ASN @400-24
AOI N
TN AEX TABPRT
AAX DPMASK
TN AEX TABPRT
TN ATX TABPRT ; HE CЛИШKOM ЛИ
NP A-L TABPRT ; CИЛЬHO ПOHИЗИЛИ
:JAGE *+1
R VTM INITCALC
:ITA Q ; ЗAПИCЬ
TN ATB Q_NORM ; ИЗMEHИBШИXCЯ
ITA C ;   Q  И  C
ATH KVANT<<1 ; HA CBOE MECTO
I VTM ; OCBEЖИM TAЙMEP
JMPS TCPQUE ;PAЗДEЛEHИЯ BPEMEHИ
:WMOD TIMER ; ЗACEЧKA
R JMP
;
;      И П   BЫБPAHHOГO ПPOЦECCA OTKAЧAHO.
;            ЗAПYCTИM, ECЛИ MOЖHO, ПOДKAЧKY.
;
IFABS:AON BL_SEL
TN ATX PCW
XTA SWPORT
JANE SELECT ; SWING ЗAHЯT
ITA TN
ASFT -32
AOU IF_LIST
ATX SWPORT
NP VTM N_SWING
JMP ACTIVATE
;
INITCALC:
K NTA
AOX RECALC
ATX RECALC
UTA
WMOD TIMER
NP VTM N_WINDOW
;*
;*             AKTИBИЗAЦИЯ ПPOЦECCA  NP.
;*             =========================
;*
;*   ПPOЦECC NP BHOCИTCЯ B CПИCOK ГOTOBЫX.  OCTATOK EГO
;*   KBAHTA C YMEHЬШAETCЯ ПPOПOPЦИOHAЛЬHO ACTP.BPEMEHИ
;*   HEAKTИBHOCTИ И ЧИCЛY CTPAHИЦ B OЗY.
;*   ПOPTЯTCЯ: I,J,RR.  BЫXOД HA SELECT ИЛИ RETURN.
;*
ACTIVATE:
NP TEMP4
RR VTM ACTIV1
NP XTA PCW
JALT SETRDQ ; HET ИП
AAN P_SYST
JANE SETRDQ ; CИCTEMHЫЙ
NP ПPИП
QTA PCNT<<2 +3 ; CTP.B OЗY
XTS TCLOSE ; BPEMЯ
A-L CLOCK ; HEAKTИBHOCTИ
15 A*L ; YMHOЖAEM HA
A/L QPAGE ; ПPOЦ.CTPAHИЦ
H-A KVANT<<1
ATH KVANT<<1
TN ПPИП
;
;        BHECEHИE ПPOЦECCA NP B CПИCOK ГOTOBЫX:
;
SETRDQ:NP XTA PCW
AAN READY_
RR JANE ; YЖE БЫЛ ГOTOB
NP XTA PCW
AON READY_
NP ATX PCW
I VTM
;
SETQ:
I MTJ J
J BTA RDQUE
ATI I
I XTA TABPRT
NP A-L TABPRT
JAGT SETQ
ITA NP
J ATB RDQUE
ITA I
NP ATB RDQUE
RR JMP
;
;
;       ECЛИ ПPOЦECC NP ПPИBЯЗAH K ЧYЖOMY ПPOЦECCOPY,
;       TOMY ПOCЫЛAETCЯ ПPEPЫBAHИE "CMEHИ ПPOЦECC".
;       ECЛИ NP ПPИOPИTETHEE, ЧEM TN, CMEHA ПPOЦECCA
;       YЧИHЯETCЯ HA HAШEM ПPOЦECCOPE.
;
ACTIV1:
NCPU
ATI CP
TN XTA TABPRT
NP A-L TABPRT
JAGE LOW
NP BTA NCPU
JAEQ CMEHA
AEI CP
JAEQ CMEHA
LOW:NP BTA NCPU
AEI CP
JAEQ RETURN
;
;        ЗДECЬ HAДO ПOCЛATЬ ДPYГИM ЦП
;        ПPEPЫBAHИE: "ECTЬ KЛИEHT"
;        KAK ЭTO ДEЛATЬ - ПOKA HEЯCHO
;
;*
;***              BOЗBPAT ИЗ ПPEPЫBAHИЯ
;*
RETURN:
CMON -1
RMOD @1802 ; Г P П
AAX WELL_INT
WMOD @1802
JANE EXTINTER
R VJM BRANCH ; HA BETBЛEHИE
NG IJP ; B ПPOЦECC
;*
;*                ДEЗAKTИBAЦИЯ TEKYЩEГO ПPOЦECCA
;*                 (CПEЦИAЛЬHЫЙ CЛYЧAЙ: ДИAЛOГ)
;*                ==============================
;*
DDACTIV:
JMP DESACTIV ; - BPEMEHHO ДO BЫЯCHEHИЯ
TN BTA EX_PRI
ATI P ; ПPИOP.
TN XTA TABPRT
ASFT 48
AAU @FF
ATI K ; KЛACC
TN XTA TABPRT
AAU @FFFF
ATI N
;           K QTA NK
K NTA 64-16
ASFT 2
ATI Q ; NK/4
A*U 3
A-I N
:JALE QLOG ; N=>3*NK/4
QTA PCNT<<2 +3
ATI Q
QLOG:ITA Q ; ПEPEXOД K
LOG2  ; ДBOИЧH.ЛOГAPИФMY
ATI Q
NG RMOD TIMER
ATI R
RMOD TIMER
A-I R
P ASFT ELOG
A+I N ; ДOЛЯ Q
ATI N
R VTM CMEHA
UTC CALCPRT1-CMEHA
;*
;*             OБЫЧHЫЙ BAPИAHT ДEЗAKTИBAЦИИ
;*             ============================
;*
DESACTIV:RR VTM CMEHA
TN MTJ NP
XTA CLOCK
ATX TCLOSE
;
DELRDQ:NP XTA PCW
AAN READY_
RR JAEQ
NP AEX PCW
NP ATX PCW
I VTM
;
DELQ:
I MTJ J
J BTA RDQUE
ATI I
RR JAEQ
AEI NP
JANE DELQ
NP BTA RDQUE
J ATB RDQUE
UTA
NP ATB RDQUE
RR JMP
;*
;*
;*                OБЩИЙ ПEPECЧET ПPИOPИTETOB
;*                ==========================
;*
;*   ЭTO ДИCПETЧEPCKИЙ ПPOЦECC, PAБOTAЮЩИЙ HA KAHAЛE 1.
;*   EГO ИHФOPMAЦИOHHAЯ БAЗA COCTOИT ИЗ ДBYX OБЬEKTOB:
;*    1. RECALC - ШKAЛA KЛACCOB, TPEБYЮЩИX ПEPECЧETA;
;*    2. TABPRT - TAБЛИЦA ПPИOPИTETOB ПPOЦECCOB;
;*          64   56   48   40       24   16      1
;*          :----:----:----:--------:----:--------:
;*          : C1 :  K : C2 :   DP   : P1 :    N   :
;*          :----:----:----:--------:----:--------:
;*
;*     KAЖДOMY ПPOЦECCY OTBOДИTCЯ OДHO CЛOBO TABPRT.
;*     K - KЛACC ПPOЦECCA;  DP - EГO ДИHAM.ПPИOPИTET;
;*     N - XAPAKTEPИCTИKA ИCПOЛЬЗOBAHИЯ BPEMEHИ;
;*     P1=256-<HOM.ПPOЦECCA>. ЭTO ПOЛE BBOДИTCЯ ДЛЯ
;*     TOГO, ЧTOБЫ ПPИ ПPOЧИX PABHЫX YCЛOBИЯX ПPEДПO-
;*     ЧTEHИE OTДABAЛOCЬ ПPOЦECCY C MEHЬШИM HOMEPOM.
;*     C1,C2 - CЧETЧИKИ BЛOЖEHHЫX KPИT.ИHTEPBAЛOB.
;*     ПPИ BXOДE (BЫXOДE) B KPИT.ИHTEPBAЛ ПPOЦECC
;*     YBEЛИЧИBAET (YMEHЬШAET) HA 1 ЛИБO C1, ЛИБO C2,
;*     B ЗABИCИMOCTИ OT TИПA COOTBETCTBYЮЩEГO CEMAФOPA.
;*
;*  S1. ECЛИ RECALC ПYCTA - ДEЗAKTИBИPYEMCЯ.  ИHAЧE
;*      ПOЛOЖИM  K = HOM.KЛACCA, COOTB. CTAPШEЙ "1".
;*  S2. ПOИCK B TABPRT OЧEPEДHOЙ CTPOKИ KЛACCA K.
;*      ECЛИ BCЯ TAБЛИЦA ПPOCMOTPEHA - ПOГACИM "1" B
;*      RECALC И BEPHEMCЯ K  S1.
;*  S3. ЗAKPЫTЬ ПPEPЫBAHИЯ. ДЛЯ BЫБPAHHOГO ПPOЦECCA
;*      ПOBTOPЯTЬ  N=N-NK/4,  ПOKA  N => NK .
;*  S4. BЫЧИCЛИTЬ  DP=[(NK-N)/Q].  ПEPECTABИTЬ ПPOЦECC
;*      B RDQUE, ECЛИ OH БЫЛ AKTИBEH.  OTKPЫTЬ ПPEPЫBA-
;*      HИЯ И BEPHYTЬCЯ K  S2.
;*
;*
;    ЧTOБЫ HE MYЧИTЬCЯ C YKAЗAHИEM TOЧKИ BXOДA ПPИ
;    AKTИBИЗAЦИИ ПPOЦECCA, ПPИMEM CЛEДYЮЩИE COГЛAШEHИЯ:
;  1. ПPИ ИHИЦИAЛИЗAЦИИ CИCTEMЫ BCE CИCTEMHЫE ПPOЦECCЫ
;     ЯBЛЯЮTCЯ AKTИBHЫMИ. TOЧKOЙ BXOДA ЯBЛЯETCЯ ПEPBAЯ
;     KOMAHДA ПPOЦECCA.
;  2. ЖEЛAЯ ДEЗAKTИBИPOBATЬCЯ, ПPOЦECC OPГAHИЗYET ПPO-
;     ГPAMMHOE ПPEPЫBAHИE (MAKPOC "PINT"). ПOCЛEДYЮЩAЯ
;     AKTИBИЗAЦИЯ BOЗOБHOBЛЯET ПPOЦECC C ПPEPBAHHOГO
;     MECTA.
;
PRT_FIN:
UTA 5
PINT
NEW_PRT:
SMON БBП
XTA RECALC
JAEQ PRT_FIN
ANU -1
ATI K
K NTA
AEX RECALC
ATX RECALC
;       K QTA NK
K NTA 64-16
ATI P
ASFT 2
ATI T ; NK/4
NP VTM QPROC-1
;
S_CLASS:NP XTA TABPRT
CMON БBП
ASFT 48
AAU @FF
AEI K
JANE ES_CLASS
NP BTA Q_NORM
ATI Q
NP XTA TABPRT
AAU @FFFF
ATI N
CALC1:T J-M N ; N=N-NK/4
ITA P
A-I N
JALE CALC1
SMON БBП
Q ASFT 24
AOI N
NP AEX TABPRT
AAX DPMASK
NP AEX TABPRT
NP ATX TABPRT
RR VJM DELRDQ ; ИЗЫMEM И BCTABИM
JAEQ ES_CLASS ; BHOBЬ COГЛACHO
RR VJM SETRDQ ; HOBOMY ПPИOPИTETY
;
ES_CLASS:TN VRM S_CLASS
JMP NEW_PRT
;
;
END
GIVGROUP:NAME QF
RETGROUP:ENTRY QF
RESGROUP:ENTRY QF
;*
;***************************************************
;*                                                 *
;*    PACПPEДEЛEHИE ГPYПП PEГИCTPOB ПPOЦECCOPA     *
;*                                                 *
;***************************************************
;*          6.06.88.  A.П.CAПOЖHИKOB
;*
POPGRUP:SUBP QF
PUSHGRUP:SUBP QF
DESACTIV:SUBP QF
PCW
PCBIT
GROUP
MODIF
;
;         ШKAЛA CBOБOДHЫX ГPYПП PEГИCTPOB ПPOЦECCOPA
;         XPAHИTCЯ B ПOCЛEДHEM PEГИCTPE 0-Й ГPYППЫ.
;            EE HAЧAЛЬHOE COCTOЯHИE = 1FFF FFFF
;
;   ГPYППA 0 ПPИHAДЛEЖИT ПPOЦECCY OБPAБOTKИ ПPEPЫBAHИЙ
;   ГPYППA 1 ПPИHAДЛEЖИT ПPOЦECCY "ЖДYЩИЙ TECT"
;   ГPYППA 2 ИCПOЛЬЗYETCЯ, ECЛИ HET CBOБOДHЫX, HO ЛИШЬ
;            CИCTEMHЫMИ ПPOЦECCAMИ.  ПPEЖHИЙ EE BЛAДE-
;            TEЛЬ ПPИ ЭTOM BЫTAЛKИBAETCЯ B ИП.
;
FRG_SC:EQU @1F
;
;MOZY=809E2    ;   - GIVGROUP
;
GIVGROUP:
TN BTA NGROUP
ATI NG ; ГPYППA ECTЬ
NG MSFT -5
NG RMOD GRBOSS
AEI TN
R JAEQ ; - ДA
;
RMOD FRG_SC
JAEQ EXPROP
ANU -33
ATI NG
RMOD FRG_SC
NG AEN 32
WMOD FRG_SC
NG MSFT -5
JMP POP
;
;      ECЛИ HET CBOБOДHЫX ГPYПП, OГPAБИM BЛAДEЛЬЦA
;      2-Й, OTOБPAB ПOCЛEДHЮЮ ГPYППY B EГO ЦEПOЧKE.
;
EXPROP:NG VTM 2<<5
NG RMOD GRBOSS
JAEQ POP ; OHA CBOБOДHA
ATI NP ; EE BЛAДEЛEЦ
NP BTA NGROUP
ASFT -5
JANE S_LAST
HLT 1 ; KAPAYЛ !
S_LAST:ATI NG
NG RMOD PPP
ASFT 16-5
AAU @3E0
JANE S_LAST
TN XTA PCW
AAN P_SYST
AOI NG
AEU 2<<5
JANE EXPROP1
NG VTM ; - OTЛYП !
R JMP
;
;         ГACИM CCЫЛKY HA "NG" B ПPEДЫДYЩEЙ ГPYППE
;         ПPOЦECCA "NP".
;
EXPROP1:NG RMOD PPP
ASFT 8-5
AAU @3E0
ATI W
W RMOD PPP
AAU @FFFF
W WMOD PPP
NP BTA NGROUP
ASFT -5
AEI NG
JANE POP ; PEЗEPBHAЯ
NP ATB NGROUP
W JMNE PUSH
NP ATB NCPU ; OTBЯЗKA OT ЦП
;
PUSH:
RR VJM PUSHGRUP
;
;         ПPИBЯЗKA K ПPOЦECCOPY И ЗAПOЛHEHИE AKTИBHOЙ
;         ГPYППЫ PEГИCTPOB ИЗ ИHФ.ПOЛЯ ПPOЦECCA.
;
POP:ITA NG
ASFT 5
TN ATB NGROUP
ITA CP
TN ATB NCPU
TN MTJ NP
R MTJ RR
JMP POPGRUP
;
;          BOЗBPAT BCEЙ ЦEПOЧKИ ГPYПП PEГИCTPOB.
;          (ПEPEД ЗABEPШEHИEM ЖИЗHИ ПPOЦECCA).
;
RETGROUP:
NG MSFT 5
RMOD FRG_SC
NG AON 32
WMOD FRG_SC
NG MSFT -5
UTA
NG WMOD GRBOSS
NG RMOD PPP
ASFT 8-5
AAU @3E0
ATI NG
JANE RETGROUP
JMP DESACTIV
;
;           ЗAПPOC ПPOЦECCOM ДЛЯ CEБЯ PEЗEPBHOЙ ГPYППЫ
;           PEГИCTPOB.  OTBET HA CYMMATOPE:
;                0 - ГPYППY HE ДAЛИ, HET CBOБOДHЫX.
;            ИHAЧE - HOMEP ГPYППЫ B 6:10 PAЗPЯДAX
;           PEЗEPBHAЯ ГPYППA OTMEЧAETCЯ B PPP ПPOЦECCA
;
RESGROUP:NG RMOD PPP
ASFT 16-5
AAU @3E0
R JANE ; YЖE ECTЬ !
RMOD FRG_SC
R JAEQ ; HET CBOБ.
ANU -33
ATI W
RMOD FRG_SC
W AEN 32
WMOD FRG_SC
W MSFT -16
NG RMOD PPP
AOI W
AON 64-22
NG WMOD PPP
W MSFT 16-5
AAU @FF ; TEГ
NG MSFT 5-8
AOI NG
NG MSFT 8-5
AON 64-14
W WMOD PPP
ITA TN
W WMOD GRBOSS
ITA W
R JMP
;
END
POPGRUP:NAME QF
PUSHGRUP:ENTRY QF
;*
;***   OБMEH ИHФOPMAЦИEЙ MEЖДY ИHФOPMAЦИOHHЫM ПOЛEM
;*     ПPOЦECCA  NP  И ГPYППOЙ EГO PEГИCTPOB  NG .
;*
;*           :-------------------------:
;*         0 :       BPEMЯ CЧETA       :
;*         1 :  TAЙMEP    :   PEЗEPB   :
;*         2 :  P A B     :   P A П Y  :===\
;*           :-------------------------:   I
;*                .................        I
;*           :-------------------------:   I
;*   PAПY-16 :    И 1     :     И2     :   I
;*           :        .........        :   I
;*        -9 :   И 1 5    :    И 1 6   :   I
;*        -8 :  C Ч A C   :    P O П   :   I
;*        -7 :    P P     :    P P P   :   I
;*        -6 :       CYMMATOP          :   I
;*        -5 :        P M P            :   I
;*     -4:-1 :    PAБOЧИE   ЯЧEЙKИ     :   I
;*           :-------------------------:   I
;*      PAПY :  HAЧAЛO HOBOГO KBAHTA   :<==/
;*
PCW:LCB (0)
IFP
GROUP
MODIF
;
CMD
;
;MOZY=80AD0     ;   - POPGRUP
;
POPGRUP:
NP ПPИП
NP XTA PCW
AAU @3FF
ATI W
W XTA IFCTIM ; BPEMЯ CЧETA
NG WMOD CTIME+1
ASFT 32
NG WMOD CTIME
W XTA IFTIMER ; TAЙMEP
NG WMOD TAIL
ASFT 32
NG WMOD TIMER
W XTA ASTEC ; PAB,PAПY
ATI W
ASFT 32
NG WMOD SPRADR
W XTA -5 ; PMP
NG WMOD PMP+1
ASFT 32
NG WMOD PMP
W XTA -6 ; CYMMATOP
NG WMOD ACC+1
ASFT 32
NG WMOD ACC
W XTA -7 ; PP,PPP
NG WMOD PPP
ASFT 32
NG WMOD PP
W XTA -8 ; CЧAC,POП
NG WMOD POП
ASFT 32
NG WMOD CЧAC
W XTA -9 ; И15,И16
NG WMOD 16
ASFT 32
NG WMOD 15
W XTA -10 ; И13,И14
NG WMOD 14
ASFT 32
NG WMOD 13
W XTA -11
NG WMOD 12
ASFT 32
NG WMOD 11
W XTA -12
NG WMOD 10
ASFT 32
NG WMOD 9
W XTA -13
NG WMOD 8
ASFT 32
NG WMOD 7
W XTA -14
NG WMOD 6
ASFT 32
NG WMOD 5
W XTA -15
NG WMOD 4
ASFT 32
NG WMOD 3
W XTA -16
NG WMOD 2
ASFT 32
NG WMOD 1
ITA TN
NG WMOD GRBOSS
W UTA -16
NG WMOD PAПY
RR JMP
;
;
PUSHGRUP:
NP ПPИП
NP XTA PCW
AAU @3FF
A+U IFCTIM
ATI W
W MSFT -1
NG RMOD CTIME
W ATH
NG RMOD CTIME+1
W ATH 1
NG RMOD TIMER
W ATH 2
NG RMOD TAIL
W ATH 3
NG RMOD SPRADR
W ATH 4
NG RMOD PAПY
A+U 16
W ATH 5
A-U 16
ATI W
W MSFT -1
NG RMOD 1
W ATH
NG RMOD 2
W ATH 1
NG RMOD 3
W ATH 2
NG RMOD 4
W ATH 3
NG RMOD 5
W ATH 4
NG RMOD 6
W ATH 5
NG RMOD 7
W ATH 6
NG RMOD 8
W ATH 7
NG RMOD 9
W ATH 8
NG RMOD 10
W ATH 9
NG RMOD 11
W ATH 10
NG RMOD 12
W ATH 11
NG RMOD 13
W ATH 12
NG RMOD 14
W ATH 13
NG RMOD 15
W ATH 14
NG RMOD 16
W ATH 15
NG RMOD CЧAC
W ATH 16
NG RMOD POП
W ATH 17
NG RMOD PP
W ATH 18
NG RMOD PPP
W ATH 19
NG RMOD ACC
W ATH 20
NG RMOD ACC+1
W ATH 21
NG RMOD PMP
W ATH 22
NG RMOD PMP+1
W ATH 23
UTA
NG WMOD GRBOSS
RR JMP
;
END
SEMDOWN:NAME QF
SEMUP:ENTRY QF
;*
;*                               Y CEMAФOPA
;*                               Я И MOЯ MAШA ...
;*                                    (HAPOДHAЯ ПECHЯ)
;*
;**************************************************
;*                                                *
;*      O Ч E P E Д И     П P O Ц E C C O B.      *
;*               C E M A Ф O P Ы .                *
;*                                                *
;**************************************************
;*           31.05.88.   A.П.CAПOЖHИKOB.
;*
;*   MЫ OTKAЗAЛИCЬ OT TPAДИЦИOHHЫX ДЛЯ БЭCM-6 БИTOBЫX
;*   ШKAЛ ПPOЦECCOB И HAЧИHAEM ИCПOЛЬЗOBATЬ CПИCOЧHЫE
;*   CTPYKTYPЫ.  ПPИ ЭTOM HAM БYДET ДOCTATOЧHO ИMETЬ
;*   CПИCKИ C OДHOЙ CBЯЗЬЮ.  C KAЖДЫM  J-M ПPOЦECCOM
;*   ACCOЦИИPOBAH БAЙT, COДEPЖAЩИЙ HOMEP  N ПPOЦECCA,
;*   CЛEДYЮЩEГO ЗA  J-M B OЧEPEДИ.  ECЛИ N=0, TO
;*   J - ПOCЛEДHИЙ B OЧEPEДИ.  YKAЗATEЛЬ HAЧAЛA OЧEPE-
;*   ДИ XPAHИTCЯ OTДEЛЬHO. B ЧACTHOCTИ, ЭTO MOЖET БЫTЬ
;*   БAЙT ПPOЦECCA 0.
;*
;*      I.  OЧEPEДЬ ГOTOBЫX ПPOЦECCOB  RDQUE.
;*      =====================================
;*   AHAЛOГ ШKAЛЫ ГOTOBHOCTИ B OC "ДYБHA".  HAЧAЛO
;*   CПИCKA YKAЗЫBAET БAЙT ПPOЦECCA 0.  CПИCOK CTPOИT-
;*   CЯ ПO YБЫBAHИЮ ПPИOPИTETOB ПPOЦECCOB.  CПИCOK HE
;*   ПYCT, T.K. COДEPЖИT ПO KPAЙHEЙ MEPE "ЖДYЩИЙ TECT".
;*   ЗAMEЧAHИE: Y ПPOЦECCA-0 "ПPИOPИTET" ДOЛЖEH БЫTЬ 0.
;*
;*
;*       II. CEMAФOP ДOCTYПA K OБЩEЙ ПAMЯTИ.
;*       ===================================
;*   OH ПPEДHAЗHAЧEH ДЛЯ OБECПEЧEHИЯ BOЗMOЖHOCTИ MOHO-
;*   ПOЛЬHOЙ PAБOTЫ C ПAMЯTЬЮ B TEЧEHИE KOPOTKOГO ПPO-
;*   MEЖYTKA BPEMEHИ. PEAЛИЗYETCЯ CПEЦИAЛЬHЫM OБPAЩE-
;*   HИEM K ЯЧEЙKE ПAMЯTИ, AДPEC KOTOPOЙ ИЗBECTEH
;*   MИKPOПPOГPAMME.  ПOKA MЫ TOЛЬKO OБOЗHAЧAEM MECTA,
;*   ГДE ЭTOT CEMAФOP БYДET HEOБXOДИM, MAKPOCAMИ :
;*       SMON  - "YCTAHOBИTЬ MOHOПOЛИЮ"
;*       CMON  - "CHЯTЬ MOHOПOЛИЮ"
;*
;*   KOMAHДA  SMON  БЛOKИPYET BHEШHИE ПPEPЫBAHИЯ HA
;*   "CBOEM" ПPOЦECCOPE И BXOД B KPИT.ИHTEPBAЛ ДЛЯ
;*   "ЧYЖИX" ПPOЦECCOPOB.  ПOCЛEДHИE B ЭTOM CЛYЧAE
;*   ПPOCTO "ЖYЖЖAT" HA OПPOCE ЗAHЯTOCTИ CEMAФOPA.
;*
;*   KOMAHДA  CMON  PAЗPEШAET BHEШHИE ПPEPЫBAHИЯ HA
;*   "CBOEM" ПPOЦECCOPE И OCBOБOЖДAET KPИT.ИHTEPBAЛ
;*   ДЛЯ COCEДHИX ПPOЦECCOPOB.
;*
;*
;*        III. ПPOЧИE CEMAФOPЫ.
;*        =====================
;*   OHИ ПPEДHAЗHAЧEHЫ ДЛЯ OБCЛYЖИBAHИЯ KPИTИЧECKИX
;*   ИHTEPBAЛOB, BHYTPИ KOTOPЫX ПPOЦECCЫ ЗAHИMAЮTCЯ
;*   ДOCTATOЧHO БOЛЬШOЙ PAБOTOЙ, HAПPИMEP, OБMEHAMИ.
;*   ЗДECЬ HE ЖAЛKO ПOЙTИ HA PACXOДЫ ПO OPГAHИЗAЦИИ
;*   ПPOГPAMMHO YПPABЛЯEMЫX OЧEPEДEЙ K KPИT.ИHTEPBA-
;*   ЛAM.  CEMAФOPЫ БЫBAЮT ДBYX TИПOB, OДHИ ПOBЫШAЮT
;*   KЛACC ПPOЦECCA, ЗAXBATИBШEГO KPИTИЧ. ИHTEPBAЛ,
;*   ДPYГИE HE ПOBЫШAЮT.  C KAЖДЫM CEMAФOPOM CBЯЗAHЫ
;*   ДBA БAЙTA:
;*     BOSS  - COДEPЖИT HOMEP ПPOЦECCA, ЗAXBATИBШEГO
;*             KPИT.ИHTEPBAЛ, ИЛИ 0.
;*     WAIT  - COДEPЖИT YKAЗATEЛЬ HAЧAЛA OЧEPEДИ
;*             ЖДYЩИX ПPOЦECCOB, ИЛИ 0
;*
;*   ПPOЦECC, ЗAXBATЫBAЮЩИЙ CEMAФOP, PEГИCTPИPYETCЯ
;*   B ПOЛE "BOSS", A TAKЖE YBEЛИЧИBAET HA 1 CЧETЧИK
;*   C1 ИЛИ C2  B CЛOBE CBOEГO ПPИOPИTETA.
;*   ECЛИ ЖE CEMAФOP ЗAHЯT, ПPOЦECC BHOCИTCЯ B OЧEPEДЬ
;*   ЖДYЩИX И ИЗЫMAETCЯ ИЗ OЧEPEДИ ГOTOBЫX.
;*   TAK KAK ЛЮБOЙ ПPOЦECC MOЖET ЖДATЬ HE БOЛEE ЧEM Y
;*   OДHOГO CEMAФOPA, TO OЧEPEДЬ ЖДYЩИX CAM БOГ BEЛEЛ
;*   COBMECTИTЬ C  RDQUE.
;*
;*   ПPИ OCBOБOЖДEHИИ CEMAФOPA OЧEPEДЬ ЖДYЩИX ПPOДBИ-
;*   ГAETCЯ, CEMAФOP TYT ЖE OTДAETCЯ ПEPBOMY ИЗ HИX,
;*   И ECЛИ ЭTO HEOБXOДИMO, ПPOИЗBOДИTCЯ ПEPECЧET
;*   ПPИOPИTETOB ПPOЦECCOB.
;*
DESACTIV:SUBP QF
ACTIV1:SUBP QF
RETURN:SUBP QF
SETQ:SUBP QF
DELQ:SUBP QF
;
 PCW
PCBIT
SEMAF
;
MODIF
;
CONST
CLNS:HEX FFFF FF00 FFFF FFFF
;
CMD
;*
;*   SEMDOWN - ЗAXBAT CEMAФOPA.  HOMEP CEMAФOPA HA
;*   PEГИCTPE IA, BOЗBPAT ПO R.  ПOPTЯTCЯ: I,J,NP,RR.
;*
;MOZY=80B1A        ;   - SEMDOWN
;
SEMDOWN:
TN MTJ NP
IA BTA SEMBOSS<<3
JAEQ FREE ; - CBOБOДEH
AEI TN
JAEQ RETURN ; - CBOЙ
IA UTC
I VTM SEMWAIT<<3 - RDQUE
RR VJM SETQ ; B OЧEPEДЬ ЖДYЩИX
IA ITA @C0
ASFT -32
TN AOX PCW ; ЗAПOMHИM
TN ATX PCW ; HOMEP CEMAФOPA
JMP DESACTIV
;
FREE:ITA NP
IA ATB SEMBOSS<<3
RR VTM RETURN
JMP PRIUP
;*
;*   SEMUP - OCBOБOЖДEHИE CEMAФOPA.  HOMEP CEMAФOPA
;*   HA PEГИCTPE IA, BOЗBPAT ПO R. ПOPTЯTCЯ: I,J,NP,RR.
;*
SEMUP:
IA BTA SEMBOSS<<3
AEI TN
JANE RETURN ; И HE ЗAHИMAЛИ!
TN UTC
I VTMB TABPRT
XTA SCSEM
IA AAN
:JANE *+1
I UTM 2
:I BTA ; BOCCTAHOBЛEHИE
JAEQ NEWBOSS ; CTAPOГO
A-U 1 ; ПPИOPИTETA
I ATB
;
NEWBOSS:
IA BTA SEMWAIT<<3
IA ATB SEMBOSS<<3
JAEQ RETURN ; HИKTO HE ЖДET
ATI NP
NP XTA PCW
AAX CLNS
NP ATX PCW
IA MTJ I
I UTM SEMWAIT<<3 - RDQUE
RR VJM DELQ ; ИЗ OЧ.ЖДYЩИX
I VTM
RR VJM SETQ ; B ГOTOBЫE
RR VTM ACTIV1
;
PRIUP:XTA SCSEM
IA AAN
:JANE *+1
UTC 16
:NTA 64-57 ; BPEMEHHOE
NP A+L TABPRT ; ПOBЫШEHИE
NP ATX TABPRT ; ПPИOPИTETA
RR JMP
;
END
OЧEPEДЬ:NAME QF
;*
;*                   OЧEPEДЬ - ЭTO ФOPMA CYЩECTBOBAHИЯ
;*                   ЧEЛOBEKA B COЦИAЛИCTИЧECKOM OБЩE-
;*                   CTBE.     (HAPOДHAЯ MYДPOCTЬ).
;*
;****************************************************
;*                                                  *
;*       YПPABЛEHИE OЧEPEДЯMИ ЗAЯBOK HA OБMEHЫ      *
;*                                                  *
;****************************************************
;*
ИЗOЧEP:ENTRY QF
SMEM_UP:ENTRY QF
;*
OБMOЧ
;*
;*   ПOCTYПAЮЩИE B CИCTEMY ЗAЯBKИ HA OБMEHЫ CKЛAДЫBA-
;*   ЮTCЯ B OБЩYЮ KYЧY ЗAЯBOK (JOB), ГДE ПOЛYЧAЮT
;*   ИHДEKC J=1,2,...,MAXJOB.  C KAЖДЫM KAHAЛOM OБMEHA
;*   N=0,1,...,MAXCHAN-1  CBЯЗAHA CBOЯ OЧEPEДЬ ЗAЯBOK.
;*   N-Й БAЙT HEADS ЯBЛЯETCЯ "ГOЛOBOЙ" N-Й OЧEPEДИ.
;*   PACПPEДEЛEHИE YCTPOЙCTB ПO KAHAЛAM ПOKA HE
;*   KOHKPETИЗИPOBAHO. B ЧACTHOCTИ, "KAHAЛOM" MOЖHO
;*   CЧИTATЬ И OTДEЛЬHOE YCTPOЙCTBO.
;*
;*   KAЖДЫЙ ЭЛEMEHT MACCИBA ЗAЯBOK JOB MOЖET HAXOДИTЬ-
;*   CЯ ЛИБO POBHO B OДHOЙ OЧEPEДИ, ЛИБO B CПИCKE CBO-
;*   БOДHЫX, ПOЭTOMY BCE OЧEPEДИ И CПИCOK CBOБOДHЫX
;*   MOЖHO ДEPЖATЬ B OДHOM MACCИBE QUE (MAXJOB БAЙT).
;*   0-Й БAЙT QUE ЯBЛЯETCЯ ГOЛOBOЙ CПИCKA CBOБOДHЫX.
;*
;*   ECЛИ L-Й БAЙT (L=1,2,...) QUE COДEPЖИT KOД J > 0
;*   ЭTO OЗHAЧAET, ЧTO J-Я ЗAЯBKA B JOB CTOИT B CBOEЙ
;*   OЧEPEДИ OБMEHOB HEПOCPEДCTBEHHO ЗA L-Й.
;*   ECЛИ ЖE L-Й БAЙT QUE COДEPЖИT 0, ЭTO ЗHAЧИT, ЧTO
;*   L-Я ЗAЯBKA CTOИT B CBOEЙ OЧEPEДИ ПOCЛEДHEЙ.
;*
;*        ФOPMAT ЗAЯBKИ HA OБMEH (2 CЛOBA):
;*
;*     64   56   48   40   32                  1
;*     :----:----:----:----:--------------------:
;*   0 : TN : CN : UN : ST :    A D R E S S     :
;*     :----:--------------:--------------------:
;*   1 :         ДOП. ИHФOPMAЦИЯ                :
;*     :----:--------------:--------------------:
;*
;*   TN - HOMEP ПPOЦECCA, ЗAKAЗABШEГO OБMEH.
;*   CN - HOMEP OБMEHHOГO KAHAЛA;
;*   UN - HOMEP YCTPOЙCTBA;
;*   ADRESS - ФИЗ.AДPEC БYФEPA B ПAMЯTИ. B HEKOTOPЫX
;*        CЛYЧAЯX ЭTO ПOЛE MOЖET ИMETЬ ИHOЙ CMЫCЛ;
;*   ST - TEKYЩEE COCTOЯHИE ЗAKAЗA:
;*        8 : "1"-ГOTOB K OБPAБOTKE, "0"-YЖE B PAБOTE;
;*        7 : "1"-OБPAБOTKA OKOHЧEHA, "0"-HE OKOHЧEHA;
;*       6-1: KOД ЗABEPШEHИЯ ИЛИ KOД COCTOЯHИЯ;
;*
;*   BTOPOE CЛOBO ЗAЯBKИ MOЖET ИCПOЛЬЗOBATЬCЯ KAK
;*   YГOДHO, B ЗABИCИMOCTИ OT TИПA OБMEHHOГO KAHAЛA.
;*
;*   ИCПOЛHИTEЛЬ, OБCЛYЖИBAЮЩИЙ K-E YCTPOЙCTBO
;*   (K=0,1,...), CKAHИPYET COOTBETCTBYЮЩYЮ OЧEPEДЬ
;*   ЗAЯBOK, HAЧИHAЯ C ГOЛOBЫ (K-Й БAЙT HEADS).
;*   OБHAPYЖИB ЗAЯBKY, ГOTOBYЮ K OБPAБOTKE, OH OБHY-
;*   ЛЯET Y HEE ПOЛE ST И HAЧИHAET TPYДИTЬCЯ.
;*   ЗABEPШИB OБCЛYЖИBAHИE, ИCПOЛHИTEЛЬ ЗAПИCЫBAET B
;*   ПOЛE ST KOД ЗABEPШEHИЯ И ГEHEPИPYET COБЫTИE ДЛЯ
;*   ПPOЦECCA-KЛИEHTA.  ECЛИ ИCПOЛHИTEЛEM ЯBЛЯETCЯ
;*   ПYЛЬTOBOЙ ПPOЦECCOP, OH ПPOCTO ИHИЦИИPYET
;*   BHEШHEE ПPEPЫBAHИE "KOHEЦ OБMEHA".
;*
;*   ПOCTAHOBKA HOBOЙ ЗAЯBKИ B CBOЮ OЧEPEДЬ OБMEHA
;*   ПPOИЗBOДИTCЯ CAMИM ПPOЦECCOM-KЛИEHTOM. KAK ПPA-
;*   BИЛO, ДOБABЛEHИE ПPOИCXOДИT B XBOCT OЧEPEДИ,
;*   HO BBИДY MAЛЫX PAЗMEPOB OЧEPEДEЙ HET CMЫCЛA
;*   ЗABOДИTЬ YKAЗATEЛИ XBOCTOB. KOHEЦ OЧEPEДИ OПPE-
;*   ДEЛЯETCЯ ПPЯMЫM ПOИCKOM.  ИЗ CПИCKA CBOБOДHЫX
;*   ЭЛEMEHTOB JOB (0-Й БAЙT QUE) OTЩEПЛЯETCЯ OДИH.
;*   TYДA ПEPEПИCЫBAETCЯ ЗAЯBKA HA OБMEH, MAPKИPOBAH-
;*   HAЯ HOMEPOM ПPOЦECCA-KЛИEHTA.
;*
;
MODIF
;
CMD
;
; ---    1.  R CALL OЧEPEДЬ   - ПOCTAHOBKA B OЧEPEДЬ
;            J = <AДPEC ЗAЯBKИ>.  ПOPTЯTCЯ:W,J,ACC
;
;MOZY=80A15      ;   - OTCHERED
;
OЧEPEДЬ:
SMON БBП
BTA QUE<<3
JAEQ KAPAЧYH
ATI W ; CBOБ.ЭЛ-T
W BTA QUE<<3 ;
ATB QUE<<3 ; CHЯЛИ C ГOЛOBЫ
J XTA 1
W UTC -1
W ATX JOB ; 2-E CЛOBO
W UTC -1
W ATX DUBJOB
J XTA
AON 64-40 ; "ГOTOB"
W UTC -1
W ATX JOB-1 ; 1-E CЛOBO
ATX LAST_JOB
W UTC -1
W ATX DUBJOB-1
ASFT 48
AAU @FF ; KAHAЛ
A-U MAXCHAN ; ЗAГOЛOBOK
:ATI J ;
J BTA QUE<<3 ; ПOИCK
JANE *-1 ; XBOCTA OЧEPEДИ
W ATB QUE<<3 ; W - ПOCЛEДHИЙ
ITA W
J ATB QUE<<3 ; J - ПEPEД HИM
;
;    TEMP2
;
;
;---    OCBOБOЖДEHИE ГЛOБAЛЬHOГO CEMAФOPA ПAMЯTИ
;
SMEM_UP:
ГHOM
JAEQ UP0
CMON БBП
R JMP
UP0:
CMON -1
R JMP
;
KAPAЧYH:
HLT @39 ; HET CBOБ.
JMP * ; ЭЛEMEHTOB
;
; ---    2.  R CALL ИЗOЧEP    - ИЗЬЯTИE
;            BXOД - TOЛЬKO ПOД CEMAФOPOM !!!
;            J = 1,2,...   - ИHДEKC ЗAЯBKИ B JOB.
;            ПOPTЯTCЯ:  W,ACC
;            ПPИ BЫXOДE HA CYMMATOPE 0 ИЛИ 1-E CЛOBO
;            TOЛЬKO ЧTO ИCKЛЮЧEHHOЙ  J-Й ЗAЯBKИ.
;
ИЗOЧEP:
J UTC -1
J XTA JOB-1
AAN 64-39
JAEQ CLPPINF ; HE OБPAБOTAHA!
J UTC -1
J XTA JOB-1
15 ATX
ASFT 48
AAU @FF ; KAHAЛ
A-U MAXCHAN ; ЗAГOЛOBOK
SJ1:ATI W
W BTA QUE<<3
JAEQ KAPAЧYH ; HET TAKOГO
AEI J
JANE SJ2
J BTA QUE<<3
W ATB QUE<<3 ; COMKHEM PЯДЫ
BTA QUE<<3
J ATB QUE<<3 ; BEPHEM
ITA J ; B ГOЛOBY CПИCKA
STB QUE<<3 ; CBOБOДHЫX
JMP CLPPINF
SJ2:AEI J
JMP SJ1
CLPPINF:
UTS
STX PPINF
R JMP
;
END
KOHCOЛЬ:NAME QF
TERMOS:ENTRY QF
;*
;*                               HA ДBYXKOHCOЛЬHOM
;*                                  KPAHE Я PAБOTAЛ,
;*                               KOГДA CЛOMAЛACЬ TAM
;*                                  OДHA KOHCOЛЬ ...
;*                                    (CTAPAЯ ПECHЯ).
;*
;****************************************************
;*                                                  *
;*    BBOД/BЫBOД CTPOKИ HA OПEPATOPCKYЮ KOHCOЛЬ     *
;*                                                  *
;****************************************************
;*
OБMOЧ
OЧEPEДЬ:SUBP QF
LIMIT:EQU LO/12
;
;
;    PEГИCTP I : AДPEC TEKCTA (CЛOBHЫЙ !).  MЛAДШИЙ
;                БAЙT ПOCЛEДHEГO CЛOBA TEKCTA = 0.
;    PEГИCTP J : HOMEP TEPMИHAЛA = 0,1,2,...
;                BCE TEPMИHAЛЫ "CИДЯT" HA KAHAЛE 0.
;                ГЛABHOЙ KOHCOЛЬЮ ЯBЛЯETCЯ TEPMИHAЛ 0.
;    BOЗBPAT : RR.
;
;    TEKCT, ПOДЛEЖAЩИЙ BЫДAЧE, ПOCЛOBHO ПEPEПИCЫBAEM B
;    KOЛЬЦEBOЙ БYФEP "CON_OUT" BMEЩAЮЩИЙ  LO  CЛOB.
;    B ЗAЯBKE HA OБMEH B ПOЛE AДPECA ИHФOPMAЦИИ
;    ПOMEЩAETCЯ OTHOCИTEЛЬHЫЙ HOMEP ПEPBOГO CЛOBA
;    TEKCTA ПO OБЛACTИ CBЯЗИ C ПYЛЬT-ПPOЦECCOPOM.
;
;    ПPИ PAБOTE OT OБЫЧHOГO ПPOЦECCA ИCПOЛЬЗYETCЯ
;    CEMAФOP-0.  ПPИ PAБOTE OT ПPEPЫBAHИЙ KPИT.ИHTEPBAЛ
;    YЖE БЫЛ ЗAXBAЧEH KOMAHДOЙ "SMON".
;
;
;**************************************************
;           ИHФOPMAЦИЯ ДЛЯ И.H.CИЛИHA:
;
;    ПOЛE CBЯЗИ MEЖДY  ЦП  И  ПП  PAЗMEЩAETCЯ C TOЧKИ
;    ЗPEHИЯ ЦП  B "ФИЗ.AДPECAX"  FFFF 0000 - FFFF 07FF
;    И PACПPEДEЛЯETCЯ CЛEДYЮЩИM OБPAЗOM :
;
;          1. CCЫЛKИ HA OTH.AДPECA MACCИBOB :
;             ( BCE ИЗMEPЯETCЯ B CЛOBAX БЭCM )
;      64                                       1
;      :-----------------------------------------:
;    0 :  HAЧAЛO ЗAГOЛOBKOB OЧEPEДEЙ -       AH  :
;      :-----------------------------------------:
;    1 :  HAЧAЛO CПИCKOB OЧEPEДEЙ -          AQ  :
;      :-----------------------------------------:
;    2 :  HAЧAЛO MACCИBA ЗAЯBOK -            AJ  :
;      :-----------------------------------------:
;    3 :  HAЧAЛO БYФEPA BBOДA -            ABIN  :
;      :-----------------------------------------:
;    4 :  HAЧAЛO БYФEPA BЫBOДA -          ABOUT  :
;      :-----------------------------------------:
;    5 :  ДЛИHA БYФEPA BЫBOДA -              LO  :
;      :-----------------------------------------:
;
;            2.  LAST -  KOПИЯ ПOCЛEДHEЙ ЗAЯBKИ OT ЦП
;
;      64   56   48   40   32                   1
;      :----:----:----:----:---------------------:
;    6 : TN : CN : UN : ST : AДPEC ПO OБM.БYФEPY :
;      :----:----:----:----:---------------------:
;      ЗДECЬ HAC ИHTEPECYET   CN - HOMEP OЧEPEДИ
;
;            3.  ДOП ИHФOPMAЦИЯ K ПPEPЫBAHИЮ OT ПП.
;
;      :-----------------------------------------:
;    7 :                                ITYP     :
;      :-----------------------------------------:
;
;            4.  HEADS - ЗAГOЛOBKИ BCEX OЧEPEДEЙ
;                ПOKA HAC ИHTEPECYET TOЛЬKO 0-Я
;                OЧEPEДЬ (BЫBOД HA KOHCOЛЬ).
;
;        0    1    2    3    4    5    6    7
;      :----:----:----:----:----:----:----:----:
;   AH : I  :    :    :    :    :    :    :    :
;      :----:----:----:----:----:----:----:----:
;      :    :    :    :       ...........      :
;      :----:----:----:------------------------:
;
;            5.  QUE - ПPOШИTЫE CПИCKИ OЧEPEДEЙ
;                  I    L              J
;      :----:----:----:----:----:----:----:----:
;   AQ :    :    : J  : 0  :    :    : L  :    :
;      :----:----:----:----:----:----:----:----:
;      :    :    :    :      ...........       :
;      :----:----:----:------------------------:
;
;            6.  JOB - ЗAЯBKИ HA OБMEH OT  Ц П
;                      (OДHA ЗAЯBKA = 2 CЛOBA)
;
;      :----:----:----:----:-------------------:
;   AJ : TN : CN : UN : ST :     A Д P E C     :
;      :-------------------:-------------------:
;      : ДOП.ИHФ. (ПOKA HE ЗAДEЙCTBOBAHO)      :
;      :---------------------------------------:
;      :          ..................           :
;      : TN-HOM.ПPOЦECCA, CN-HOM.OЧEPEДИ       :
;      : UN-HOM.YCTPOЙCTBA, ST-CTATYC OБMEHA   :
;      :          .................            :
;
;           7.  CON_IN  - БYФEP BBOДA (16 CЛOB)
;
;           8.  CON_OUT - KOЛЬЦEBOЙ БYФEP BЫBOДA
;                         HA KOHCOЛЬ ( LO CЛOB ).
;
;      Ц П   ПИШET TOЛЬKO B :  LAST,HEADS,QUE,JOB,
;                              CON_OUT.
;      П П   ПИШET TOЛЬKO B :  ITYP, CON_IN
;
;   CKAHИPOBAHИE K-Й OЧEPEДИ HAЧИHAETCЯ ЧTEHИEM K-ГO
;   БAЙTA HEADS. ECЛИ TAM 0 - OЧEPEДЬ ПYCTA.
;   ИHAЧE TAM I=1,2,3,... - ИHДEKC ПO JOB.  ECЛИ I-Я
;   ЗAЯBKA B JOB HE ДOЛЖHA CEЙЧAC OБPAБATЫBATЬCЯ,
;   ПEPEXOДИM K CЛEДYЮЩEMY ЭЛEMEHTY OЧEPEДИ. ДЛЯ ЭTOГO
;   БEPEM  J - COДEPЖИMOE I-ГO БAЙTA QUE.  ECЛИ J=0,
;   OЧEPEДЬ KOHЧИЛACЬ, ИHAЧE БEPEM J-Ю ЗAЯBKY B JOB.
;   CЛEД.ЭЛEMEHT L=<J-Й БAЙT QUE>  И T.Д.
;
;   ПPИ BЫBOДE HA TEPMИHAЛ ПOЛE AДPECA B ЗAЯBKE
;   TPAKTYETCЯ KAK HOMEP CЛOBA = 0,1,2,...,LO-1
;   ПO KOЛЬЦEBOMY БYФEPY  CON_OUT.  TAM HAЧИHAETCЯ
;   TEKCT, ПOДЛEЖAЩИЙ BЫBOДY.  OH KOHЧAETCЯ БAЙTOM "0"
;   (K ЭTOMY AДPECY ДOГOBOPИЛИCЬ ДOБABЛЯTЬ AДPEC
;    CAMOГO БYФEPA OTHOCИTEЛЬHO БЛOKA CBЯЗИ C ПП).
;
;   ПOЛE ST B ЗAЯBKE CЛYЖИT ДЛЯ KOHTPOЛЯ ЗA COCTOЯHИEM
;   OБMEHA:  БИT 8 = "1" - ЗAЯBKA ГOTOBA K OБPAБOTKE;
;            БИT 8 = "0" - ЗAЯBKA YЖE B PAБOTE;
;            БИT 7 = "1" - OБPAБOTKA ЗAЯBKИ ЗAKOHЧEHA;
;            БИT 7 = "0" - EЩE HE ЗAKOHЧEHA.
;   ЗAKOHЧИB OБPAБOTKY  J-Й ЗAЯBKИ B JOB,  ПП ФOPMИPYET
;   ITYP = 256*J  И ПOCЫЛAET ПPEPЫBAHИE B  Ц П.
;
;   ПOЛYЧИB C KOHCOЛИ COOБЩEHИE ДЛЯ OПEPAЦИOHHOЙ CИCTE-
;   MЫ, ПП ПEPEПИCЫBAET EГO B БYФEP  CON_IN,  ФOPMИPYET
;   ITYP = 1 И ПOCЫЛAET ПPEPЫBAHИE B  Ц П.
;**************************************************
;*
MODIF
IFP
;
BUF:BLOCK TJOB(2),TSTRI(16)
;
PCW
PCBIT
;
CMD
;
;MOZY=80A8C      ;   - CONSOL
;
KOHCOЛЬ:15 ATX
MPAC I ; J,W,R
15 ATD ; - CПACAEM
ITA TN ; N ПPOЦECCA
ASFT -16
AOI J ; + N TERM.
ASFT -40 ; B ЗAЯBKY
AOU CON_OUT-REFERS ; (ПOKA БEЗ
15 ATX ; AДPECA TEKCTA)
R VTM -LIMIT
J VTM -MAXCHAN ; KAHAЛ=0
ГHOM
JAEQ LENQUE
UTA 3 ; ЗAXBAT CEMAФOPA-0
PINT
LENQUE:J BTA QUE<<3
ATI J ; ПOДCЧET
R UTM 1 ; ДЛИHЫ
JANE LENQUE ; OЧEPEДИ
;
;        ECЛИ ЗAKAЗOB MHOГO - ПPOCTO ПOДMEHИM
;        ПOCЛEДHЮЮ CTPOKY, ПOДЛEЖAЩYЮ BЫДAЧE,
;        HA TOЛЬKO ЧTO ПPИCЛAHHYЮ.
;        ECЛИ ЗAKAЗOB MAЛO - ЧECTHO ДOБABИM HOBЫЙ.
;
:R JMGT *+1
UTC 1 ; CBOБ.MECTO
:XTA LAST_OUT ; B БYФEPE
ATI W
ATX LAST_OUT ; ПOCЛ.TEKCT
15 ARX
15 MTJ J ; B ЗAЯBKY -
15 ATX ; AДPEC ПO БYФEPY
TRAN:I XTA
I UTM 1 ; ПOCЛOBHAЯ
W ATX CON_OUT ; ПEPEПИCЬ
W UTM 1-LO
:W JMLT *+1
 W VTM -LO ; KOЛЬЦEBAHИE
:W UTM LO
AAU @FF
JANE TRAN
ITA W ; HOBOE CBOБ.
STX LAST_OUT+1 ; MECTO
ГHOM
JAEQ NOSEM
UTA 4 ; OCBOБ.CEMAФOPA-0
PINT
NOSEM:R JMGT RETTERM
R VJM OЧEPEДЬ
;
RETTERM:15 DTA
MUNP I
15 XTA ; CYMMATOP
RR JMP ; HE ПOPTИM
;
;
;       *********************************
;       OБMEH CTPOKAMИ C TEPMИHAЛOM ЮЗEPA
;       *********************************
;
;     B OTЛИЧИE OT PAБOTЫ C KOHCOЛЬЮ, ПPOBOДИTCЯ
;     C ЗAKPЫTИEM ЗAДAЧИ, ПOДABШEЙ OБMEH.  ИCПOЛЬ-
;     ЗYETCЯ KAHAЛ  CN = 1.   B ПOЛE "UN" ЗAДAETCЯ
;     HOMEP TEPMИHAЛA (1,2,...), BЗЯTЫЙ ИЗ ИП ЮЗEPA,
;     ИЛИ 0, ECЛИ B KAЧECTBE TEPMИHAЛA ЮЗEPA ФИГYPИ-
;     PYET BCE-TAKИ KOHCOЛЬ.  B ПOЛE AДPECA ЗAДAETCЯ
;     ПOЛHЫЙ ФИЗ.AДPEC CTPOKИ. KOHEЦ CTPOKИ - БAЙT "0".
;     B 64:57 P. 2-ГO CЛOBA ЗAЯBKИ ЗAДAETCЯ  K O П :
;      0 - BЫBOД CTPOKИ HA TEPMИHAЛ
;      2 - ПPИEM CTPOKИ C TEPMИHAЛA
;      1 - "BBOД C ПOДCKAЗKOЙ".  CHAЧAЛA BЫBOДИTCЯ
;          ПOДCKAЗKA, ЗATEM ПPOИCXOДИT BBOД "BCTЫK"
;          BЫBEДEHHOMY. TAKИM OБPAЗOM, B БYФEP ЮЗEPA
;          ПOПAДET HE TOЛЬKO TO, ЧTO BBEДEHO, HO И
;          BЫBEДEHHAЯ ПOДCKAЗKA.
;
;              ПPИ OБPAЩEHИИ ЗAДAЮTCЯ :
;              ========================
;     I - MAT.AДPEC ПEPBOГO CЛOBA БYФEPA ЮЗEPA
;     J - KOД OПEPAЦИИ ( 0, 1 ИЛИ 2 )
;     TN - HOMEP ПPOЦECCA
;     TERMOS : OБMEH C TEPMИHAЛOM ЮЗEPA
;         +1 : OБMEH C ГЛABHOЙ KOHCOЛЬЮ
;     BЫXOД ПO RR.
;
TERMOS:UTC NTERM ; - ЮЗEP
:XTS ; - KOHCOЛЬ
ASFT 16
AAU @FF ; "UN"
AOU @100 ; "CN"=1
TN MSFT -16
AOI TN
TN MSFT 16
ASFT -8
ATH TJOB<<1
MPAC I
15 ATD
ITA I ; ЗAПOMHИM AДPEC
AAX =H0000 0000 FFFF FFFF
ATX TJOB+1 ; (ДЛЯ BBOДA)
;
SMON БBП
TN XTA PCW
AON IF_FIX ; ФИKCAЦИЯ ИП
AON W_TERM
TN ATX PCW
CMON БBП
AAU @FFC00
A+U TSTRI-IFCTIM
ATH TJOB<<1 +1 ; ФИЗ.AДPEC
ITA J
ATB TJOB<<3 +8 ; KOП
A-U 2
JAGE INQUE ; - BBOД
R VTM TSTRI
:I XTA ; ПEPEПИCЬ
I UTM 1 ; BЫBOДИMOГO
R ATX ; B ИП-БYФEP
R UTM 1
AAU @FF
JANE *-2
;
INQUE:J VTM TJOB
R VJM OЧEPEДЬ
NTA ; ЗAKP.ПO ДИAЛOГY
PINT
;
;        PACФИKCAЦИЮ  ИП  CДEЛAET "EXTINTER"
;
XTA TJOB+1
ATI I
ASFT 56
JAEQ RETTERM ; - BЫBOД
J VTM TSTRI
:J XTA ; ПEPEПИCЬ
J UTM 1 ; BBEДEHHOГO
I ATX ; B БYФEP
AAU @FF ; ЮЗEPA
JAEQ RETTERM
I VLM *-2
;
END
CREVENT:NAME QF
CLEVENT:ENTRY QF
BRANCH:ENTRY QF
BRANCH1:ENTRY QF
;*
;***************************************************
;*                                                 *
;*     C O Б Ы T И Я    И    B E T B Л E H И Я     *
;*                                                 *
;***************************************************
;*            6.06.88.   A.П.CAПOЖHИKOB.
;
PCW
PCBIT
RRBIT
;
IFP
;
EVENT
ACTIVATE:SUBP QF
DESACTIV:SUBP QF
DDACTIV:SUBP QF
RETURN:SUBP QF
RESGROUP:SUBP QF
PUSHGRUP:SUBP QF
;
GROUP
MODIF
;
CMD
;
;       ГEHEPAЦИЯ ПPOЦECCY NP COБЫTИЯ HOMEP IA.
;
;MOZY=80A6C       ;   - CREVENT
;
CREVENT:
NP XTA EVENTS
IA AON -1 ; HOBOE COБ.
NP ATX EVENTS
NP AAX M_EVENTS
JAEQ RETURN ; HE PAЗPEШ.
NTA B_BRAN
NP AAX PCW
JANE RETURN ; БЛOK.BETB.
NP XTA PCW
AAN W_EVEN
JAEQ RETURN ; HE ЖДET
JMP ACTIVATE
;
;        ДEЗAKTИBAЦИЯ ДO HACTYПЛEHИЯ COБЫTИЯ
;
CLEVENT:
TN XTA PCW
AON W_EVEN ; "ЖДEM COБ."
AON B_BRAN ; CHИMEM
AEN B_BRAN ; БЛOK.BETB.
TN ATX PCW
TN XTA EVENTS ; MOЖET, YЖE?
TN AAX M_EVENTS
JAEQ DESACTIV ; - EЩE HET
JMP RETURN
;
;          БЛOK BOЗBPATA ИЗ ПPEPЫBAHИЯ.
;       OPГAHИЗAЦИЯ, ECЛИ HAДO, BETBЛEHИЯ.
;
BRANCH:
TN XTA PCW
AAN B_BRAN
R JANE ; -БЛOKИPOBAHO
TN XTA EVENTS
TN AAX M_EVENTS
R JAEQ
ANU
ATI IA
IA NTA -1
TN AEX EVENTS
TN ATX EVENTS ; ГAШEHИE
TN XTA PCW
AAN W_EVEN
JAEQ BRANCH1
;
;      ПPOЦECC ЖДAЛ COБЫTИЯ. БYДET BOЗBPAT "ПOД BЫЗOB"
;      ПPOГPAMMЫ CLEVENT.  ПPИ ЭTOM IA=<HOMEP COБЫTИЯ>
;
TN AEX PCW
TN ATX PCW
ITA IA
NG WMOD IA
R JMP
;
;      ACИHXPOHHOE COБЫTИE. OPГAHИЗYEM BETBЛEHИE :
;        (HA TOЙ ЖE CAMOЙ ГPYППE PEГИCTPOB !)
;         И ПOKA TOЛЬKO ДЛЯ PEЖИMA ДИCПETЧEPA!!!
;
BRANCH1:
TN MTJ NP
RR VJM PUSHGRUP
ITA TN
NG WMOD GRBOSS
TN XTA PCW
AON B_BRAN
TN ATX PCW
IA HTA VECTOR<<1 -1
EXTF 64-20
NG WMOD CЧAC
XTA ASTEC
NG WMOD 15 ; MAГAЗИH
NG RMOD PPP
AAU @FFF00 ; ГACИM "PЭ"
NG WMOD PPP
NTA 64-PД
AON 64-POA
NG WMOD PP
ITA IA
NG WMOD IA ; KOД COБЫTИЯ
JMP RETURN
END
TCPQUE:NAME QF
;*
;***************************************************
;*                                                 *
;*    BEДEHИE OЧEPEДИ TAЙMEPOB CЧETHOГO BPEMEHИ    *
;*                                                 *
;***************************************************
;*            26.5.88     A.П.CAПOЖHИKOB
;*
;*   B MAШИHE CYЩECTBYET OДИH 64-PAЗPЯДHЫЙ PEГИCTP
;*   CЧETHOГO BPEMEHИ  И OДИH 32-PAЗPЯДHЫЙ TAЙMEP
;*   CЧETHOГO BPEMEHИ ПPOЦECCA.  B TO ЖE BPEMЯ ПPOЦECC
;*   ДOЛЖEH ИMETЬ BOЗMOЖHOCTЬ PAБOTATЬ OДHOBPEMEHHO C
;*   HECKOЛЬKИMИ TAЙMEPAMИ.  BЫXOД COCTOИT B TOM, ЧTO
;*   B ИП ПPOЦECCA BEДETCЯ CПИCOK ЗAKAЗOB HA TAЙMEP,
;*   YПOPЯДOЧEHHЫЙ ПO BOЗPACTAHИЮ BPEMEH CPAБATЫBAHИЯ.
;*   OДИH ЗAKAЗ ЗAHИMAET OДHO 64-PAЗPЯДHOE CЛOBO :
;*      64                          8     1
;*     :----------------------------:-----:
;*     : BPEMЯ CPAБATЫBAHИЯ TAЙMEPA :HOMEP:
;*     :----------------------------:-----:
;*
;*   CYMMATOP  = OTHOCИT. BPEMЯ CPAБATЫBAHИЯ TAЙMEPA:
;*   PEГИCTP I = HOMEP TAЙMEPA :
;*
;*   0 - OЧEPEДHOЙ KBAHT CИCTEMЫ PAЗДEЛEHИЯ BPEMEHИ;
;*   1 - ГЛOБAЛЬHЫЙ TIME-LIMIT ПPOЦECCA;
;*   2:N - TAЙMEPЫ, YCTAHABЛИBAEMЫE ЮЗEPOM. ПPИ CPAБA-
;*         TЫBAHИИ TAKOГO TAЙMEPA ПPOЦECCY ГEHEPИPYETCЯ
;*         COБЫTИE.
;*
;*   HAЧAЛЬHOE COCTOЯHИE CПИCKA ЗAKAЗOB YCTAHABЛИBAETCЯ
;*   CИCTEMOЙ ПPИ COЗДAHИИ ПPOЦECCA, ПPИЧEM TAЙMEPЫ 2:N
;*   YCTAHABЛИBAЮTCЯ "HA БECKOHEЧHOCTЬ".
;*   ПPИ ПOCTYПЛEHИИ HOBOГO ЗAKAЗA ПPEДЫДYЩИЙ TAЙMEP C
;*   TEM ЖE HOMEPOM ИЗЫMAETCЯ ИЗ CПИCKA.  TAKИM OБPAЗOM
;*   HA KAЖДЫЙ TAЙMEP ИMEETCЯ POBHO OДHA ЗAЯBKA.
;*   BЫXOД: RETS.  ПOPTИTCЯ:J.
;*
;
N:EQU 6 ; ЧИCЛO TAЙMEPOB
MASK:EQU @FF ; ПOЛE "N"
@FF800:BLOCK IFCTIM(6),TQUE
GROUP
MODIF
;
;MOZY=80AC0      ;   - TCPQUE
;
TCPQUE:
A+L IFCTIM
ASFT -8
15 ATX ; ЗAЯBKA
J VTM N-1
SEAR:J XTA TQUE ; ПOИCK
AAU MASK ; CTAPOЙ
AEI I ; ЗAЯBKИ
JAEQ TOWN
J VRM SEAR
HLT ; - EE HET !
;---
BACK:J XTA TQUE
J ATX TQUE+1 ; OЧEPEДЬ
TOWN:J VRM BACK ; "ПЯTИTCЯ"
J VTM 2-N
;---
SORT:J XTA TQUE+N-1 ; ПOИCK
J ATX TQUE+N-2 ; MECTA ДЛЯ
15 A-L -1 ; HOBOЙ
JAGT PUT ; ЗAЯBKИ
J VLM SORT
J VTM 1 ; - B CAMЫЙ ЗAД
;---
PUT:15 XTA ; BCTABЛЯEM
AOI I ; HOMEP TAЙMEPA
J ATX TQUE+N-2
XTA TQUE ; HAИMEHЬШИЙ
ASFT 8 ; ИДET B ДEЛO
A-L IFCTIM
NG WMOD TIMER
RETS
END
WAITTEST:NAME QF
;*
;*                      ЧTO ДEЛATЬ, ECЛИ ДEЛATЬ HEЧEГO
;*
;*                              (COBETCKИЙ COФИЗM).
;*
;***************************************************
;*                                                 *
;*          ПPOЦECC - "ЖДYЩИЙ TECT"                *
;*                                                 *
;***************************************************
;*
MAIN_SW:SUBP QF
RES_END:CCB (0)
STARTER:SUBP QF
IFP
;
VAR
SUM:HEX 0
;
CMD
;
;         YHИЧTOЖEHИE ПOCЛEДHИX CЛEДOB "STARTER"
;         ( ECЛИ OH HEPEЗИДEHT, A ПOKA ЭTO HE TAK! )
;
;MOZY=80BB5      ;  -  WAITTEST
;
UTA
1 VTM STARTER>>10 & @3FF
;       1 WMOD @400 ; EГO ПPИПИCKA
13 VTM ЖДY
;
;         ПEPBЫM ДEЛOM BЫЧИCЛИM И ЗAПOMHИM
;         KOHTP.CYMMY  C-OБЛACTИ PEЗИДEHTA
;         A ЗATEM БYДEM EE PEГYЛЯPHO CBEPЯTЬ.
;
CALCREZ:UTA
1 VTM @3F ; ДO CEMAФOPA !
:1 ARX MAIN_SW
1 VRM *
1 VTM RES_END-MAIN_SW-@42
:1 ARX MAIN_SW+ @41 ; И ПOCЛE
1 VRM *
13 JMP
;
:HLT @111
AEX SUM
;    ЖДY:ATX SUM
;      13 VJM CALCREZ
;        AEX SUM
;        JANE ЖДY-1
;        XTA SUM
;        JMP ЖДY
;
ЖДY:JMP *
;
END
D_DRIVER:NAME QF
SF_OPEN:ENTRY QF
F_OPEN:ENTRY QF
F_CREAT:ENTRY QF
F_PERM:ENTRY QF
F_CLOSE:ENTRY QF
F_READ:ENTRY QF
F_WRIT:ENTRY QF
INQUE:ENTRY QF ; BXOД ДЛЯ SWING
;*
;***********************************************
;*                                             *
;*   ИHTEPФEЙC C ФAЙЛOBOЙ CИCTEMOЙ IBM/PC      *
;*                                             *
;***********************************************
;*
;*   ФAЙЛOBЫE OПEPAЦИИ OTPAБATЫBAЮTCЯ ПEPИФEPИЙHЫM
;*   ПPOЦECCOPOM.  ДЛЯ ЗAЯBOK HA ЭTИ OПEPAЦИИ ИCПOЛЬ-
;*   ЗYETCЯ KAHAЛ 2 B HAШEЙ CИCTEME OБMEHHЫX OЧEPEДEЙ.
;*           OБЩИЙ ФOPMAT ФAЙЛOBOЙ ЗAЯBKИ:
;*    64   56   48   40   32   24              1
;*    :----:----:----:----:----:----------------:
;*  1 : TN : CN : UN : ST : MT :    A M E M     :
;*    :----:----:----:----:----:----------------:
;*  2 :JOB :ATR :  L E N  :      D A D R E S    :
;*    :----:----:---------:---------------------:
;*
;*   TN - HOMEP ПPOЦECCA-ЗAKAЗЧИKA. ДOБABЛЯETCЯ
;*        ПPИ ПOCTAHOBKE B OЧEPEДЬ.
;*   CN - HOMEP KAHAЛA. ДOБABЛЯETCЯ ПPИ ПOCTAHOBKE
;*        B OЧEPEДЬ.
;*   UN - HOMEP "YCTPOЙCTBA". BЫДAETCЯ ПPИ ЗAKAЗE
;*        ФAЙЛA. ИCПOЛЬЗYETCЯ B OCTAЛЬHЫX OПEPAЦИЯX.
;*   ST - COCTOЯHИE ЗAЯBKИ. BHAЧAЛE BCEГДA = 0.
;*   MT - ПPEИMYЩECTBEHHЫЙ TEГ MACCИBA.
;*   AMEM - ФИЗИЧECKИЙ AДPEC MACCИBA B ПAMЯTИ (CЛOBHЫЙ)
;*   DADRES - AДPEC ПO ФAЙЛY (БAЙTOBЫЙ)
;*   LEN  - ДЛИHA OБMEHHOЙ ПOPЦИИ B БAЙTAX
;*   ATR -  БAЙT ATPИБYTOB ФAЙЛA
;*          (ЗAДAETCЯ BO BCEX ФAЙЛOBЫX OПEPAЦИЯX)
;*   JOB -  KOД ФAЙЛOBOЙ OПEPAЦИИ
;*
;*   JOB=1 : OTKPЫTИE ФAЙЛA.  ПOЛE "AMEM" ЗAДAET ФИЗ.
;*           AДPEC CTPOKИ, COДEPЖAЩEЙ ПOЛHOE ИMЯ ФAЙЛA
;*           HAПPИMEP,  D:/IVANOV/LIBRARY/F1.BIN
;*           ДЛЯ XPAHEHИЯ ПOЛHOГO ИMEHИ OTBEДEHO CПEЦИ-
;*           AЛЬHOE MECTO B HAЧAЛE  И П  ПPOЦECCA.
;*           B ПOЛE "UN" ЗAДAETCЯ ЛOГИЧECKИЙ HOMEP
;*           ФAЙЛA (0:63) Y ПPOЦECCA-ЗAKAЗЧИKA.
;*           ПOCЛE OПEPAЦИИ B "UN" ПOПAДAET CИCTEMHЫЙ
;*           HOMEP ФAЙЛA.
;*
;*   JOB=0 : ЗAKPЫTИE ФAЙЛA.  ЗAДAЮTCЯ: UN, ATR,
;*           A TAKЖE AMEM - AДPEC ПOЛHOГO ИMEHИ ФAЙЛA.
;*
;*   JOB=2 : ЗAПИCЬ ИЗ ПAMЯTИ B ФAЙЛ.
;*   JOB=3 : ЧTEHИE ИЗ ФAЙЛA B ПAMЯTЬ.
;*
;*              A T P И Б Y T Ы   Ф A Й Л A :
;*
;*             8   7   6           3   2   1
;*           :---:---:---:---:---:---:---:---:
;*           : R : W : A :   :   : P : T : S :
;*           :---:---:---:---:---:---:---:---:
;*
;*     R=1 : ЧTEHИE ИЗ ФAЙЛA PAЗPEШEHO;
;*     W=1 : ЗAПИCЬ B ФAЙЛ PAЗPEШEHA;
;*     A=1 : PAЗPEШEHA TOЛЬKO ДOЗAПИCЬ "B XBOCT" ФAЙЛA;
;*     P=1 : ПOCTOЯHHЫЙ ФAЙЛ (HE CTИPAETCЯ ПPИ "CLOSE");
;*     T=1 : OБMEH ПPOИЗBOДИTCЯ C TEГAMИ;
;*     S=1 : KOPOTKИE (48-БИTHЫE) CЛOBA БЭCM-6;
;*
;
PCW
PCBIT
TPP
OБMOЧ
SPORT
OЧEPEДЬ:SUBP QF
ИЗOЧEP:SUBP QF
FIX_PAGE:SUBP QF
ERROR:SUBP QF
DHEX8:SUBP QF
KOHCOЛЬ:SUBP QF
VMD
PSYS
IFP
;
EVENT
MODIF
C:EQU CP ; KAHAЛ
P:EQU PA ; ЛИCT
U:EQU P1 ; ЛOГ.HOMEP
;
FATA
WAITJOB:EQU NAMES
;
;
;
;
;           FATA - TAБЛИЦA OTKPЫTЫX ФAЙЛOB.
;           ===============================
;     BXOДOM B FATA CЛYЖИT HOMEP  0 < UN < 256
;                   B ФAЙЛOBOЙ CИCTEME IBM/PC.
;     NAMES - ПOЛHЫE ИMEHA ФAЙЛOB (256*8 CЛOB).
;     FBOSS - BЛAДEЛЬЦЫ ФAЙЛOB (256 БAЙT)
;     FNUM - ЛOГИЧECKИE HOMEPA Y BЛAДEЛЬЦEB (256 БAЙT)
;     FATR - ATPИБYTЫ ФAЙЛOB (256 БAЙT)
;     FSTAT - CЧETЧИKИ OБMEHOB И OШИБOK (256 ПOЛYCЛOB)
;     FCOOR - TEKYЩИE K-TЫ ПO ФAЙЛY (256 ПOЛYCЛOB)
;     FNPC  - СООТВЕТСТВИЕ НОМЕРОВ ФАЙЛОВ МКБ-->PC
;     FPCN  - СООТВЕТСТВИЕ НОМЕРОВ ФАЙЛОВ PC-->МКБ
;     SFNUM - HOMEPA UN ДЛЯ CПEЦ-ФAЙЛOB 0:63
;     SFATR - CTAHДAPTHЫE ATPИБYTЫ CПEЦ.ФAЙЛOB 0:63
;        CПEЦ-ФAЙЛЫ BCEГДA OTKPЫTЫ И ПPИHAДЛEЖAT
;        CPAЗY BCEM ПPOЦECCAM. OHИ COДEPЖAT ИHФOPMAЦИЮ,
;        ПOCTOЯHHO HEOБXOДИMYЮ CИCTEME ИЛИ ПPOЦECCY.
;
;
;
;
;           FDB - ДECKPИПTOP ФAЙЛA ЮЗEPA:
;     OДHO CЛOBO HA ЛOГИЧECKИЙ HOMEP U=0,...,63
;     C KAЖДЫM ФAЙЛOM U CBЯЗAH БYФEPHЫЙ ЛИCT BFPOOL+U
;     64   56   48   40   32       16  13     1
;     :----:----:----:----:--------:---:-------:
;     : SP : AT : UN : ST :  LEN   : T :  CNT  :
;     :----:----:----:----:--------:---:-------:
;     SP - 0 ИЛИ HOMEP CПEЦИAЛЬHOГO ФAЙЛA +@80
;     AT - БAЙT ATPИБYTOB ФAЙЛA
;     UN - HOMEP B ФAЙЛOBOЙ CИCTEME IBM/PC
;     ST - KOД COCTOЯHИЯ ПOCЛEДHEЙ OБMEHHOЙ ЗAЯBKИ
;    LEN - ДЛИHA ПOCЛ.ПPOЧИTAHHOГO БЛOKA B БAЙTAX
;    CNT - CЧETЧИK ЧИCЛA ЭЛEMEHTOB B БYФEPE ФAЙЛA.
;      T - TИП ЭЛEMEHTA ФAЙЛA (0-CЛOBO, 1-ПOЛCЛOBA,
;                     2-ЧETBEPTЬ CЛOBA, 3-БAЙT)
;
;
CONST
;
FDEF
;
CMD
;
;MOZY=80C5E    ;   - D_DRIVER
;
BEGIN:
SMON БBП
XTA DDPORT
JAEQ FINISH
ANU -1
ATI C ; KAHAЛ OБMEHA
C NTA
AEX DDPORT
ATX DDPORT
;
QUESCAN:C UTC -MAXCHAN ; "ГOЛOBA"
J VTM ; OЧEPEДИ KAHAЛA
QUESCAN1:J BTA QUE<<3
JAEQ BEGIN
ATI J
J UTC -1
J XTA JOB-1
ASFT 32
AAU @FF
ATI PA ; ПОЛЕ ОШИБОК
AAU @40
JAEQ QUESCAN1 ; ЕЩЕ НЕ ГОТОВ
CMON БBП
J MSFT -1
PA UTM -64
;
;        ПPИПИCKA  И П  ЮЗEPA K CBOEMY PAБ.ЛИCTY
;
J XTA JOB-2
ASFT 40
AAU @FF
ATI P2 ; IBM/PC UN
P2 BTA FPCN<<3
ATI U ; VIRT.MKB UN
AEI P2
ASFT -40
J AEX JOB-2
J ATX JOB-2
ASFT 56
ATI TN
TN XTA PCW
AOU @3FF
WMOD WSPAG+N_DRIV+@400
W VTMF HNDLSC
P2 J+M W
;
;        ПEPEKЛЮЧATEЛЬ ПO TИПY OKOHЧEHHOЙ OПEPAЦИИ
;
J XTA JOB-1
ASFT 56
JAEQ ECLOS
AEU 1
JAEQ EOPEN
;
;        OKOHЧEH OБMEH (ЧTEHИE ИЛИ ЗAПИCЬ)
;        ДЛИHY ПPOЧИTAHHOГO БЛOKA (ECЛИ ЧTEHHИE!)
;        И KOД OШИБKИ - B ДECKPИПTOP ЮЗEPA.
;        ECЛИ OБMEH БЫЛ 48-P. CЛOBAMИ БЭCM-6,
;        TO ДEЛAETCЯ PACПAKOBKA.
;
END_EXCH:
AEU 3
ATI R ; 0-ЗAПИCЬ !
CPUSH
U BTA FNUM<<3
ATI I ; ЛOГ.HOM.ЮЗEPA
AAU @80
JAEQ SETANSW ; OБЫЧHЫЙ
;
;        ПPИXOДИTCЯ TYПO PAЗЫCKИBATЬ ЛOГ.HOMEP,
;        ПOД KOTOPЫM Y ЮЗEPA ЗAKAЗAH ЭTOT CПEЦ.ФAЙЛ
;
I VTM 64
SSF:I VRM *+1
U HLT ; - HE HAШЛИ
:I XTA WSPAG+N_DRIV<<10 +FDB-IFCTIM
J AEX JOB-2
AAX =H0000 FF00 0000 0000
JANE SSF
;
;        ДЛИHY ПPOЧИTAHHOГO БЛOKA И KOД OTBETA
;        ЗACЫЛAEM B ДECKPИПTOP I-ГO ФAЙЛA.
;
SETANSW:J XTA JOB-1
ASFT 32
I UTM WSPAG+N_DRIV<<10 +FDB-IFCTIM
I MSFT -2
I ATQ 2
AAU @FFFF ; ДЛИHA B БAЙTAX
ATI IA ;
U A+H FCOOR<<1 ; + TEK.K-TЫ
U ATH FCOOR<<1 ; ПO ФAЙЛY
ITA PA
I MSFT -1
I ATB 3 ; KOД OTBETA
:JAEQ NORMAL
AEU 6
JAEQ REOPEN
AEU 6
HLT 6 ; <<<???>>>
U HTA FSTAT<<1
A+U 1
U ATH FSTAT<<1
AAU 8
JAEQ REPEAT
NORMAL:U HTA FSTAT<<1
AAU @FFFF0 ; ГAШ.CЧ.OШ.
A+U @10 ; +1 K CЧ.OБM.
U ATH FSTAT<<1
;
;        ПPИПИШEM ЛИCT ЮЗEPA (OH EЩE ЗAHЯT B OБMEHE!)
;        K CBOEMY PAБ.ЛИCTY, И БEЗ ПOMEX ПEPEЛOПATИM.
;
J XTA JOB-2
AOU @3FF
WMOD WSPAG+N_DRIV+@400
ASFT 10
AAU @3FF
ATI P2 ; ФИЗ.ЛИCT
U BTA FATR<<3
AAU 1
JAEQ OPTASK ; 64-BITS
;
J XTA JOB-2
AAU @3FF
AOU WSPAG+N_DRIV<<10
ATI W
ITA IA
AEU @600
:JANE *+1 ; ЛИCT
UTC 256-1024 ; CEKTOP
:I VTM 1024-1
SETR БПTЧ+БПTЗ+БПИHT+БЧOП
UNPACK:W TTA
AEN ; ИHBEPCИЯ ЗHAKA
ASNA @400+4 ; PAЗMHOЖEHИE
AEN ; OБPATHO
W TTX
W UTM 1
I VRM UNPACK
CLRR БПTЧ+БПTЗ+БПИHT+БЧOП
;
OPTASK:
SMON БBП
P2 HTA TPP<<1 ; PACKPOEM
AAU @F7FFF ;  ПO
P2 ATH TPP<<1 ; OБMEHY
TN XTA PCW
AAN W_SWIN
JAEQ OPTASK1
;
;       ПPOЦECC, ЖДABШИЙ ПOДKAЧKИ CTPAHИЦЫ,
;       B AKTИBИЗAЦИИ HE HYЖДAETCЯ !
;
TN AEX PCW
TN ATX PCW
AAN W_EXCH
JANE OPTASK1
;       JMP ENDJOB
;   <<< BPEMEHHO BMECTO ПPEДЫД.KOMAHДЫ:
TN VTM N_SWING
IA VTM W_EXCH
JMP ACT_USER ; OTKPOEM SWING-A
;   >>>>>>>>>>>>>>>>>>>>>
;
OPTASK1:
IA VTM W_EXCH
TN XTA PCW
IA AAN ; ЗAKPЫT ПO OБMEHY
JANE ACT_USER ; - ДA
UTA E_EXCH
ASFT -40
AOU 1 ; ЮЗEPY - COБЫTИE
JMP SYSINT ; "KOHEЦ OБMEHA"
;
;
;       CBEPШИЛOCЬ ЗAKPЫTИE ФAЙЛA. ЧИCTKA FATA.
;
ECLOS:U ATB FBOSS<<3
U ATB FNUM<<3
U ATB FATR<<3
U ATH FCOOR<<1
U ATB FNPC<<3
P2 ATB FPCN<<3
W CLRF ; CLEAR HNDLSC-BIT
U MSFT -3
U UTM NAMES
W VTM 7
:U ATX
U UTM 1
W VRM *-1
;     JMP ENDJOB
IA VTM W_EXCH ; BAPИAHT C
JMP ACT_USER ; ЗAKPЫTOЙ ЗAДAЧEЙ
;
;       OKOHЧEH ЗAKAЗ HA OTKPЫTИE ФAЙЛA.
;
EOPEN:PA JMNE EOPEN1 ; НЕ ЗАКАЗАЛСЯ
W FTA
JANE REOPEN ; "НАЛОЖЕНИЕ НОМЕРОВ"
W SETF ; SET HNDLSC-BIT
EOPEN1:XTA WAITJOB
JANE REOPEN1
;
;       ПOЛЯ "ATR","UN" И "ST" - B ДECKPИПTOP ЮЗEPY
;
J XTA JOB-1
ATI W ; HOM.Y ЮЗEPA
ASFT 48
W UTM WSPAG+N_DRIV<<10 +FDB-IFCTIM
W MSFT -3
W ATB 1 ; "ATR"
ITA PA
W ATB 3 ; "ST"
IA VTM IF_FIX
JANE ACT_USER ; - HE ЗAKAЗAЛCЯ
:U UTM 1
U BTA FNPC<<3
JANE *-1
U ATH FCOOR<<1
ITA P2
U ATB FNPC<<3
ITA U
W ATB 2 ; "un"
P2 ATB FPCN<<3
;
;        PEГИCTPAЦИЯ ФAЙЛA B "FATA"
;
ITA TN
U ATB FBOSS<<3 ; - BЛAДEЛEЦ
J XTA JOB-1
U ATB FNUM<<3 ; - HOMEP Y HEГO
ASFT 48
U ATB FATR<<3 ; - ATPИБYTЫ
W BTA
JAEQ NOSPEC
U ATB FNUM<<3
ATI W ; PEГИCTPAЦИЯ B
ITA U ; CПИCKE CПEЦ.ФAЙЛOB
W ATB SFNUM<<3 -@80
NOSPEC:
U MSFT -3
W VTM 7
:W XTA WSPAG+N_DRIV<<10 +PATHNAME-IFCTIM
U UTC NAMES
W ATX
W VRM *-1
;
ACT_USER:
SMON БBП
TN XTA PCW
IA AON
IA AEN
TN ATX PCW
UTA 2 ; AKTИBAЦИЯ ЮЗEPA
;
SYSINT:
ITS TN
ASFT -32
15 AOX
PINT
;
;          OTPAБOTAHHAЯ ЗAЯBKA ИЗЫMAETCЯ ИЗ OЧEPEДИ
;
ENDJOB:
J MSFT 1
SMON БBП
R VTM QUESCAN
JMP ИЗOЧEP
;
;          ПOBTOPEHИE OБMEHA ПPИ OШИБKAX
;
REPEAT:TN VTM N_DRIV
J MTJ PA
15 MTJ I
J UTA JOB-2
ASFT -1
ATI W
J VTM 3
XTA ="ER.DISK:"
:W HTS
JMPS DHEX8
:W UTM 1
J VRM *-1
UTS @0D0A
ASFT -48
15 ATX
RR VJM KOHCOЛЬ
I MTJ 15
PA MTJ J
;
REPEAT1:SMON БBП
J XTA JOB-2
ASFT 40
AAU @FF
ATI U
U AEB FNPC<<3
ASFT -40
J AEX JOB-2
AAX =HFFFF FF00 FFFF FFFF
AON 64-40 ; "ГOTOB"
J ATX JOB-2
J ATX DUBJOB-2
J XTA JOB-1
J ATX DUBJOB-1
UTA
ATX PPINF
JMP QUESCAN
;
;      ПОВТОРНОЕ ОТКРЫТИЕ ВСЕХ ФАЙЛОВ ПОСЛЕ СБОЯ РС
;
REOPEN:J XTA JOB-2
ATX WAITJOB
J XTA JOB-1
ATX WAITJOB+1
;
PAUSE:W VTM 31
U VTM 3
UTA
:W ATX FPCN
W VRM *
:U ATX HNDLSC
U VRM *
U VTM -255
XTA =H0000 03FF 0000 0008
PINT
;
REOPEN2:U BTA FNPC<<3 +255
JAEQ REOPEN3
U UTM 255
U BTA FATR<<3
AOU @100 ; "OPEN"
ASFT -48
AOI U
J ATX JOB-1
RMOD FATA>>10 & @3FF + @400
AAU @FFC00
UTS N_DRIV
ASFT -16
U AOU @200 ; U + CN=2
ASFT -40
15 AOX
U MSFT -3
A+I U
J ATX JOB-2
JMP REPEAT1
;
REOPEN1:
PA JMNE PAUSE ; НЕ ЗАКАЗАЛСЯ
J XTA JOB-1
ATI U
P2 ATB FPCN<<3
ITA P2
U ATB FNPC<<3
U UTM -255
;
REOPEN3:U VLM REOPEN2
XTA WAITJOB
J ATX JOB-2
XTA WAITJOB+1
J ATX JOB-1
UTA
ATX WAITJOB
JMP REPEAT1
;
;      BCE. PAБOT БOЛEE HET. ЗAKPЫBAEMCЯ.
;
FINISH:
UTA 5
PINT
JMP BEGIN
;
;
;      *****************************************
;     *  BXOДЫ OT ЮЗEPA ДЛЯ ФAЙЛOBЫX OПEPAЦИЙ:  *
;      *****************************************
;
; ---  0. ЗAKPЫTИE ФAЙЛA. ДOCБPOC, ECЛИ HAДO, БYФEPA.
;         HA BXOДE: TN-HOMEP ПPOЦECCA, U-ЛOГ.HOM.ФAЙЛA.
;         BЫXOД: RR.
;
F_CLOSE:MPAC I ; J,W,R
15 ATD ; - CПACAEM
F_CL1:U XTA FDB
JAEQ CLFDB
ASFT 40
AAU @FF
ATI R ; "UN"
R BTA FNPC<<3
A-U 5
JALT CLFDB ; БРЕД !
U XTA FDB
AAU @1FFF
JAEQ NOPUSH ; БYФEP ПYCT
U XTA FDB
AAN 64-51
JAEQ NOPUSH ; BPEM.ФAЙЛ
NTA 64-55
AON 64-54
U AAX FDB
JAEQ NOPUSH ; TOЛЬKO ЧTEHИE
SMON БBП
U QTA TMP<<2 +BFPOOL
ASFT 4
JAEQ NOPUSH ; YЖE CБPOШEH
ATI J
J RMOD @800
AAU 4 ; "БИЗM"
JAEQ NOPUSH
;
PUSH:U UTA BFPOOL ; БYФ.ЛИCT
AON 64-32 ; ФЛ."ДOCБPOC"
ASFT -32
AOU 10 ; ЗAKAЗ SWING-Y
PINT
JANE NOPUSH ; - ПPИHЯT
NTA 64-40 ;
AOU 8 ; ПAYЗA 0.25 CEK
PINT
JMP F_CL1
;
NOPUSH:U XTA FDB
JALT CLFDB ; CПEЦ.ФAЙЛ
AAX =H0000 FF00 0000 0000
R HTS FCOOR<<1
:JANE *+1
UTC 4 ; ПУСТОЙ ФАЙЛ
:UTA
R AOB FATR<<3
ATI W ; "ATR"
AAU 4
JANE ZERNAM ; ПOCT.ФAЙЛ !
;
RMOD FATA>>10 & @3FF + @400
AAU @FFC00
R MSFT -3
A+I R
15 AOX ; ФИЗ.AДPEC ИMEHИ
UTS
ZERNAM:J VTM
R VJM INQUE
;    <<<< BPEMEHHO C ЗAKPЫTИEM ЗAДAЧИ
UTA
PINT
;    >>>>>>>>>>>>>>>>>>>>>
;
CLFDB:
CMON БBП
UTS ; ДECKPИПTOP
U STX FDB ; ГACИTCЯ
JMP RET_USER
;
;        БЛOK ПOCTAHOBKИ ЗAЯBKИ B OЧEPEДЬ.
;        HEДOФOPMИPOBAHHAЯ ЗAЯBKA - B CTEKE.
;        ДOБABЛЯЮTCЯ: TN,JOB,ATR, HOMEP KAHAЛA.
;        YKAЗATEЛЬ CTEKA YMEHЬШAETCЯ HA 1.
;        ПOPTЯTCЯ: J,W
;
INQUE:ITS TN
ASFT -56
AON 64-50 ; KAHAЛ=2
15 AOX -2
15 ATX -2
ITA J
ASFT -8
AOI W ; + ATPИБYTЫ
ASFT -48
15 AOX
15 ATX
15 UTM -2
15 MTJ J
CHREOP:
SMON БВП
XTA WAITJOB
JANE WAITREOP
J XTA
ASFT 40
AAU @FF
ATI W
W AEB FNPC<<3
ASFT -40
J AEX
J ATX
JMP OЧEPEДЬ
;
WAITREOP:XTA =H0000 03FF 0000 0008
PINT
JMP CHREOP
;
; ---  1. OTKPЫTИE ФAЙЛA.  ИMЯ ЗAДAETCЯ B ИП ЮЗEPA
;     TN - HOMEP ПPOЦECCA, U - ЛOГ.HOMEP, W - ATPИБYTЫ
;     HA BPEMЯ OПEPAЦИИ ПPOЦECC ДEЗAKTИBИPYETCЯ.
;     BЫXOД: RR.  CYMMATOP=<HOM.OШИБKИ>
;
F_OPEN:MPAC I ; J,W,R
15 ATD ; - CПACAEM
F_OP1:UTA
U ATX FDB
F_OP2:J VTM 1
SMON БBП
TN XTA PCW
AON IF_FIX ; ФИKCAЦИЯ ИП
TN ATX PCW
AAX =H0000 0000 000F FC00
A+U PATHNAME-IFCTIM
ITS U ; HOMEP Y ЮЗEPA
R VJM INQUE
UTA ; ДEЗAKTИBAЦИЯ
PINT
U XTA FDB
ASFT 32
AAU @3F
JANE CLFDB ; HE OTKPЫЛCЯ
JMP RET_USER
;
; ---  F_CREAT - OTKPЫTИE CYЩECTBYЮЩEГO ИЛИ
;      COЗДAHИE HOBOГO ФAЙЛA C ATPИБYTAMИ E4.
;      ЗAДAЮTCЯ: TN,U.  BЫXOД:R.  ПOPTЯTCЯ:W,RR.
;      F_PERM - ПPEBPAЩEHИE BPEMEHHOГO ФAЙЛA
;      B ПOCTOЯHHЫЙ. BЫXOД:R.  ПOPTИTCЯ RR.
;      B OБOИX CЛYЧAЯX ПPИ HEYДAЧE CYMMATOP=0.
;
F_CREAT:W VTM @E0
RR VJM F_OPEN
F_PERM:U XTA FDB
R JAEQ ; HEYДAЧA
AON 64-51
U ATX FDB
ASFT 40
AAU @FF
ATI RR
RR BTA FATR<<3
AOU 4
RR ATB FATR<<3
R JMP
;
; ---  SF_OPEN - ЗAKAЗ HA ИCПOЛЬЗOBAHИE CПEЦ-ФAЙЛA
;       I ЗAДAET CИCTEMHЫЙ HOMEP CПEЦ-ФAЙЛA (0,1..)
;       TN - HOM.ПPOЦECCA, U-ЛOГ.HOMEP Y ЮЗEPA
;       ATPИБYTЫ W OПPEДEЛЯЮTCЯ ПO CИCTEMHOЙ TAБЛИЦE.
;       ИMЯ ФAЙЛA ПEPEПИCЫBAETCЯ B PATHNAME, ПPИЧEM
;       PACШИPEHИE "**" ЗAMEHЯETCЯ HA HOMEP ПPOЦECCA.
;
SF_OPEN:MPAC I
15 ATD
I BTA SFATR<<3
ATI W ; ATPИБYTЫ
:I JMNE *+1
UTC OSFILE-MAINFILE
:J VTM MAINFILE
I UTA @80
ASFT -56
U ATX FDB
I BTA SFNUM<<3
JAEQ NEWSF
;
;        KЛИEHT "ПPИCACЫBAETCЯ" K YЖE OTKPЫTOMY ФAЙЛY
;
W MSFT -8
AOI W
W MSFT 8
ASFT -40
U AOX FDB
U ATX FDB
UTA
JMP RET_USER
;
;         ПEPEПИCЬ ИMEHИ  I-ГO ФAЙЛA B PATHNAME
;
NEWSF:R VTM
TRNAME:J XTA
J UTM 1
R ATX PATHNAME
R UTM 1
AAU @FF
JANE TRNAME
I VRM NEWSF
;
R VTMB PATHNAME
CHSTAR:R BTA
JAEQ F_OP2 ; - HA OTKPЫTИE
AEU 42 ; "*"
JAEQ SPECOWN
R VLM CHSTAR
;
;        ЛИЧHЫЙ CПEЦ-ФAЙЛ ЮЗEPA (YKAЧKA,ЛИCTИHГ И T.П.)
;          ( CПEЦИAЛЬHOГO Y HEГO - TOЛЬKO ИMЯ !!!)
;
SPECOWN:ITA TN
JMPS DHEX8
:R ATB 1
ASFT 8
R ATB
JMP F_OP1
;
;
; ---  2,3.  OБMEH C ФAЙЛOM. БEЗ ЗAKPЫTИЯ ЗAДAЧИ
;         TN - HOMEP ПPOЦECCA,  U - ЛOГ.HOMEP ФAЙЛA
;         NP - MAT.AДPEC БYФEPA,  W - MAIN TAG
;         CYMMATOP = LEN + DADRES.
;         BЫXOД: RR.
;
F_WRIT:
15 ATX 3
MPAC I ; J,W,R
15 ATD ; - CПACAEM
J VTM 2
U XTA FDB
AAN 64-49 ; KOPOTKИE CЛOBA
JAEQ NOPRESS ; - HET
;         YПЛOTHEHИE ПEPEД ЗAПИCЬЮ 48-P. CЛOB
15 XTA 1
ASFT 32
AAU @F800
:JAEQ *+1 ; CEKTOP
UTC 1024-256 ; ЛИCT
:R VTM 256-1
SETR БПTЧ+БПTЗ+БПИHT
;
PRESS:NP UTC
R XTA
ASNA @400-4
UTY 3 ; OLD COM TAG
NP UTC
R TTX
R VRM PRESS
NP JMNE NOPRESS
;
SETR БВП
XTA @3FF
RMOD @401
ATI R
RMOD @400
WMOD @401
XTA @400
ASNA @400-4
UTY 3
TTX @400
ITA R
WMOD @401
;
NOPRESS:
CLRR БВП+БПTЧ+БПTЗ+БПИHT
JMP F_EXCH
;
F_READ:15 ATX 3
MPAC I
15 ATD
J VTM 3
;
F_EXCH:15 UTM 2
U XTA FDB ; "UN"
AAX =H0000 FF00 0000 0000
15 ATX -2
ITA NP ; + OTHOCИT.
AAU @3FF ; AДPEC HA ЛИCTE
W MSFT -24
AOI W ; + MAIN TAG
15 AOX -2
15 ATX -2
NP MTJ I
IA MTJ R
NP MSFT 10
ITA NP
AAU @3FF
ATI NP ; MAT.ЛИCT
IA VTM 0 ; ЗAKP.ЛИCTA
JMPS FIX_PAGE ; ПO OБMEHY
:I MTJ NP
R MTJ IA
ITA W ; ФИЗ.ЛИCT
ASFT -10
15 AOX -2
15 ATX -2
ASFT 40
AAU @FF
ATI R ; "UN"
R BTA FATR<<3
STI W
R VJM INQUE
;
SETR БПTЧ+БПИHT
NP XTA @3FF ; <<< ЗAKP.ДO KOHЦA>>>
CLRR БПTЧ+БПИHT
;
;       OБЩИЙ BЫXOД K ЮЗEPY :
;
RET_USER:15 ATX 1 ; CYMM.BЫXOДA
15 DTA
MUNP I ; J,W,R
15 XTA 3
RR JMP
;
END
TTANAL:NAME QF
;*
;*                     ...A B HYTPE Y EЯ - ДYMATEЛЬ,
;*                        PEШATEЛЬ И OTBEЧATEЛЬ.
;*                                 (ПPOФ. BЫБEГAЛЛO)
;*
;***************************************************
;*                                                 *
;*      AHAЛИЗATOP COOБЩEHИЙ, ПOЛYЧEHHЫX           *
;*          C OПEPATOPCKOЙ KOHCOЛИ                 *
;*                                                 *
;***************************************************
;*
;*    AKTИBИЗИPYETCЯ OT ПPEPЫBAHИЯ ПO BBOДY C KOHCOЛИ.
;*    COOБЩEHИЯ MOГYT БЫTЬ AДPECOBAHЫ KAK CИCTEME, TAK
;*    И KOHKPETHOMY ПPOЦECCY NN.  B ПOCЛEДHEM CЛYЧAE
;*    TTANAL OCYЩECTBЛЯET ПOЧTOBYЮ ФYHKЦИЮ.  OБЩИЙ BИД:
;*
;*         QD NN<TEKCT COOБЩEHИЯ> <RETURN>
;*
;*    ECЛИ COOБЩEHИE AДPECOBAHO CИCTEME, TO NN=00.
;*    ECЛИ ПPИ ЭTOM ПEPBЫЙ CИMBOЛ TEKCTA HE ЯBЛЯETCЯ
;*    ШECTHAДЦATИPИЧHOЙ ЦИФPOЙ, NN MOЖHO OПYCTИTЬ.
;*
OБMOЧ
PCW
PCBIT
PSYS
SPORT
RRBIT
TPP
FATA
VMD
EVENT
ATQUE:LCB LTQ,ATQ
;
MAINTERM:EQU 0
KOHCOЛЬ:SUBP QF
DHEX8:SUBP QF
HEXB1:SUBP QF
F_OPEN:SUBP QF
F_CLOSE:SUBP QF
STARTJOB:SUBP QF
PACKDATE:SUBP QF
PACKTIME:SUBP QF
WEEKDAY:SUBP QF
DATE:SUBP QF
TIME:SUBP QF
;
CODE
;
IFP
BUF:BLOCK NAME(2),STR(14),LSTADR,DIR
MODIF
T:EQU PA ; YK.ПO CTPOKE
C:EQU CA ; TEK.CИMBOЛ
;
CONST
;
SYSDIR:CHAR "MEMORY"
:CHAR "START"
:CHAR "DEBUG"
:CHAR "TECTAY"
:CHAR "HEXCALC"
:CHAR "DATE"
:CHAR "OSDATE"
:CHAR "OUTPUT"
:CHAR "KILL"
:HEX 0
;
CMD
;
;       ECЛИ ECTЬ BXOДHAЯ CTPOKA - ПEPEПИШEM K CEБE
;
;MOZY=81551      ;   -  TTANAL
;
BEGIN:XTA CON_IN
JANE TRAN
UTA 5
PINT
TRAN:TN VTM N_TTAN
I VTM 10
T VTMB STR
P1 VTM 2 ; "SERVER"
TRAN1:I XTA CON_IN
I ATX STR
I VRM TRAN1
UTA
ATX CON_IN
T BTA
ATI C
JAEQ EDIR
;
;      ПPOПYCK ЛEBЫX ПPOБEЛOB
;
:T BTA
T UTM 1
AEU @20
JAEQ *-1
;
;       ПPOБA HA KOД AДPECATA
;
T BTA -1
JMPS HEXB1
:JALT SYSADR
ASFT -4
T BTS
JMPS HEXB1
:15 AOX
JALT ERRADR
ATI NP
NP JMEQ SYSADR
ITA NP
A-U QPROC
JAGE SYSADR
NP XTA PCW
JAEQ ERRADR
;
;       COOБЩEHИE ПEPEAДPECYETCЯ ПPOЦECCY NP
;
JMP ERRDIR
;
;       COOБЩEHИE AДPECOBAHO CИCTEME
;
SYSADR:XTA =" "
ATX DIR
ATX NAME
ATX NAME+1
I VTMB DIR
T UTM -2
;
GIVDIR:T UTM 1
T BTA
ATI C
JAEQ EDIR
I ATB
I UTM 1
AEU @20
JANE GIVDIR
;
;        ПOИCK B CПИCKE ПPИKAЗOB
;        (ПO ПEPBЫM 3 CИMBOЛAM)
;
EDIR:W VTM SYSDIR
NP VTM QPROC-1
:W XTA
JAEQ START ; "SERVER"
AEX DIR
ASFT 40
W JAEQ SW-SYSDIR
W VLM EDIR+1
;
SW:JMP MEMORY
:P1 VTM 1
JMP START
:P1 VTM 0
JMP START ; - DEBUG
:P1 VTM -1
JMP START ; - TECT AY
:R VTM HEXCALC
JMP HEXNUM  ; - HEXCALC
:T MTJ IA
JMP GETDAT ; - DATE
:I VTM OSDATE
JMP TOTER ; - OSDATE
:I VTM STR
JMP TOTER ; - OUTPUT
:R VTM KILL
JMP HEXNUM ; - KILL
;
;      ************************************
;       START <ИMЯ ФAЙЛA C ПAKETOM ЗAДAЧИ>
;      ************************************
;       HEOПOЗHAHHAЯ ДИPEKTИBA  TPAKTYETCЯ
;       KAK ЗAПYCK BATCH-ФAЙЛA !!!
;
;
;      BЫБOP CЧETHOГO KAHAЛA
;
START:NP XTA PCW
JAEQ FORMIF
NP VRM *-1
HLT 6
;
;       ФOPMИPOBAHИE  И П  ЗAПYCKAEMOГO ПPOЦECCA
;       ДЛЯ  И П  OTДAEM CBOЙ PAБOЧИЙ ЛИCT.
;       ИП ЮЗEPA COЗДAEM HA OCHOBE ИП ДИCПETЧEPA
;
FORMIF:I VTM 1023
UTA
:I ATX WSPAG+N_TTAN<<10
I VRM *
I VTM WSPAG+N_TTAN<<10 -IFCTIM
J VTM FDB-IFCTIM+1 ; ФAЙЛЫ:0,1
FIF1:J XTA IFCTIM
J ATX WSPAG+N_TTAN<<10
J VRM FIF1
I MTJ W
W UTM TMP
W MSFT -2
UTA
J VTM BFPOOL-WSPAG
:J UTC WSPAG ; БEЗ CИCT.
W ATQ ; ЛИCTOB !!!
J VRM *-1
;
XTA DIR ; KOД ДИPEKTИBЫ
I ATX REGSCAL ; ЗAПYCKA
ITA P1
ASFT -32
I ATX SAVREG ; И1,И2
;
UTA SAVREG+16
I ATX ASTEC ; PAПY
UTA SAVREG+10
ASFT -32
I ATX SAVREG+7 ; И15
UTA STARTJOB
ASFT -32
I ATX SAVREG+8 ; CЧAC
NTA 32-PД
AON 32-POA
I ATX SAVREG+9 ; PP+PPP
SMON БBП+БПTЧ+БПИHT
XTA CLOCK ; ACTP.BPEMЯ
I ATX TCLOSE ; ЗAПYCKA
;
;         OTДAEM CBOЙ ЛИCT ЮЗEPY
;
QTA DTMP<<2 +WSPAG+N_TTAN
ASFT 4
ATI J
UTA @F
ATQ DTMP<<2 +WSPAG+N_TTAN
UTA
WMOD WSPAG+N_TTAN +@400
QTA PCNT<<2 +3
A-U 1
ATQ PCNT<<2 +3
;
UTA IF_LIST
ASFT -16
AOU @F00
AOI NP
J ATH TPP<<1
ITA J
ASFT -10
AON B_BRAN
AON IF_FIX
NP ATX PCW
UTA QPROC-1 ; "OБPATHЫЙ"
A-I NP ; HOMEP ПPOЦECCA
ASFT -16
AON 64-49 ; KЛACC=2
NP ATX TABPRT
NTA E_STOP-1
NP ATX M_EVENTS
ITA NP
ASFT -32
AOU 2
PINT
ITA NP
JMPS DHEX8
:AAU @FFFF
ASFT -8
AOX ="ДAЧИ-'0''0'."
ATX NAME+1
XTA ="CTAPT ЗA"
ATX NAME
XTA =Z"'@0A''@0D'"
ATX STR
NAMOUT:I VTM NAME
JMP TOTER
;
;       *********************************
;            KILL <НОМЕР ПРОЦЕССА>
;       *********************************
;
KILL:JALT ERRNAM
ITA IA
A-U QPROC
JAGE ERRNAM
IA XTA PCW
JAEQ ERRNAM
AAN P_SYST
JANE ERRADR
SMON БВП
IA XTA PCW
AON B_BRAN
AEN B_BRAN
IA ATX PCW
IA UTA E_STOP<<8
ASFT -32
AOU 1
PINT
JMP BEGIN
;
;       *********************************************
;        MEMORY <ИMЯ, AДPEC ИЛИ ПYCTO> (CMEЩ.)KOЛИЧ.
;       *********************************************
;                BЫДAЧA COДEPЖИMOГO ПAMЯTИ.
;
MEMORY:P1 VTM ; CMEЩEHИE
P2 VTM ; KOЛИЧECTBO
C JMEQ NEXTADR
ATX LSTADR ; =0
I VTMB NAME+1
W VTM ; TИП=<AДPEC>
;
;        BЫБOPKA OПEPAHДOB ДИPEKTИBЫ "MEMORY"
;
GIVOPER:T UTM 1
T BTA
ATI IA
IA UTM -@28 ; "("
IA JMLE EOPER1
I ATB
I UTM 1
:W JMNE *+1
JMPS HEXB1
:JALT TYP1
XTS LSTADR
ASFT -4
15 AOX
ATX LSTADR
JMP GIVOPER
TYP1:W VTM 1 ; TИП=<ИMЯ>
JMP GIVOPER
;
EOPER1:JAEQ EOPER
RI VTM 1
:IA JMEQ *+1
RI VTM
GIVOPER1:T UTM 1
T BTA
JAEQ EOPER
JMPS HEXB1
:JALT GIVOPER2
RI ITS P2
ASFT -4
15 AOX
RI ATI P2
JMP GIVOPER1
GIVOPER2:RI VRM GIVOPER1
;
;        ПOИCK, ECЛИ HAДO, B CПИCKE ЗAГPYЗKИ
;        ПCEBДOИMЯ  IFPROC<NN> - BЫДAЧA  И П.
;
EOPER:W JMEQ NEXTADR ; - AДPEC
W VTM LOADLIST
XTA NAME+1
ATX NAME
AEX ="IFPROCNN"
ASFT 16
JANE SLL
XTA NAME
AAU @FF
JMPS HEXB1
:JALT SLL
ATI NP
XTA NAME
ASFT 8
AAU @FF
JMPS HEXB1
:JALT SLL
ASFT -4
AOI NP
ATI NP
JAEQ ERRADR
A-U QPROC
JAGE ERRADR
NP XTA PCW
AAU @3FF
A+U WSPAG+N_TTAN<<10
ATX LSTADR
NP XTA PCW
AOU @3FF
WMOD WSPAG+N_TTAN +@400
JMP NEXTADR
;
SLL:W XTA
AEX =H2020 2020 2020 2020
JAEQ ERRNAM
W XTA
AEX NAME+1
W UTM 2
JANE SLL
W XTA -1
ATX LSTADR
;
;         ИЗBЛEЧEHИE CЛOBA ПO MAT.AДPECY.
;            ФOPMИPOBAHИE CTPOKИ:
;    <ИMЯ>   MAT.AДP:XXXXX, ФИЗ: XXXXX, KOД: XX...X
;
NEXTADR:
XTA ="MAT.AДP:"
ATX STR
LOOPOUT:XTA LSTADR
A+I P1
P1 VTM
EXTF 64-20
ATX LSTADR
JMPS DHEX8
:ATX STR+1
XTA =",  ФИЗ: "
ATX STR+2
XTA LSTADR
ASFT 10
AAU @3FF
ATI 13
SETR БЗO+БПHП+БПTЧ+БПИHT+БЧOП
13 RMOD @400
AAU @3FF
ATI IA
JMPS DHEX8
:AAU @3FFFF
ASFT -16
AOX =" П:0'0''0'  "
ATX NAME+1
IA UTM -@200
IA JMLT PROTECT
13 RMOD @400
AEX LSTADR
AAU @FFC00
AEX LSTADR
ATI IA
XTA LSTADR
ATI 13
A+U 1
ATX LSTADR
13 TTA ; ЧTEHИE CЛOBA
CLRR БЗO+БПHП+БПTЧ+БПИHT+БЧOП
15 YTX ; - TEГ
ITS IA
JMPS DHEX8
:ATX STR+3
XTA=",  ИHФ: "
ATX STR+4
15 XTA -1
ASFT 32
JMPS DHEX8
:STX STR+5
JMPS DHEX8
:STX STR+6
JMPS DHEX8
:AAU @FFFF
ASFT -24
AOX =" T:'0''0''@0A''@0D''0'"
ATX STR+7
LOUT1:I VTM NAME
RR VJM TOTER+1
P2 JMEQ BEGIN
P2 VRM LOOPOUT
;
;      AДPEC - ИЗ YKAЧAHHOЙ CTPAHИЦЫ
;
PROTECT:
CLRR БЗO+БПHП+БПTЧ+БПИHT+БЧOП
XTA =" - ЗAЩИЩ"
ATX STR+2
XTA =Z"EH!'@0A''@0D'"
ATX STR+3
JMP NAMOUT
;
;        *************************************
;         DATE <ПYCTO ИЛИ HOBЫE ДATA И BPEMЯ>
;        *************************************
;
GETDAT:IA UTM 1
IA BTA
A-U @20
JAEQ GETDAT
JALT PRIDAT
RR VJM PACKDATE
JAEQ ERRDIR
ATI P1 ; HOBAЯ ДATA
XTA CLOCK
AEU -1
A/L =86400000000
YTA64
A/L =1000000
ATI P2 ; CTAPOE BPEMЯ
:IA BTA -1
IA UTM 1
A-U @20
JAEQ *-1
JALT OLDTIME
IA UTM -2
RR VJM PACKTIME
JAEQ ERRDIR
ATI P2 ; HOBOE BPEMЯ
OLDTIME:ITA P1
A*U 86400
A+I P2
A*L =1000000
AEU -1
ATX CLOCK
;
;        PAЗГPYЗИM PAДИ TAKOГO CЛYЧAЯ
;        OЧEPEДЬ ПPOЦECCOB, CИДЯЩИX HA ПAYЗE
;
CLOPAUS:XTA ATQ
AAU @FF
JAEQ CLOP1
ASFT -32
AOU 9
PINT
CLOP1:XTA LTQ
JANE CLOPAUS
;
;       BЫДAЧA TEKYЩИX ДATЫ И BPEMEHИ
;
PRIDAT:CP VTM BUF
CP MCJ 15
XTA ="CEГOДHЯ"
UTS -1
RR VJM WEEKDAY
UTS -1
RR VJM DATE
XTS =" BPEMЯ: "
UTS -1
RR VJM TIME
UTS @0A0D
ASFT -48
15 ATX
15 MCJ CP
I VTM BUF
JMP TOTER
;
;        *************************************
;           KAЛЬKYЛЯTOP: HEXCALC AAA+-*/BBB
;        *************************************
;
HEXCALC:W VTM HPL
C UTM -PLUS
C JMEQ HC2
W VTM HMIN
C UTM PLUS-MINUS
C JMEQ HC2
W VTM HMUL
C UTM MINUS-MUL
C JMEQ HC2
W VTM HDIV
C UTM MUL-DIV
C JMNE ERRDIR
HC2:IA MTJ P1
R VJM HEXNUM
C JMNE ERRDIR
IA JMEQ ERRDIR
ITA P1
W JMP
HPL:A+I IA
JMP HCEND
HMIN:A-I IA
JMP HCEND
HMUL:A*I IA
JMP HCEND
HDIV:A/I IA
JMP HCEND
;
HCEND:I VTM STR+1
JMPS DHEX8
:AAX =H0000 00FF FFFF FFFF
AOX =Z" = "
I ATX
XTA =Z"'@0A''@0D'"
I ATX 1
JMP TOTER
;
;
;        BЫБOPKA ШECTHAДЦATИPИЧHOГO ЧИCЛA
;
HEXNUM:IA VTM
HN:T UTM 1
T BTA
ATI C
R JAEQ
AEU BL
JAEQ HN
AEU BL
JMPS HEXB1
:R JALT
IA MSFT -4
AOI IA
ATI IA
JMP HN
;
ERRNAM:I VTM =Z"TAKИX HE ДEPЖИM!'@0A''@0D'"
JMP TOTER
ERRDIR:I VTM =Z"OШ.KOMAHДA.'@0A''@0D'"
JMP TOTER
ERRADR:I VTM =Z"OШ.HOMEP ПPOЦECCA.'@0A''@0D'"
TOTER:RR VTM BEGIN
:J VTM MAINTERM
JMP KOHCOЛЬ
END
DHEX8:NAME QF
HEXB1:ENTRY QF
;*
;***   DHEX8 - ПEPEBOД ДBOИЧHOГO 32-PAЗPЯДHOГO
;*             ЧИCЛA B TEKCTOBЫЙ 16-PИЧHЫЙ BИД.
;*             APГYMEHT И PEЗYЛЬTAT HA CYMMATOPE.
;***   HEXB1 - ПEPEBOД OДHOГO CИMBOЛA ИЗ 16-PИЧHOГO
;*             TEKCTOBOГO BИДA B 4-БИTHOE ДBOИЧHOE
;*             ЧИCЛO. ECЛИ ЦИФPA HE ШECTHAДЦATИPИЧHAЯ
;*             PEЗYЛЬTAT = -1.
;*
CMD
;
;MOZY=80BA3     ;   -  DHEX8
;
DHEX8:
ASFT -32
AUX =H0F0F 0F0F 0F0F 0F0F
15 ATX
ARX =H0606 0606 0606 0606
AAX =H1010 1010 1010 1010
ASFT 2
15 ATX ; 04
ASFT 1
15 AOX -1 ; 06
ASFT 1
15 AOX ; 07
15 ARX
ARX ="00000000"
RETS
;
HEXB1:
A-U @30
JALT NEG
A-U 9
JALE D09
A-U @41-@39
JALT NEG
A-U @46-@41
JAGT NEG
A+U 15
RETS
D09:A+U 9
RETS
NEG:UTA -1
RETS
END
SWING:NAME QF
;*
;***************************************************
;*                                                 *
;*       YПPABЛEHИE ПAMЯTЬЮ  (ПOДKAЧKA)            *
;*                                                 *
;***************************************************
;*
SF_OPEN:SUBP QF
F_READ:SUBP QF
F_WRIT:SUBP QF
INQUE:SUBP QF
VMD
IFP
PCW
PSYS
SPORT
PCBIT
RRBIT
TPP
FATA
;
MODIF
U:EQU P1 ; ЛOГ.HOM.ФAЙЛA
RP:EQU P2 ; PEЗ.ЛИCT
;
P_FIX:EQU 64-15
P_PUSH:EQU 64-32
;
CMD
;
;          ПEPBAЯ AKTИBAЦИЯ ПPOИЗBOДИTCЯ ПPИ ЗAПYCKE OC
;          ДЛЯ ЗAKAЗA  HEOБXOДИMЫX CПEЦ-ФAЙЛOB :
;          0 - ДИCПETЧEP,  1 - MOHИTOPHAЯ CИCTEMA
;
;MOZY=80BBE     ;   -  SWING
;
TN VTM N_SWING ; OT CEБЯ
U VTM 1 ;
:U MTJ I
RR VJM SF_OPEN
:JAEQ *+1
U HLT 1
:U VRM *-2
JMP CLOSE2
;
FATAL:HLT 5
;
;        ЗABEPШEHИE OБCЛYЖИBAHИЯ И ДEЗAKTИBAЦИЯ
;
CLOSE:ITA RP
ATX RES_PAGE
;<<<<<<<<< BPEMEHHO :
XTA SWPORT
ASFT 32
AAU @FF
ATI TN
TN XTA PCW ; KЛИEHTA -
AON BL_SEL ; - HA BOЛЮ
AEN BL_SEL
TN ATX PCW
;>>>>>>>>>>>>>>>>>>>>>>>>>>
CLOSE2:UTA
ATX SWPORT
UTA 5
PINT
;
;        BXOД OT CTPAHИЧHЫX ПPEPЫBAHИЙ.
;        ПPOЦECC-KЛИEHT ПOДAET BO BXOДHOЙ ПOPT
;        (ECЛИ SWING БЫЛ CBOБOДEH!) CBOЙ HOMEP
;        (40:32 P.) И HOMEP MAT.ЛИCTA (16:1),
;        A CAM ПPOCTABЛЯET CEБE "BL_SEL", HO HE
;        ДEЗAKTИBИPYETCЯ.  SELECT OБECПEЧИBAET БЛOKИPOBKY
;        ЗAXBATA ПPOЦECCOPA TAKИMИ ПPOЦECCAMИ B ПEPИOД
;        ЗAHЯTOCTИ SWING-A.
;
;        ЗAKAЗ HA ПOДKAЧKY ПPOИЗBOДИTCЯ OT ИMEHИ KЛИEHTA,
;        A ЗAKAЗ HA YKAЧKY - OT ИMEHИ CAMOГO SWING-A.
;        ПPИ ЗAKAЗE MOГYT ПOДABATЬCЯ ПPИЗHAKИ :
;         15 - ПOДKAЧKA C ФИKCAЦИEЙ ЛИCTA
;         32 - ПPИHYДИTEЛЬHAЯ YKAЧKA БEЗ OTЬEMA ЛИCTA
;
XTA RES_PAGE
ATI RP
XTA SWPORT
AAX =H0000 00FF 0000 03FF
ATI NP ; MAT.ЛИCT
ASFT 32
ATI TN ; KЛИEHT
JAEQ CLOSE
R VTM PUSH
XTA SWPORT
AAN P_PUSH
JANE GIV_IF
;
;     KЛИEHT ECTЬ. PAЗPEШИM EMY БPATЬ ПPOЦECCOP.
;     ПEPBOE, ЧTO OH ПPИ ЭTOM CДEЛAET - TKHETCЯ
;     B ЛИCT, ЗAKPЫTЫЙ ПO OБMEHY.
;
;         TN XTA PCW ; ПOKA PEШИЛИ
;         AON BL_SEL ; CДEЛATЬ ЭTO
;         AEN BL_SEL ; ПOПOЗЖE !!!
;         TN ATX PCW ; (B "CLOSE")
R VTM READ
;
;       ПPИПИCKA  И П  KЛИEHTA TN K CEБE CO CMEЩEHИEM
;       HA OДИH ЛИCT.  OПPEДEЛEHИE TИПA CP ЛИCTA NP.
;
GIV_IF:TN XTA PCW
AOU @3FF
WMOD IF_LIST + @401
CP VTM 0 ; ЮЗEP
ITA NP
A-U MAIN_SW>>10 & @3FF
R JALT
A-U NONRSDNT-MAIN_SW>>10
JALT FATAL ; C-PEЗИДEHT
A-U WMSP-NONRSDNT>>10
CP VTM 1 ; ДИCПETЧEP
R JALT
CP VTM 2 ; PAБOЧИЙ ЛИCT
A-U LAST_SYS
R JALE
CP VTM 4 ; БYФEP ФAЙЛA
ITA NP
A-U BFPOOL
JALT CHIF
A-U 63
R JALE
A-U FREE_V>>10 -BFPOOL-63
JALT FATAL ; V-PEЗИДEHT
CHIF:ITA NP
AEU IF_LIST
:JAEQ *+1
UTC 5-3 ; COMMON
:CP VTM 3 ; И П
R JMP
;
;
;       ЗAKPЫTИE ФИЗ.ЛИCTA RP ПO OБMEHY И ПOCTAHOBKA
;       OБMEHA B OЧEPEДЬ. I = <AДPEC ДECKPИПTOPA ФAЙЛA>
;       NP = <MAT.ЛИCT>, CP = <EГO TИП>
;
ПOДKAЧKA:
XTA SWPORT ; C BOЗMOЖHOЙ
AAN P_FIX  ; ФИKCAЦИEЙ !
RP AOH TPP<<1
RP ATH TPP<<1
TN XTA PCW ; KЛИEHT
AON W_SWIN ; ЖДET KOHЦA
TN ATX PCW ; ПOДKAЧKИ
UTC 3-2 ; - ЧTEHИE
;
YKAЧKA:J VTM 2 ; - ЗAПИCЬ
RP HTA TPP<<1
AON 64-16 ; ЗAKP.ПO OБM.
RP ATH TPP<<1
I UTC FDB
PA VTMB
PA BTA 1
ATI W ; ATPИБYTЫ
PA BTA 2
ATI U ; "UN"
ASFT 10-40
AOI RP ; +ЛИCT
ASFT -10
CP JMP *+1
:JMP RW_USER
:NP UTS -DISPAGE0-2
JMP RW9K
:HLT @52
:NP UTS -IF_LIST-2
JMP RW9K
:I XTS FDB
JMP RW_BUF
:HLT @55
;
;        ПOPЯДOK PAЗMEЩEHИЯ ЛИCTOB ЮЗEPA
;             B EГO ФAЙЛE YKAЧKИ:
;        -------------------------------
;      0,1  : И П  ПPOЦECCA И EГO ПPOДOЛЖEHИE
;      2,3  : MAT.ЛИCTЫ 512,513 (ЭKCTPAKOДЫ БЭCM)
;      4,...: MAT.ЛИCTЫ 0-511
RW_USER:ITS NP
A-U 512
:JAGE *+1
NP UTA 2
RW9K:A+U 2 ; БЛOKИ ПO
AON 64-33 ; 9 K БAЙT
A*U 9216 ; (C TEГAMИ)
JMP R_W
;
;        БYФEPHЫЙ ЛИCT "CMOTPИT" B CBOЙ POДHOЙ ФAЙЛ
;        OБMEH ПPOИЗBOДИTCЯ C HAЧAЛA TEKYЩИX 8K-БAЙT
;        ФAЙЛA. ДЛИHA OБMEHHOЙ ПOPЦИИ OПPEДEЛЯETCЯ
;        ПO ДECKPИПTOPY ФAЙЛA.  MAIN TAG = 0.
;
RW_BUF:
ASFT 13
AAU 7 ; TИП ЭT-TA
A-U 3 ; ФAЙЛA
ATI IA
I XTA FDB
AAU @1FFF ; ЧИCЛO ЭЛ-TOB
A+U 1
IA ASFT -32
U AOH FCOOR<<1 ; HAЧAЛO
AAU @FE000 ; 8K-БЛOKA
R_W:
;       JMP INQUE
R MTJ PA
R VJM INQUE
UTA ; clear
RP WMOD @800 ; "bobr,bism"
;   <<<   BPEMEHHO: ЗAKPЫTИE ДO KOHЦA OБMEHA :
NTA W_EXCH
AOX PCW+N_SWING
ATX PCW+N_SWING
UTA
PINT
PA JMP
;   >>>>>>>>>>>>>>>>>>>>>
;
;       POCПИCЬ RP TEГOM HEИHИЦИИPOBAHHOЙ ПEPEMEHHOЙ
;       ИЛИ CПEЦKOДOM ДЛЯ PEЖ. ЭMYЛЯЦИИ (ЛИCTЫ 0:31)
;       CИCTEMHЫE ЛИCTЫ ПPИДETCЯ PACПИCЫBATЬ OБЫЧHЫM
;       TEГOM, ЧTOБ HE HAPBATЬCЯ ПPИ БAЙTOBOЙ PAБOTE.
;       PAЗPEШEHИE ПPOЦECCY ПOЛHOГO ДOCTYПA K ЛИCTY.
;
FIRST_US:NP QTA TMP<<2 + @1000
AOU @C
NP ATQ TMP<<2 + @1000
ITA RP
ASFT -10
AOU @3FF
WMOD WSPAG+N_SWING + @400
W VTM 1023
UTY 2
IA VTM =H87D7 1C70 0007 A000
ITA NP
AAU @FFFE0
JAEQ OLDCODE
IA VTM
AAU @FFE00
:JANE *+1
UTC @34
:UTY
IA VTM
OLDCODE:IA XTA
SETR БПTЗ+БПИHT
:W TTX WSPAG+N_SWING<<10
W VRM *
CLRR БПTЗ+БПИHT
CPUSH
;
;         ПPИПИCKA MAT.ЛИCTA NP K ФИЗ.ЛИCTY RP
;         YBEЛИЧEHИE HA 1 CЧETЧИKA CTPAHИЦ
;         ПPOЦECCA-KЛИEHTA, HAXOДЯЩИXCЯ B OЗY.
;         (ИП ПPOЦECCA ДOЛЖHO БЫTЬ B ПAMЯTИ!)
;
ПPИПИCKA:XTA PCNT+@400
A+U 1
ATX PCNT+@400
NP QTA TMP<<2 + @1000
AAU 3
RP MSFT -4
JANE PRIVATE
NP QTA DTMP<<2
AAU @F
AOI RP
NP ATQ DTMP<<2
JMP TOTPP
PRIVATE:
NP QTA TMP<<2 + @1000
AAU @F
AOI RP
NP ATQ TMP<<2 + @1000
TN UTC -@FF
;
TOTPP:IA VTM @FF
RP MSFT 4
AAU @F ; ПOЛЯ "PR" И "T"
15 ATX ; MEHЯЮTCЯ MECTAMИ
ASFT -4
15 AOX
AAU @3C
ASFT -6
NP MSFT -16
AOI NP ; + MAT.ЛИCT
NP MSFT 16
AOI IA ; + BЛAДEЛEЦ
RP ATH TPP<<1
R JMP
;
;         OTHЯTИE MAT.ЛИCTA NP Y ПPOЦECCA TN.
;
OTПИCKA:UTA
NP WMOD @400
RP ATH TPP<<1
NP QTA TMP<<2 + @1000
AAU @F
NP ATQ TMP<<2 + @1000
AAU 3
R JANE
NP QTA DTMP<<2
AAU @F
NP ATQ DTMP<<2
R JMP
;
;         P A Б O T Ы   П O   П O Д K A Ч K E :
;         =====================================
;
READ:CP JMP *+1
:JMP R_USER
:JMP R_DISP
:R VTM NEW_RP
JMP FIRST_US
:JMP FATAL ; - ИП
:R VTM NEW_RP
JMP R_BUF ; - БYФEP
COMMON:JMP FATAL ; - OБЩ.CTP.
;
;        ПOДKAЧKA ИЗ ФAЙЛA C ДИCПETЧEPOM
;        (HEPEЗИДEHT, CПИCOK ЗAГPYЗKИ ИЛИ
;        ИHTEPПPETATOP ЭKCTPAKOДOB БЭCM-6)
;
R_DISP:I VTM 0
R VJM ПPИПИCKA
R VTM NEW_RP
JMP ПOДKAЧKA
;
;
;                TPEБYETCЯ ЛИCT ДЛЯ ЮЗEPA.
;       ECЛИ ЛИCT ИMEET PEЖИM ДOCTYПA="TOЛЬKO ЗAПИCЬ"
;       ЭTO ПEPBOE K HEMY OБPAЩEHИE. ДAДИM ЮЗEPY RP,
;       PACПИCAB EГO TEГOM HEИHИЦИAЛИЗИP.ПEPEMEHHOЙ,
;       A K ЛИCTY PAЗPEШИM ПOЛHЫЙ ДOCTYП.
;
R_BUF:NP XTA FDB-BFPOOL+@400
JAEQ FIRST_US
;
R_USER:NP QTA TMP<<2 + @1000
ATI W
AAU 3
JAEQ COMMON
W MSFT 2
W UTM -1
R VTM NEW_RP
W JMEQ FIRST_US
;
:CP JMEQ *+1 ; COБCTBEHHЫЙ
NP UTC -BFPOOL-2 ; ФAЙЛ ЮЗEPA
:I VTM 2 + @400 ; ИЛИ ФAЙЛ YKAЧKИ
R VJM ПPИПИCKA
R VJM ПOДKAЧKA
;
;       BЫБOP HOBOГO PEЗEPBHOГO ЛИCTA
;       =============================
;       ( ПOKA - ПO KOЛЬЦY !!! )
;
NEW_RP:
CHECK:RP UTM -1
RP JMGT *+2
WTC QPAGE
RP VTM -1
:ITA RP
AEX RES_PAGE
JAEQ CHECK
RP MTJ W
W MSFT 4
XTA BLK_16P
W AAN
JANE CHECK
RP HTA TPP<<1
JAEQ CLOSE ; - CBOБOДEH
15 ATX
ATI NP
AAU @C000
U1AS CHECK ; ФИKCИPOBAH
AAU @FF
ATI TN ; - BЛAДEЛEЦ
AEU @FF
JAEQ CHECK ; - OБЩИЙ
NP MSFT 16
R VJM GIV_IF
;
;          P A Б O T Ы   П O   Y K A Ч K E :
;          =================================
;
CP JMP *+1
:R VTM W_USER
JMP OTПИCKA
:R VTM CLOSE ; KOKHEM
JMP OTПИCKA ; HEPEЗИДEHT
:TN XTA PCW
JMP W_WORK
:JMP CHECK ; ИП HE БEPEM
:R VTM W_BUF
JMP OTПИCKA ; -БYФEP
:JMP CHECK
;
;         PAБOЧИЙ ЛИCT CИCTEMHOГO ПPOЦECCA MOЖHO
;         BЗЯTЬ, ECЛИ BXOДHOЙ ПOPT ПPOЦECCA ПYCT,
;         T.E. OH ЗAKPЫЛCЯ, HE ИMEЯ PAБOTЫ.
;         TOГДA И YKAЧИBATЬ EГO HE HAДO !
;
W_WORK:
AAU @3FF
ATI R
R XTA IFCTIM + @403 ; - ПOPT
JANE CHECK ; ЗAHЯT
R VTM CLOSE
JMP OTПИCKA
;
;                 YKAЧKA ЛИCTA ЮЗEPA :
;
W_BUF:NP XTA FDB-BFPOOL+@400
JAEQ CLOSE ; - KOKHEM !
;
W_USER:
NP QTA TMP<<2 + @1000
ATI W
AAU 3
JAEQ CHECK ; - OБЩИЙ
;
P_USER:
RP RMOD @800 ; "БИЗM"
AAU 4 ; ЛИCT MEHЯЛCЯ ?
JAEQ EPUSH ; - HET
TN VTM N_SWING ; OT CEБЯ
:CP JMEQ *+1 ;
NP UTC -BFPOOL-2 ; ФAЙЛ ЮЗEPA
:I VTM 2 + @400 ; ИЛИ YKAЧKИ
R VJM YKAЧKA
;        NTA W_EXCH
;       TN AOX PCW ; ЗAKPOEMCЯ
;       TN ATX PCW ; ДO KOHЦA
;        UTA        ; OБMEHA
;        PINT
;
EPUSH:XTA SWPORT
AAN P_PUSH
JAEQ CLOSE
RI MCJ RP ; RP - TOT ЖE !
RI WMOD @800 ; БOБP,БИЗM = 0
NG XTA PCW
AON BL_SEL ; KЛИEHTA -
AEN BL_SEL ; - HA BOЛЮ
NG ATX PCW
JMP CLOSE
;
;
;       П P И H Y Д И T E Л Ь H A Я   Y K A Ч K A :
;       ===========================================
;       ЮЗEP BMECTE CO SWING-OM ЖДYT ЗABEPШEHИЯ
;       OБMEHA. ЛИCT Y ЮЗEPA HE OTHИMAETCЯ.
;
PUSHC:NP QTA DTMP<<2
JMP PUSH1
PUSH:NP QTA TMP<<2 + @1000
AAU 3
JAEQ PUSHC
NP QTA TMP<<2 + @1000
PUSH1:ATI RI ; ФИЗ.ЛИCT ЮЗEPA
RI MSFT 4
RI MCJ RP ; - HA BPEMЯ CБPOCA
TN MTJ NG ; KЛИEHT
RP JMEQ EPUSH ; - YЖE YKAЧAH
JMP P_USER
;
END
PACKDATE:NAME QF
PACKTIME:ENTRY QF
DATE:ENTRY QF
TIME:ENTRY QF
WEEKDAY:ENTRY QF
;*
;*       28/07/87      A.П.CAПOЖHИKOB
;*
;*****************************************************
;*
;*   PACKDATE - ПEPEBOД ДATЫ ИЗ TEKCTOBOГO
;*   ПPEДCTABЛEHИЯ  ДД/MM/ГГ  B 16-PAЗPЯДHOE
;*   ЦEЛOE ЧИCЛO, PABHOE KOЛИЧECTBY ДHEЙ,
;*   ПPOШEДШИX OT 31/12/1927, C YЧETOM BИCO-
;*   KOCHЫX ЛET.  ПPИ BXOДE PEГИCTP 14 COДEPЖИT
;*   БAЙTOBЫЙ AДPEC HAЧAЛA ЛEKCEMЫ "ДATA".
;*
;*   ПPИЧEM ECЛИ ГГ>27, ИMEETCЯ B BИДY 20-Й
;*   BEK, A ECЛИ ГГ<28, TO 21-Й BEK.
;*   PEЗYЛЬTAT HA CYMMATOPE B 1-16 P.  ПPИ
;*   OШИБOЧHOM ЗAДAHИИ ДATЫ PEЗYЛЬTAT = 0.
;*   PAЗPEШAETCЯ OПYCKATЬ ФPAГMEHTЫ ДД И MM.
;*   ПPИ ЭTOM ПOЛAГAETCЯ ДД=1, MM=1.
;*   ФPAГMEHT ГГ MOЖHO ЗAДABATЬ ИЗ 4 ЦИФP.
;*
;*   DATE - OБPATHAЯ ПPOЦEДYPA.
;*   ПPИ BXOДE - ДATA HA CYMMATOPE B BИДE
;*   ЦEЛOГO ЧИCЛA.  ПPИ BЫXOДE ДATA HA
;*   CYMMATOPE B ФOPMATE   ДД/MM/ГГ.
;*   ПPИ BXOДHOM CYMMATOPE <= 0 BЫДAETCЯ
;*   TEKYЩAЯ KAЛEHДAPHAЯ ДATA.
;*
;*   WEEKDAY - BЫДAЧA HA CYMMATOPE HAИMEHOBAHИЯ
;*   ДHЯ HEДEЛИ, A B И1 - EГO HOMEPA :
;*       (0-BC., 1-ПH., ... , 7-CБ.)
;*   APГYMEHT - TOT ЖE, ЧTO И Y "DATE".
;*
;*   PACKTIME - YПAKOBKA BPEMEHИ ИЗ TEKCTOBOГO
;*   ПPEДCTABЛEHИЯ  ЧЧ.MM.CC  B ЦEЛOЧИCЛEHHOE
;*   ПPEДCTABЛEHИE  3600*ЧЧ + 60*MM + CC
;*   14 PEГИCTP ЗAДAET БAЙTOBЫЙ AДPEC HAЧAЛA
;*   ЛEKCEMЫ "BPEMЯ".  ФPAГMEHTЫ MM И CC
;*   MOЖHO OПYCKATЬ, TOГДA ПOЛAГAETCЯ MM=CC=0.
;*
;*   TIME - ПEPEBOД BPEMEHИ ИЗ YПAKOBAHHOГO ЦEЛO-
;*   ЧИCЛEHHOГO ПPEДCTABЛEHИЯ 3600*ЧЧ+60*MM+CC
;*   B TEKCTOBOE  ЧЧ.MM.CC
;*   APГYMEHT И PEЗYЛЬTAT HA CYMMATOPE, ПPИЧEM
;*   ECЛИ APГYMEHT < 0,  BЫДAETCЯ TEKYЩEE ЗHAЧEHИE
;*   ACTPOHOMИЧECKOГO BPEMEHИ.
;*
;*   ПOPTЯTCЯ  1-4  PEГИCTPЫ.  BOЗBPAT: R.
;*****************************************************
;*
PP_ADR:LCB (1024-8),CLOCK ; -ЧACЫ
TIMESTD:LCB (1)
CONST
BDAY:INTB 0,31,28,31,30,31,30,31
:INTB 31,30,31,30,31,255,255,255
TWD:CHAR "BOCKP.  "
CHAR "ПOHEД.  "
CHAR "BTOPHИK "
CHAR "CPEДA   "
CHAR "ЧETBEPГ "
CHAR "ПЯTHИЦA "
CHAR "CYББOTA "
;
;======= PEГИCTPЫ
;
1:BLOCK D,M,Y,W(2),R
IA:EQU 14
;
CMD
;*
;*    ПOЛYЧEHИE ДECЯTИЧHЫX  DAY,MON,YEAR (D,M,Y)
;*
;MOZY=80B36     ;   - PACKDATE
;
PACKDATE:
M VTM 1
Y VTM 1
PD1:M MTJ D
Y MTJ M
Y VTM
JMP PD3
;
PD2:A-U @39 - @2F
JAGT ERROR
A-U @30 - @39
ITS Y
A*U 10
15 A+L
ATI Y
PD3:IA BTA
IA UTM 1
A-U @2F ; "/"
JAEQ PD1
JAGT PD2
;
;     KOHEЦ TEKCTA. KOHTPOЛЬ D,M,Y
;
ITA Y
A/U 100
YTA64
A-U 28
ATI Y
:Y JMNE *+1
Y UTM 100
:D JMLE ERROR
M JMLE ERROR
M UTM -12
M JMGT ERROR
M UTM 12
15 UTC 1
W VTMB
XTA BDAY
15 ATX 1
XTA BDAY+1
15 ATX 2
ITA Y
AAU 3 ; BИC.ГOД
JANE CHDAY ; - HET
UTA 29
W ATB 2 ; LEN(ФEBP)=29
;
CHDAY:M UTC
W BTA
I-A D
JAGT ERROR ; D > LEN(M)
;
;              YЧET ЧИCЛA ДHEЙ B ПOЛHЫX MECЯЦAX
;
:M UTM -1
 M UTC
 W BTA
 A+I D
 ATI D
 M JMGT *-2
;
;              YЧET ЧИCЛA ДHEЙ B ПOЛHЫX ГOДAX
;
ITA Y
A*U 365
Y MSFT 2
A+I Y ; + ЧИCЛO BИC.ЛET
A+I D
R JMP
;
ERROR:UTA
R JMP
;
PACKTIME:W VTM 2
D VTM
M VTM
Y VTM
PT1:IA BTA
IA UTM 1
A-U @2E ; "."
JALT PT3
A-U @30 - @2E
JALT PT2
A-U @39 - @30
JAGT ERROR
A+U 9
W ITS D
A*U 10
15 A+L
W ATI D
A-U 60
JAGE ERROR
JMP PT1
PT2:W VRM PT1
JMP ERROR
PT3:Y UTM -24
Y JMGE ERROR
Y UTA 24
A*U 60
A+I M
A*U 60
A+I D
R JMP
;
WEEKDAY:JAGT WD1
XTA CLOCK
AEU -1
A/L =86400000000
JAGE WD1
UTA
WD1:A+U 1
A/U 7
YTA64
ATI D
D XTA TWD
R JMP
;
CLOCKER:XTA ="01/01/90"
R JMP
;
;    OБPATHЫЙ ПEPEBOД
;
DATE:JAGT NOASTRD
XTA CLOCK
AEU -1
15 ATX 1
A-L TIMESTD
JALE CLOCKER ; ДO ЗAПYCKA
A-L =864000
JAGT CLOCKER ; > 10 ДHEЙ
15 XTA 1
A/L =86400000000
NOASTRD:ATI D
A/U 365
ATI Y;ЧИCЛO ПOЛHЫX ЛET
Y UTM 1
;
MAK_Y:Y UTM -1
ITA Y
A*U 365
Y MTJ M
M MSFT 2
A+I M
I-A D
JALE MAK_Y ; HA ГOД MEHЬШE
ATI D ; ДHEЙ ПOCЛ.ГOДA
Y UTM 28-100
:Y JMGE *+1
Y UTM 100
:XTA BDAY
XTS BDAY+1
ITS Y
AAU 3
15 UTC -2
W VTMB
M VTM 1
JANE MAK_M
UTA 29
W ATB 2 ; LEN(ФEBP)=29
;
;               ПOЛYЧEHИE HOMEPA MECЯЦA
;
MAK_M:M UTC
W BTA
I-A D
JALE MAK_D
ATI D
M VLM MAK_M
;
;               ПEPEBOД D,M,Y - B TEKCT
;
MAK_D:XTA ="00/00/00"
15 UTM -2
TOTEX:ITS D
D VTM -2
DIG2:A/U 10
AOU @30 ; "0"
W ATB
YTA64
AOU @30
W ATB 1
W UTM 3
D ITA Y+1
D VLM DIG2
15 XTA
R JMP
;
TIME:JAGE NOASTRT
XTA CLOCK
AEU -1
A/L =86400000000
YTA64
A/L =1000000
NOASTRT:A/U 3600
ATI D ; ЧACЫ
YTA64
A/U 60
ATI M ; MИHYTЫ
YTA64
ATI Y ; CEKYHДЫ
XTA ="00.00.00"
15 UTC -2
W VTMB 2
JMP TOTEX
;
END
BESMEXTR:NAME QF
STARTJOB:ENTRY QF ; HAЧAЛO ПPOЦECCA
ENDJOB:ENTRY QF ; KOHEЦ ПPOЦECCA
;*
;*                        TPAДИЦИИ MEPTBЫX ПOKOЛEHИЙ
;*                        TЯГOTEЮT, KAK ПPOKЛЯTИE,
;*                        HAД YMAMИ ЖИBЫX.
;*                                       (K.MAPKC)
;*
;***************************************************
;*                                                 *
;*        ИHTEPПPETATOP ЭKCTPAKOДOB БЭCM-6         *
;*                                                 *
;***************************************************
;*
F_READ:SUBP QF
F_WRIT:SUBP QF
F_OPEN:SUBP QF
F_CLOSE:SUBP QF
SF_OPEN:SUBP QF
F_CREAT:SUBP QF
F_PERM:SUBP QF
ERRMACRO:SUBP QF
FIX_PAGE:SUBP QF
PUSHGRUP:SUBP QF
DHEX8:SUBP QF
KOHCOЛЬ:SUBP QF
TERMOS:SUBP QF
DATE:SUBP QF
TIME:SUBP QF
SERVER:SUBP QF
PCW
IFP
TPP
SEMAF
FATA
CODE
GROUP
SPORT
VMD
;
ДД89
72:BLOCK COMTIME,LIMTIME(2),PULT,PASS(2),NAM(3)
;
OUTFIL:EQU 3 ; ФAЙЛ-ЛИCTИHГ
LLIST:EQU BFPOOL+OUTFIL <<10 ; EГO БYФEP
;
RRBIT
MODIF
U:EQU P1 ; ЛOГ.HOMEP
;
CONST
ENDFIL:CHARZ "*READ'@81''0''0'OLD'@CA''@0A''@0A'"
:CHARZ "*END F'0''0'ILE'@CA''@0A''@0A'"
;
;         CПИCOK ИHTEPПPETИPYEMЫX MOДEЛEЙ ЛEHT
;         B PAЗPЯДAX 9:16 - CИCTEMHЫЙ HOMEP.
;
LISMOD:CHAR "MONSYS'1''9'"
CHAR "LIBRAR'4''@12'"
CHAR "LIBRAR'5''@37'"
;     CHAR "ROLLIB'6''1'"
;
TUMBLER:HEX 0
:HEX 0
:HEX 0
:HEX 0
:HEX 0
:HEX 0
:HEX 0
:HEX 0
;
CMD
;
;MOZY=80EA6      ;   - BESMEXTR
;
;
;               CTAPOPEЖИMHЫE ЭKCTPAKOДЫ БЭCM-6:
;               ================================
;               IA=<ИCП.AДPEC>,  CP=<KOД OПEPAЦИИ>
;
:15 YTX ; B CTEK:
ITS IA ; PMP,ACC,И14
XTS REGSCAL
AEN ; CHИMAEM "PЭ"
ATX REGSCAL
AAN 64-63
JAEQ SWCP
;
;        ЗAKAЗAHA TPACCИPOBKA ЭKCTPAKOДOB
;
CP NTA ; ЭTOT Э-K
AAX REGSCAL ; БЛOKИPOBAH
AOX Ю_ЭKCT ; ИЛИ BЫДAH
JANE SWCP ; ИHTEPПPETEPOM
15 XTA -2
CP NTS
AAU @9E0
:UZAS *+1 ; CYMMATOPHЫЙ
IA XTA ; C ИHФ.CЛOBOM
:ASNA @400-4
ASFT 16
ATX WS
15 MTJ I
15 VTM BUF+2
ITA CP
ASFT -58
AUX =H0000 0000 0000 0707
AOX ="MACRO-00"
ITS IA
ASFT -49
AUX =H0007 0707 0707 0000
AOX ="(00000)."
J VTM 0
ITS RI
JMPS DHEX8
:AAX =H0000 0000 FFFF FFFF
ASFT -8
AOX =" C:'0''0''0''0',"
XTS WS
ASFT 32
JMPS DHEX8 ; 48:33
AAX =H0000 0000 FFFF FFFF
AOX =Z" IW:"
XTS WS
JMPS DHEX8 ; 32:1
:UTS @0A0D
ASFT -48
15 ATX
I MTJ 15
I VTM BUF+2
RR VJM TERMOS
;
;        HA BCЯKИЙ CЛYЧAЙ, ДЛЯ HECДEЛAHHЫX KOMAHД:
;
SWCP:ITA CP
A-U @28
JALT INVALID ; < 50B
A-U @40 - @28
CP JALT SWCP1 - @28 ; < 100B
JMP INVALID
;
SWCP1:JMP MACRO50
;
:IA JMEQ EXT_OLD
JMP ERREXT ; - 51
;
:IA JMEQ EXT_OLD
JMP WRPHYS ; - 52
;
:IA JMEQ EXT_OLD
JMP WRPHYSM ; - 53
;
:JMP EXT_OLD ; 54
:JMP EXT_OLD ; 55
;
:IA JMEQ EXT_OLD
JMP ERREXT ; - 56
;
:IA JMEQ EXT_OLD
JMP MACRO57
;
:JMP ERREXT ; - 60
:PA VTM -6
JMP MACRO61
;
:IA JMEQ FINISH
JMP MACRO62
;
:ITA IA
JMP MACRO63
;
:JMP EXT_OLD ; - 64
;
:ITA IA
JMP MACRO65 ; - 65
;
:JMP ERREXT ; -66
;
:IA XTA
JMP MACRO67
;
:15 XTA -2
JMP MACRO70
;
:IA XTA
JMP MACRO71
;
:I VTM 10
JMP MACRO72
;
:JMP ERREXT ; - 73
;
:PA VTM
JMP MACRO74
;
:JMP MACRO75
;
:UTC 1
:PA VTM
JMP M7776
;
;            *****************************
;             HAЧAЛЬHЫE ДEЯHИЯ ПPOЦECCA
;             ПOCЛE ПEPBOЙ EГO AKTИBAЦИИ.
;            *****************************
;
;       ПOKA Y HEГO ECTЬ TOЛЬKO  И П  + ДBA OCHOBHЫX
;       CИCTEMHЫX ФAЙЛA (0 И 1), + KOПИЯ CTPOKИ ДИPEKTИBЫ
;       ЗAПYCKA B BUF+2, A TAKЖE TИП ПYCKA B 1 PEГИCTPE.
;       ДOБEPEM OCTAЛЬHOE XOЗЯЙCTBO :
;
;     ЛOГИЧ.HOMEP   HAЗHAЧEHИE CПEЦ.ФAЙЛA   CИCT.HOM.
;         0         HEPEЗИДEHTЫ  O C           0
;         1         MOHИTOPHAЯ CИCTEMA         1
;         2         ДЛЯ YKAЧKИ CTPAHИЦ         2
;         3         ДЛЯ ЗAПИCИ ЛИCTИHГA        3
;       <...>       ФOPTPAHHЫE БИБЛИOTEKИ     4,5
;
;      PEГИCTP CP:  0-DEBUG, 1-START,  -1:TECT AY
;                   2-SERVER
;      -------------------------------------------
STARTJOB:I MTJ CP
KTOЯ
ATI TN
ГHOM
ATI NG
UTA MACRO74 ; ЭTO HA CЛYЧAЙ
AAX =H0000 0000 FFFF FFFF
AON 32-PД ; ЛИШHEГO "RETS"
AON 32-POA
ATX RETSTEC
ATX RETSTEC+1
UTA RETSTEC+1
ATH ASTEC<<1
NG WMOD SPRADR ; - P A B
UTA SAVREG+16
ATH ASTEC<<1 +1
NG WMOD PAПY
U VTM 2
;
;         ЗAKAЗ MAT.ЛИCTOB :
;
UTA 7
I VTM 511
:I ATQ TMP<<2
I VRM *
ATQ TMP<<2 +LINT
ATQ TMP<<2 +LINT+1
I VTM 63
J VTM 1023
:I ATQ TMP<<2 +BFPOOL
I VRM *
UTA
ATH PCNT<<1 ; PCNT=NTERM=0
ATQ TMP<<2 +1022
ATQ TMP<<2 +1023
:J ATX TABS ; ЧИCTKA CПPABOЧHИKA
J VRM * ; ИHTEPПPETATOPA
;
I VTM 2 ; ФAЙЛ YKAЧKИ
RR VJM SF_OPEN
JANE ABS_FILE
CP JMLE COPINT
I VTM 1
R VTM OCCINPUT
ITA CP
AEU 2
JANE GIVPAR
R VTM SERVER
;
;         BЫБOPKA B PATHNAME  I-ГO ПAPAMETPA
;
GIVPAR:J VTMB BUF+2
UTA
GP1:W VTM
ATX PATHNAME
GP2:J BTA
W ATB PATHNAME<<3
JAEQ GP4 ; KOHEЦ CTPOKИ
J UTM 1
AEU BL
JAEQ GP3
W UTM 1
JMP GP2
GP3:W JMEQ GP2 ; ЛEBЫE ПPOБEЛЫ
I VRM GP1 ;
W ATB PATHNAME<<3
R JMP
GP4:I VRM GP1
R JMP
;
;         ЗAKAЗ BXOДHOГO ФAЙЛA  ПOД HOM.63
;      ФAЙЛЫ <ИMЯ>.B6 CЧИTAЮTCЯ COЗДAHHЫMИ HA БЭCM
;
OCCINPUT:U VTM 63
I VTM 2
W BTA PATHNAME<<3 -3
ASFT -8
W AOB PATHNAME<<3 -2
ASFT -8
W AOB PATHNAME<<3 -1
AEX =H0000 0000 002E 4236
:JANE *+1
UTC @85 - @84
:W VTM @84
RR VJM F_OPEN
JANE ABS_FILE
;
;         ЗAKAЗ ФAЙЛA ДЛЯ ЛИCTИHГA (2-Й ПAPAMETP)
;         ПPИ HEYKAЗAHИИ БEPETCЯ CПEЦ-ФAЙЛ 3.
;
R VJM GIVPAR
U VTM OUTFIL
I VTM 3 ; ЛИCTИHГ
RR VTM SET_TYP
W JMEQ SF_OPEN ; CTAHДAPT
W VTM @E0
RR VJM F_OPEN ; - CBOЙ ФAЙЛ
SET_TYP:JANE ABS_FILE ; HEYДAЧA
U XTA FDB
AOU @6000 ; TИП=3
U ATX FDB
;
;       ЗABEДEHИE CBOEГO ЭKЗEMПЛЯPA
;       ИHTEPПPETATOPA ЭKCTPAKOДOB ДД-89
;
COPINT:I VTM 2047
SETR БЧC+БЧOП
INTERCOP:I TTA EXTOLD
I TTX LINT<<10
I TTX 30<<10 ; И B 30-M ЛИCTE!
I VRM INTERCOP
CP JMGE FORMOD
J VTM 1023
TRANTEST:J TTA TECTAY
J TTX ; B 0-Й ЛИCT
J VRM TRANTEST
I VTM =Z" *** TECT AY/YY имени А.Н.ТОМИЛИНА и M.Г.ЧAЙKOBCKOГO.'@0A''@0D'"
RR VTM FORMIF
JMP KOHCOЛЬ
;
;        "OПOЗHABAHИE" MOДEЛEЙ ЛEHT :
;
FORMOD:I XTA LISMOD
AAU @F00FF ; ГAШ.CИCT.HOM.
APX =H5F5F 5F5F 5F5F 0FFF
AEN
ASNA @400+4
AEN
UTY 2
I TTX TNAMT
I UTM 1
I XTA LISMOD
JANE FORMOD
;     <<<<<<<<<<
IA VTM 1
NP VTM @1e
JMPS FIX_PAGE
:NP VTM @1f
JMPS FIX_PAGE
:NP VTM @200
JMPS FIX_PAGE
:NP VTM @201
JMPS FIX_PAGE
;       >>>>>>>>>>>
CP JMEQ FORMIF ; - "DEBUG"
;
;          ЧTEHИE BXOДHOГO ФAЙЛA. ПEPEПИCЬ HA MБ 01
;
NP VTM TABS+@400 ; HAЧAЛO "MБ"
I VTM ; HAЧ.ДИCK.AДPEC
P2 VTM 6<<10 ; 6K БAЙT
W VTM 2 ; "ЧИCЛO PЭ"
U VTM 63
U XTA FDB
AAN 64-49
JANE INPUT
NP VTM TABS+@10000 ; HAЧ.PC-ФAЙЛA
P2 VTM 8<<10 ; 8K БAЙT
W VTM 0 ; "ЧИCЛO HP"
;
INPUT:ITA P2
ASFT -32
AOI I
RR VJM F_READ
P2 J+M I ; CЛEД.ДИCK.AДPEC
NP UTM @400 ; CЛEД.ЛИCT
U XTA FDB
ASFT 16
AAU @FFFF ; ПPOЧЛИ
ATI RR
AEI P2 ; CKOЛЬKO ПPOШEHO
JAEQ INPUT ; - ДA
P2 MSFT 13
P2 JMEQ CREATD01 ; 1:1
;
;          ФAЙЛ CДEЛAH HA PC.  ПEPEBOД B "COSY"
;
RR MSFT 3
UTA ; ГAPAHTИPYEM
RR UTC 1-@400
NP ATX ; KOHEЦ ФAЙЛA
I VTMB TABS+@10000
NP VTM TABS+@3FF
RR VTM ; STRLEN
R VJM CPINIT
;
LCOD:I BTA
I UTM 1
ATI IA
JAEQ ELCOD
IA UTM -ETX
IA JMEQ ELCOD
IA UTM ETX-CR
IA JMEQ LCOD
IA UTM CR-LF
IA JMEQ ESTR
ITA RR
A-U 83
JAGE LONGSTR ; ДЛИHHAЯ CTPOKA
IA UTM LF-9
IA JMEQ TAB
RR UTM 1
IA UTM 9-BL
IA JMEQ BLAN
J JMLT LCOD1
;
;          CБPOC  J+1  ПPOБEЛOB
;
:J JMEQ *+1 ; OДИH
J UTC @81 - BL ; MHOГO
:UTA BL
R VJM CPACK
;
;          ПEPEKOДИPOBKA И CБPOC CИMBOЛA
;
LCOD1:IA BTA ALTISO<<3 +BL
R VTM LCOD
;
CPACK:W ATB WS<<3 +5
W VLM RCPACK
WPACK:XTA WS
AEN
ASNA @400+4
AEN
UTY 2
NP TTX
CPINIT:NP UTM 1
W VTM -5 ; CЧ.БAЙT
XTA =H0A0A 0A0A 0A0A 0000
ATX WS ; HAKOПИTEЛЬ
RCPACK:J VTM -1 ; CЧ.ПPOБEЛOB
R JMP
;
BLAN:J UTM 1
JMP LCOD
LONGSTR:J VTM -1
JMP LCOD
;
TAB:ITA RR
AAU 7
U-A 8
ATI IA
IA J+M J
IA J+M RR
JMP LCOD
;
ESTR:J UTA 84 ; 83+(J+1)
A-I RR
:RR VTM
JALE *+2
A+U @80 ; XBOCTOBЫE
R VJM CPACK ; ПPOБEЛЫ
:R VTM LCOD ; ДOCБPOC
JMP WPACK ; HAKOПИTEЛЯ
;
ELCOD:P2 VTM -3
R VJM WPACK
ELCOD1:P2 XTA ENDFIL+3
ATX WS
R VJM WPACK
CP VTM 63 ; "START"
P2 VLM ELCOD1
;
;         ПPEBPAЩEHИE БYФEPA C TEKCTOM B "MБ-01"
;
CREATD01:NP UTM -TABS-@400
NP MSFT 10
CD01:NP UTA 32
ASFT -54
AUX =H0000 0000 0001 F01F
NP ATX TABDRU
NP VRM CD01
RR VJM F_CLOSE ; OTKAЗ OT Ф-63
;
;         ПOДГOTOBKA  И П  K BXOДY B PEЖИM ЭMYЛЯЦИИ
;         ЗAXBAT PEЗEPBHOЙ ГPYППЫ MOДИФИKATOPOB.
;
FORMIF:UTA 7 ; ЗA PEЗEPBOM
PINT
WTC ASTEC
W VTM ; PAПY
;
;         ДИPEKTИBA ЗAПYCKA ("START" ИЛИ "DEBUG")
;         YЖE HAXOДИTCЯ B REGSCAL. 4-Й БAЙT EE
;         MOЖET ЗAДABATЬ PEЖИMЫ:  STA<N>, N=0,...,7
;         OHИ ПOПAДYT B 63:61 P.REGSCAL :
;           63 - ЗAKAЗAHA TPACCИPOBKA ЭKCTPAKOДOB
;           62 - BЫBOД HA TEPMИHAЛ OT Э064
;           61 - ЗAMEHA "000" HA "075"
;         5:8 БAЙTЫ ДИPEKTИBЫ ПOЗBOЛЯЮT БЛOKИPOBATЬ
;         TPACCИPOBKY OTДEЛЬHЫX ЭKCTPAKOДOB :
;         STA60001 - 000@ : ЭKCTPAKOДЫ  77:74
;             0010 - 00@0 :   ---"---   73:70
;             0100 - 0@00 :   ---"---   67:64
;             1000 - @000 :   ---"---   63:60
;
BTA REGSCAL<<3 +3
ATI IA
NTA ; "PЭ"
IA UTM -@30
IA JMLE WRRSC
IA UTM -7
IA JMGT WRRSC
IA UTA 7+8
ASFT -60
XTS REGSCAL
APX =H0000 0000 4747 4747
ASFT 48
15 AOX
AOU @1C04 ; БЛOK.TP:63-65,75
WRRSC:CP JMGE *+1
AON 64-61
:ATX REGSCAL
R VJM ABREG
AAU @F0000 ; HOM.PEЗ.ГP.
AOU 2 ; TEГ PEЗ-TA
AON 32-ББЧ
W ATX -7 ; ---> PP,PPP
XTA LINT<<10 +1
ASFT 12
:CP JMGE *+2
UTA
W ATX -16 ; И1,И2
UTA 8 ; ДЛЯ TECTA: 10B
:AAU @7FFF ; AДP.BXOДA
ASFT -32
W ATX -8 ; ---> CЧAC
UTA ; И15,И16 = 0
W ATX -9
UTA 6 ; B ИHИЦИATOP
PINT
;==========================================
;
;         ПOЛПPOГPAMMA ЗAMEHЫ CTPAHИЦ I И J
;
MPCHANGE:
SMON БBП
I QTA TMP<<2
J QTS TMP<<2
I STQ TMP<<2
:J ATQ TMP<<2
RR VJM *+2
I MCJ J
RR VTM MPCRET
:J QTA TMP<<2
ASFT 4
ATI W
JAEQ MCPCL
ITA J
ASFT -16
W AEH TPP<<1
AAU @F0000
W AEH TPP<<1
W ATH TPP<<1
AAU @3FF
W MSFT -10
AOI W
MCPCL:J WMOD @400
RR JMP
MPCRET:
CMON БBП
R JMP
;
;       ПOДПPOГPAMMA ДЛЯ OПPEДEЛEHИЯ AДPECA I БЛOKA
;       PEГИCTPOB B ГPYППE (J=0) ИЛИ B ПAMЯTИ (J=1)
;       ПPEPЫBAHИЯ БЛOKИPYEM, ЧTOБЫ HE ПOДMEHИЛИ
;       ГPYППY PEГИCTPOB !
;       HA CYMMATOPE BЫДAETCЯ PPP.
;
ABREG:J VTM
SETR БBП
ГHOM
ATI NG
NG RMOD PPP
15 ATX
ASFT 8-5
AAU @3E0 ; ПPEPB.ГPYППA
JANE ABRET
J VTM 1
NG RMOD PAПY
ASFT -1
ABRET:STI I
R JMP
;
;
;          ИCПOЛHEHИE ЭKCTPAKOДA B PEЖИME ЭMYЛЯЦИИ.
;          ЛИCTЫ 512:513 COДEPЖAT BЫЖИMKY ИЗ ДД-89.
;          MEHЯEM ИX MECTAMИ C 30:31 ЛИCTAMИ.
;          BOCCTAHOBИM: И14,CYMMATOP,PMP.  ЗAПOMHИM
;          CTAPЫЙ BOЗBPAT И ПOЙДEM HA 74000B + CP - 50B
;
EXT_OLD:
I VTM 30
J VTM LINT
R VJM MPCHANGE
I VTM 31
J VTM LINT+1
ITA CP
A-U 52 ; Э064
:JAEQ *+1
R VJM MPCHANGE
:ITA IA
ASFT -32
AOI CP
ATX Ю_ЭKCT
ITA RI
ATX Ю_CЧAC
CP UTA @7800-41
JMP SET_RI
;
;        BOЗBPAT K ЮЗEPY ПOCЛE ИHTEPПPETATOPA
;
RETEX:XTA Ю_CЧAC
;
;        YCTAHOBKA ЗAДAHHOГO CЧAC ДЛЯ BЫXOДA
;        B MAT.PEЖИM (HA ЛEBYЮ KOMAHДY).
;
SET_RI:ATI RI
R VJM ABREG
ITA RI
J JMP *+1
:I WMOD CЧAC
JMP SETLEFT
:I ATH 16-32
JMP SETLEFT
;
;        BOЗBPAT B PEЖИM ЭMYЛЯЦИИ ПOД ЭKCTPAKOД.
;        YCTAHOBKA B И14 ИCПOЛHИTEЛЬHOГO AДPECA.
;        BOЗBPAT - BCEГДA HA ЛEBYЮ KOMAHДY, KPOME
;        CПEЦ.PEЖИMA ДЛЯ Э075.
;
RET_75:UTC REGSCAL
;
GO_OLD:XTA
AAN 64-61
JANE RET_OLD ; CПEЦ-075
R VJM ABREG
SETLEFT:15 XTA -1 ; И14
J JMP *+1
:I WMOD IA
JMP *+2
:I ATH 13-32
I HTA 18-32
:J JMNE *+1
I RMOD PP
:AON 64-ПИA
AEN 64-ПИA
AON 64-ППK ; HAЛEBO!
J JMP *+1
:I WMOD PP
JMP RET_OLD
:I ATH 18-32
JMP RET_OLD
;
;        ЗAПPEЩEHHAЯ KOMAHДA.  ПPOБA CПEЦ.PEЖИMA
;
INVALID:XTA REGSCAL
AAN 64-61
JAEQ INVALID1
RI UTC ; ПPOTAЛKИBAETCЯ !
;
;        BOCCTAHOBЛEHИE  CYMMATOPA И PMP
;           И BOЗBPAT ИЗ ЭKCTPAKOДA
;
RET_OLD:I VTM
;          TEMP5
XTA REGSCAL
AEN ; YCT."PЭ"
STX REGSCAL
STI IA
15 XTY
:I JMEQ RET_RET
I HLT ; KOMAHДЫ 33
;        ЭTO CEЙЧAC KOПИPYETCЯ B CTAPYЮ ГPYППY!
RET_RET:
CLRR БBП+БППY+ПOП
RET
;
;        ПPEOБPAЗOBAHИE BOЗBPAЩAEMOГO CYMMATOPA
;
RETAC:
ASFT -16
AEN
ASNA @400+4
AEN
;
RETACOLD:15 ATX -2
JMP GO_OLD
;
;       ЭKCTPAKOДЫ 76,77 ИCПOЛЬЗYЮTCЯ ДЛЯ BOЗBPATA
;       ИЗ ИHTEPПPETATOPA (ИЛИ BЫДAHЫ ПPOГPAMMOЙ).
;
M7776:XTA Ю_ЭKCT
JAEQ GO_OLD ; KЛИEHT БAЛYETCЯ
ATI CP
UTA
ATX Ю_ЭKCT
I VTM 30
J VTM LINT
R VJM MPCHANGE ; OБPATHAЯ
I VTM 31       ; ЗAMEHA
J VTM LINT+1   ; ЛИCTOB
CP MTJ P1
P1 UTM -52 ; Э064
:P1 JMEQ *+1
R VJM MPCHANGE
:PA JMNE ERREXT ; БЫЛA OШИБKA
P1 JMNE RETEX
;
;      ПOCЛE 64 ЭKCTPAKOДA BЫГPEБEM EГO БYФEP
;      ======================================
;
IA UTM -1
IA JMLE RETEX ; Э64(0,1)
XTA LINT<<10 + @174 ; 564B
ASFT 12
AAU @3FF
ATI I ; HAЧ.БYФEPA
P2 VTMB LLIST
U VTM OUTFIL
U XTA FDB
AAU @1FFF
A+I P2 ; TEK.YKAЗ.
ATI P2 ; ПO БYФ.BЫB.
;
;        HAЧAЛO HOBOЙ CTPOKИ ЛИCTИHГA
;
GCOD1:I XTA LINT<<10
PA VTMB BUF+2
I UTM 1
ASNA @400-4
AOU @FFFF
ATX WS ; 6 БAЙT
AEU -1
JAEQ EGCOD ; KOHEЦ БYФEPA-64
NG VTM -4
AEU -1
ASFT 56
IA VTM PLUS
JAEQ MARK1
A-U 2
ATI CP ; ПPOTЯЖKИ-1
CP JMLT MARK
A-U 70
JALT CROUT
CP VTM 2 ; В НАЧАЛЕ - 3 ПУСТЫХ
CROUT:UTA CR ; HA TT - HE
JMPS OUTPUTL ; BЫДAEM,
:UTA LF ; TOЛЬKO B
JMPS OUTPUTL ; ЛИCTИHГ
:CP VRM CROUT
UTC MINUS-BL
MARK:IA VTM BL
MARK1:ITA IA
JMPS OUTPUTL
;
GCOD2:NG BTA WS<<3 +5
ATI IA ; ГOCT-CИMBOЛ
A-U @7E ; "176"
JALT GCOD3
A-U @80-@7E
JALT GCOD5 ; KOHEЦ CTPOKИ
ATI CP ; ПPOБEЛЫ
:UTA BL
JMPS OUTPUT
:CP VRM *-1
JMP GCOD4
GCOD3:IA BTA GOSTALT<<3 ; ПEPEBOД
JMPS OUTPUT ; B KOД MKБ
GCOD4:NG VLM GCOD2
;
I XTA LINT<<10
ASNA @400-4
ATX WS
AEU @FF000 ; HET "176" !!!
JAEQ GCOD5
NG VTM -5
I VLM GCOD2
;
;           KOHEЦ OЧEPEДHOЙ CTPOKИ.  ПPOБA
;           ПAPAЛЛEЛЬHOЙ BЫДAЧИ HA TEPMИHAЛ.
;
GCOD5:UTA CR
JMPS OUTPUT
:UTA LF
JMPS OUTPUT
:XTA REGSCAL
AAN 64-62
JAEQ GCOD1 ; HE HAДO
UTA
PA ATB
I MTJ PA
I VTM BUF+2
J VTM 0
ATB BUF+2<<3 +81
UTA LF
ATB BUF+2<<3 +80
UTA CR
ATB BUF+2<<3 +79
RR VJM TERMOS
PA MTJ I
JMP GCOD1
;
;         ЗAПИCЬ CИMBOЛA B БYФEP ЛИCTИHГA
;         И B БYФEP ДЛЯ BЫДAЧИ HA TEPMИHAЛ
;
OUTPUT:
PA UTM 1
PA ATB -1 ; B TT-БYФEP
OUTPUTL:P2 ATB
P2 UTM 1
ITA P2
AAU @1FFF
JAEQ WRBOUT
RETS
WRBOUT:NP VTM LLIST ; БYФEP ПOЛOH.
U XTA FDB ; HYЖEH CБPOC.
ASFT 40
AAU @FF
ATI W
JAEQ WRBRET ; A ФAЙЛA HET !
W HTA FCOOR<<1
AON 64-46 ; 8K БAЙT
W VTM 0 ; MAIN TAG
RR VJM F_WRIT
WRBRET:P2 VTMB LLIST
RETS
;
;           B C E   B Ы Г P E Б Л И :
;
EGCOD:ITA P2 ; ===> B CЧETЧИK
U AEX FDB ; БAЙTOB
AAU @1FFF ; "XBOCTA"
U AEX FDB ; ФAЙЛA
U ATX FDB
JMP RETEX
;
;         Э K C T P A K O Д Ы  -  0 5 0
;         =============================
;            I = <AДPEC MAT.ИПЗ>
;           WS = <CYMMATOP B 1:48 P.>
;
MACRO50:XTA INTERP
ASFT 12
AAU @7FF
A+U INTERP
ATI I ; " И П З "
ITA IA
AAU @FFFF0
JAEQ EXT_OLD ; < 16
15 XTA -2
ASNA @400-4
ASFT 16
ATX WS ; CYMMATOP B P.48:1
ITA IA
A-U @34
JALT ERREXT ; < 64B
A-U @4C - @34
IA JALE SW50 - @34
A-U @80 - @4C
JALT ERREXT ; 114<IA<200
A-U @89 - @80
IA JALE SW50_200 - @80
A-U @7000 - @89
JALT ERREXT ; 211<IA<70000
;
;         PAБOTA C "ИПЗ" :
;
ATI IA
IA MSFT 10
AAU @3FF
A-U @131 ; MAKC.ДЛИHA ИПЗ
JAGT RETZER
A+U @131 - 64
A+I I
ATI I
I XTA
IA JMEQ RETACOLD ; "READ"
R VTM RETACOLD
IA JMP *
:UTA ; "WRITE"
:15 AOX -2 ; "OR"
JMP WRIF
:15 AAX -2 ; "AND"
JMP WRIF
;
WRIF:AEN
ASNA @400-4
ASNA @400+4
AEN
AAU @FF000
UTY 2
I TTX
R JMP
;
;           AДPECA  64 - 114 :
;
SW50:J VTM -2 ; 64 - ЗAПИCЬ NAME
JMP WRNAM
:JMP ERREXT ; 65 - TAPES
:J VTM 2
JMP TTINP6 ; 66 - ДИPEKTИBA(6)
;
:RR VTM DATTIM ; 67 - DATE*
JMP TIME
;
:JMP ERREXT ; 70 - OCT. BPEMЯ
:JMP GO_OLD ; 71 - ПEЧ. BPEMEH
:JMP ERREXT ; 72 - ЛИMИT BPEM.
:JMP ERREXT ; 73 - BP.HA ABOCT
;
:XTA WS ; 74 - ПEPEXBAT
JMP ПEPKOH ; ЭK.KOHЦA
;
:IA VTM 0 ; 75 - YCTAHOBKA PEЖ.
JMP MACRO75 ; ЗAПИCИ KOMAHД
;
:XTA WS ; 76 - BЫДAЧA CTPOKИ
JMP TTPRINT ; HA KOHCOЛЬ
;
:JMP ERREXT ; 77 - ФИKC.ЛИCTA
:I XTA PASS ; 100 - ЗAПPOC
JMP RETACOLD ; ШИФPA (ДИCПAK)
:UTA ; 101 - ПPИЧИHA ABOCTA
JMP RETAC
:JMP GO_OLD ; 102 - KPATHOCTЬ
:JMP GO_OLD ; 103 - AДP.ABOCTA
:JMP ERREXT ; 104 - ЗAПPOC ФИO
:JMP ERREXT ; 105 - HOMEP TOMA
:JMP ERREXT ; 106 - ФИO/1
:JMP ERREXT ; 107 - ФИO/2
:JMP ERREXT
:JMP ERREXT
:JMP ERREXT ; 112 - YCT.ДEЛЬTЫ
:JMP ERREXT ; 113 - ЗAПP.ДEЛЬTЫ
:RR VTM DATE_4 ; 114 - ЗAПPOC ДATЫ
JMP DATE
;
;            AДPECA  200-211 :
;
SW50_200:UTA ; 200 - ЗAПPOC
JMP RETACOLD ; CTATYCA ЛИCTA
:XTA WS ; 201 - ПEPEBOД ИЗ 2
JMP BINDEC ; B 2/10 CИCTEMY
:XTA WS ; 202 - ПEPEBOД
JMP DECISO ; ИЗ 2/10 B TEKCT
:XTA WS ; 203 -  1:1
JMP CL13_48
:UTA
JMP RETAC ; 204 - ПYCTOЙ
;
:XTA WS
JMP TTINP ; 205 - BBOД C TT
;
:JMP ERREXT
:JMP ERREXT
;
:15 XTA -2 ; 210 - CEMAФOP
JMP MATSEM
:NTA 32-14 ; 211 - ЖДY ЛEHTЫ
JMP PAUSE1
;
;
;       BЫДAЧA TEKYЩИX ДATЫ И BPEMEHИ :
;          ДД MM ГГ ЧЧ MM CC T
;          24 44 44 24 44 44 4
;       HA CYMMATOPE YЖE CTOИT BPEMЯ
;       B TEKCTOBOM BИДE:  ЧЧ.MM.CC
;
DATTIM:APX =H030F 000F 0F00 0F0F
ASFT 64-26
UTS
RR VJM DATE
APX =H030F 000F 0F00 0F0F
ASFT 64-48
15 AOX
JMP RETAC
;
;        BЫДAЧA ДATЫ B CTИЛE TYMБЛ.PEГ.-4
;        HA CYMMATOPE YЖE CTOИT ДATA:  ДД/MM/ГГ
;
DATE_4:APX =H030F 0001 0F00 0F0F
ASFT 64-43
JMP RETAC
;
;        ЗAПИCЬ "NAME" B MAT.ИПЗ
;
WRNAM:XTA WS
AAU @7FFF
ATI W
UTY 2
:W XTA
W UTM 1
I UTC
J TTX 2
J VLM *-2
JMP GO_OLD
;
;        ПEPEXBAT ЭKCTPAKOДA KOHЦA - 074
;
ПEPKOH:ATX ПEPE74
JMP GO_OLD
;
;        BЫДAЧA CTPOKИ HA KOHCOЛЬ
;
TTPRINT:AAU @7FFF
ATI P2 ; HAЧ.CTPOKИ
TTPR1:J VTM 0 ; -KOHCOЛЬ
PA VJM TR68
I VTM BUF+2
RR VTM GO_OLD
JMP TERMOS+1
;
;        ПPИEM CTPOKИ C ГЛABHOЙ KOHCOЛИ
;
TTINP:AAU @7FFF
I VTM BUF+2
J VTM 2 ; -BBOД
RR VJM TERMOS+1 ; C KOHCOЛИ
ATI P2 ; -БYФEP ЮЗEPA
PA VJM TR86
UTA 1 ; NTT=0
JMP RETAC
;
;        ПPИEM ДИPEKTИBЫ (6 CИMB. B KOДE TEXT)
;
TTINP6:I VTM BUF+2
RR VJM TERMOS+1
UTA
P1 VTMB BUF+2
:P1 BTS
P1 UTM 1
STI IA
ASFT -8
IA AOB ALTISO<<3
IA JMNE *-2
APX =H5F5F 5F5F 5F5F 5F5F
ASFT 10
JMP RETAC
;
MATSEM:JAGE *+1
UTC 3-4 ; - ЗAXBAT
:UTA 4 ; - OTKAЗ
AON 64-33 ; HOMEP = 1
PINT
JMP GO_OLD
;
;        ПEPEBOД 9-PAЗPЯДHOГO ДBOИЧHOГO ЧИCЛA
;        (OБЫЧHO ЭTO HOMEP БOБИHЫ) B 2/10 BИД:
;
BINDEC:A/U 10
15 YTX
A/U 10
15 YTX
ASFT -4
15 AOX
ASFT -4
15 AOX
CL13_48:AAU @FFF
JMP RETAC
;
;         ПEPEBOД 2/10 ЧИCЛA B TEKCT
;
DECISO:
ASFT -52
AUX =H0000 0000 000F 0F0F
AOX ="00'0''0'0000"
JMP RETAC
;
;
;
;         Э K C T P A K O Д Ы  -  0 5 7
;         =============================
;
MACRO57:UTA
ATX WS ; CYMM.BЫXOДA
15 XTA -2
ASNA @400-4
ASFT 16
ATX WS+1 ; CYMM.BXOДA
ITA IA
ASFT 3
IA JAEQ SW57-1
IA UTM -@B ; 13B
IA JMEQ PAUSE
IA UTM @B - @FFF ; 7777B
IA JMEQ ERREXT ; - MЛ EC
IA UTM @FFF - @7FFF ; 77777B
IA JMEQ OCCUPYD
;
;         OПPOC/ЗAKAЗ/OTKAЗ MAГHИTHЫX ЛEHT
;
W VTM -15
15 XTA -1 ; И14
AAN 64-12
JAEQ OCCUPYT
I VTM 31
LFDB:I XTA FDB+24 ; 30-67
JAEQ ELFDB
I NTA 64-48
AOX WS ; ФOPMИPOBAHИE
ATX WS ; ШKAЛЫ ЗAKAЗAHHЫX
15 XTA -1
AAN 64-6
JANE ELFDB ; - ЗAПPOC ШKAЛЫ
XTA WS+1
I AAN 64-48
JAEQ ELFDB
I MTJ U
U UTM 24
RR VTM ELFDB
;
;        БЛOK OTKAЗA OT ЛEHTЫ
;
REFTAP:XTA TABS ; ЧИCTKA B
U AON -24 ; ШKAЛE
U AEN -24 ; S-ФAЙЛOB
ATX TABS
U BTA MODEL<<3
JAEQ F_CLOSE
ATI J
XTA =H7800 0000 0000 0000
UTY 2
J TTX T1MT-8
JMP F_CLOSE ; -OTKAЗ
;
ELFDB:I VRM LFDB
JMP OKRET57
;
OCCUPYT:W XTA TNAMT+15
15 AEX -2
JAEQ OCCT1
W VLM OCCUPYT
UTA ; ЛEHTЫ HETY
JMP CHPRINT
;
OCCT1:W UTA 8+15 ; HOMEP
ATX WS ; MOДEЛИ MЛ
15 XTA -1
AAN 64-11
JAEQ OKRET57 ; -OПPOC
W XTA LISMOD+15
ASFT 8
AAU @FF ; CИCTEMHЫЙ
ATI W ; HOMEP
R VJM ABREG
I MCJ W ; ЗA MAT.HOMEPOM:
J JMP *+1
:W RMOD 13  ; ИЗ И13
JMP *+2
:W HTA 12-32 ; ИЗ ПAMЯTИ
:AAU @3F
ATI U
RR VJM SF_OPEN
:JAEQ OCCT2
NTA 64-47 ; "HEГOTOB"
AOX WS
ATX WS
;
CHPRINT:15 XTA -1
AAN 64-9
JANE OKRET57
I VTM BUF+2
XTA ="HET ЛEHT"
I ATX
15 XTA -2
ASFT -40
AUX =H0000 0F0F 0F00 0000
AOX =Z"Ы-000'@0A''@0D'"
I ATX 1
J VTM 0
RR VTM OKRET57
JMP KOHCOЛЬ
;
;        OФOPMЛEHИE ЗAKAЗA B TAБЛИЦE ДД-89
;
OCCT2:XTA WS
U ATB MODEL<<3
ATI I
I UTM T1MT-8
ITA TN
ASFT -6
AOI U
ASFT -52
R VTM OKRET57
JMP WRIF
;
;          AДPECA  1-7 :
;
SW57:JMP ERREXT ; CDC
:JMP ERREXT ; CALCOMP
PAUSE:NTA 32-12 ; 4 CEK.
JMP PAUSE1
:JMP ERREXT ; MЛ EC
:JMP GO_OLD ; ЭMYЛЯЦИЯ
RETZER:UTA
JMP RETAC ; BPEMЯ
:JMP ERREXT ; PAБOTA C "OB"
;
PAUSE1:AOU 8
PINT
JMP GO_OLD
;
;          OПEPAЦИИ C ДИCKAMИ  Б Э C M - 6 :
;          =================================
;
;    <HOMEP ПAKETA> OПPEДEЛЯET ИMЯ ПOДKATAЛOГA B
;          OCHOBHOM CПPABOЧHИKE ФAЙЛOB CИCTEMЫ.
;    <ИMЯ ПAKETA> - HE ИCПOЛЬЗYETCЯ.
;    <ИMЯ XOЗЯИHA>  TPAKTYETCЯ KAK ИMЯ ФAЙЛA HA PC
;    <ИMЯ ФAЙЛA>    TPAKTYETCЯ KAK PACШИPEHИE .EXT
;    <PEЖИM>      OПPEДEЛЯET ЗHAЧEHИE ATPИБYTA "W"
;
;    TAK, ЗAKAЗ:  D667/SYSTEM,CROSS,LIB,W
;    TPAHCЛИPYETCЯ B:  D:\BESM6\DIS667\CROSS.LIB
;    И PAЗPEШAETCЯ ДOCTYП ПO ЗAПИCИ.
;    ЧTOБЫ ИMETЬ ПYCTOE PACШИPEHИE ИMEHИ ФAЙЛA,
;    HAДO ИCПOЛЬЗOBATЬ CЛOBO "BLAN" :
;    D76/OWN,FILE,BLAN  ==>  D:\BESM6\DIS076\FILE
;
;
OCCUPYD:XTA WS+1
AAU @7FFF
ATI P2 ; ИHФ.ПOЛE
XTA WS+1
ASFT 15
AAU @1F
ATI I ; K O П
AEU @1F
JAEQ OKRET57 ; CMEHA CTATYCA
I JMP *+1
:JMP OKRET57 ; ЗAK.ПAKETA
:JMP OKRET57 ; OTK.ПAKETA
:JMP DCOOR ; KOOPДИHATЫ
GNDIS:R VTM OCCFIL
JMP NEXTWORD ; ЗAK.ФAЙЛOB
:R VTM OCCSFIL
JMP NEXTWORD ; ЗAK.SCRATCH
RNF:R VTM REFFIL
JMP NEXTWORD ; OTK.ФAЙЛOB
:I VTM 31
JMP REFALL ; OTK.BCEГO
;
;        SCRATCH-ФAЙЛ ПPOCTO OTMEЧAEM "1" B TABS
;        KPOME TOГO, B COOTB. CTPOKY FDB ПИШETCЯ
;                  8000 0000 0000 0000
;
OCCSFIL:JAEQ OKRET57 ; KOHEЦ CПИCKA
ASFT 36
AAU @3F
ATI U
XTA TABS
U AON -24
ATX TABS
NTA
U ATX FDB
JMP NEXTWORD
;
DCOOR:U VTM 56
R VJM NEXTWORD
ASFT -52
AUX =H0000 0000 0F0F 0F00
AOX ="\DIS000\"
ATX PATHNAME+1
XTA ="D:\BESM6"
ATX PATHNAME
;
GMAS:R VJM NEXTWORD
ASFT -16
ATX PATHNAME+2
JALT OKRET57 ; KOHEЦ CПИCKA
UTA
ATX PATHNAME+3
J VTMB PATHNAME+2
:J BTA ; ПOИCK KOHЦA
A-U BL ; ИMEHИ ФAЙЛA
JALE GFIL
J VLM *-1
;
GFIL:R VJM NEXTWORD
ASFT -16
JALT GMAS ; K CЛEД."BOSS"
AEX ="BLAN"
ASFT 40
JAEQ GMNUM ; БEЗ ".EXT"
AEX ="     BLA"
J ATB 3
ASN @400+8
J ATB 2 ; ПPИЛEПЛЯEM
ASN @400+8 ; PACШИPEHИE
J ATB 1 ; B ЗAД
UTA POIN ; ИMEHИ ФAЙЛA
J ATB
;
GMNUM:R VJM NEXTWORD
AAN 64-30 ; "W"
:JANE *+1 ;
UTC @85-@C5 ; -ЧTEHИE
:W VTM @C5 ; -ЗAПИCЬ
RR VJM F_OPEN
JANE OTЛYП
R VTM GFIL
U UTA @F00 ; "ДЛИHA" > 7400 B
ASFT -12
U VLM ORMAT
;
OTЛYП1:UTC 2 ; БИT45
OTЛYП:NTA 1+4 ; БИT47
R VJM ORMAT
NEGR:UTA 1
ATX WS
OKRET57:XTA WS
JMP RETAC
;
OCCFIL:R VJM NEXTWORD
JAEQ OKRET57 ; KOHEЦ CПИCKA
ATI I ; CTAP.MAT.HOM
ASFT 36
ATI U ; HOB.MAT.HOM
AAN 64-12
JANE GNDIS ; K CЛEД.ПAKETY
ITA I
AAU @3F
JAEQ OTЛYП1 ; HE ЗAKAЗAЛCЯ
ATI I
ITA U
AAU @3F
ATI U
I XTS FDB
U ATX FDB
ASFT 40
AAU @FF
STI U ; "UN"
U ATB FNUM<<3
UTA
I ATX FDB
U UTM -16 ; "NMOD" =
:U JMLT *+1 ; 30-47(B)
U VTM -16
:U UTA 16+24
ASFT -30-12
R VTM OCCFIL
JMP ORMAT
;
NEXTWORD:P2 XTA
P2 UTM 1
ASNA @400-4
ASFT 16
W VTM 5 ; ДЛЯ TTPRINT
R JMP
;
ORMAT:P2 AOX -1
UTY 2
P2 TTX -1
R JMP
;
REFFIL:JAEQ OKRET57
ASFT 36
AAU @3F
ATI U
XTA TABS
U AON -24
U AEN -24
ATX TABS
RR VTM RNF
JMP F_CLOSE
;
REFALL:UTA
ATX TABS
U VTM 24-1
:U UTM 1
RR VJM F_CLOSE
I VRM *-1
JMP OKRET57
;
;          Э K C T P A K O Д - 6 2   (IA.NE.0)
;          ===================================
;
MACRO62:RR VTM GO_OLD
IA MTJ U
U MSFT 9
ITA IA
AAU @1FF
ATI IA
AEU @1FF
JAEQ REFTAP
;
;         YCTAHOBKA "ДEЛЬTЫ"=IA  HA ЛEHTY=U
;
DELTA:U BTA MODEL<<3
RR JAEQ
ATI I
I UTM T1MT-8
ITA IA
ASFT -24
I AEX
AAX =H0000 0000 00FF F000
I AEX
RR MTJ R
JMP WRIF
;
;            Э K C T P A K O Д Ы  - 052,053
;            ==============================
;         (ЗAПИCЬ B ФИЗ.ПAMЯTЬ ПPOCTAЯ И ПO MACKE)
;
WRPHYS:15 XTA -2 ; CYMM===>PMP
15 ATX -3
UTA -1 ; ПOЛHAЯ MACKA
15 ATX -2
WRPHYSM:ITA IA
AAU @FF800
JANE ERREXT ; BEЛИK AДPEC
IA UTC LINT<<10
I VTM
I XTA
15 AEX -3
15 AAX -2
I AEX
R VTM RETACOLD
JMP WRIF
;
;            Э K C T P A K O Д  -  061
;            =========================
;          ( ЧTEHИE 1-7 ПYЛЬTOBЫX CЛOB)
;
;  MACRO61:UTA -1
;  RR VJM DATE
;  APX =H030F 0001 0F00 0F0F
;  ASFT 48-43
;  ATX WS
;  IA MTJ I
;  :PA XTA TUMBLER+6
;  R VJM WRIF
;  I UTM 1
;  PA VLM *-1
;  I UTM -4
;  XTA WS
;  R VTM GO_OLD
;  JMP WRIF
MACRO61:XTA =H7800 0000 0000 0000
UTY 2
:IA TTX
IA UTM 1
PA VLM *-1
JMP GO_OLD
;
;            Э K C T P A K O Д Ы  -  063,065
;            ===============================
;        ЧTEHИE ФИЗИЧECKOЙ ЯЧEЙKИ.  AДPECA 0-2047
;        ИMИTИPYET ПAMЯTЬ ИHTEPПPETATOPA, ПPOЧEE ПYCTO.
;
MACRO63:
MACRO65:
AAU @FF800
JANE ERREXT ; BEЛИK AДPEC
IA XTA LINT<<10
IA UTM -7
IA JMGT RETACOLD
IA XTA TUMBLER+7
RR VTM DATE_4
IA UTM 7-4
IA JMEQ DATE
JMP RETAC
;
;
;             Э K C T P A K O Д   O T Л A Д K И
;             =================================
;
MACRO67:
ASNA @400-4
ASFT 16
ATX WS
W VTM 2 ; OCT.ПO ЧT.
AAN 64-21
JANE STOP67
W VTM 1 ; OCT.ПO ЗAП.
XTA WS
AAN 64-22
JANE STOP67
XTA WS
AAN 64-23
JANE RET67 ; - ПPOKPYTKA
W VTM ; OCT.ПO NK.
;
STOP67:XTA WS
AAU @7FFF ; ЗAЩИЩAEMЫЙ
W ATX OCT67 ; AДPEC
ATI I
XTA WS
AAN 64-24 ; ПPИЗH.ПEЧATИ
ASFT -40
RI AOU 1 ; CЧAC+1
ATX RETM67 ; BXOД ПO ЗAЩИTE
SETR БПTЗ+БПTЧ
I TTA
15 ATX
W NTA 64-5
AOY ; B TEГ -
AEX ; - HYЖHЫЙ БИT
15 XTA ; ЗAЩИTЫ
I TTX
CLRR БПTЗ+БПTЧ
;
;        BЫXOД - ПO AДPECY B 39:25 P. IW67
;
RET67:XTA WS
ASFT 24
AAU @7FFF
JMP SET_RI
;
;             Э K C T P A K O Д   O Б M E H A
;             ===============================
;
MACRO70:IA JMEQ *+1
IA XTA
:ASNA @400-4 ; CXЛOПHEM ПOPЯДOK
ASFT 16
ATX IW70 ; B PAЗP.48:1
15 ATX -2 ; <CYMM>=IW70
AAN 64-40
ASFT 39
ATI W ; ЗП/ЧT
P2 VTM @3FFFF ; MACKA ПOИCKA
XTA IW70
ASFT 20
AAU @7C00
ATI NP ; -БYФEP
RI VTM 1024 ; ДЛИHA=ЛИCT
PA VTM 0 ; CEKTOP=0
XTA IW70
ASFT 12
AAU @3F
ATI U ; YCTP-BO
A-U 24
JALT DRUM
A-U 32
JAGE BADM70
XTA IW70
AAN 64-39
JANE BADM70 ; - ФИЗ.ЛEHTA
XTA IW70
AAN 64-42 ; -ЧTEHИE ИMEHИ
JANE RNAMT
XTA IW70
AAN 64-41 ; - ПOДBOД
JANE GO_OLD
XTA TABS
U AAN -24
JANE SVT ; SCRATCH
;
;         YЧET CMEЩEHИЯ ПPИ OБMEHE C MOДEЛЬЮ ЛEHTЫ
;
U BTA MODEL<<3
JAEQ OWN
ATI J
J XTA T1MT-8
ASFT 24
AAU @FFF
A+L IW70
ATX IW70
;
;         OБMEH C ЛИЧHЫM ФAЙЛOM
;         (BEДETCЯ 48-PAЗPЯДHЫMИ CЛOBAMИ)
;
OWN:U XTA FDB
JAEQ BADM70 ; ЧYЖAЯ MЛ
;       <<<<<<<<<< SPECIAL FOR MAIL BOX >>>>>>>>>
ASFT 40-3
AAU @7F8
ATI J
J XTA FATA+1
AEX ="\DIS667\"
J XTS FATA+2
AEX ="MD.MAD"
ASFT 16
15 AOX
JANE NOMAIL
XTA IW70
A-U @C0 ; 300(B)
ATX IW70
NOMAIL:
;           --------------------------
ITA RI
ASFT -32
XTS IW70
AAI P2 ; TPAKT ИЛИ
AAU @FFF ; ЗOHA
ASFT -10
A+I PA ; + CEKTOP
15 AOX
A*U 6
RR VTM GO_OLD
W JMEQ F_WRIT
W VTM 3 ; MAIN TAG=<OLD COM>
JMP F_READ
;
;         CTAHДAPTИЗAЦИЯ ДЛЯ MБ :
;    1:5 - TRAKT,  7:8 - CEKTOP,  25:26 - AБЗAЦ
;
DRUM:XTA IW70
AAN 64-46
JANE CHMOD ; - MOДEЛЬ MЛ
XTA IW70
AAN 64-36
JAEQ STAND
XTA IW70
AAU @FF
ATX WS
ASFT -8
AOX WS
ASFT 2
AAU @FF
AEX WS
AEX IW70
ATX IW70
STAND:XTA IW70
AAN 64-48
JAEQ NOTSECT
RI VTM 256 ; ДЛИHA=CEKTOP
XTA IW70
ASFT -2
AAU @300
ATI PA ; CEKT.CMEЩEHИE
XTA IW70
ASFT 24-8
AAU @300
A+I NP
ATI NP ; + AБЗAЦ
;
NOTSECT:P2 VTM @3F01F ; MACKA ПOИCKA
XTA IW70
AAN 64-39
JAEQ SVT ; MAT.MБ
W JMEQ BADM70 ; ФИЗ.ЗAПИCЬ
;
ITA U
U VTM 1 ; 9/MONSYS
J VTM ; ЗOHA=0
AEU @11 ; MБ-21
JAEQ MSSHIFT
J VTM @20 ; ЗOHA=40
AEU 3 ; MБ-22
JAEQ MSSHIFT
J VTM @100 ; ЗOHA=400
AEU @1C ; MБ-16
JANE BADM70
;
MSSHIFT:
XTA IW70
AAU @FF01F
A+I J ; + CMEЩEHИE
ATX IW70
P2 VTM @3FFFF
JMP OWN
;
;        OБMEH ПO HOMEPY MOДEЛИ (TOЛЬKO ЧTEHИE)
;        COOTBETCTB. CПEЦ-ФAЙЛ ПPИПИCЫBAETCЯ K
;        ДECKPИПTOPY-63.
;
CHMOD:XTA IW70
AAN 64-39
U AOX TNAMT-8
JAEQ BADM70
W JMEQ BADM70
U XTA LISMOD-8
ASFT 8
AAU @FF
ATI I ; CИCT.HOMEP
U VTM 63
RR VJM SF_OPEN
W VTM 3
JMP OWN
;
;         SCRATCH - ФAЙЛ OTPAБATЫBAETCЯ TOЧHO
;         TAK ЖE, KAK И MAT. БAPAБAH,  T.E.
;         B BИPT.ЛИCTAX  CAT+1 : 511
;
SVT:I VTM 1-LT
SETR БПИHT+БПTЧ+БПTЗ+БЧOП
:I XTA TABDRU+LT-1
JAEQ NOFIND
AEX IW70
P2 AAU ; MACKA
JAEQ FIND
I VLM SVT+1
:HLT @70 ; ПEPEПOЛHEHИE
JMP *
NOFIND:XTA IW70 ; PEГИCTPAЦИЯ
AON 64-19 ; (ДЛЯ MБ-00)
I ATX TABDRU+LT-1
W JMEQ FIND
I MTJ RR
RR UTM CAT+LT
RR MSFT -10
J VTM 1023 ; ПPИ ПEPBOM
UTY 2 ; OБP. ПO ЧTEHИЮ
XTA =H7800 0000 0000 0000
:RR TTX ; PACПИШEM
RR UTM 1 ; ЛИCT
J VRM *-1 ; HYЛЯMИ
;
FIND:I UTM CAT+LT
I MSFT -10
CHWR:PA J+M I ; +CMEЩEHИE
RI UTM -1
W JMEQ TRAN ; ЗAПИCЬ
I MCJ NP ; ЧTEHИE
TRAN:RI UTC
NP TTA
RI UTC
I TTX
RI VRM TRAN
NP JMEQ ADR0
I JMNE GO_OLD
;
;      работа с 0-м адресом
;
ADR0:
SETR БВП
XTA @3FF
RMOD @401
ATI RI
RMOD @400
WMOD @401
:NP JMEQ *+1
NP UTC -@400
:TTA @400
I TTX
:I JMNE *+1
TTX @400
:ITA RI
WMOD @401
CLRR БВП
JMP GO_OLD
;
RNAMT:U BTA MODEL<<3
ATI J
J XTA TNAMT-8
JMP RETACOLD
;
;
;       Э K C T P A K O Д   OБMEHA C TEPMИHAЛOM
;       =======================================
;
MACRO71:
ASNA @400-4
ASFT 16
15 ATX ; IW71
15 ATX
ASFT 24
AAU @7FFF
STI P2 ; AДP.ЧACTЬ
ASFT 39
AAU 7
STI P1 ; K O П
ASFT 44
ATI W ; И.P.
JAEQ READY71
R VJM ABREG
W J+M I ; ДOCTAEM И.P.:
J JMP *+1
:I RMOD ; ИЗ ГPYППЫ
JMP *+2
:I HTA -32 ; ИЗ CTEKA
:AAU @7FFF
CMON БBП
A+I P2
AAU @7FFF
ATI P2
;
READY71:P2 MTJ CP
I VTM BUF+2
P1 UTM -4
P1 JMLT GO_OLD ; -ПEPФOPAЦИЯ
P1 MTJ J
J JMP *+1
:PA VTM OUT71 ; BЫBOД
JMP TR68
:PA VTM TER71 ; BBOД C
JMP TR68 ; ПOДCKAЗKOЙ
:RR VTM INP71
JMP TERMOS ; ЧИCTЫЙ BBOД
:HLT @71
;
OUT71:RR VTM GO_OLD
JMP TERMOS
TER71:P1 ATB -1 ; БEЗ "CR" !!!
RR VJM TERMOS
INP71:CP MTJ P2
PA VTM GO_OLD
;
TR86:P1 VTMB BUF+2
IA VTM 1
W86:P2 UTM 1
W VTM 5
B86:IA JMEQ C86 ; ДOKPYTKA
P1 BTA
P1 UTM 1
ATI IA
AEU CR
JAEQ E86
C86:P2 XTA -1
ASFT -8
IA AOB ALTISO<<3
P2 ATX -1
W VRM B86
ASFT -16
AEN
ASNA @400+4
AEN
UTY 2
P2 TTX -1
IA JMNE W86
PA JMP
E86:IA VTM
JMP C86
;
TR68:P1 VTMB BUF+2
R VJM NEXTWORD
:ATX BUF+1
W VTM -5
LTR68:W BTA BUF<<3 +15
ATI IA
IA BTA ISOALT<<3
P1 ATB
JAEQ ELTR68
AEU 1 ; "ПYCTЫШKA"
:JAEQ *+1
P1 UTM 1
:W VLM LTR68
JMP NEXTWORD
ELTR68:UTS CR
P1 ATB
UTA LF
P1 STB 1
W VTM 7
P1 UTM 1
:W UTC ; ГAPAHTИPYEM
P1 ATB 1 ; HYЛИ ДO
W VRM *-1 ; KOHЦA CЛOBA
PA JMP
;
;            Э K C T P A K O Д - 0 7 2
;           ===========================
;
MACRO72:
IA UTM -@71C7 ; 70707B
IA JMEQ GO_OLD ; - IFOVFL
IA UTM @71C7 - 4
IA JMLT GO_OLD ; -DD89
IA JMEQ DFWRIT
IA XTA 4
ASNA @400 -4
AAU @F0000
ATX IW72
15 ATX -2 ; CYMMATOP=IW72
ASFT 58
ATI J ; KOП-72
XTA IW72
ASFT -6
ATX IW72
J JMEQ REFMEM72
J UTM -8
J JMEQ CHEMEM72
J UTM 8-9
J JMEQ GIVMEM72
J UTM 9-16
J JMEQ REFTAP72
JMP GO_OLD
;
;   ---    ЗAПИCЬ CTPOKИ B "DAYFILE"
;
DFWRIT:15 XTA -2
ASFT 12
AAU @7FFF
ATI P1
XTA REGSCAL
AAN 64-62 ; YЖE BЫДAЛИ
JANE GO_OLD ; OT Э064 !
:P1 UTC
I XTA
I ATX WS ; WS(13)=0 !
I VRM *-1
P2 VTM WS
JMP TTPR1
;
;   ---    OTKAЗ OT ЛEHTЫ
;
REFTAP72:
R VJM FR72
JAEQ GO_OLD
;........
JMP REFTAP72
;
;   ---    ЗAMEHA HOMEPOB MAT. CTPAHИЦ
;
CM72:JAEQ ERREXT
P1 MTJ I
P2 MTJ J
R VJM MPCHANGE
CHEMEM72:R VJM FR72
JAEQ GO_OLD
R VTM CM72
;
;          BЫБOPKA OЧEPEДHOГO ФPAГMEHTA IW72
;          B P2. ПPEДЫДYЩИЙ OCTAETCЯ B P1.
;          CYMMATOP = 0, ECЛИ KOHEЦ ИHФOPMAЦИИ.
;
FR72:P2 MTJ P1
XTA IW72
JAEQ ERREXT
ASFT 58
ATI P2
XTS IW72
ASFT -6
STX IW72
AEU @3F
R JMP
;
;   ---   ЗAKAЗ / OTKAЗ  MAT. CTPAHИЦ
;
GIVMEM72:UTC 1
REFMEM72:IA VTM -1 ; ДЛЯ "FIX_PAG"
R VJM FR72
JAEQ GO_OLD
ITA P2
A-U 32
P2 MTJ P1
:JALT *+1
R VJM FR72
:ITA P1
AAU @1F
ATI P1
A-I P2
JAGT ERREXT
ATI J
LOOPRG:P1 MTJ NP
P1 UTM 1
IA JMEQ LOOPGP ; ЭTO ЗAKAЗ !
JMPS FIX_PAGE ; ЭTO OTKAЗ !
:J VLM LOOPRG
JMP REFMEM72
;
LOOPGP:NP QTA TMP<<2
JANE *+2 ; YЖE ECTЬ !
UTA 7 ; - ЗAKAЗЫBAEM
NP ATQ TMP<<2
:J VLM LOOPRG
JMP GIVMEM72
;
;         HEЗAПYCK ПO OTCYTCTBИЮ TPEБYEMЫX ФAЙЛOB
;
ABS_FILE:I VTM PATHNAME-1
I XTA
XTS ="NO FILE:"
I ATX
J VTM 0
RR VJM KOHCOЛЬ
15 XTA
ATX PATHNAME-1
;
;            Э K C T P A K O Д   K O H Ц A
;           ===============================
;
MACRO74:XTA ПEPE74
UTS
STX ПEPE74
JANE SET_RI
;
;         0 - HOPMAЛЬHЫЙ KOHEЦ ЗAДAЧИ
;         6 - ЗAПP.KOM  ИЛИ ПЛOXOЙ ЭKCTPAKOД
;
FINISH:UTC -6 ; HOPMA
;
INVALID1:
BADM70:
ERREXT:IA VTM 6 ; "ЗAПP.KOM."
R VJM ABREG
NG RMOD PAПY
ATH ASTEC<<1 +1
J JMNE INMEM
I MTJ NG
TN MTJ NP
RR VJM PUSHGRUP
;
INMEM:WTC ASTEC
W VTM -16
15 XTA ; ИAOП=И14 !
ASFT -32
AOI IA ; HOM.OШ. ИЛИ 0
STX INFERR
W STX 10 ; CYMMATOP
W ATX 11 ; PMP
IA VTM
JMP ERRMACRO ; HA ПEЧATЬ
;
;         ПOCЛE ПEЧATИ - BOT CЮДA
;
ENDJOB:U VTM OUTFIL
R VJM F_PERM
U VTM 63
R VTM QSEM-1
SEMALL:ITA R ; ОСВОБОЖДЕНИЕ
ASFT -32
AOU 4 ; ВСЕХ СЕМАФОРОВ
PINT
R VRM SEMALL
;
CLO_F:RR VJM F_CLOSE
U VRM CLO_F
;
I VTM BUF
XTA ="KOHEЦ ЗA"
I ATX
ITA TN
JMPS DHEX8
:AAU @FFFF
AOX =Z"ДAЧИ- "
I ATX 1
UTA @0A0D
ASFT -48
I ATX 2
J VTM 0
RR VJM KOHCOЛЬ
;
;     TEMP3
NP VTM 1021 ; KPOME ИП !!!
:IA VTM -1 ; OTKAЗ OT
JMPS FIX_PAGE ; ЛИCTOB
:NP VRM *-1
UTA 5
PINT
;
;
;               ЭKCTPAKOД "ЗAПИCЬ KOMAHД"
;              ===========================
;
MACRO75:15 XTA -2 ; CYMMATOP BXOДA
UTY 3 ; "KOMAHДA PЭ"
IA TTX
CPUSH
ITA IA
AAU @FFFFE
JANE RET_75
R VJM ABREG
:IA JMNE *+1
UTC 3-2 ; TEГ=<KOMAHДA PЭ>
:W VTM 2 ; TEГ=<ЧИCЛO PЭ>
UTA @FFFFC
J JMNE PPPMEM
I RMOD PPP
AAU @FFFFC
AOI W
I WMOD PPP
JMP RET_75
PPPMEM:I AAH 19-32
AOI W
I ATH 19-32
JMP RET_75
;
END
ERRMACRO:NAME QF
;*
;*********************************************
;*                                           *
;*      СТАНДАРТНАЯ ОБРАБОТКА СОБЫТИЙ.       *
;*      ПEЧATЬ COOБЩEHИЯ OБ OШИБKE ИЛИ       *
;*      KOHЦE ЗAДAЧИ, A TAKЖE PEГИCTPOB      *
;*                                           *
;*********************************************
;*
;*     TEKYЩEE COCTOЯHИE ЗAДAЧИ HAXOДИTCЯ
;*     B BEPШИHE CTEKA YПPЯTЫBAHИЯ :
;*       0 :       И1          И2
;*       7 :       И15         И16
;*       8 :       CЧAC        POП
;*       9 :       PP          PPP
;*      10 :          CYMMATOP
;*      11 :           P M P
;*     KPOME TOГO, B "INFERR" ПEPEДAЮTCЯ :
;*                 ИAOП     HOM.OШ. ИЛИ 0
;*
;*     НОМЕР СОБЫТИЯ - В РЕГИСТРЕ  IA
;*
ENDJOB:SUBP QF
TERMOS:SUBP QF
DHEX8:SUBP QF
F_WRIT:SUBP QF
TIME:SUBP QF
FATA
IFP
VMD
EVENT
OUTFIL:EQU 3 ; ФAЙЛ-ЛИCTИHГ
LLIST:EQU BFPOOL+OUTFIL<<10
CODE
MODIF
U:EQU P1
;
CONST
;
THD:CHAR "M1-M8:  M9-16:  CM,MP:  "
TKILL:CHARZ "ЗАДАЧА СНЯТА.'13''10'"
TERROR:CHARZ "KOHEЦ ЗAДAЧИ.'13''10'"
:CHARZ "OTC.БЛOK ПAMЯTИ'13''10'"
:CHARZ "MHOГOKP.OШИБKA'13''10'"
:CHARZ "TIME-OUT OЗY'13''10'"
:CHARZ "TIME-OUT ШИHЫ'13''10'"
:CHARZ "OШ.ПPOГ.ПPEP.'13''10'"
:CHARZ "ЗAПP.KOM. ИЛИ ПЛOXOЙ ЭKCTPAKOД.'13''10'"
:CHARZ "OTC.AДPEC ПAMЯTИ'13''10'"
:CHARZ "OTPИЦ.HOMEP CTPAHИЦЫ Y KOMAHДЫ'13''10'"
:CHARZ "OTPИЦ.HOMEP CTPAHИЦЫ Y OПEPAHДA'13''10'"
:CHARZ "ПPOГP.ИHTEPП.TEГA KOMAHДЫ'13''10'"
:CHARZ "ПPOГP.ИHTEPП.TEГA OПEPAHДA'13''10'"
:CHARZ "ЗAЩИTA AДPECA ПPИ ЧTEHИИ'13''10'"
:CHARZ "KOHTPOЛЬ KOMAHДЫ'13''10'"
:CHARZ "???"
:CHARZ "OПEPAHД B ЧYЖOM ЛИCTE'13''10'"
:CHARZ "KOMAHДA B ЧYЖOM ЛИCTE'13''10'"
:CHARZ "ЗAЩИTA CTPAHИЦЫ ПO OБPAЩEHИЮ'13''10'"
:CHARZ "ЗAЩИTA CTPAHИЦЫ ПO ЗAПИCИ'13''10'"
:CHARZ "ЗAЩИTA BЫБOPKИ KOMAHДЫ'13''10'"
:CHARZ "ЗAЩИTA ПEPEДAЧИ YПPABЛEHИЯ'13''10'"
:CHARZ "ЗAЩИTA AДPECA ПPИ ЗAПИCИ'13''10'"
:CHARZ "ЧYЖOЙ CYMMATOP'13''10'"
:CHARZ "ЧYЖOЙ OПEPAHД'13''10'"
:CHARZ "???"
:CHARZ "???"
:CHARZ "???"
:CHARZ "???"
:CHARZ "???"
:CHARZ "ШAГOBЫЙ PEЖИM'13''10'"
:CHARZ "???"
:CHARZ "???"
:CHARZ "???"
:CHARZ "ПEPEПOЛHEHИE'13''10'"
:CHARZ "ПEPEПOЛHEHИE ПOPЯДKA БЭCM-6'13''10'"
:CHARZ "ДEЛEHИE HA 0'13''10'"
:CHARZ "ПППYПP"
:CHARZ "HEЗAKOHHЫЙ OПEPAHД'13''10'"
:CHARZ "0-Й MAT.AДPEC'13''10'"
;
CMD
;
;MOZY=81219      ;   - ERRMACRO
;
KTOЯ
ATI TN
ГHOM
ATI NG
CMON БBП
SETR БЧOП+БЧC
WTC ASTEC
P2 VTM -16
XTA INFERR
P2 ATX 12
ATI J
ASFT 32
ATI PA ; ИAOП
U VTM OUTFIL
U XTA FDB
AAU @1FFF ; HAЧ.AДPEC
RI VTMB LLIST ;  ПO
A+I RI ; БYФEPY
ATI RI ; ЛИCTИHГA
IA JMP SW_EVEN
;
SW_EVEN:J VTM ; -NORMAL END
:I VTM TERROR
JMP ST1
:HLT @222
:HLT @333
:HLT @444
:HLT @555
:I VTM TKILL
JMP ST2
;
ST1:J JMEQ ST2
I XTA
I UTM 1
AAU @FF
JANE ST1
J VRM ST1
ST2:
RR VJM STROUT
;
P2 MSFT -1
I VTMB BUF+2
XTA ="   CЧAC:"
JMPS FRAG6
:P2 HTA 16
JMPS DIG5
:XTA ="   ИAOП:"
JMPS FRAG6
:ITA PA
JMPS DIG5
:XTA ="    POП:"
JMPS FRAG6
:P2 HTA 17
JMPS DIG5
:XTA ="    PEЖ:"
JMPS FRAG6
:P2 HTA 18
JMPS DIG8
:XTA ="    PPP:"
JMPS FRAG6
:P2 HTA 19
JMPS DIG8
:CP VTM -2
RR VJM STROUTB
;
REGOUT:CP XTA THD+2
ATX BUF+2
I VTMB BUF+2
CP JMNE *+2
P2 UTM 4
UTC 3-7
:RR VTM 7
I UTM 6
REG1:UTA BL ; ПPOБEЛ
I ATB
I UTM 1
P2 HTA
P2 UTM 1
JMPS DIG8
:RR VRM REG1
CP JMNE NEXLIN
XTA ="   СЧЕТ:"
JMPS FRAG6
:XTA IFCTIM
AEU -1
A/L =1000000
I MTJ CP
RR VJM TIME
CP MTJ I
CP VTM
W VTM 7
JMPS FRAG
;
NEXLIN:RR VJM STROUTB
CP VLM REGOUT
UTA ETX
RI ATB ; " E O F "
RI UTA 1
U AEX FDB
AAU @1FFF ; OФOPMЛEHИE
U AEX FDB ; KOHЦA ФAЙЛA
U ATX FDB ; C ЛИCTИHГOM
CLRR БЧOП+БЧC
JMP ENDJOB
;
FRAG6:W VTM 6
JMP FRAG
DIG8:UTC 7-4
DIG5:W VTM 4
JMPS DHEX8
FRAG:I MTJ J
W J+M J
FR1:J ATB
ASFT 8
J UTM -1
I UTM 1
W VRM FR1
RETS
;
STROUTB:UTA CR
I ATB
UTA LF
I ATB 1
UTA
I ATB 2
I VTM BUF+2
STROUT:I MTJ J
J MSFT -3
TRLST:J BTA
J UTM 1
RI ATB
JAEQ STROUTT
RI UTM 1
ITA RI
AAU @1FFF
JANE TRLST
NP VTM LLIST
U XTA FDB
ASFT 40
AAU @FF
RI VTMB LLIST
ATI W
JAEQ TRLST
W HTA FCOOR<<1
AON 64-46 ; 8K БAЙT
W VTM 0 ; MAIN TAG
RR MTJ R
RR VJM F_WRIT
R MTJ RR
JMP TRLST
STROUTT:J VTM 0
JMP TERMOS
END
SERVER:NAME QF
;*
;*******************************************
;*     ПOДБИPATEЛЬ ИЗ "ПOЧTOBOГO ЯЩИKA"    *
;*******************************************
;*
F_OPEN:SUBP QF
F_CREAT:SUBP QF
F_READ:SUBP QF
F_WRIT:SUBP QF
TERMOS:SUBP QF
ENDJOB:SUBP QF
DHEX8:SUBP QF
;
IFP
MODIF
U:EQU P1
MEM:EQU 41<<10 ; PAБ.ПAMЯTЬ
;
;     ПPИ ЗAПYCKE REGSCAL COДEPЖИT KOД ДИPEKTИBЫ
;     ЗAПYCKA, PATHNAME - EE ПEPBЫЙ ПAPAMETP.
;     BCЯ CTPOKA OT ЗAПYCKA CИДИT B  BUF+2.
;     A ПOKA HAM HИЧEГO ЭTOГO HE HAДOБHO.
;
;MOZY=81655     ;   - SERVER
;
UTA
ATX REGSCAL
XTA ="D:\BESM6"
ATX PATHNAME
XTA ="\DIS667\"
ATX PATHNAME+1
XTA =Z"MD.MAD"
ATX PATHNAME+2
U VTM 63
;
XTA =Z"SERVER>"
ATX BUF+2
I VTM BUF+2
J VTM 1
RR VJM TERMOS+1
XTA BUF+2
AEU @47 ; "G"
AAU @FF
JANE ENDJOB
;
W VTM @84
RR VJM F_OPEN
JANE ABS_FILE
;
;       ЗACACЫBAEM BECЬ ФAЙЛ B ПAMЯTЬ
;
NP VTM MEM
W VTM ; MAIN TAG
NTA 64-46 ; 8KБAЙT
INPUT:15 ATX
RR VJM F_READ
U XTA FDB
ASFT 16
AAU @FFFF
AEU @2000
STI RR
A+U @2000
NP UTM @400 ; +1 ЛИCT
RR JMEQ INPUT
;
;      TИП (TEXT ИЛИ BIN) OПPEДEЛЯETCЯ ПO HAЛИЧИЮ
;      KOДA CMEЩEHИЯ B 16-17 БAЙTAX "MAIL BOX".
;
XTA MEM+2
ASFT 48
AEU @1200
JANE TEXT ; "TYPE"
ATX PATHNAME+2
I VTMB MEM
J VTMB PATHNAME+1
W VTM 5
;
;       ПEPEПИCЬ ЗAДAHHOГO ЧИCЛA БAЙT (C POTAЦИEЙ)
;       B ЗAДAHHЫЙ ФAЙЛ  (AHAЛOГ "BLOAD")
;
:I BTA 1
J ATB 1
I BTA
J ATB 2
I UTM 2
J UTM 2
W VRM *-3
;
NP VTM MEM
U VTM 62
R VJM F_CREAT
JAEQ ABS_FILE
;
I BTA 1
ASFT -8
I AOB
ASFT -8
I AOB 3
ASFT -8
I AOB 2
CALCLEN:ATI RI ; ДЛИHA ФAЙЛA
ASFT 1
ATI W ; K-BO ПAP БAЙTOB
W UTM -1
I UTM 6 ; OTKYДA
J VTMB MEM ; KYДA
:I BTA 1
J ATB
I BTA
J ATB 1
I UTM 2
J UTM 2
W VRM *-3
J VTM
I VTM =Z"BLOAD: "
RR VJM TERMOS+1
;
OUTPUT:RI MTJ I
RI UTM -8192
:RI JMLE *+1
I VTM 8192
:ITA I
ASFT -32
AOI J
RR VJM F_WRIT
J UTM 8192
NP UTM @400
RI JMGT OUTPUT
I UTC
J UTA -8192
J VTM =" БAЙT ЗAПИCAHO B"
MESS:15 MTJ I
JMPS DHEX8
:J XTS
J XTS 1
XTS =" ФAЙЛ   "
XTS PATHNAME+1
XTS PATHNAME+2
UTS
J VTM 0
RR VJM TERMOS+1
JMP ENDJOB
;
ABS_FILE:J VTM =" - HE OTKPЫЛCЯ"
JMP MESS
;
;
;       ПEPEПИCЬ TEKCTA (AHAЛOГ "TYPE")
;
TEXT:I VTM =Z" TYPE: "
J VTM 0
RR VJM TERMOS+1
HLT @23
END
*CALL ELPRESS:30
*CALL DISPLOAD
*CALL DISSND:BLOAD
*END F
