*NAME OC-6 (d_driver)
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
;*   JOB=4 : ПОДВОД.  DADRES = СМЕЩЕНИЕ В БАЙТАХ
;*           LEN = 0,1,2 (начало, тек., конец файла)
;*           На выходе в DADRES попадает абс.координаты
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
ATI CP
CP JMP *+1
:UTA
JAEQ ECLOS
:JMP EOPEN
:R VTM 0 ; WRITE
JMP END_EXCH
:R VTM 1 ; READ
JMP END_EXCH
:R VTM -1 ; MOVE
JMP END_EXCH
;
;        OKOHЧEH OБMEH (ЧTEHИE ИЛИ ЗAПИCЬ)
;        ДЛИHY ПPOЧИTAHHOГO БЛOKA (ECЛИ ЧTEHHИE!)
;        И KOД OШИБKИ - B ДECKPИПTOP ЮЗEPA.
;        ECЛИ OБMEH БЫЛ 48-P. CЛOBAMИ БЭCM-6,
;        TO ДEЛAETCЯ PACПAKOBKA.
;
END_EXCH:
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
ita tn
aeu n_swing
jaeq samecoor
tn xta pcw
aan w_swin
jane samecoor
j xta job-1
a+i ia
u ath fcoor<<1
samecoor:
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
:JANE *+1 ; лист
UTC 256-1024 ; сектор
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
AAU @FFFF
AEU @600
:JANE *+1 ; лист
UTC 256-1024 ; сектор
:R VTM 1024-1
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
*END F
