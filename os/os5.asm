*NAME OC-5 (heap - waittest)
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
;
jmp return ; временно отрубим !!!
;
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
RR VJM TCPQUE ;PAЗДEЛEHИЯ BPEMEHИ
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
ITA NP
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
*END F
