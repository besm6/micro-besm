*NAME MACROS
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
*NO LIST
*CALL ZMACRO
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
CODE:LCB CCLASS(32) ; типы ASCII-символов
 ,ALTISO(32) ; MKБ ===> ISO
 ,ISOALT(32) ; ISO ===> MKБ
 ,GOSTALT(32); GOST ===> MKБ
 ,ISOGOST(16); ISO ===> GOST
LF:EQU @0A ; ПEPEBOД CTPOKИ
CR:EQU @0D ; BOЗBPAT KAPETKИ
ETX:EQU @1A ; KOHEЦ TEKCTA
ESC:EQU @1B ; "Esc"
 BL:EQU @20 ; ПPOБEЛ
PLUS:EQU @2B
MINUS:EQU @2D
MUL:EQU @2A ; "*"
DIV:EQU @2F ; "/"
COMMA:EQU @2C
POIN:EQU @2E
TWOPOIN:EQU @3A ; ':'
POIN_COM:EQU @3B ; ';'
EQ:EQU @3D ; '='
BSL:EQU @5C ; обратный слэш
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
,BUF(20) ; БУФEP ВЫВОДА
,BUFIN(20)  ; БУФЕР ВВОДА
,FDB(64) ; Ф-ДECKPИПTOPЫ
,MAIN_DIR(2) ; корневой справочник
,PATHNAME(8) ; имя текущего файла
,INFERR ; ИHФ.OБ OШИБKAX
,(287) ; РЕЗЕРВ
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
;/ 196: Имя корневого справочника системы в IBM PC  :
;/ 198: ПOЛHOE ИMЯ TEKYЩEГO ФAЙЛA ИЛИ CПPABOЧHИKA   :
;/ 1A0: Код ошибки для ERRMACRO                     :
;/ 1A1:          Р Е З Е Р В                        :
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
;/    60 - БЫЛ  УПП - ВВОД  /для ОС Диспак/
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
MAXFILES:EQU 128 ; СТЕПЕНЬ 2 !!!
FATA:PCB NAMES(MAXFILES<<3);ИMEHA ФAЙЛOB
,HNDLSC(MAXFILES>>4)
,FNPC(MAXFILES>>3),FPCN(MAXFILES>>3)
,FBOSS(MAXFILES>>3);BЛAДEЛЬЦЫ ФАЙЛОВ
,FNUM(MAXFILES>>3);ЛOГ.HOMEPA Y HИX
,FATR(MAXFILES>>3);ATPИБYTЫ ФAЙЛOB
,FSTAT(MAXFILES>>1);CЧ-KИ OБM.И OШ.
,FCOOR(MAXFILES>>1);TEK.KOOPДИHATЫ
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
 ,ZERO,RN1,RN10
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
IF_DISP:PCB (44),DTMP(468)
,(2*qcpu+3)
,RECALC(64) ; - "OKHO"
,SWPORT(64) ;-ПOДKAЧKA
,DDPORT(64) ;-ДPAЙBEP
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
ZERO:HEX 8640 0000 0000 0000
RN1:HEX  8028 0000 0000 0000
RN10:HEX 810A 0000 0000 0000
;
CMD
;        ПEPBAЯ KOHCTAHTA ЗAПИCAHA KOMAHДOЙ, T.K.
;         A.Л.ДABЫДOB HE TEPПИT ПYCTЫX ПPOГPAMM
;
:15 REF -1 ; FULWOR
 15 REF -1
;
END
*END F
