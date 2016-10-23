*NАМЕ 1:INIABT
*       БОПП+БМПУ+МПС+СУСС+РГ/ТГ
*TIME:01.00
*DISC:664/SYSTEM,microb
*FILE:arc,W
*file:lib,67,r
*LIBRA:23,25
*CALL ficMEMORY
*PERSO:67
*NО LIST
*CALL MICROB
;
;СПИСОК ВОЗМОЖНЫХ ЗНАЧЕНИЙ ПОЛЕЙ:
;--------------------------------
;
FLIST SQI=JZ,CJS,JМАР,CJP,PUSH,JSRP,CJV,JRP,RFCT,RРСТ,CRTN,CJPP,LDCT,LООР,
      CONT,TWB
FLIST МАР=РЕ,GRP,МЕ
FLIST ALUD=Q,NО,ВА,В,RSBQ,RSB,LSBQ,LSB
FLIST FUNC=ADD,SUBR,SUBS,OR,AND,NOTRS,EXOR,EXNOR
FLIST ALUS=AQ,АВ,ZQ,ZВ,ZА,DА,DQ,DZ
FLIST RА=А,У,INTR,РС,РССОРУ,DADR,HALF,ВУТЕ,EXPN,MANT,WR6,WR5,WR4,WR3,WR2,WR1
FLIST RВ=А,У,INTR,РС,РССОРУ,DADR,HALF,ВУТЕ,EXPN,MANT,WR6,WR5,WR4,WR3,WR2,WR1
FLIST CI=CI0,CI1,CIX,CIC
FLIST SHMUX=LSLSL,NSNSL,ASLLS,NDNS,CDLDL,ADNDL,LDLD,LDLND,RSLRSL,RSSRSS,
      RSRS,IDCS,RDSRDS,RDLRDL,VDCD,RDRD
FLIST SТОРС=NС,NN,NZ,NV,/NС,/NN,/NZ,/NV,МС,MN,MZ,MV,/МС,/MN,/MZ,/MV,
      IС,IN,IZ,IV,/IС,/IN,/IZ,/IV,SETNC,SETNN,SETNZ,SETNV,
      УТОМ,MTON,SЕТМ,SETN,MCN,NСМ,CLRM,CLRN,INVM,CLRNC,CLRNN,CLRNZ,CLRNV
FLIST MNSA=U,IRA,МР
FLIST MODNM=М0,М1,М2,М3,М4,М5,М6,М7,М8,М9,М10,М11,М12,М13,М14,SР,С,RR,
      RRR,SPRADR,СТТ,ACL,ACR,YCL,YCR,РСС,РССС,CTL,CTR,SVFA,PROCNC,MREZ
FLIST DSRC=MODGN,PROCN,CNT,PHYSPG,ARBOPC,MULRZ1,MULRZ2,СОМА,SHIFT,ОРС,
      LOS,PROM
FLIST RTIME=RТ
FLIST WTIME=WТ
FLIST YDST=MODGN,PROCN,CNT,PHYSPG,ARBOPC,MUL1,MUL2,ADRREG,PSHIFT,CCLR,BTRCLR
FLIST SHF=CICL,LOG,ARIPH,EMULF
FLIST ARBI=CCRD,CCWR,DCRD,DCWR,FЕТСН,DRD,DWR,RDMWR,BTRWR,BTRRD,BICLR,BIRD
FLIST CYSTR=NТ3,NТ4,NТ5,NТ6,NТ7,NТ8,NТ9,NТ10
FLIST BRA=RG0,RG1,RG2,RG3
FLIST ARA=RG0,RG1,RG2,RG3
FLIST YDEV=PHYSAD,RADRR,PSMEM,МРМЕМ,SТОРМ0,SТОРМ1
FLIST YDEVT=ECBTAG
FLIST DDEV=ВВ,MODB,CLRCD,STATUS,РРМЕМ0,РРМЕМ1
FLIST YDTIM=CTIME
FLIST FFCNT=LOGGRP,MULGRP,ADDGRP,SЕТС,CLRRCB,SETRCB,CLRJMP,SETJMP,
      SETEI,CLREI,CLRTR0,SETTR0,CLRTR1,SETTR1,CLRCT,CLRCTT,CLRTKK,SЕТТКК,
      STRTLD,СНТКК,SETHLT,CLRINT,CLRRUN,LDCPMP,PRGINT,EXTINT,SETNR,SETER
FLIST MPADR=ADRB1,ADRB2,ADRB3,ADRB4,DАТАВ1,DАТАВ2,DАТАВ3,DАТАВ4,
      DАТАВ5,DАТАВ6,DАТАВ7,DАТАВ8,INFB1,INFB2,FМР,FСР
FLIST COND=YES,NORMB,RNDB,OVRIB,BNB,OVRFTB,DRG,EMLRG,RСВ,СВ,CEMLRG,
      СТ,TR1,INTSTP,RUN,NMLRDY,INT,FULMEM,ARBRDY,СРМР,IR15,ТККВ
;
;СПИСОК ОШИБОЧНЫХ КОМБИНАЦИЙ ПОЛЕЙ
;---------------------------------
;
;ШИНА D:
;-------
;
;ИСТОЧНИКИ: DSRC
;           CSM-WЕМ
;           ЕСА-WRA
;           DDEV-WRD
;
СНЕСК DSRC+CSM-WЕМ
СНЕСК DSRC+ЕСА-WRA
СНЕСК DSRC+DDEV-WRD
СНЕСК CSM-WЕМ+ЕСА-WRA
СНЕСК CSM-WЕМ+DDEV-WRD
СНЕСК ЕСА-WRA+DDEV-WRD
;
;ШИНА У:
;-------
;
;ИСТОЧНИКИ: YDEVT-WRB
;           ALU
;           ЕСВ-WRB
;           YDEV-WRY
;           YDTIM+RTIME
;
СНЕСК YDEVT-WRB+ALU
СНЕСК YDEVT-WRB+ЕСВ-WRB
СНЕСК YDEVT-WRB+YDEV-WRY
СНЕСК YDEVT-WRB+YDTIM+RTIME
СНЕСК ALU+ЕСВ-WRB
СНЕСК ALU+YDEV-WRY
СНЕСК ALU+YDTIM+RTIME
СНЕСК ЕСВ-WRB+YDEV-WRY
СНЕСК ЕСВ-WRB+YDTIM+RTIME
СНЕСК YDEV-WRY+YDTIM+RTIME
;
;     ==================
;     МАКРОСЫ ДЛЯ ТЕСТОВ
;     ==================
;
MACRO TN DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=EXPN,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=0
MACRO Т DSRC=PROM,ALUS=DZ,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=0
MACRO TIK ALUS=ZВ,RВ=MANT,Н,CI,ALUD=В,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
MACRO TIK3 ALUS=ZВ,RВ=WR3,Н,CI,ALUD=В,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
MACRO CLRTYP ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=INTR,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=1
MACRO ТУРЕ ALUS=ZВ,RВ=INTR,Н,CI,ALUD=В,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=1
MACRO С3 ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR3,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
;
;     ==================
;     МАКРОСЫ ДЛЯ КОМАНД
;     ==================
;
MACRO МА CSM,MNSA=IRA,ALUS=DQ,FUNC=ADD,ALUD=В,RВ=DADR,ALU,YDST=ADRREG
MACRO MAWF CSM,MNSA=МР,MODNM=SР,ALUS=DZ,ALUD=В,RВ=DADR,ALU,YDST=ADRREG
MACRO ARF CSM,MNSA=МР,MODNM=SР,ALUS=DZ,FUNC=SUBS,ALUD=В,RВ=DADR,ALU,YDST=ADRREG
MACRO SSPRG ЕСВ,WRB,BRA=RG3
MACRO PHAW YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
MACRO PHAR YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DRD
MACRO RСА DSRC=СОМА,ALUS=DZ,ALUD=Q
MACRO WА МАР=РЕ,COND=ARBRDY,IСС
MACRO SPRG ЕСВ,BRA=RG3,CSM,WЕМ,MNSA=МР,MODNM=SР
MACRO АС CSM,MNSA=МР,MODNM=С,ALUS=DQ,FUNC=ADD,ALUD=Q
MACRO TRSH DSRC=SHIFT,MPS,PSHF=SН0,SHF=LOG
MACRO R МАР=РЕ,COND=RСВ
MACRO М МАР=МЕ,COND=ТККВ,DDEV=CLRCD,WRD,ISE
MACRO MED МАР=МЕ,COND=ТККВ,LЕТС,ISE
MACRO ML МАР=МЕ,DDEV=CLRCD,WRD,ISE
MACRO МЕ МАР=МЕ,LЕТС
MACRO MI МАР=МЕ,COND=ТККВ,DDEV=CLRC,WRD
;
;
А1/:PROG;
;
;     РАСПРЕДЕЛЕНИЕ РЕГИСТРОВ БОПП ДЛЯ ТЕСТОВ:
;
;    АДРЕСА РЕГИСТРОВ БОПП:
;    0   1   2   3   4   5   6   7   8   9   А   В   С   D   Е   F
;  I-------------------------------I--------------------------------I
;  I   I   I   I   I          ДОПОЛНИТЕЛЬНАЯ  ИНФОРМАЦИЯ            I
;  I-------------------------------I--------------------------------I
;
;  0 РГ.БОПП: НОМЕР ТЕСТА, МЛ.БАЙТ РГ.EXPN
;  1 РГ.БОПП: ТИП ПРОВЕРКИ В ТЕСТЕ, ЕСЛИ ИХ НЕСКОЛЬКО; МЛ.БАЙТ РГ.INTR
;  2 РГ.БОПП: ТИП ОБРАЩЕНИЯ К БОПП:
;             00 - ЦИКЛ;
;             FF - ПРИЗНАК ОШИБКИ;
;             ХХ = "ЗАПРОС" = ТИП ПРОВЕРКИ (РГ.INTR).
;  3 РГ.БОПП: НОМЕР ЦИКЛА, МЛ.БАЙТ РГ.MANT
;
EXTERNAL INITSM,ERRTST,ERRINF,ERRINH,ERRINQ
;
;     ========================
;     ПРОВЕРКА КОМАНД  Б М П У
;     ========================
;
БМПУ5:ENTRY
;===== КОМАНДЫ CONT + CJP
;   ТИП ПРОВЕРКИ (МЛ. БАЙТ INTR И 1 РГ.БОПП) = 1 (CONT); = 2 (CJP)
;
CJP А=PSMPU5,МАР=РЕ
PSMPU5:CONT А=Н5,%TN%
CJS А=INITSM,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=MANT,ALU,YDEV=МРМЕМ,WRY
>,IОМР,MPADR=3
CONT %CLRTYP%
;ПРОВЕРЯЕМ КОМАНДЫ
;INTR=1 (ТИП ПРОВЕРКИ)
CONT А=ERRTST,МАР=РЕ,%ТУРЕ%
CONT А=ERRTST,МАР=РЕ,IСС
CJP А=БМПУ6,МАР=РЕ,%ТУРЕ%
CJP А=ERRTST,МАР=РЕ
;
;
БМПУ6:ENTRY
;===== LDCT + RРСТ; INTR = 0-5
;
CJP А=PSMPU6,МАР=РЕ
PSMPU6:CONT А=Н6,%TN%
CJS А=INITSM,МАР=РЕ
CONT %CLRTYP%
;ПРОВЕРЯЕМ КОМАНДЫ
;INTR=1
LDCT А=$F0,МАР=РЕ,%ТУРЕ%
RPD6:RРСТ А=RPD6,МАР=РЕ,IСС
;INTR=2
RРСТ А=ERRTST,МАР=РЕ,IСС,%ТУРЕ%
;INTR=3
LDCT А=ERRTST,МАР=РЕ,%ТУРЕ%
LDCT А=$F0,МАР=РЕ,IСС
RPDI6:RРСТ А=RPDI6,МАР=РЕ
;INTR=4
LDCT А=0,МАР=РЕ,%ТУРЕ%
RРСТ А=ERRTST,МАР=РЕ
LDCT А=$F,МАР=РЕ
;INTR=5
RРСТ А=БМПУ7,МАР=РЕ,%ТУРЕ%
CJP А=ERRTST,МАР=РЕ
;
;
БМПУ7:ENTRY
;===== JRP; INTR = 0-4
;
CJP А=PSMPU7,МАР=РЕ
PSMPU7:CONT А=Н7,%TN%
CJS А=INITSM,МАР=РЕ
CONT %CLRTYP%
;INTR=1
CONT %ТУРЕ%
;УСТАНАВЛИВАЕМ НР
LDCT А=ERRTST,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,ALU,YDST=CNT
JRP А=NЕХ7,МАР=РЕ
;INTR=2
NЕХ7:JRP А=NЕХТ7,МАР=РЕ,COND=EMLRG,IСС,%ТУРЕ%
NЕХТ7:LDCT А=NЕХТС7,МАР=РЕ
;INTR=3
JRP А=ERRTST,МАР=РЕ,COND=EMLRG,%ТУРЕ%
CJP А=ERRTST,МАР=РЕ
;INTR=4
NЕХТС7:JRP А=БМПУ8,МАР=РЕ,%ТУРЕ%
JRP А=ERRTST,МАР=РЕ
;
;
БМПУ8:ENTRY
;===== CJS + CRTN
;   INTR = 00,01,02,03,04,05,06, ЕСЛИ ЧЕРЕЗ ВСЕ П/П ПРОХОДИМ НОРМАЛЬНО!
;
CJP А=PSMPU8,МАР=РЕ
PSMPU8:CONT А=Н8,%TN%
CJS А=INITSM,МАР=РЕ
CONT %CLRTYP%
;INTR=1
CJS А=ERRTST,МАР=РЕ,IСС,%ТУРЕ%
;0 - В РР, УСТАНАВЛИВАЕМ НР
CONT ALUS=DZ,FUNC=AND,ALU,YDST=CNT
;INTR=2
CJS А=ERRTST,МАР=РЕ,COND=EMLRG,%ТУРЕ%
;1-Я ЗАГРУЗКА АДРЕСА В СТЕК
CJS А=SUBR1,МАР=РЕ
CJP А=БМПУ9,МАР=РЕ
;2-Я, INTR=3
SUBR1:CJS А=SUBR2,МАР=РЕ,%ТУРЕ%
CRTN
CJP А=ERRTST,МАР=РЕ
;3-Я, INTR=4
SUBR2:CRTN COND=EMLRG,%ТУРЕ%
CRTN IСС
CJS А=SUBR3,МАР=РЕ
CRTN
CJP А=ERRTST,МАР=РЕ
;4-Я, INTR=5
SUBR3:CJS А=SUBR4,МАР=РЕ,%ТУРЕ%
CRTN
CJP А=ERRTST,МАР=РЕ
;5-Я, INTR=6
SUBR4:CJS А=SUBR5,МАР=РЕ,%ТУРЕ%
CRTN IСС
CRTN
CJP А=ERRTST,МАР=РЕ
SUBR5:CRTN
CJP А=ERRTST,МАР=РЕ
;
;
БМПУ9:ENTRY
;===== CJPP; ТИП ПРОВЕРКИ (РГ.INTR) = 0-25 (19 Н)
;
CJP А=PSMPU9,МАР=РЕ
PSMPU9:CONT А=Н9,%TN%
CJS А=INITSM,МАР=РЕ
CONT %CLRTYP%
CONT ALUS=DZ,FUNC=AND,ALU,YDST=CNT
LDCT А=20,МАР=РЕ
JS:CJS А=SUB1,МАР=РЕ
RРСТ А=JS,МАР=РЕ
;1 ЗАГРУЗКА СТЕКА
CJS А=SUBE1,МАР=РЕ
CJP А=БМПУА,МАР=РЕ
SUB1:CJS А=SUB2,МАР=РЕ
CJP А=ERRTST,МАР=РЕ
;ОБХОДИМ АДРЕС ВОЗВРАТА, INTR=1-20
SUB2:CJPP А=S2,МАР=РЕ,%ТУРЕ%
CJP А=ERRTST,МАР=РЕ
S2:CRTN
;2
SUBE1:CJS А=SUBE2,МАР=РЕ
CJP А=ERRTST,МАР=РЕ
;3
SUBE2:CJS А=SUBE3,МАР=РЕ
CJP А=ERRTST,МАР=РЕ
;4
SUBE3:CJS А=SUBE4,МАР=РЕ
CJS А=ERRTST,МАР=РЕ
;5
SUBE4:CJS А=SUBE5,МАР=РЕ
CJS А=ERRTST,МАР=РЕ
;ВОЗВРАТ, INTR=21-25
SUBE5:CJPP А=R1,МАР=РЕ,%ТУРЕ%
CJS А=ERRTST,МАР=РЕ
R1:CJPP А=R2,МАР=РЕ,%ТУРЕ%
CJS А=ERRTST,МАР=РЕ
R2:CJPP А=R3,МАР=РЕ,%ТУРЕ%
CJS А=ERRTST,МАР=РЕ
R3:CJPP А=R4,МАР=РЕ,%ТУРЕ%
CJS А=ERRTST,МАР=РЕ
R4:CJPP А=ERRTST,МАР=РЕ,COND=EMLRG
CJPP А=ERRTST,МАР=РЕ,IСС
CRTN
;
;
БМПУА:ENTRY
;===== PUSH; ТИП ПРОВЕРКИ (РГ.INTR) = 01,02
;
CJP А=PSPUA,МАР=РЕ
PSPUA:CONT А=НА,%TN%
CJS А=INITSM,МАР=РЕ
CONT %CLRTYP%
CONT ALUS=DZ,FUNC=AND,ALU,YDST=CNT
LDCT А=ERRTST,МАР=РЕ
;INTR=1
PUSH А=NС2,МАР=РЕ,%ТУРЕ%
CJPP А=NС1,МАР=РЕ
NС1:JRP А=ERRTST,МАР=РЕ,IСС
NС2:LDCT А=БМПУВ,МАР=РЕ
;INTR=2
PUSH А=ERRTST,МАР=РЕ,COND=EMLRG,%ТУРЕ%
CJPP А=NС3,МАР=РЕ
NС3:JRP А=ERRTST,МАР=РЕ,COND=EMLRG
;
;
БМПУВ:ENTRY
;===== PUSH + LООР;  1 РГ.БОПП = РГ.INTR = 0-64
;
CJP А=PSPUB,МАР=РЕ
PSPUB:CONT А=НВ,%TN%
CJS А=INITSM,МАР=РЕ
CONT %CLRTYP%
PUSH А=ERRTST,МАР=РЕ,ALUS=DZ,FUNC=AND,ALU,YDST=CNT
;INTR=1
LООР COND=EMLRG,IСС,%ТУРЕ%
LООР
PUSH А=100,МАР=РЕ
RРСТ А=LР,МАР=РЕ
CJPP А=БМПУС,МАР=РЕ
;INTR=2
LР:LООР COND=EMLRG,%ТУРЕ%
CJP А=ERRTST,МАР=РЕ
;
;
БМПУС:ENTRY
;===== RFCT;  INTR = 0,1,2 (2 - ОЧЕНЬ РЕДКО)
;
CJP А=PSPUC,МАР=РЕ
PSPUC:CONT А=НС,%TN%
CJS А=INITSM,МАР=РЕ
CONT %CLRTYP%
CONT ALUS=DZ,FUNC=AND,ALU,YDST=CNT
;INTR=1
PUSH А=100,МАР=РЕ,%ТУРЕ%
RFCT
PUSH А=ERRTST,МАР=РЕ,IСС
;INTR=2
RFCT COND=EMLRG,%ТУРЕ%
;
;
БMПYD:ENTRY
;===== JSRP
;
CJP А=PSPUD,МАР=РЕ
PSPUD:CONT А=HD,%TN%
CJS А=INITSM,МАР=РЕ
CONT %CLRTYP%
CONT ALUS=DZ,FUNC=AND,ALU,YDST=CNT
;INTR=1
LDCT А=SВ1,МАР=РЕ,%ТУРЕ%
JSRP А=ERRTST,МАР=РЕ,IСС
LDCT А=ERRTST,МАР=РЕ
;INTR=2
JSRP А=SВ2,МАР=РЕ,COND=EMLRG,IСС,%ТУРЕ%
CJP А=ERRTST,МАР=РЕ
SВ1:CRTN
SВ2:CJPP А=БМПУЕ,МАР=РЕ
;
;
БМПУЕ:ENTRY
;===== TWB; ТИП ПРОВЕРКИ (РГ.INTR) = 00-06
;
CJP А=PSPUE,МАР=РЕ
PSPUE:CONT А=НЕ,%TN%
CJS А=INITSM,МАР=РЕ
CONT %CLRTYP%
CONT ALUS=DZ,FUNC=AND,ALU,YDST=CNT
;INTR=1
PUSH А=100,МАР=РЕ,%ТУРЕ%
TWB А=NСОМ,МАР=РЕ,COND=EMLRG
;INTR=2
CJP А=ERRTST,МАР=РЕ
NСОМ:PUSH А=ERRTST,МАР=РЕ,%ТУРЕ%
TWB А=ERRTST,COND=EMLRG,IСС
;1-Я ЗАГРУЗКА СТЕКА
CJS А=SU1,МАР=РЕ
CJP А=CTCCF,МАР=РЕ
;2
SU1:CJS А=SU2,МАР=РЕ
CJP А=ERRTST,МАР=РЕ
;3
SU2:CJS А=SU3,МАР=РЕ
CJP А=ERRTST,МАР=РЕ
;4
SU3:CJS А=SU4,МАР=РЕ
CJP А=ERRTST,МАР=РЕ
;5
SU4:CJS А=SU5,МАР=РЕ
CJP А=ERRTST,МАР=РЕ
SU5:LDCT А=0,МАР=РЕ
;5; INTR=3
TWB А=RR1,МАР=РЕ,COND=EMLRG,%ТУРЕ%
CJP А=ERRTST,МАР=РЕ
;4; INTR=4
RR1:TWB А=RR2,МАР=РЕ,IСС,%ТУРЕ%
CJP А=ERRTST,МАР=РЕ
;3; INTR=5
RR2:TWB А=ERRTST,МАР=РЕ,%ТУРЕ%
;2; INTR=6
TWB А=ERRTST,МАР=РЕ,COND=EMLRG,IСС,%ТУРЕ%
;1
CRTN
;
;
;     ============================
;     УСЛОВНЫЕ ПЕРЕХОДЫ ПО СТ СУСС
;     ============================
;
CTCCF:ENTRY
;===== ЗАГРУЗКА 0 В N, УСЛОВНЫЙ ПЕРЕХОД  CJP  ПО СТ СУСС; INTR = 0-2
;
CJP А=PSCTF,МАР=РЕ
PSCTF:CONT А=HF,%TN%
CJS А=INITSM,МАР=РЕ
;1 - В РГ.N
CONT SТОРС=1,CEN
;0 - В N
CONT SТОРС=3,CEN
;ЖДЕМ 1 ТАКТ
CONT SТОРС=21
;П/У НА НАЧАЛО, ЕСЛИ /NZ=1 (Т.К. NZ Д.БЫТЬ = 0, КОТОРЫЙ ЗАГРУЗИЛИ!)
CJP А=СТСС10,МАР=РЕ,COND=СТ,SТОРС=21
;ОШИБКА; ЧИТАЕМ N В РГ.У
CJS А=ERRINF,МАР=РЕ,SТОРС=1,DDEV=STATUS,ALUS=DZ,ALUD=В,RВ=У
;
;
СТСС10:ENTRY
;===== ЗАГРУЗКА 0 В N, КОМАНДА JRP
;
CJP А=PSCT10,МАР=РЕ
PSCT10:CONT А=Н10,%TN%
CJS А=INITSM,МАР=РЕ
;1 - В РГ.N
CONT SТОРС=1,CEN
;0 - В N
CONT SТОРС=3,CEN
;ЖДЕМ 1 ТАКТ
LDCT А=СТСС11,МАР=РЕ,SТОРС=20
;П/У НА НАЧАЛО, ЕСЛИ NZ=0
JRP А=ERCT10,МАР=РЕ,COND=СТ,SТОРС=20
;ОШИБКА; ЧИТАЕМ N В РГ.У
ERCT10:CJS А=ERRINF,МАР=РЕ,SТОРС=1,DDEV=STATUS,ALUS=DZ,ALUD=В,RВ=У
;
;
СТСС11:ENTRY
;===== УСТАНОВКА N ПО РЕЗ-ТУ ИЗ ПРЦР + КОМАНДА CJP
;
CJP А=PSCT11,МАР=РЕ
PSCT11:CONT А=Н11,%TN%
CJS А=INITSM,МАР=РЕ
;0 - В РГ.А ПРЦР, NZ=1
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=А,CEN
;F...F - В РГ.А ПРЦР, NZ=0
CONT ALUS=ZА,RА=А,FUNC=EXNOR,Н,ALUD=В,RВ=А,CEN
;ЖДЕМ 1 ТАКТ
CONT IСС,SТОРС=21
;П/У НА НАЧАЛО, ЕСЛИ NZ=0 (/NZ=1), ЕСЛИ НЕ 0-Й РЕЗУЛЬТАТ
CJP А=СТСС12,МАР=РЕ,COND=СТ,SТОРС=21
;ОШИБКА; ЧИТАЕМ N В РГ.У
CJS А=ERRINF,МАР=РЕ,SТОРС=1,DDEV=STATUS,ALUS=DZ,ALUD=В,RВ=У
;
;
СТСС12:ENTRY
;===== УСТАНОВКА N ПО РЕЗ-ТУ ИЗ ПРЦР + КОМАНДА JRP
;
CJP А=PSCT12,МАР=РЕ
PSCT12:CONT А=Н12,%TN%
CJS А=INITSM,МАР=РЕ
;0 - В РГ.А ПРЦР, NZ=1
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=А,CEN
;F...F - В РГ.А ПРЦР, NZ=0
CONT ALUS=ZА,RА=А,FUNC=EXNOR,Н,ALUD=В,RВ=А,CEN
;ЖДЕМ 1 ТАКТ
LDCT А=СТСС13,МАР=РЕ,SТОРС=20
;П/У НА НАЧАЛО, ЕСЛИ NZ=0
JRP А=ERCT12,МАР=РЕ,COND=СТ,SТОРС=20
;ОШИБКА; ЧИТАЕМ N В РГ.У
ERCT12:CJS А=ERRINF,МАР=РЕ,SТОРС=1,DDEV=STATUS,ALUS=DZ,ALUD=В,RВ=У
;
;
СТСС13:ENTRY
;===== ПРОВЕРКА СИГНАЛОВ СЕМ И CEN
;
CJP А=PSCT13,МАР=РЕ
PSCT13:CONT А=Н13,%TN%
CJS А=INITSM,МАР=РЕ
CONT %CLRTYP%
;0 - В РГ.А ПРЦР, NZ=MZ=1
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=А,CEN,СЕМ
;ПЫТАЕМСЯ ЗАГРУЗИТЬ 0 В NZ И MZ БЕЗ CEN И СЕМ
CONT SТОРС=3
;ЖДЕМ 1 ТАКТ
CONT SТОРС=21,%ТУРЕ%
;INTR = 1: П/У НА ОШИБКУ, ЕСЛИ NZ=0 (/NZ=1); N - В РГ.У
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,DDEV=STATUS,ALUS=DZ,ALUD=В,RВ=У
;ЖДЕМ 1 ТАКТ (?)
LDCT А=СТСС14,МАР=РЕ,SТОРС=37,%ТУРЕ%
;INTR = 2: П/У НА НАЧАЛО, ЕСЛИ MZ=1; ИЛИ НА ОШИБКУ, ЕСЛИ MZ=0; М - В РГ.У
JRP А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=37,DDEV=STATUS,ALUS=DZ,ALUD=В,RВ=У
;
;
СТСС14:ENTRY
;===== ЗАГРУЗКА 0 В М
;
CJP А=PSCT14,МАР=РЕ
PSCT14:CONT А=Н14,%TN%
CJS А=INITSM,МАР=РЕ
;1 - В РГ.М
CONT SТОРС=1,СЕМ
;0 - В М (MZ=0)
CONT SТОРС=3,СЕМ
;ЖДЕМ 1 ТАКТ
LDCT А=СТСС15,МАР=РЕ,SТОРС=36
;П/У НА НАЧАЛО, ЕСЛИ MZ=0; ИЛИ НА ОШИБКУ, ЕСЛИ MZ=1
JRP А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=36,DDEV=STATUS,ALUS=DZ,ALUD=В,RВ=У
;
;
СТСС15:ENTRY
;===== УСТАНОВКА М ПО РЕЗ-ТУ ИЗ ПРЦР
;
CJP А=PSCT15,МАР=РЕ
PSCT15:CONT А=Н15,%TN%
CJS А=INITSM,МАР=РЕ
;0 - В РГ.А ПРЦР, MZ=1
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=А,СЕМ
;1 - В РГ.А ПРЦР, MZ=0
CONT ALUS=ZА,RА=А,FUNC=ADD,Н,CI,ALUD=В,RВ=А,СЕМ
;ЖДЕМ 1 ТАКТ
LDCT А=СТСС16,МАР=РЕ,SТОРС=36
;П/У НА НАЧАЛО, ЕСЛИ MZ=0; ИЛИ НА ОШИБКУ, ЕСЛИ MZ=1
JRP А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=36,DDEV=STATUS,ALUS=DZ,ALUD=В,RВ=У
;
;
СТСС16:ENTRY
;===== ОБМЕН МЕЖДУ М И N
;
CJP А=PSCT16,МАР=РЕ
PSCT16:CONT А=Н16,%TN%
CJS А=INITSM,МАР=РЕ
CONT %CLRTYP%
;0 - В РГ.А ПРЦР, MZ=1
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=А,СЕМ
;1 - В РГ.А ПРЦР, NZ=0
CONT ALUS=ZА,RА=А,FUNC=ADD,Н,CI,ALUD=В,RВ=А,CEN
;ОБМЕН М И N, NZ=1, MZ=0
CONT SТОРС=2,СЕМ,CEN
;ЖДЕМ 1 ТАКТ
CONT SТОРС=21,%ТУРЕ%
;INTR=1; П/У НА ОШИБКУ, ЕСЛИ NZ=0 (/NZ=1)
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,DDEV=STATUS,ALUS=DZ,ALUD=В,RВ=У
;ЖДЕМ 1 ТАКТ
LDCT А=СТСС17,МАР=РЕ,SТОРС=36,%ТУРЕ%
;INTR=2; П/У НА НАЧАЛО, ЕСЛИ MZ=0; ИЛИ НА ОШИБКУ, ЕСЛИ MZ=1
JRP А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=36,DDEV=STATUS,ALUS=DZ,ALUD=В,RВ=У
;
;
СТСС17:ENTRY
;===== ЗАПИСЬ 0,F С ШИНЫ У В РГ.М СУСС, ЧТЕНИЕ РГ.М, СРАВНЕНИЕ В МП
;
CJP А=PSCT17,МАР=РЕ
PSCT17:CONT А=Н17,%TN%
CJS А=INITSM,МАР=РЕ
;0 - В РГ.А ПРЦР, В РГ.N  СУСС
CONT ALUS=ZА,FUNC=AND,Н,ALUD=В,RВ=А,SТОРС=3,CEN
;/А - В А, В РГ.М СУСС ЧЕРЕЗ ШИНУ У, СТАРОЕ М - В N
CONT ALUS=ZА,RА=А,FUNC=EXNOR,Н,ALUD=В,RВ=А,ALU,SТОРС=0,СЕМ,CEN
>,DDEV=STATUS,WRD
;РГ.М СУСС - НА ШИНУ D, В РГ.У, СРАВНИВАЕМ С РГ.А
CONT SТОРС=32,DDEV=STATUS,ALUS=DА,RА=А,FUNC=EXOR,Н,ALUD=В,RВ=У
;СДВИГ РЕЗ-ТА ВПРАВО НА 6 (УБИРАЕМ МУСОР В МЛ.РАЗРЯДАХ)
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0+6,SHF=LOG
;УБИРАЕМ МУСОР В СТ.РАЗРЯДАХ: СДВИГ ВЛЕВО НА 60, NZ=1
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0-60,SHF=LOG,CEN
LDCT А=СТСС18,МАР=РЕ,SТОРС=21
;П/У НА ОШИБКУ, ЕСЛИ /NZ=1 (NZ=0)
JRP А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=21
;
;
СТСС18:ENTRY
;===== ПОРАЗРЯДНОЕ ИЗМЕНЕНИЕ РГ.N;  INTR = 0-2
;
CJP А=PSCT18,МАР=РЕ
PSCT18:CONT А=Н18,%TN%
CJS А=INITSM,МАР=РЕ
CONT %CLRTYP%
;0 - В РГ.А ПРЦР, В РГ.N  СУСС
CONT ALUS=ZА,FUNC=AND,Н,ALUD=В,RВ=А,SТОРС=3,CEN
;УСТАНАВЛИВАЕМ В 1 ОТДЕЛЬНЫЕ РАЗРЯДЫ РГ.N: 1 - В NZ
CONT SТОРС=9,CEN
;1 - В NС
CONT SТОРС=11,CEN
;1 - В NN
CONT SТОРС=13,CEN
;1 - В NV, F...F - В РГ.А
CONT SТОРС=15,CEN,ALUS=ZА,RА=А,FUNC=EXNOR,Н,ALUD=В,RВ=А
;ЧИТАЕМ РГ.N СУСС - В РГ.У МПС, СРАВНИВАЕМ С РГ.А
CONT SТОРС=1,DDEV=STATUS,ALUS=DА,RА=А,FUNC=EXOR,Н,ALUD=В,RВ=У
;СДВИГ РЕЗ-ТА ВПРАВО НА 6 (УБИРАЕМ МУСОР В МЛ.РАЗРЯДАХ)
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0+6,SHF=LOG
;УБИРАЕМ МУСОР В СТ.РАЗРЯДАХ: СДВИГ ВЛЕВО НА 60, MZ=1
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0-60,SHF=LOG,СЕМ
CONT SТОРС=37,%ТУРЕ%
;INTR=1; П/У НА ОШИБКУ, ЕСЛИ N НЕ РАВЕН РГ.А
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=37
;УСТАНАВЛИВАЕМ В 0 ОТДЕЛЬНЫЕ РАЗРЯДЫ РГ.N: 0 - В NZ,NС,NN,NV
CONT SТОРС=8,CEN
CONT SТОРС=10,CEN
CONT SТОРС=12,CEN
;А ТАКЖЕ 0 - В РГ.А
CONT SТОРС=14,CEN,ALUS=ZА,FUNC=AND,Н,ALUD=В,RВ=А
;СРАВНИВАЕМ А И N
CONT SТОРС=1,DDEV=STATUS,ALUS=DА,RА=А,FUNC=EXOR,Н,ALUD=В,RВ=У
;УБИРАЕМ МУСОР В СТ.И МЛ.РАЗРЯДАХ
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0+6,SHF=LOG
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0-60,SHF=LOG
>,СЕМ
LDCT А=МПС19,МАР=РЕ,SТОРС=37
;INTR=2; П/У НА ОШИБКУ, ЕСЛИ /MZ=1 (MZ=0)
JRP А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=37,%ТУРЕ%
;
;
;     ==============================================
;     ПОВЕРКА МИКРОПРОЦЕССОРНЫХ СЕКЦИЙ   +   С У С С
;     ==============================================
;
МПС19:ENTRY
;===== КОМАНДЫ ADD, EOR; СРАВНЕНИЕ В МИКРОПРОГРАММЕ
;
CJP А=PSMP19,МАР=РЕ
PSMP19:CONT А=Н19,%TN%
CJS А=INITSM,МАР=РЕ
;4 РГ.БОПП - В СТ.БАЙТ РГ.А МПС (БАЙТ ИЗ БОПП + СДВИГ)
CONT YDEV=МРМЕМ,IОМР,MPADR=4,DSRC=SHIFT,MPS,PSHF=SН0-56,SHF=LOG
>,ALUS=DZ,FUNC=ADD,Н,ALUD=В,RВ=А
;ТО ЖЕ - В РГ.Q (БАЙТ ИЗ БОПП + СДВИГ)
CONT YDEV=МРМЕМ,IОМР,MPADR=4,DSRC=SHIFT,MPS,PSHF=SН0-56,SHF=LOG
>,ALUS=DZ,FUNC=ADD,Н,ALUD=Q
;А + 1 -> В РГ.А
CONT ALUS=ZА,RА=А,Н,CI,ALUD=В,RВ=А
;Q + 1 -> В РГ.Q
CONT ALUS=ZQ,Н,CI,ALUD=Q
;СРАВНИВАЕМ А И Q
CONT ALUS=AQ,RА=А,FUNC=EXOR,Н,ALUD=В,RВ=У,CEN
LDCT А=МПС1А,МАР=РЕ,SТОРС=21
JRP А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
;
;
МПС1А:ENTRY
;===== КОМАНДЫ ADD И SUBR, СРАВНЕНИЕ В МП
;
CJP А=PSMP1A,МАР=РЕ
PSMP1A:CONT А=Н1А,%TN%
CJS А=INITSM,МАР=РЕ
;4 РГ.БОПП - В СТ.РАЗРЯДЫ РГ.А
PUSH А=3,МАР=РЕ,YDEV=МРМЕМ,IОМР,MPADR=4,DSRC=SHIFT,MPS,PSHF=SН0-56
>,SHF=LOG,ALUS=DZ,Н,ALUD=В,RВ=А
;А + 1 - В РГ.А, 4 РАЗА
RFCT ALUS=ZВ,RВ=А,Н,CI,ALUD=В
PUSH А=3,МАР=РЕ
;А - 1 - В РГ.А, 4 РАЗА (СТОЛЬКО ЖЕ РАЗ ВЫЧИТАЕМ)
RFCT ALUS=ZА,RА=А,FUNC=SUBR,Н,ALUD=В,RВ=А
;СРАВНИВАЕМ С 4 РГ.БОПП
CONT YDEV=МРМЕМ,IОМР,MPADR=4,DSRC=SHIFT,SHF=LOG,MPS,PSHF=SН0-56,ALUS=DZ,Н
>,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,Н,ALUD=Q,CEN
LDCT А=ERRINQ,МАР=РЕ,IСС,SТОРС=20
JRP А=МПС1В,МАР=РЕ,COND=СТ,SТОРС=20
;
;
МПС1В:ENTRY
;===== УСТАНОВКА РЕГИСТРОВ  М,N  СУСС ПО РЕЗУЛЬТАТУ ИЗ МПС
;   INTR = 1,2 - ПРОВЕРЯЕМ NZ,MZ; 3,4 - NN,MN; 5,6 - NС,МС; 7,8 - NV,MV
;   РГ.У = РГ.N ИЛИ М.
;
CJP А=PSMP1B,МАР=РЕ
PSMP1B:CONT А=Н1В,%TN%
CJS А=INITSM,МАР=РЕ
CONT %CLRTYP%
;0 - В РГ.А, NZ=MZ=1
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=А,CEN,СЕМ
CONT SТОРС=/NZ,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,DDEV=STATUS,ALUS=DZ,ALUD=В,RВ=У
CONT SТОРС=/MZ,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/MZ,DDEV=STATUS,ALUS=DZ,ALUD=В,RВ=У
;ИНВЕРТИРУЕМ РГ.А, NN=MN=1
CONT ALUS=ZА,RА=А,FUNC=EXNOR,Н,ALUD=В,RВ=А,CEN,СЕМ
CONT SТОРС=/NN,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NN,DDEV=STATUS,ALUS=DZ,ALUD=В,RВ=У
CONT SТОРС=/MN,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/MN,DDEV=STATUS,ALUS=DZ,ALUD=В,RВ=У
;ДОБАВЛЯЕМ 1 К FFF...FFF, NС=МС=1
CONT ALUS=ZВ,RВ=А,Н,CI,ALUD=В,CEN,СЕМ
CONT SТОРС=/NС,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NС,DDEV=STATUS,ALUS=DZ,ALUD=В,RВ=У
CONT SТОРС=/МС,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NС,DDEV=STATUS,ALUS=DZ,ALUD=В,RВ=У
;СДВИГАЕМ 0 ВПРАВО С ЗАГРУЗКОЙ "1" = 80...00
CONT ALUS=ZА,RА=А,Н,ALUD=RSB,RВ=А,SHMUX=NSNSL
;К 80...00 ДОБАВЛЯЕМ СТОЛЬКО ЖЕ: NV=MV=1
CONT ALUS=АВ,RА=А,RВ=А,FUNC=ADD,Н,ALUD=В,CEN,СЕМ
CONT SТОРС=/NV,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NV,DDEV=STATUS,ALUS=DZ,ALUD=В,RВ=У
CONT SТОРС=/MV,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/MV,DDEV=STATUS,ALUS=DZ,ALUD=В,RВ=У
;
;
МПС1С:ENTRY
;===== ЗАПИСЬ, ЧТЕНИЕ РЕГИСТРОВ МПС: РГ.Q
;
CJP А=PSMP1C,МАР=РЕ
PSMP1C:CONT А=Н1С,%TN%
CJS А=INITSM,МАР=РЕ
;4 РГ.БОПП - СДВИГ В СТ.РАЗРЯДЫ - В РГ.Q
CONT YDEV=МРМЕМ,IОМР,MPADR=4,DSRC=SHIFT,MPS,PSHF=SН0-56,SHF=LOG
>,ALUS=DZ,FUNC=ADD,Н,ALUD=Q
;СНОВА ЧИТАЕМ ИЗ БОПП, СРАВНИВАЕМ С РГ.Q
CONT YDEV=МРМЕМ,IОМР,MPADR=4,DSRC=SHIFT,MPS,PSHF=SН0-56,SHF=LOG
>,ALUS=DQ,FUNC=EXOR,Н,ALUD=Q,CEN
LDCT А=MПC1D,МАР=РЕ,SТОРС=21
JRP А=ERRINQ,МАР=РЕ,COND=СТ,SТОРС=21
;
;
MПC1D:ENTRY
;===== ПЕРЕСЫЛКА РГ.А,WR1-WR5,У
;
CJP А=PSMP1D,МАР=РЕ
PSMP1D:CONT А=H1D,%TN%
CJS А=INITSM,МАР=РЕ
;4 РГ.БОПП - СДВИГ В СТ.РАЗРЯДЫ - В РГ.А
CONT YDEV=МРМЕМ,IОМР,MPADR=4,DSRC=SHIFT,MPS,PSHF=SН0-56,SHF=LOG
>,ALUS=DZ,FUNC=ADD,Н,ALUD=В,RВ=А
;А -> WR1 -> WR2 -> WR3 -> WR4 -> WR5 -> У
CONT ALUS=ZА,RА=А,Н,ALUD=В,RВ=WR1
CONT ALUS=ZА,RА=WR1,Н,ALUD=В,RВ=WR2
CONT ALUS=ZА,RА=WR2,Н,ALUD=В,RВ=WR3
CONT ALUS=ZА,RА=WR3,Н,ALUD=В,RВ=WR4
CONT ALUS=ZА,RА=WR4,Н,ALUD=В,RВ=WR5
CONT ALUS=ZА,RА=WR5,Н,ALUD=В,RВ=У
;СНОВА ЧИТАЕМ ИЗ БОПП, СРАВНИВАЕМ С РГ.У
CONT YDEV=МРМЕМ,IОМР,MPADR=4,DSRC=SHIFT,MPS,PSHF=SН0-56,SHF=LOG
>,ALUS=DА,RА=У,FUNC=EXOR,Н,ALUD=Q,CEN
LDCT А=МПС1Е,МАР=РЕ,SТОРС=21
JRP А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
;
;
МПС1Е:ENTRY
;===== СРАВНИВАЕМ ОДИН И ТОТ ЖЕ РЕГИСТР ПО ВХОДАМ А И В
;
CJP А=PSMP1E,МАР=РЕ
PSMP1E:CONT А=Н1Е,%TN%
CJS А=INITSM,МАР=РЕ
;СРАВНИВАЕМ
CONT ALUS=АВ,RА=У,RВ=У,FUNC=EXOR,Н,ALUD=Q,CEN
LDCT А=MПC1F,МАР=РЕ,SТОРС=21
JRP А=ERRINQ,МАР=РЕ,COND=СТ,SТОРС=21
;
;
MПC1F:ENTRY
;===== ЛОГИЧЕСКИЕ, АРИФМЕТИЧЕСКИЕ КОМАНДЫ: AND
;   AND С "0" (INTR=01); AND С F...F" (02); AND С ДОПОЛНЕНИЕМ (INTR=03)
;
CJP А=PSMP1F,МАР=РЕ
PSMP1F:CONT А=H1F,%TN%
CJS А=INITSM,МАР=РЕ
;0 - В А
CONT ALUS=ZА,FUNC=AND,Н,ALUD=В,RВ=А
;FF...FF - В РГ.WR1
CONT ALUS=ZА,RА=А,FUNC=EXNOR,Н,ALUD=В,RВ=WR1
;CONST = "FF00...00" - В РГ.У (СДВИГОМ)
CONT ALUS=DZ,Н,ALUD=ВА,RА=WR1,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0-48,SHF=LOG
;ДОПОЛНЕНИЕ CONST - В WR2
CONT ALUS=ZА,RА=У,FUNC=EXNOR,Н,ALUD=В,RВ=WR2
CONT %CLRTYP%
;INTR=1; "FF...FF" AND С "0"
CONT ALUS=АВ,RА=А,RВ=WR1,FUNC=AND,Н,ALUD=Q,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINQ,МАР=РЕ,COND=СТ,SТОРС=21
;INTR=2; CONST (FF00...00) AND С "F...F" = CONST
CONT ALUS=АВ,RА=WR1,RВ=У,FUNC=AND,Н,ALUD=Q
;СРАВНИВАЕМ С CONST
CONT ALUS=AQ,RА=У,FUNC=EXOR,Н,ALU,CEN
CONT SТОРС=21,%ТУРЕ%
CJP А=ERRINQ,МАР=РЕ,COND=СТ,SТОРС=21
;INTR=3; AND С ДОПОЛНЕНИЕМ
CONT ALUS=АВ,RА=У,RВ=WR2,FUNC=AND,Н,ALUD=Q,ALU,CEN
LDCT А=МПС20,МАР=РЕ,SТОРС=21,%ТУРЕ%
JRP А=ERRINQ,МАР=РЕ,COND=СТ,SТОРС=21
;
;
МПС20:ENTRY
;===== OR С "0" (INTR=01); OR С ДОПОЛНЕНИЕМ (INTR=02)
;
CJP А=PSMP20,МАР=РЕ
PSMP20:CONT А=Н20,%TN%
CJS А=INITSM,МАР=РЕ
;0 - В WR1
CONT ALUS=ZА,FUNC=AND,Н,ALUD=В,RВ=WR1
;FF...FF - В WR2
;CONST = "FF00...00" - В WR3 (СДВИГОМ)
CONT ALUS=DZ,Н,ALUD=ВА,RА=WR2,RВ=WR3,ALU,DSRC=SHIFT,MPS,PSHF=SН0-56
>,SHF=LOG
;ДОПОЛНЕНИЕ CONST - В WR4
CONT ALUS=ZА,RА=WR3,FUNC=EXNOR,Н,ALUD=В,RВ=WR4
CONT %CLRTYP%
;INTR=1; OR С "0"
CONT ALUS=АВ,RА=WR1,RВ=WR3,FUNC=OR,Н,ALUD=Q
CONT ALUS=AQ,RА=WR3,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINQ,МАР=РЕ,COND=СТ,SТОРС=21
;INTR=2; OR С ДОПОЛНЕНИЕМ
CONT ALUS=АВ,RА=WR3,RВ=WR4,FUNC=OR,Н,ALUD=Q
;ИНВЕРТИРУЕМ, СРАВНИВАЕМ С 0
CONT ALUS=ZQ,FUNC=EXNOR,Н,ALUD=Q,CEN
LDCT А=МПС21,МАР=РЕ,SТОРС=21,%ТУРЕ%
JRP А=ERRINQ,МАР=РЕ,COND=СТ,SТОРС=21
;
;
МПС21:ENTRY
;===== NOTRS, R=S=CONST
;
CJP А=PSMP21,МАР=РЕ
PSMP21:CONT А=Н21,%TN%
CJS А=INITSM,МАР=РЕ
;CONST (ЛЮБУЮ) - В WR1
CONT YDEV=МРМЕМ,IОМР,MPADR=4,DSRC=SHIFT,MPS,PSHF=SН0-56,SHF=LOG
>,ALUS=DZ,Н,ALUD=В,RВ=WR1
;(.NОТ.R).AND.S
CONT ALUS=АВ,RА=WR1,RВ=WR1,FUNC=NOTRS,Н,ALUD=Q,CEN
LDCT А=МПС22,МАР=РЕ,SТОРС=21
JRP А=ERRINQ,МАР=РЕ,COND=СТ,SТОРС=21
;
;
МПС22:ENTRY
;===== NOTRS, S=0; S=F...F;  INTR = 0-2
;
CJP А=PSMP22,МАР=РЕ
PSMP22:CONT А=Н22,%TN%
CJS А=INITSM,МАР=РЕ
;0 - В WR1
CONT ALUS=ZА,FUNC=AND,Н,ALUD=В,RВ=WR1
;CONST (FF...00) - В WR2
CONT ALUS=ZА,RА=WR1,FUNC=EXNOR,Н,ALUD=В,RВ=WR2
CONT ALUS=DZ,Н,ALUD=ВА,RА=WR2,RВ=WR2,ALU,DSRC=SHIFT,MPS,PSHF=SН0-50,SHF=LOG
CONT %CLRTYP%
;INTR=1; NOTRS: AND С 0
CONT ALUS=АВ,RА=WR2,RВ=WR1,FUNC=NOTRS,Н,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINQ,МАР=РЕ,COND=СТ,SТОРС=21
;INTR=2; NOTRS: AND С "F...F"
CONT ALUS=АВ,RА=WR1,RВ=WR2,FUNC=NOTRS,Н,ALUD=Q
CONT ALUS=AQ,RА=WR2,FUNC=EXOR,Н,ALUD=Q,СЕМ
LDCT А=МПС23,МАР=РЕ,SТОРС=37,%ТУРЕ%
JRP А=ERRINQ,МАР=РЕ,COND=СТ,SТОРС=37
;
;
МПС23:ENTRY
;===== ALUS=DQ
;
CJP А=PSMP23,МАР=РЕ
PSMP23:CONT А=Н23,%TN%
CJS А=INITSM,МАР=РЕ
;CONST - В Q
CONT YDEV=МРМЕМ,IОМР,MPADR=4,DSRC=SHIFT,MPS,PSHF=SН0-56,SHF=LOG
>,ALUS=DZ,Н,ALUD=Q
;СРАВНИВАЕМ ЕЕ
CONT YDEV=МРМЕМ,IОМР,MPADR=4,DSRC=SHIFT,MPS,PSHF=SН0-56,SHF=LOG
>,ALUS=DQ,FUNC=EXOR,Н,ALUD=В,RВ=У,CEN
LDCT А=МПС24,МАР=РЕ,SТОРС=21
JRP А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
;
;
МПС24:ENTRY
;===== ALUS=ZВ
;
CJP А=PSMP24,МАР=РЕ
PSMP24:CONT А=Н24,%TN%
CJS А=INITSM,МАР=РЕ
;CONST - В WR1
CONT YDEV=МРМЕМ,IОМР,MPADR=4,DSRC=SHIFT,MPS,PSHF=SН0-56,SHF=LOG
>,ALUS=DZ,Н,ALUD=В,RВ=WR1
;ТО ЖЕ - В Q
CONT ALUS=ZВ,RВ=WR1,Н,ALUD=Q
;СРАВНИВАЕМ
CONT YDEV=МРМЕМ,IОМР,MPADR=4,DSRC=SHIFT,MPS,PSHF=SН0-56,SHF=LOG
>,ALUS=DQ,FUNC=EXOR,Н,ALUD=В,RВ=WR2,CEN
LDCT А=НМПС25,МАР=РЕ,SТОРС=21
JRP А=ERRINQ,МАР=РЕ,COND=СТ,SТОРС=21
;
;
;     ===
;      Н
;     ===
;
НМПС25:ENTRY
;===== Н: ПЕРЕСЫЛКА 32 РАЗРЯДОВ; INTR = 0-2
;
CJP А=PSH25,МАР=РЕ
PSH25:CONT А=Н25,%TN%
CJS А=INITSM,МАР=РЕ
;0 - В WR1
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR1
;F...F - В WR2
CONT ALUS=ZА,RА=WR1,FUNC=EXNOR,Н,ALUD=В,RВ=WR2
;F...F - СДВИГ ВПРАВО ЛОГ. НА 32Р. - В WR3 = 0...0F...F
CONT ALUS=DZ,Н,ALUD=ВА,RА=WR2,RВ=WR3,ALU,DSRC=SHIFT,MPS,PSHF=SН0+32
>,SHF=LOG
CONT %CLRTYP%
;0 - В Q (64 Р.)
CONT ALUS=ZА,RА=WR1,Н,ALUD=Q,ALU
;F...F - В Q (32 Р.)
CONT ALUS=ZА,RА=WR2,ALUD=Q,ALU
;INTR=1; СРАВНИВАЕМ Q И WR3
CONT ALUS=AQ,RА=WR3,FUNC=EXOR,Н,ALUD=В,RВ=У,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
;INTR=2; ПЕРЕСЫЛАЕМ 0 (32 Р.)
CONT ALUS=ZА,RА=WR1,ALUD=Q
CONT ALUS=ZQ,Н,СЕМ
LDCT А=НМПС26,МАР=РЕ,SТОРС=37,%ТУРЕ%
JRP А=ERRINQ,МАР=РЕ,COND=СТ,SТОРС=37
;
;
НМПС26:ENTRY
;===== ЛОГИЧЕСКИЕ ОПЕРАЦИИ С 32 Р.
;   ОШИБКИ ПРИ ИСПОЛНЕНИИ КОМАНД (РГ.INTR = 1 РГ.БОПП):
;   OR - 01; EXNOR - 02; AND - 03; EOR - 04.
;
CJP А=PSH26,МАР=РЕ
PSH26:CONT А=Н26,%TN%
CJS А=INITSM,МАР=РЕ
;0 - В WR1
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR1
;F...F - В WR2
CONT ALUS=ZА,RА=WR1,FUNC=EXNOR,Н,ALUD=В,RВ=WR2
;0...0F...F - В WR3
CONT ALUS=DZ,Н,ALUD=ВА,RА=WR2,RВ=WR3,ALU,DSRC=SHIFT,MPS,PSHF=SН0+32
>,SHF=LOG
;F...F0...0 - В WR4
CONT ALUS=ZА,RА=WR3,FUNC=EXNOR,Н,ALUD=В,RВ=WR4
CONT %CLRTYP%
;0 - В Q (64 Р.)
CONT ALUS=ZА,RА=WR1,Н,ALUD=Q
;INTR=1; OR С F...F (32 Р.); СРАВНИВАЕМ Q И WR3
CONT ALUS=AQ,RА=WR2,FUNC=OR,ALUD=Q
CONT ALUS=AQ,RА=WR3,FUNC=EXOR,Н,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINQ,МАР=РЕ,COND=СТ,SТОРС=21
;INTR=2; ИНВЕРТИРУЕМ МЛ. 32Р. РГ.Q
CONT ALUS=ZQ,FUNC=EXNOR,ALUD=Q
CONT ALUS=ZQ,Н,СЕМ
CONT SТОРС=37,%ТУРЕ%
CJS А=ERRINQ,МАР=РЕ,COND=СТ,SТОРС=37
;F...F - В РГ.Q
CONT ALUS=ZА,RА=WR2,Н,ALUD=Q
;INTR=3; AND С "0" (32 Р.) = F...F0...0, СРАВНИВАЕМ
CONT ALUS=ZQ,FUNC=AND,ALUD=Q
CONT ALUS=AQ,RА=WR4,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINQ,МАР=РЕ,COND=СТ,SТОРС=21
;INTR=4; EOR НА 32 РАЗР.
CONT ALUS=AQ,RА=WR4,FUNC=EXOR,СЕМ
LDCT А=НМПС27,МАР=РЕ,SТОРС=37,%ТУРЕ%
JRP А=ERRINQ,МАР=РЕ,COND=СТ,SТОРС=37
;
;
НМПС27:ENTRY
;===== ОТСУТСТВИЕ ПЕРЕНОСА В 33 РАЗРЯД ПРИ СЛОЖЕНИИ 32 РАЗРЯДОВ; INTR = 0-2
;
CJP А=PSH27,МАР=РЕ
PSH27:CONT А=Н27,%TN%
CJS А=INITSM,МАР=РЕ
;0 - В WR1
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR1
;0...0F...F - В WR2
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR2
CONT ALUS=ZА,RА=WR1,FUNC=EXNOR,ALUD=В,RВ=WR2
;F...F0...0 - В Q
CONT ALUS=ZА,RА=WR2,FUNC=EXNOR,Н,ALUD=Q
CONT %CLRTYP%
;0...0F...F - В WR4
CONT ALUS=ZА,RА=WR2,Н,ALUD=В,RВ=WR4
;0...0F...F  + 1  НА 32 РАЗР.
CONT ALUS=ZВ,RВ=WR4,CI,ALUD=В,ALU
;INTR=1; ПРОВЕРЯЕМ ОТСУТСТВИЕ ПЕРЕНОСА (ВСЕ 64Р. Д.Б. = 0)
CONT ALUS=ZА,RА=WR4,Н,CEN
;WR1 + 1 - В WR1 НА 32 Р.
CONT SТОРС=21,ALUS=ZВ,RВ=WR1,CI,ALUD=В,ALU
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,%ТУРЕ%
;INTR=2; ПРОВЕРЯЕМ СТ.РАЗРЯДЫ WR1 (Д.Б.=0)
CONT ALUS=AQ,RА=WR1,FUNC=AND,Н,СЕМ
LDCT А=НМПС28,МАР=РЕ,SТОРС=37,%ТУРЕ%
JRP А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=37
;
;
НМПС28:ENTRY
;===== ОТСУТСТВИЕ ЗАЕМА В 33Р.ПРИ ВЫЧИТАНИИ 32 РАЗРЯДОВ; INTR = 0-2
;
CJP А=PSH28,МАР=РЕ
PSH28:CONT А=Н28,%TN%
CJS А=INITSM,МАР=РЕ
;0 - В WR1
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR1
;0...0F...F - В WR2
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR2
CONT ALUS=ZА,RА=WR1,FUNC=EXNOR,ALUD=В,RВ=WR2
;F...F0...0 - В Q
CONT ALUS=ZА,RА=WR2,FUNC=EXNOR,Н,ALUD=Q
CONT %CLRTYP%
;0 - В WR4
CONT ALUS=ZА,FUNC=AND,Н,ALUD=В,RВ=WR4
;ВЫЧИТАЕМ 1 В 32 РАЗР.
CONT ALUS=ZВ,RВ=WR4,FUNC=SUBR,ALUD=В,ALU
;INTR=1; ПРОВЕРЯЕМ ОТСУТСТВИЕ ЗАЕМА (СТ.Р. Д.Б. = 0, МЛ.Р. = -1)
CONT ALUS=АВ,RА=WR2,RВ=WR4,FUNC=EXOR,Н,CEN
;WR1 - 1 - В WR1 НА 32 Р.
CONT SТОРС=21,ALUS=ZВ,RВ=WR1,FUNC=SUBR,ALUD=В,ALU
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,%ТУРЕ%
;INTR=2; ПРОВЕРЯЕМ СТ.РАЗРЯДЫ WR1 (Д.Б.=0)
CONT ALUS=AQ,RА=WR1,FUNC=AND,Н,СЕМ
LDCT А=НМПС29,МАР=РЕ,SТОРС=37,%ТУРЕ%
JRP А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=37
;
;
НМПС29:ENTRY
;===== ПРОВЕРКА ПРИЗНАКОВ (IZ) НА 32 И 64 РАЗР.; INTR = 0-2
;
CJP А=PSH29,МАР=РЕ
PSH29:CONT А=Н29,%TN%
CJS А=INITSM,МАР=РЕ
;0 - В WR1
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR1
;0...0F...F - В WR1
CONT ALUS=ZА,RА=WR1,FUNC=EXNOR,ALUD=В,RВ=WR1
;F...F0...0 - В WR2
CONT ALUS=ZА,RА=WR1,FUNC=EXNOR,Н,ALUD=В,RВ=WR2
CONT %CLRTYP%
;INTR=1; ПЕРЕСЫЛАЕМ F...F0...0, 64 РАЗРЯДА, Д.Б.NZ=0
CONT ALUS=ZА,RА=WR2,Н,ALU,CEN
;INTR=2; ПЕРЕСЫЛАЕМ 32 РАЗРЯДА, Д.Б. MZ=1
CONT SТОРС=20,ALUS=ZА,RА=WR2,ALU,СЕМ
CJP А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=20,%ТУРЕ%
LDCT А=МПС2А,МАР=РЕ,SТОРС=37,%ТУРЕ%
JRP А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=37
;
;
;     ========================
;     ДОПОЛНИТЕЛЬНЫЕ ТЕСТЫ МПС
;     ========================
;
МПС2А:ENTRY
;===== КОМАНДА RРСТ + RLD
;
CJP А=PSMP2A,МАР=РЕ
PSMP2A:CONT А=Н2А,%TN%
CJS А=INITSM,МАР=РЕ
;RРСТ: CONST - В РГ/СЧ СУАМ, CONST+1 - В РГ.У
;ДЕЛАЕМ CONST FF
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=У
CONT ALUS=ZВ,RВ=У,FUNC=EXNOR,Н,ALUD=В
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=А,ALU,DSRC=SHIFT,MPS,PSHF=SН0-56,SHF=LOG
CONT ALUS=DZ,Н,ALUD=ВА,RА=А,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0+56,SHF=LOG
CONT ALUS=ZА,RА=У,Н,CI,ALUD=ВА,RВ=У,ALU,RLD
;ЦИКЛ: ВЫЧИТАЕМ ПО 1 ИЗ CONST
RР2А:RРСТ А=RР2А,МАР=РЕ,ALUS=ZВ,RВ=У,FUNC=SUBR,ALUD=В,CEN
CONT SТОРС=/NZ
;ЕСЛИ НЕ 0 - ОШИБКА
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=/NZ
;
;
МПС2В:ENTRY
;===== ПРОВЕРКА ALUD=ВА
;
CJP А=PSMP2B,МАР=РЕ
PSMP2B:CONT А=Н2В,%TN%
CJS А=INITSM,МАР=РЕ
;ДЕЛАЕМ CONST FF В РГ.У,А
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=У
CONT ALUS=ZВ,RВ=У,FUNC=EXNOR,Н,ALUD=В
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=А,ALU,DSRC=SHIFT,MPS,PSHF=SН0-56,SHF=LOG
CONT ALUS=DZ,Н,ALUD=ВА,RА=А,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0+56,SHF=LOG
CONT ALUS=ZА,RА=У,Н,ALUD=В,RВ=А
;ПИШЕМ В АИСП НЕ СДВИНУТОЕ, СДВИГАЕМ
CONT ALUS=DZ,Н,ALUD=ВА,RА=А,RВ=А,ALU,YDST=ADRREG,DSRC=SHIFT,MPS,PSHF=SН0-8
>,SHF=LOG
;ПРОВЕРЯЕМ, ЧТО ЗАПИСАЛОСЬ В АИСП. (Д.Б. НЕ СДВИНУТОЕ!)
CONT YDEV=RADRR,DSRC=SHIFT,MPS,PSHF=SН0,SHF=LOG,ALUS=DА,RА=У,FUNC=EXOR,ALUD=Q
CONT ALUS=AQ,RА=У,FUNC=AND,Н,ALUD=Q,CEN
CONT SТОРС=/NZ
CJS А=ERRINQ,МАР=РЕ,COND=СТ,SТОРС=/NZ
;
;
МПС2С:ENTRY
;===== ОТНОШЕНИЕ ЧИСЕЛ
;
CJP А=PSMP2C,МАР=РЕ
PSMP2C:CONT А=Н2С,%TN%
CJS А=INITSM,МАР=РЕ
;0 - В РГ.У
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=У
PUSH А=30,МАР=РЕ
;УВЕЛИЧИВАЕМ РГ.У
CONT ALUS=ZВ,RВ=У,Н,CI,ALUD=В
;У + 1 - В РГ.А
CONT ALUS=ZА,RА=У,Н,CI,ALUD=В,RВ=А
;СРАВНИВАЕМ: А - У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=SUBS,Н,CI,ALUD=Q,СЕМ
;КТО БОЛЬШЕ?
CONT SТОРС=48
;ЕСЛИ А МЕНЬШЕ ИЛИ РАВНА У - ОШИБКА
CJS А=ERRINQ,МАР=РЕ,COND=СТ,SТОРС=48
;
;
;       ==================================
;       ПРОВЕРКА РГ/ТГ ПРИЗНАКОВ И УСЛОВИЙ
;       ==================================
;
TГ2D:ENTRY
;===== ПРОВЕРКА УСЛОВИЙ РЕГИСТРА РЕЖИМОВ
;   В СЛУЧАЕ ОШИБКИ НЕ СБРАСЫВЮТСЯ:
;   БНОР(01),БОКР(02),БПП(03),ББЧ(04),БППУ(05),РД(06),РЭ(07),
;   ППК(08),ПИА(09),РЭС(0А),ПОП(0В)
;
CJP А=PSTG2D,МАР=РЕ
PSTG2D:CONT А=H2D,%TN%
CJS А=INITSM,МАР=РЕ
;0 ИЗ МПС - В РГ,ТГ ПРИЗНАКОВ
CONT ALUS=DZ,FUNC=AND,ALU,YDST=CNT
CONT %CLRTYP%
CONT
;ПРОВЕРЯЕМ УСЛОВИЯ: INTR=1
CJS А=ERRTST,МАР=РЕ,COND=NORMB,%ТУРЕ%
;2
CJS А=ERRTST,МАР=РЕ,COND=RNDB,%ТУРЕ%
;3
CJS А=ERRTST,МАР=РЕ,COND=OVRIB,%ТУРЕ%
;4
CJS А=ERRTST,МАР=РЕ,COND=BNB,%ТУРЕ%
;5
CJS А=ERRTST,МАР=РЕ,COND=OVRFTB,%ТУРЕ%
;6
CJS А=ERRTST,МАР=РЕ,COND=DRG,%ТУРЕ%
;7
CJS А=ERRTST,МАР=РЕ,COND=EMLRG,%ТУРЕ%
;8
CJS А=ERRTST,МАР=РЕ,COND=RСВ,%ТУРЕ%
;9
CJS А=ERRTST,МАР=РЕ,COND=СВ,%ТУРЕ%
;А
CJS А=ERRTST,МАР=РЕ,COND=CEMLRG,%ТУРЕ%
;В
CJS А=ERRTST,МАР=РЕ,COND=INTSTP,%ТУРЕ%
;
;
ТГ2Е:ENTRY
;===== ПРОВЕРКА УСЛОВИЙ РЕГИСТРА РЕЖИМОВ
;   НЕ УСТАНАВЛИВАЮТСЯ:
;   БНОР(01),БОКР(02),БПП(03),ББЧ(04),БППУ(05),РД(06),
;   ППК(07),ПИА(08),РЭС(09),ПОП(0А)
;
CJP А=PSTG2E,МАР=РЕ
PSTG2E:CONT А=Н2Е,%TN%
CJS А=INITSM,МАР=РЕ
;FF..FF ИЗ МПС - В РГ,ТГ ПРИЗНАКОВ
CONT ALUS=DZ,FUNC=AND,ALUD=В,RВ=А
CONT ALUS=ZА,RА=А,FUNC=EXNOR,ALU,YDST=CNT
CONT %CLRTYP%
;ПРОВЕРЯЕМ УСЛОВИЯ, INTR=1
CJS А=ERRTST,МАР=РЕ,COND=NORMB,IСС,%ТУРЕ%
;2
CJS А=ERRTST,МАР=РЕ,COND=RNDB,IСС,%ТУРЕ%
;3
CJS А=ERRTST,МАР=РЕ,COND=OVRIB,IСС,%ТУРЕ%
;4
CJS А=ERRTST,МАР=РЕ,COND=BNB,IСС,%ТУРЕ%
;5
CJS А=ERRTST,МАР=РЕ,COND=OVRFTB,IСС,%ТУРЕ%
;6
CJS А=ERRTST,МАР=РЕ,COND=DRG,IСС,%ТУРЕ%
;7
CJS А=ERRTST,МАР=РЕ,COND=RСВ,IСС,%ТУРЕ%
;8
CJS А=ERRTST,МАР=РЕ,COND=СВ,IСС,%ТУРЕ%
;9
CJS А=ERRTST,МАР=РЕ,COND=CEMLRG,IСС,%ТУРЕ%
;А
CJS А=ERRTST,МАР=РЕ,COND=INTSTP,IСС,%ТУРЕ%
;
;
TГ2F:ENTRY
;===== УСТАНОВКА ТГ. ПОЛЕМ FFCNT + ПРОВЕРКА НА УСЛОВИЯХ
;   ОШИБКИ: ПИА = 0 (01); ППК = 0 (02); СЛЕД1 = 0 (03); ПИА = 1,ДР.СИГНАЛ! (04)
;
CJP А=PSTG2F,МАР=РЕ
PSTG2F:CONT А=H2F,%TN%
CJS А=INITSM,МАР=РЕ,FFCNT=SЕТС
CONT %CLRTYP%,ISE
;0 ИЗ МПС - В РГ/ТГ ПРИЗНАКОВ
CONT ALUS=DZ,FUNC=AND,ALU,YDST=CNT
;УСТАНОВКА ПИА
CONT FFCNT=SЕТС
CONT ISE
;ОШИБКА, ЕСЛИ ПИА=0
CJS А=ERRTST,МАР=РЕ,COND=СВ,IСС,%ТУРЕ%
;АНАЛОГИЧНО ППК
CONT
CONT FFCNT=SETRCB
CJS А=ERRTST,МАР=РЕ,COND=RСВ,IСС,%ТУРЕ%
;СЛЕД1
CONT FFCNT=SETTR1
CJS А=ERRTST,МАР=РЕ,COND=TR1,IСС,%ТУРЕ%
CONT DDEV=CLRCD,FFCNT=CLRTR1
CONT ISE
CJS А=ERRTST,МАР=РЕ,COND=СВ,IСС,%ТУРЕ%
;
;
ТГ30:ENTRY
;===== СБРОС ТГ. ПОЛЕМ FFCNT + ПРОВЕРКА НА УСЛОВИЯХ
;   ПИА = 1 (01); ППК = 1 (02); СЛЕД1 = 1 (03)
;
CJP А=PSTG30,МАР=РЕ
PSTG30:CONT А=Н30,%TN%
CJS А=INITSM,МАР=РЕ
;FF..FF ИЗ МПС - В РГ,ТГ ПРИЗНАКОВ
CONT ALUS=DZ,FUNC=AND,ALUD=В,RВ=А
CONT ALUS=ZА,RА=А,FUNC=EXNOR,ALU,YDST=CNT,FFCNT=SETTR1
CONT %CLRTYP%
;СБРОС ПИА
CONT FFCNT=CLRC
CONT ISE
CJS А=ERRTST,МАР=РЕ,COND=СВ,%ТУРЕ%
;ППК
CONT FFCNT=CLRRCB
CJS А=ERRTST,МАР=РЕ,COND=RСВ,%ТУРЕ%
;СЛЕД1
CONT FFCNT=CLRTR1
CJS А=ERRTST,МАР=РЕ,COND=TR1,%ТУРЕ%
;
;
ТГ31:ENTRY
;===== "0" - В РГ,ТГ ПРИЗНАКОВ, УСТ/СБРОС ТКК, ISE, ПРОВЕРКА ППК ПО УСЛОВИЮ
;
CJP А=PSTG31,МАР=РЕ
PSTG31:CONT А=Н31,%TN%
CJS А=INITSM,МАР=РЕ
;"0" - В РГ,ТГ ПРИЗНАКОВ
CONT ALUS=DZ,FUNC=AND,Н,ALU,YDST=CNT
;УСТАНОВКА ТКК
CONT FFCNT=SЕТТКК
;ПРИЗНАК ПМИ, ПО КОТОРОМУ ТКК ПЕРЕПИСЫВАЕТСЯ В ППК
CONT ISE
CJS А=ERRTST,МАР=РЕ,COND=RСВ,IСС
;СБРАСЫВАЕМ ППК ЧЕРЕЗ ТКК
CONT FFCNT=CLRTKK
LDCT А=ТГ32,МАР=РЕ,ISE
;П/У НА ОШИБКУ, ЕСЛИ ППК УСТАНОВЛЕН, ИНАЧЕ - НА НАЧАЛО
JRP А=ERRTST,МАР=РЕ,COND=RСВ
;
;
ТГ32:ENTRY
;===== "F" - В РГ,ТГ ПРИЗНАКОВ, СБРОС/УСТАНОВКА ТКК, ISE, ПРОВЕРКА ППК ПО УСЛ.
;
CJP А=PSTG32,МАР=РЕ
PSTG32:CONT А=Н32,%TN%
CJS А=INITSM,МАР=РЕ
;"FF" - В РГ,ТГ ПРИЗНАКОВ
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=А
CONT ALUS=ZА,RА=А,FUNC=EXNOR,ALU,YDST=CNT
;СБРОС ТКК
CONT FFCNT=CLRTKK
CONT ISE
CJS А=ERRTST,МАР=РЕ,COND=RСВ
;УСТАНАВЛИВАЕМ ППК ЧЕРЕЗ ТКК
CONT FFCNT=SЕТТКК
LDCT А=ТГ33,МАР=РЕ,ISE
;П/У НА ОШИБКУ, ЕСЛИ ППК СБРОШЕН; ИНАЧЕ - НА НАЧАЛО
JRP А=ERRTST,МАР=РЕ,COND=RСВ,IСС
;
;
ТГ33:ENTRY
;===== "0","F"-В РГ/ТГ ПРИЗНАКОВ,СМЕНА ТКК,ISE,ПРОВЕРКА ППК ПО УСЛОВИЮ; INTR=0-4
;
CJP А=PSTG33,МАР=РЕ
PSTG33:CONT А=Н33,%TN%
CJS А=INITSM,МАР=РЕ
;"0" - В РГ,ТГ ПРИЗНАКОВ; ТКК=ППК=ЛК=0
CONT ALUS=DZ,FUNC=AND,Н,ALU,YDST=CNT,FFCNT=CLRTKK
CONT %CLRTYP%
;ИЗМЕНЕНИЕ ППК ЧЕРЕЗ ТКК: ТКК=ПК (1)
CONT FFCNT=СНТКК
;INTR=1; ПРИЗНАК ПМИ, ПО КОТОРОМУ ТКК ПЕРЕПИСЫВАЕТСЯ В ППК
CONT ISE,%ТУРЕ%
CJS А=ERRTST,МАР=РЕ,COND=RСВ,IСС
;ИЗМЕНЯЕМ ППК ЧЕРЕЗ ТКК
CONT FFCNT=СНТКК
CONT ISE,%ТУРЕ%
;INTR=2; П/У НА ОШИБКУ, ЕСЛИ ППК УСТАНОВЛЕН
CJS А=ERRTST,МАР=РЕ,COND=RСВ
;"FF" - В РГ,ТГ ПРИЗНАКОВ, ТКК=ППК=ПК=1
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=А
CONT ALUS=ZА,RА=А,FUNC=EXNOR,ALU,YDST=CNT,FFCNT=SЕТТКК
;INTR=3; ИЗМЕНЕНИЕ ППК: ТКК=ЛК=0
CONT FFCNT=СНТКК
CONT ISE,%ТУРЕ%
CJS А=ERRTST,МАР=РЕ,COND=RСВ
;УСТАНАВЛИВАЕМ ППК ЧЕРЕЗ ТКК
CONT FFCNT=СНТКК
LDCT А=ТГ34,МАР=РЕ,ISE
;INTR=4; П/У НА ОШИБКУ, ЕСЛИ ППК СБРОШЕН; ИНАЧЕ - НА НАЧАЛО
JRP А=ERRTST,МАР=РЕ,COND=RСВ,IСС,%ТУРЕ%
;
;
ТГ34:ENTRY
;===== ПРОВЕРКА ПРИЗНАКОВ ГРУПП
;   ЧИТАЕМ РГ.ПРИЗНАКОВ, СРАВНИВАЕМ В CONST ИЗ ПЗУ
;   ЗАПИСЬ 0 (РГ.INTR = 01); ЛОГ.ГРУППА ПОСЛЕ ЗАПИСИ 0 (02);
;   ЗАПИСЬ 1 (03); ГРУППА УМНОЖЕНИЯ ПОСЛЕ ЗАПИСИ 1 (04);
;   ЛОГ.ГРУППА (05); УМНОЖЕНИЯ (06); СЛОЖЕНИЯ (07)
;
CJP А=PSTG34,МАР=РЕ
PSTG34:CONT А=Н34,%TN%
CJS А=INITSM,МАР=РЕ
;"0" - В РГ,ТГ ПРИЗНАКОВ
CONT ALUS=DZ,FUNC=AND,Н,ALU,YDST=CNT
CONT %CLRTYP%
;ЧИТАЕМ ТГ.ПРИЗНАКОВ, МАСКА НА 5-3 РАЗРЯДЫ
CONT DSRC=CNT,ALUS=DZ,ALUD=В,RВ=У
CONT А=Н1С,DSRC=PROM,ALUS=DА,RА=У,FUNC=AND,ALUD=Q,CEN
CONT SТОРС=/NZ,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=/NZ
;УСТАНАВЛИВАЕМ ЛОГ.ГРУППУ, ЧИТАЕМ
CONT FFCNT=LOGGRP
CONT DSRC=CNT,ALUS=DZ,ALUD=В,RВ=У
CONT А=Н1С,DSRC=PROM,ALUS=DА,RА=У,FUNC=AND,ALUD=В,RВ=У
CONT А=В3,DSRC=PROM,ALUS=DА,RА=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=/NZ
;"FF" - В РГ,ТГ ПРИЗНАКОВ
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=А
CONT ALUS=ZА,RА=А,FUNC=EXNOR,ALU,YDST=CNT
;ЧИТАЕМ ТГ.ПРИЗНАКОВ, МАСКА НА 5-3 РАЗРЯДЫ
CONT DSRC=CNT,ALUS=DZ,ALUD=В,RВ=У
CONT А=Н1С,DSRC=PROM,ALUS=DА,RА=У,FUNC=AND,ALUD=Q
;СРАВНИВАЕМ С ТЕМ ЖЕ (1С)
CONT А=Н1С,DSRC=PROM,ALUS=DQ,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=/NZ
;УСТАНАВЛИВАЕМ ГРУППУ УМНОЖЕНИЯ, ЧИТАЕМ
CONT FFCNT=MULGRP
CONT DSRC=CNT,ALUS=DZ,ALUD=В,RВ=У
CONT А=Н1С,DSRC=PROM,ALUS=DА,RА=У,FUNC=AND,ALUD=В,RВ=У
CONT А=В4,DSRC=PROM,ALUS=DА,RА=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=/NZ
;УСТАНАВЛИВАЕМ ЛОГ.ГРУППУ, ЧИТАЕМ
CONT FFCNT=LOGGRP
CONT DSRC=CNT,ALUS=DZ,ALUD=В,RВ=У
CONT А=Н1С,DSRC=PROM,ALUS=DА,RА=У,FUNC=AND,ALUD=В,RВ=У
CONT А=В3,DSRC=PROM,ALUS=DА,RА=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=/NZ
;УСТАНАВЛИВАЕМ ГРУППУ УМНОЖЕНИЯ, ЧИТАЕМ
CONT FFCNT=MULGRP
CONT DSRC=CNT,ALUS=DZ,ALUD=В,RВ=У
CONT А=Н1С,DSRC=PROM,ALUS=DА,RА=У,FUNC=AND,ALUD=Q
CONT А=В4,DSRC=PROM,ALUS=DQ,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=/NZ
;УСТАНАВЛИВАЕМ ГРУППУ СЛОЖЕНИЯ, ЧИТАЕМ
CONT FFCNT=ADDGRP
CONT DSRC=CNT,ALUS=DZ,ALUD=В,RВ=У
CONT А=Н1С,DSRC=PROM,ALUS=DА,RА=У,FUNC=AND,ALUD=В,RВ=У
CONT А=В5,DSRC=PROM,ALUS=DА,RА=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=/NZ
CJP А=БМПУ5,МАР=РЕ,%TIK%
END
*END
*NО LIST
*CALL MPSEND:А1/=800
*END FILE
*END FILE
