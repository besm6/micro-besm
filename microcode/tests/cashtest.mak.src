*NАМЕ 8:CASHTEST
*       РГ.АРБИТРА И ОЗУ + КЭШ
*TIME:01.00
*DISC:664/SYSTEM,microb
*FILE:arc,30,W
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
CASH:PROG;
;     ===================
;     РГ.  К О П  АРБИТРА
;     ===================
;
;    РАСПРЕДЕЛЕНИЕ РГ.БОПП ДЛЯ ТЕСТОВ  К О П  АРБИТРА, СТАТУСА И АДРЕСА ОЗУ
;    0   1   2   3   4   5   6   7   8   9   А   В   С   D   Е   F
;  I-------------------------------I-------------------------------I
;  I   I   I   I   I               I    ЧТО ПИШЕМ  I ЧТО ПРОЧИТАЛИ I
;  I-------------------------------I-------------------------------I
;   0 РГ.БОПП - НОМЕР ТЕСТА;
;   1 РГ.БОПП - ТИП ПРОВЕРКИ ИЛИ НОМЕР ПОДТЕСТА, РГ.INTR
;   2 РГ.БОПП = 0, ЕСЛИ ВСЕ ХОРОШО (ЦИКЛ); = FF, ЕСЛИ ОШИБКА;
;   3 РГ.БОПП - МЛ.БАЙТ ЧИСЛА ЦИКЛОВ (ПРИЗНАК ТОГО, ЧТО ТЕСТ "ТИКАЕТ"),РГ.MANT
;
EXTERN OUT8/F,OUTADR,RDADR,RDDAT,OUTDAT,OUTAYH,OUT4/6,INITST
EXTERN OUTC/F,ERRINH,ERRDAF,INITSM
;
КОПА1:ENTRY
;===== ОДИНОЧНОЕ ЧТЕНИЕ 11 РГ.БОПП - ЗАПИСЬ В РГ. КОП АРБИТРА
;
CJP А=CONTA1,МАР=РЕ
CONTA1:CONT А=Н1,%Т%
CJS А=INITST,МАР=РЕ
CONT YDEV=МРМЕМ,IОМР,MPADR=11,YDST=ARBOPC
SТОРА1:CJP А=SТОРА1,МАР=РЕ
;
;
КОПА2:ENTRY
;===== ОДИНОЧНОЕ ЧТЕНИЕ РГ. КОП АРБИТРА - ЗАПИСЬ В 15 РГ.БОПП
;
CJP А=CONTA2,МАР=РЕ
CONTA2:CONT А=Н2,%Т%
CJS А=INITST,МАР=РЕ
CONT DSRC=ARBOPC,ALUS=DZ,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=15
SТОРА2:CJP А=SТОРА2,МАР=РЕ
;
;
КОПА3:ENTRY
;===== ЗАПИСЬ ПЕРЕМЕННОЙ В РГ.КОП АРБИТРА, ЧТЕНИЕ, СРАВНЕНИЕ
;   А = ЗАПИСЫВАЕМОЕ; У = ПРОЧИТАННОЕ; ВУТЕ - МАСКА НА 4 РАЗРЯДА
;   В БОПП В СЛУЧАЕ НЕСОВПАДЕНИЯ:
;   11 РГ.БОПП - ЗАПИСЫВАЕМОЕ; 15 РГ.БОПП - ПРОЧИТАННОЕ
;
CJP А=CONTA3,МАР=РЕ
CONTA3:CONT А=Н3,%Т%
CJS А=INITST,МАР=РЕ
CONT А=С15,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=ВУТЕ
;0 - В РГ.А
СА3:PUSH А=15,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=А
;ПИШЕМ 0-15 В РГ.КОП АРБИТРА
CONT ALUS=ZВ,RВ=А,ALU,YDST=ARBOPC
;ЧИТАЕМ
CONT DSRC=ARBOPC,ALUS=DА,RА=ВУТЕ,FUNC=AND,Н,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=21
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=21
RFCT ALUS=ZВ,RВ=А,CI,ALUD=В
CJP А=СА3,МАР=РЕ,%TIK%
;
;
КОПА4:ENTRY
;===== ЗАПИСЬ ФИЗ.АДРЕСОМ ИЗ МИКРОПРОГРАММЫ - В РГ.КОП АРБИТРА;ЧТЕНИЕ;СРАВНЕНИЕ
;   РГ.А - CONST, СООТВЕТСТВУЮЩАЯ КОП АРБИТРА; РГ.У - ЧТО ПРОЧИТАЛИ
;   В БОПП В СЛУЧАЕ НЕСОВПАДЕНИЯ:
;   11 РГ.БОПП - ЧТО ДОЛЖНО БЫТЬ; 15 РГ.БОПП - ЧТО ПРОЧИТАЛИ
;
CJP А=CONTA4,МАР=РЕ
CONTA4:CONT А=Н4,%Т%
CJS А=INITST,МАР=РЕ
CONT А=CTEST,ALUS=DZ,ALU,YDST=CNT
CONT А=С15,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=ВУТЕ
;ПИШЕМ ЧЕГО-НИБУДЬ В АИСП. И В RG0, ЧТОБ НЕ БЫЛО, НАПР. "0 МАТ.АДРЕСА" И Т.Д.
CONT А=С1,DSRC=PROM,ALUS=DZ,ALU,YDST=ADRREG,ЕСВ,WRB,BRA=RG0
;ПРОВЕРЯЕМ КОП АРБИТРА = 0, ЧИТАЕМ СООТВЕТСТВУЮЩУЮ CONST ИЗ ПЗУ ДЛЯ СРАВНЕНИЯ
ССА4:CONT А=ZER,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А,YDEV=PHYSAD,ARBI=0
WА0:CJP А=WА0,МАР=РЕ,COND=ARBRDY,IСС
CONT DSRC=ARBOPC,ALUS=DА,RА=ВУТЕ,FUNC=AND,Н,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=21
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=21
;КОП АРБИТРА = 1
CONT А=С1,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А,YDEV=PHYSAD,ARBI=CCRD
WА1:CJP А=WА1,МАР=РЕ,COND=ARBRDY,IСС
CONT DSRC=ARBOPC,ALUS=DА,RА=ВУТЕ,FUNC=AND,Н,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=21
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=21
;КОП АРБИТРА = 2
CONT А=С2,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А,YDEV=PHYSAD,ARBI=CCWR
WА2:CJP А=WА2,МАР=РЕ,COND=ARBRDY,IСС
CONT DSRC=ARBOPC,ALUS=DА,RА=ВУТЕ,FUNC=AND,Н,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=21
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=21
;КОП АРБИТРА = 3
CONT А=С3,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А,YDEV=PHYSAD,ARBI=DCRD
WА3:CJP А=WА3,МАР=РЕ,COND=ARBRDY,IСС
CONT DSRC=ARBOPC,ALUS=DА,RА=ВУТЕ,FUNC=AND,Н,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=21,%TIK%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=21
;КОП АРБИТРА = 4
CONT А=С4,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А,YDEV=PHYSAD,ARBI=DCWR
WА4:CJP А=WА4,МАР=РЕ,COND=ARBRDY,IСС
CONT DSRC=ARBOPC,ALUS=DА,RА=ВУТЕ,FUNC=AND,Н,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=21
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=21
;КОП АРБИТРА = 8
CONT А=С8,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А,YDEV=PHYSAD,ARBI=FЕТСН
WА8:CJP А=WА8,МАР=РЕ,COND=ARBRDY,IСС
CONT DSRC=ARBOPC,ALUS=DА,RА=ВУТЕ,FUNC=AND,Н,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=21
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=21
;КОП АРБИТРА = 9
CONT А=С9,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А,YDEV=PHYSAD,ARBI=DRD
WА9:CJP А=WА9,МАР=РЕ,COND=ARBRDY,IСС
CONT DSRC=ARBOPC,ALUS=DА,RА=ВУТЕ,FUNC=AND,Н,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=21,%TIK%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=21
;КОП АРБИТРА = 10
CONT А=С10,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А,YDEV=PHYSAD,ARBI=DWR
WА10:CJP А=WА10,МАР=РЕ,COND=ARBRDY,IСС
CONT DSRC=ARBOPC,ALUS=DА,RА=ВУТЕ,FUNC=AND,Н,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=21
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=21
;КОП АРБИТРА = 11
CONT А=С11,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А,YDEV=PHYSAD,ARBI=RDMWR
WА11:CJP А=WА11,МАР=РЕ,COND=ARBRDY,IСС
CONT DSRC=ARBOPC,ALUS=DА,RА=ВУТЕ,FUNC=AND,Н,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=21
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=21
;КОП АРБИТРА = 12
CONT А=С12,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А,YDEV=PHYSAD,ARBI=BTRWR
WА12:CJP А=WА12,МАР=РЕ,COND=ARBRDY,IСС
CONT DSRC=ARBOPC,ALUS=DА,RА=ВУТЕ,FUNC=AND,Н,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=21
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=21
;КОП АРБИТРА = 13
CONT А=С13,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А,YDEV=PHYSAD,ARBI=BTRRD
WА13:CJP А=WА13,МАР=РЕ,COND=ARBRDY,IСС
CONT DSRC=ARBOPC,ALUS=DА,RА=ВУТЕ,FUNC=AND,Н,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=21
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=21
;КОП АРБИТРА = 14
CONT А=С14,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А,YDEV=PHYSAD,ARBI=BICLR
WА14:CJP А=WА14,МАР=РЕ,COND=ARBRDY,IСС
CONT DSRC=ARBOPC,ALUS=DА,RА=ВУТЕ,FUNC=AND,Н,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=21
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=21
;КОП АРБИТРА = 15
CONT А=С15,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А,YDEV=PHYSAD,ARBI=BIRD
WА15:CJP А=WА15,МАР=РЕ,COND=ARBRDY,IСС
CONT DSRC=ARBOPC,ALUS=DА,RА=ВУТЕ,FUNC=AND,Н,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=21
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=21
CJP А=ССА4,МАР=РЕ,%TIK%
;
;
;    ========================
;    СТАТУСНЫЙ РЕГИСТР  О З У
;    ========================
СТОЗУ5:ENTRY
;===== ПРОВЕРКА СТАТУСНОГО РЕГИСТРА ОЗУ (ЗАПИСЬ, ЧТЕНИЕ)
;   РС - АДРЕС СТАТУСНОГО РЕГИСТРА (FFFF FFFD); ВУТЕ - МАСКА НА МЛ.РАЗРЯД
;   А - ЧТО ПИШЕМ В СТАТ.РЕГИСТР (0 ИЛИ 1) = 11 РГ.БОПП; У - ЧТО ЧИТАЕМ = 15 РГ.
;
CJP А=ССТМ5,МАР=РЕ
ССТМ5:CONT А=Н5,%Т%
CJS А=INITST,МАР=РЕ
;ПИШЕМ БЛОКИРОВКИ В РР (БП=1 И Т.Д.)
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
CONT А=С1,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=ВУТЕ
CONT А=С1,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А
;АДРЕС СТАТУСНОГО РЕГИСТРА ОЗУ - В РС
CONT А=С2,DSRC=PROM,ALUS=DZ,FUNC=EXNOR,Н,ALUD=В,RВ=РС
;ПИШЕМ В СТАТУСНЫЙ РЕГИСТР
RS5:CONT ALUS=ZА,RА=РС,ALU,YDST=ADRREG
CONT А=С1,DSRC=PROM,ALUS=DА,RА=А,FUNC=EXOR,Н,ALUD=В,RВ=А,ALU,ЕСВ,WRB,BRA=RG3
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
WAWS5:CJP А=WAWS5,МАР=РЕ,COND=ARBRDY,IСС
;ЧТЕНИЕ СТАТУСНОГО РЕГИСТРА ОЗУ
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DRD
WARS5:CJP А=WARS5,МАР=РЕ,COND=ARBRDY,IСС
CONT ЕСА,ARA=RG2,ALUS=DА,RА=ВУТЕ,FUNC=AND,Н,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=21
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=21
CJP А=RS5,МАР=РЕ,%TIK%
;
;
;      =====================
;      РЕГИСТР АДРЕСА  О З У
;      =====================
АОЗУ6:ENTRY
;===== ОДИНОЧНОЕ ЧТЕНИЕ РЕГИСТРА АДРЕСА ОЗУ
;   У = 12-15 РГ.БОПП - ПРОЧИТАННЫЙ АДРЕС ОЗУ, 20 РАЗРЯДОВ
;
CJP А=САМЕМ6,МАР=РЕ
САМЕМ6:CONT А=Н6,%Т%
CJS А=INITST,МАР=РЕ
;УСТАНВАЛИВАЕМ В РР БП=1 И Т.Д., ЧТО НАДО ДЛЯ ТЕСТОВ
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
;ПИШЕМ АДРЕС РГ.АДРЕСА ОЗУ - В АИСП.
CONT А=С1,DSRC=PROM,ALUS=DZ,FUNC=EXNOR,ALUD=В,RВ=РС,ALU,YDST=ADRREG
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DRD
CONT А=MADR,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=У
WААМ6:CJP А=WААМ6,МАР=РЕ,COND=ARBRDY,IСС
CONT ЕСА,ARA=RG2,ALUS=DА,RА=У,FUNC=AND,Н,ALUD=В,RВ=У
CJS А=OUTC/F,МАР=РЕ,ALUS=ZА,RА=У,Н,ALUD=В,RВ=WR6
SТРАМ6:CJP А=SТРАМ6,МАР=РЕ
;
;
АОЗУ7:ENTRY
;===== ПРОВЕРКА РЕГИСТРА АДРЕСА ОЗУ ПРИ ЗАПИСИ (В ПРЯМОМ НАПРАВЛЕНИИ И ЧЕРЕЗ 2)
;   ЗАПИСЬ ЧИСЛА В ОЗУ; ЧТЕНИЕ РЕГИСТРА АДРЕСА ОЗУ
;   АНАЛОГИЧНО МОЖНО ПРОВЕРИТЬ РГ.АДРЕСА ПРИ ЧТЕНИИ ОПЕРАНДА И ПРИ ВКС,
;   ЕСЛИ ПРИ ФИЗ.АДРЕСЕ СМЕНИТЬ КОП АРБИТРА! (ДАННЫЕ НЕ ПРОВЕРЯЕМ)
;   А - АДРЕС,НАЧИНАЯ С 2 = ДАННЫЕ = 8-11 РГ.БОПП; У - ЧТО ПРОЧИТАЛИ = 12-15 РГ.
;
CJP А=САМЕМ7,МАР=РЕ
САМЕМ7:CONT А=Н7,%Т%
CJS А=INITST,МАР=РЕ
;ПИШЕМ БЛОКИРОВКИ В РР (БП=1 И Т.Д.)
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
;ЧИТАЕМ НАЧАЛЬНЫЙ АДРЕС ДЛЯ ТЕСТА (0)
САМ7:CONT А=ZER,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А
;ПИШЕМ МАТ.АДРЕС В АИСП. И ДАННЫЕ=АДРЕСУ - В RG3 БОИ ДАННЫХ И ТЕГА
WRMA7:CONT А=С2,DSRC=PROM,ALUS=DА,RА=А,Н
>,ALUD=В,RВ=А,ALU,YDST=ADRREG,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
WWAM7:CJP А=WWAM7,МАР=РЕ,COND=ARBRDY,IСС
;ПРОВЕРЯЕМ: АДРЕС РГ.АДРЕСА FFFF FFFE - В АИСП
CONT А=С1,DSRC=PROM,ALUS=DZ,FUNC=EXNOR,ALUD=В,RВ=РС,ALU,YDST=ADRREG
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DRD
WARMA7:CJP А=WARMA7,МАР=РЕ,COND=ARBRDY,IСС
CONT А=MADR,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=У
CONT ЕСА,ARA=RG2,ALUS=DА,RА=У,FUNC=AND,Н,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=21
;ОШИБКА, ЕСЛИ НЕ СОВПАЛО, П/У НА ВЫДАЧУ ЕЕ В БОПП
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=21
;СРАВНИВАЕМ АДРЕС (А+1): ДОШЛИ ЛИ ДО КОНЦА ПАМЯТИ?
CONT А=С2,DSRC=PROM,ALUS=DА,RА=А,FUNC=ADD,Н,ALUD=Q
CONT А=В18,DSRC=PROM,ALUS=DQ,FUNC=EXOR,СЕМ
CONT SТОРС=37,%TIK%
CJP А=WRMA7,МАР=РЕ,COND=СТ,SТОРС=37
CJP А=САМ7,МАР=РЕ
;
;
АОЗУ8:ENTRY
;===== ПРОВЕРКА РЕГИСТРА АДРЕСА ОЗУ ПРИ ЧТЕНИИ ОПЕРАНДА (В ОБРАТНОМ НАПРАВЛЕНИИ)
;   ЧТЕНИЕ ОПЕРАНДА ИЗ ОЗУ; ЧТЕНИЕ РЕГИСТРА АДРЕСА ОЗУ
;   А - АДРЕС, НАЧИНАЯ С 1FFFF, ОН ЖЕ ДАННЫЕ; У - ЧТО ПРОЧИТАЛИ С РГ.АДРЕСА ОЗУ
;
CJP А=САМЕМ8,МАР=РЕ
САМЕМ8:CONT А=Н8,%Т%
CJS А=INITST,МАР=РЕ
;ПИШЕМ БЛОКИРОВКИ В РР (БП=1 И Т.Д.)
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
;ЧИТАЕМ ОПЕРАНД: УСТАН.МАХ.АДРЕС+1 В РГ.А (АДРЕС)
САМ8:CONT А=В18,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А
;ПИШЕМ МАТ.АДРЕС-1 В АИСП.
WRAM8:CONT ALUS=ZВ,RВ=А,FUNC=SUBR,Н,ALUD=В,ALU,YDST=ADRREG
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DRD
WWAM8:CJP А=WWAM8,МАР=РЕ,COND=ARBRDY,IСС
;ЧИТАЕМ РГ.АДРЕСА ОЗУ: АДРЕС РГ.АДРЕСА FFFF FFFE - В АИСП
CONT А=С1,DSRC=PROM,ALUS=DZ,FUNC=EXNOR,ALU,YDST=ADRREG
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DRD
WARAM8:CJP А=WARAM8,МАР=РЕ,COND=ARBRDY,IСС
CONT А=MADR,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=У
CONT ЕСА,ARA=RG2,ALUS=DА,RА=У,FUNC=AND,Н,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=21
;ЕСЛИ ОШИБКА, П/У НА ВЫДАЧУ ЕЕ В БОПП
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=21
;СРАВНИВАЕМ АДРЕС С 1 (ЭТО ПОСЛЕДНИЙ АДРЕС, К КОТОРОМУ ОБРАЩАЕМСЯ)
CONT А=С1,DSRC=PROM,ALUS=DА,RА=А,FUNC=EXOR,СЕМ
CONT SТОРС=37,%TIK%
CJP А=WRAM8,МАР=РЕ,COND=СТ,SТОРС=37
CJP А=САМ8,МАР=РЕ
;
;
;  РАСПРЕДЕЛЕНИЕ РЕГИСТРОВ   Б О П П   ДЛЯ ТЕСТОВ   О З У  И  К Э Ш А
;    0   1   2   3   4   5   6   7   8   9   А   В   С   D   Е   F
;  I-----------I---------------I---I--------------------------------I
;  I   I   I   I   32Р.АДРЕС   ITEГI         Д  А  Н  Н  Ы  Е       I
;  I-----------I---------------I---I--------------------------------I
;   0 РГ.БОПП - НОМЕР ТЕСТА
;   1 РГ.БОПП - ТИП ПРОВЕРКИ ИЛИ НОМЕР ПОДТЕСТА, РГ.INTR
;   2 РГ.БОПП = 0, ЕСЛИ ТЕСТ "КРУТИТСЯ"; = FF, ЕСЛИ ОШИБКА
;   3 РГ.БОПП - МЛ.БАЙТ ЧИСЛА ЦИКЛОВ ТЕСТА:ПРИЗН.ТОГО,ЧТО ТЕСТ"КРУТИТСЯ",РГ.MANT
;   ИЛИ 3-6 РГ.БОПП = АДРЕСУ (РГ.РС).
;
;     ===============================
;     ОДИНОЧНАЯ ЗАПИСЬ, ЧТЕНИЕ  О З У
;     ===============================
ОЗУ9:ENTRY
;===== ОДИНОЧНАЯ ЗАПИСЬ В ПАМЯТЬ ПО ЗАДАННОМУ АДРЕСУ
;   3-6 РГ.БОПП - АДРЕС, ПО КОТОРОМУ ПИШЕМ В ОЗУ; 7-15 РГ.БОПП - ДАННЫЕ
;
CJP А=СМЕМ9,МАР=РЕ
СМЕМ9:CONT А=Н9,%Т%
CJS А=INITSM,МАР=РЕ
;УСТАН.БЛОКИРОВКИ В РР ДЛЯ ТЕСТОВ:БП=БПНП=РОА=БЗО=БЗЗ=БПТЗ=БПИНТ=БЧС=БПТЧ=БЧОП=1
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
;ЧИТАЕМ АДРЕС ИЗ БОПП - В РГ.РС, ДАННЫЕ - В РГ.DADR, ТЕГ - В РГ.HALF
CJS А=RDADR,МАР=РЕ
CJS А=RDDAT,МАР=РЕ,ALUS=ZА,RА=РС,ALU,YDST=ADRREG
;ПИШЕМ В ОЗУ:
CONT ALUS=ZА,RА=DADR,Н,ALU,ЕСВ,WRB,BRA=RG3
CONT ALUS=ZА,RА=HALF,ALU,YDEVT=ECBTAG,WRB,BRA=RG3
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
WАМ9:CJP А=WАМ9,МАР=РЕ,COND=ARBRDY,IСС
SТРМ9:CJP А=SТРМ9,МАР=РЕ
;
;
ОЗУА:ENTRY
;===== ОДИНОЧНОЕ ЧТЕНИЕ ДАННЫХ И ТЕГА ИЗ ПАМЯТИ ПО ЗАДАННОМУ АДРЕСУ
;   3-6 РГ.БОПП - ЗАДАВАЕМЫЙ АДРЕС; 7 РГ.БОПП - ТЕГ; 8-15 РГ.БОПП - ДАННЫЕ
;
CJP А=СМЕМА,МАР=РЕ
СМЕМА:CONT А=НА,%Т%
CJS А=INITSM,МАР=РЕ
;УСТАНВАЛИВАЕМ В РР БП=1 И Т.Д., ЧТО НАДО ДЛЯ ТЕСТОВ
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
;ЧИТАЕМ АДРЕС ИЗ БОПП
CJS А=RDADR,МАР=РЕ,YDST=CCLR
;ЧИТАЕМ ИЗ ОЗУ:
CONT ALUS=ZА,RА=РС,ALU,YDST=ADRREG
CONT А=МВ,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=У,YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0
>,ARBI=DRD
WАМА:CJP А=WАМА,МАР=РЕ,COND=ARBRDY,IСС
CONT ЕСА,ARA=RG2,ALUS=DZ,Н,ALUD=В,RВ=А
CJS А=OUTDAT,МАР=РЕ,YDEVT=ECBTAG,BRA=RG2,DSRC=SHIFT,MPS,PSHF=SН0,SHF=LOG,ALUS=DА
>,RА=У,FUNC=AND,Н,ALUD=В,RВ=У
SТОРМА:CJP А=SТОРМА,МАР=РЕ
;
;
ОЗУВ:ENTRY
;===== ОДИНОЧНАЯ ВЫБОРКА КОМАНДНОГО СЛОВА И ТЕГА ИЗ ПАМЯТИ ПО ЗАДАННОМУ АДРЕСУ
;   3-6 РГ.БОПП - ЗАДАВАЕМЫЙ АДРЕС; 7 РГ.БОПП - ТЕГ; 8-15 РГ.БОПП - ДАННЫЕ
;
CJP А=СМЕМВ,МАР=РЕ
СМЕМВ:CONT А=НВ,%Т%
CJS А=INITSM,МАР=РЕ
;УСТАНВАЛИВАЕМ В РР БП=1 И Т.Д., ЧТО НАДО ДЛЯ ТЕСТОВ
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
;ЧИТАЕМ АДРЕС ИЗ БОПП
CJS А=RDADR,МАР=РЕ,YDST=CCLR
;ЧИТАЕМ ИЗ ОЗУ:
CONT ALUS=ZА,RА=РС,ALU,YDST=ADRREG
CONT А=МВ,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=У,YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0
>,ARBI=FЕТСН
WАМВ:CJP А=WАМВ,МАР=РЕ,COND=ARBRDY,IСС
CONT ЕСА,ARA=RG1,ALUS=DZ,Н,ALUD=В,RВ=А
CJS А=OUTDAT,МАР=РЕ,YDEVT=ECBTAG,BRA=RG1,DSRC=SHIFT,MPS,PSHF=SН0,SHF=LOG,ALUS=DА
>,RА=У,FUNC=AND,Н,ALUD=В,RВ=У
SТОРМВ:CJP А=SТОРМВ,МАР=РЕ
;
;
;     ========================
;     К Э Ш  КОМАНД, ОПЕРАНДОВ
;     ========================
;
КЭШС:ENTRY
;===== ОДИНОЧНАЯ ЗАПИСЬ В КЭШ ОПЕРАНДОВ ЗАДАННОГО ЧИСЛА ПО ЗАДАННОМУ АДРЕСУ
;   3-6 РГ.БОПП - АДРЕС; 7-15 РГ.БОПП - ДАННЫЕ
;
CJP А=СКЕС,МАР=РЕ
СКЕС:CONT А=НС,%Т%
CJS А=INITSM,МАР=РЕ
;УСТАН.БЛОКИРОВКИ В РР ДЛЯ ТЕСТОВ:БП=БПНП=РОА=БЗО=БЗЗ=БПТЗ=БПИНТ=БЧС=БПТЧ=БЧОП=1
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
;ЧИТАЕМ АДРЕС ИЗ БОПП В РГ.РС, ДАННЫЕ - В РГ.DADR, ТЕГ - В РГ.HALF
CJS А=RDADR,МАР=РЕ
CJS А=RDDAT,МАР=РЕ,ALUS=ZА,RА=РС,ALU,YDST=ADRREG
;ПИШЕМ В КЭШ ОПЕРАНДОВ:
CONT ALUS=ZА,RА=DADR,Н,ALU,ЕСВ,WRB,BRA=RG3
CONT ALUS=ZА,RА=HALF,ALU,YDEVT=ECBTAG,WRB,BRA=RG3
CONT YDEV=PHYSAD,ARBI=DCWR
WАКЕС:CJP А=WАКЕС,МАР=РЕ,COND=ARBRDY,IСС
SТРКЕС:CJP А=SТРКЕС,МАР=РЕ
;
;
KЭШD:ENTRY
;===== ОДИНОЧНАЯ ЗАПИСЬ В КЭШ КОМАНД ЗАДАННОГО ЧИСЛА ПО ЗАДАННОМУ АДРЕСУ
;   3-6 РГ.БОПП - АДРЕС; 7-15 РГ.БОПП - ДАННЫЕ
;
CJP А=CKED,МАР=РЕ
CKED:CONT А=HD,%Т%
CJS А=INITSM,МАР=РЕ
;УСТАН.БЛОКИРОВКИ В РР
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
;ЧИТАЕМ АДРЕС ИЗ БОПП В РГ.РС, ДАННЫЕ - В РГ.DADR, ТЕГ - В РГ.HALF
CJS А=RDADR,МАР=РЕ
CJS А=RDDAT,МАР=РЕ,ALUS=ZА,RА=РС,ALU,YDST=ADRREG
;ПИШЕМ В КЭШ КОМАНД
CONT ALUS=ZА,RА=DADR,Н,ALU,ЕСВ,WRB,BRA=RG1
CONT ALUS=ZА,RА=HALF,ALU,YDEVT=ECBTAG,WRB,BRA=RG1
CONT YDEV=PHYSAD,ARBI=CCWR
WAKED:CJP А=WAKED,МАР=РЕ,COND=ARBRDY,IСС
STPKED:CJP А=STPKED,МАР=РЕ
;
;
КЭШЕ:ENTRY
;===== ОДИНОЧНОЕ ЧТЕНИЕ ДАННЫХ И ТЕГА ИЗ КЭША ОПЕРАНДОВ ПО ЗАДАННОМУ АДРЕСУ
;   3-6 РГ.БОПП - ЗАДАВАЕМЫЙ АДРЕС; 7-15 РГ.БОПП - ПРОЧИТАННЫЕ ДАННЫЕ
;
CJP А=СКЕЕ,МАР=РЕ
СКЕЕ:CONT А=НЕ,%Т%
CJS А=INITSM,МАР=РЕ
;УСТАНВАЛИВАЕМ В РР БП=1 И Т.Д., ЧТО НАДО ДЛЯ ТЕСТОВ
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
;ЧИТАЕМ АДРЕС ИЗ БОПП В РГ.РС
CJS А=RDADR,МАР=РЕ
;ЧИТАЕМ КЭШ ОПЕРАНДОВ
CONT ALUS=ZА,RА=РС,ALU,YDST=ADRREG
CONT А=МВ,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=У,YDEV=PHYSAD,ARBI=DCRD
WАКЕЕ:CJP А=WАКЕЕ,МАР=РЕ,COND=ARBRDY,IСС
CONT ЕСА,ARA=RG2,ALUS=DZ,Н,ALUD=В,RВ=А
CJS А=OUTDAT,МАР=РЕ,YDEVT=ECBTAG,BRA=RG2,DSRC=SHIFT,MPS,PSHF=SН0,SHF=LOG
>,ALUS=DА,RА=У,FUNC=AND,Н,ALUD=В,RВ=У
SТОРКЕ:CJP А=SТОРКЕ,МАР=РЕ
;
;
KЭШF:ENTRY
;===== ОДИНОЧНАЯ ВЫБОРКА КОМАНДНОГО СЛОВА ИЗ КЭША КОМАНД ПО ЗАДАННОМУ АДРЕСУ
;   3-6 РГ.БОПП - ЗАДАВАЕМЫЙ АДРЕС; 7-15 РГ.БОПП - ПРОЧИТАННОЕ КОМ.СЛОВО
;
CJP А=CKEF,МАР=РЕ
CKEF:CONT А=HF,%Т%
CJS А=INITSM,МАР=РЕ
;УСТАНВАЛИВАЕМ В РР БП=1 И Т.Д., ЧТО НАДО ДЛЯ ТЕСТОВ
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
;ЧИТАЕМ АДРЕС ИЗ БОПП В РГ.РС
CJS А=RDADR,МАР=РЕ
;ЧИТАЕМ КЭШ КОМАНД
CONT ALUS=ZА,RА=РС,ALU,YDST=ADRREG
CONT А=МВ,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=У,YDEV=PHYSAD,ARBI=CCRD
WAKF:CJP А=WAKF,МАР=РЕ,COND=ARBRDY,IСС
CONT ЕСА,ARA=RG1,ALUS=DZ,Н,ALUD=В,RВ=А
CJS А=OUTDAT,МАР=РЕ,YDEVT=ECBTAG,BRA=RG1,DSRC=SHIFT,MPS,PSHF=SН0,SHF=LOG
>,ALUS=DА,RА=У,FUNC=AND,Н,ALUD=В,RВ=У
STOPKF:CJP А=STOPKF,МАР=РЕ
;
;
КЭШ10:ENTRY
;===== ЗАПИСЬ CONST1, CONST2 В КЭШ КОМАНД ПО 2 АДРЕСАМ
;   ЗАПИСЫВАТЬ ФИЗ. АДРЕС В RG0 ДЛЯ КЭША НЕ НАДО!
;   1 АДР.- В WR1; CONST1 - В WR2, В КЭШ КОМАНД (ЧЕРЕЗ RG1 БОИ ТЕГА И ОПЕРАНДА)
;   2 АДР.- В WR3; CONST2 - В WR4, В КЭШ КОМАНД
;   В РГ.INTR - ТИП ПРОВЕРКИ (1 РГ.БОПП):
;   1 - ПРОВЕРЯЕМ ДАННЫЕ ПО 1 АДРЕСУ; 2 - ТЕГ; 3 - ДАННЫЕ ПО 2 АДРЕСУ; 4 - ТЕГ
;
CJP А=СК10,МАР=РЕ
СК10:CONT А=Н10,%Т%
CJS А=INITST,МАР=РЕ
;УСТАНАВЛИВАЕМ БП=1 И Т.Д.
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
;ПИШЕМ:
;1-Й АДРЕС ИЗ ПЗУ - В РГ.WR1 МПС, В АИСП
CONT А=МВ,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=WR1,ALU,YDST=ADRREG
;CONST1 - В WR2, В RG1 БОИ ТЕГА И ОПЕРАНДА, ЗАПУСК АРБИТРА НА ЗАПИСЬ
CONT А=ZER,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=WR2,ALU,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG1
CONT YDEV=PHYSAD,ARBI=CCWR
;ЖДЕМ ГОТ.АРБИТРА
WА1К10:CJP А=WА1К10,МАР=РЕ,COND=ARBRDY,IСС
;2-Й АДРЕС - В WR3, В АИСП.
CONT А=В13,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=WR3,ALU,YDST=ADRREG
;CONST2 - В WR4, В RG1 ТЕГА И ДАННЫХ
CONT А=CFFF,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=WR4,ALU,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG1
CONT YDEV=PHYSAD,ARBI=CCWR
WА2К10:CJP А=WА2К10,МАР=РЕ,COND=ARBRDY,IСС
;ЧИТАЕМ: ПРОВЕРЯЕМ ПО 1-ОМУ АДРЕСУ; ОШ=1,2
ССК10:CONT ALUS=ZА,RА=WR1,Н,ALUD=В,RВ=РС,ALU,YDST=ADRREG
CONT ALUS=ZА,RА=WR2,Н,ALUD=В,RВ=DADR
CONT %CLRTYP%
CJS А=СМРСС,МАР=РЕ,YDEV=PHYSAD,ARBI=CCRD
;АНАЛОГИЧНО СО 2 АДРЕСОМ; ОШ=3,4
CONT ALUS=ZА,RА=WR3,Н,ALUD=В,RВ=РС,ALU,YDST=ADRREG
CJS А=СМРСС,МАР=РЕ,YDEV=PHYSAD,ARBI=CCRD,ALUS=ZА,RА=WR4,Н,ALUD=В,RВ=DADR
CJP А=ССК10,МАР=РЕ,%TIK%
;
;
;П/П ЧТЕНИЯ РГ.RG1 (КОМАНДЫ); СРАВНЕНИЕ; П/У НА ОШИБКУ, ЕСЛИ НЕ СОВПАЛО
СМРСС:CJP А=СМРСС,МАР=РЕ,COND=ARBRDY,IСС
CONT ЕСА,ARA=RG1,ALUS=DZ,Н,ALUD=В,RВ=А
CONT ALUS=АВ,RА=А,RВ=DADR,FUNC=EXOR,Н,ALUD=Q,CEN
;ПЕРЕХОД НА ВЫДАЧУ РГ.В БОПП, ЕСЛИ ЧТО НЕ ТАК
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRDAF,МАР=РЕ,COND=СТ,SТОРС=21
;ЧИТАЕМ ТЕГ КОМАНДЫ В У, СРАВНИВАЕМ, МАСКИРУЕМ
CONT YDEVT=ECBTAG,BRA=RG1,DSRC=SHIFT,MPS,PSHF=SН0,SHF=LOG
>,ALUS=DZ,Н,ALUD=В,RВ=У
CONT ALUS=АВ,RА=У,RВ=DADR,FUNC=EXOR,ALUD=Q
CONT А=МВ,DSRC=PROM,ALUS=DQ,FUNC=AND,Н,ALUD=Q,CEN
CONT SТОРС=21
CJS А=ERRDAF,МАР=РЕ,COND=СТ,SТОРС=21,%ТУРЕ%
CRTN
;
;П/П ПРОВЕРКИ ПРОЧИТАННЫХ ДАННЫХ И ТЕГА ИЗ РГ.RG2
CMPDC:CJP А=CMPDC,МАР=РЕ,COND=ARBRDY,IСС
;СРАВНИВАЕМ ОПЕРАНД
CONT ЕСА,ARA=RG2,ALUS=DZ,Н,ALUD=В,RВ=А
CONT ALUS=АВ,RА=DADR,RВ=А,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=21
CJS А=ERRDAF,МАР=РЕ,COND=СТ,SТОРС=21,%ТУРЕ%
;ЧИТАЕМ И СРАВНИВАЕМ ТЕГ
CONT YDEVT=ECBTAG,BRA=RG2,DSRC=SHIFT,MPS,PSHF=SН0,SHF=LOG
>,ALUS=DZ,Н,ALUD=В,RВ=У
CONT ALUS=АВ,RА=DADR,RВ=У,FUNC=EXOR,ALUD=Q
CONT А=МВ,DSRC=PROM,ALUS=DQ,FUNC=AND,Н,ALUD=Q,CEN
CONT SТОРС=21
CJS А=ERRDAF,МАР=РЕ,COND=СТ,SТОРС=21,%ТУРЕ%
CRTN
;
;
КЭШ11:ENTRY
;===== ЗАПИСЬ CONST,/CONST В КЭШ КОМАНД ПО ВСЕМ АДРЕСАМ, ЧТЕНИЕ, СРАВНЕНИЕ
;   DADR - CONST; HALF - НАЧАЛЬНОЕ ЗНАЧЕНИЕ CONST
;   РС   - АДРЕС; MANT - НАЧАЛЬНОЕ ЗНАЧЕНИЕ АДРЕСА
;   А    - ЧТО ПРОЧИТАНО В РАЗРЯДАХ ДАННЫХ; У - ТЕГА; Q - РЕЗ-Т СРАВНЕНИЯ
;   INTR = 1, ЕСЛИ ПРОВЕРЯЕМ ДАННЫЕ; = 2, ЕСЛИ ТЕГ
;
CJP А=CONK11,МАР=РЕ
CONK11:CONT А=Н11,%Т%
CJS А=INITST,МАР=РЕ
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
;ПИШЕМ НАЧАЛЬНЫЙ АДРЕС FFF80000 - 1 (ЧТОБ БЫЛ < 0 И НЕ АДРЕС КОНТРОЛЛЕРА)
CONT А=В20,DSRC=PROM,ALUS=DZ,FUNC=SUBR,Н,ALUD=В,RВ=MANT
;ЧИТАЕМ CONST - В DADR, HALF
CONT А=CFFF,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=HALF
CONT ALUS=ZА,RА=HALF,Н,ALUD=В,RВ=DADR
PUSH А=1023,МАР=РЕ,ALUS=ZА,RА=MANT,Н,ALUD=В,RВ=РС
;ДОБАВЛЯЕМ В ЦИКЛЕ К АДРЕСУ 0000 0101Н, ПИШЕМ В RG0
;(АДРЕС МЕНЯЕТСЯ ОТ  FFF0 0100  ДО  FFFC 03FF)
CONT А=В9,DSRC=PROM,ALUS=DА,RА=РС,Н,CI,ALUD=В,RВ=РС,ALU,YDST=ADRREG
>,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
;ИНВЕРТИРУЕМ CONST, ПИШЕМ В РГ. DADR, RG1
CONT ALUS=ZВ,RВ=DADR,FUNC=EXNOR,Н,ALUD=В,ALU,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG1
CONT YDEV=PHYSAD,ARBI=CCWR
W1К11:CJP А=W1К11,МАР=РЕ,COND=ARBRDY,IСС
RFCT
;
;СРАВНИВАЕМ: ПИШЕМ В DADR CONST (УЖЕ ИНВЕРТИРОВАННУЮ)
ССК11:CONT ALUS=ZА,RА=HALF,FUNC=EXNOR,Н,ALUD=В,RВ=DADR
PUSH А=1023,МАР=РЕ,ALUS=ZА,RА=MANT,Н,ALUD=В,RВ=РС
CONT А=В9,DSRC=PROM,ALUS=DА,RА=РС,Н,CI,ALUD=В,RВ=РС,ALU,YDST=ADRREG
>,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
CONT %CLRTYP%
CJS А=СМРСС,МАР=РЕ,YDEV=PHYSAD,ARBI=CCRD
RFCT ALUS=ZВ,RВ=DADR,FUNC=EXNOR,Н,ALUD=В
CJP А=ССК11,МАР=РЕ
;
;
КЭШ12:ENTRY
;===== ЗАПИСЬ CONST,/CONST В КЭШ ОПЕРАНДОВ(!) ПО ВСЕМ АДРЕСАМ, ЧТЕНИЕ, СРАВНЕНИЕ
;   (АНАЛОГИЧНО ПРЕДЫДУЩЕМУ ТЕСТУ, НО ДЛЯ ОПЕРАНДОВ)
;   DADR - CONST; HALF - НАЧАЛЬНОЕ ЗНАЧЕНИЕ CONST
;   РС   - АДРЕС; MANT - НАЧАЛЬНОЕ ЗНАЧЕНИЕ АДРЕСА
;   А    - ЧТО ПРОЧИТАНО В РАЗРЯДАХ ДАННЫХ; У - ТЕГА, Q - РЕЗ-Т СРАВНЕНИЯ
;   INTR = 1, ЕСЛИ ПРОВЕРЯЕМ ДАННЫЕ; = 2, ЕСЛИ ТЕГ
;
CJP А=CONK12,МАР=РЕ
CONK12:CONT А=Н12,%Т%
CJS А=INITST,МАР=РЕ
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
CONT А=В13,DSRC=PROM,ALUS=DZ,FUNC=ADD,Н,ALUD=В,RВ=MANT
;ЧИТАЕМ CONST - В DADR, HALF
CONT А=CFFF,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=HALF
CONT ALUS=ZА,RА=HALF,Н,ALUD=В,RВ=DADR
PUSH А=1023,МАР=РЕ,ALUS=ZА,RА=MANT,Н,ALUD=В,RВ=РС
;ПИШЕМ АДРЕС В RG0
CONT А=В9,DSRC=PROM,ALUS=DА,RА=РС,Н,CI,ALUD=В,RВ=РС,ALU,YDST=ADRREG
>,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
;ИНВЕРТИРУЕМ CONST, ПИШЕМ В РГ. DADR, RG3
CONT ALUS=ZВ,RВ=DADR,FUNC=EXNOR,Н,ALUD=В,ALU,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
CONT YDEV=PHYSAD,ARBI=DCWR
WА1К12:CJP А=WА1К12,МАР=РЕ,COND=ARBRDY,IСС
RFCT
;
;ПРОВЕРЯЕМ: ПИШЕМ В DADR CONST (УЖЕ ИНВЕРТИРОВАННУЮ)
ССК12:CONT ALUS=ZА,RА=HALF,FUNC=EXNOR,Н,ALUD=В,RВ=DADR
PUSH А=1023,МАР=РЕ,ALUS=ZА,RА=MANT,Н,ALUD=В,RВ=РС
CONT А=В9,DSRC=PROM,ALUS=DА,RА=РС,Н,CI,ALUD=В,RВ=РС,ALU,YDST=ADRREG
>,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
CONT %CLRTYP%
CJS А=CMPDC,МАР=РЕ,YDEV=PHYSAD,ARBI=DCRD
RFCT ALUS=ZВ,RВ=DADR,FUNC=EXNOR,Н,ALUD=В
CJP А=ССК12,МАР=РЕ
;
;
КЭШ13:ENTRY
;===== ЗАПИСЬ ДАННЫХ=АДРЕСУ В КЭШ ОПЕРАНДОВ ПО ВСЕМ АДРЕСАМ,ЧТЕНИЕ,СРАВНЕНИЕ
;   РС - АДРЕС И ЗАПИСАННЫЕ ДАННЫЕ; А - ПРОЧИТАННЫЕ ДАННЫЕ, У - ТЕГ
;   INTR = 1, ЕСЛИ ЧИТАЕМ ДАННЫЕ; = 2, ЕСЛИ ТЕГ
;   MANT - НАЧАЛЬНЫЙ АДРЕС; Q - РЕЗ-Т СРАВНЕНИЯ
;
CJP А=CONK13,МАР=РЕ
CONK13:CONT А=Н13,%Т%
CJS А=INITST,МАР=РЕ
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=ADRREG
CONT А=В8,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=MANT
PUSH А=1023,МАР=РЕ,ALUS=ZА,RА=MANT,Н,ALUD=В,RВ=РС
;ПИШЕМ АДРЕС В АИСП. И ДАННЫЕ = АДРЕСУ В БОИ
CONT ALUS=ZА,RА=РС,Н,CI,ALUD=В,RВ=РС,ALU,YDST=ADRREG
>,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
CONT YDEV=PHYSAD,ARBI=DCWR
WА1К13:CJP А=WА1К13,МАР=РЕ,COND=ARBRDY,IСС
RFCT ALUS=ZА,RА=РС,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
;ЧИТАЕМ, СРАВНИВАЕМ
ССК13:PUSH А=1023,МАР=РЕ,ALUS=ZА,RА=MANT,Н,ALUD=В,RВ=РС
CONT ALUS=ZА,RА=РС,Н,CI,ALUD=В,RВ=РС,ALU,YDST=ADRREG,YDEV=МРМЕМ,WRY,IОМР
>,MPADR=3
CONT ALUS=ZА,RА=РС,Н,ALUD=В,RВ=DADR
CONT %CLRTYP%
CJS А=CMPDC,МАР=РЕ,YDEV=PHYSAD,ARBI=DCRD
RFCT
CJP А=ССК13,МАР=РЕ
;
;
КЭШ14:ENTRY
;===== ЗАПИСЬ ИНВЕРТ.АДРЕСА В КЭШ КОМАНД ПО ВСЕМ АДРЕСАМ, ЧТЕНИЕ, СРАВНЕНИЕ
;   РС - АДРЕС, DADR = /РС, А = ДАННЫЕ, У = ТЕГ
;   INTR = 1, ЕСЛИ ЧИТАЕМ ДАННЫЕ; = 2, ЕСЛИ ЧИТАЕМ ТЕГ
;
CJP А=CONK14,МАР=РЕ
CONK14:CONT А=Н14,%Т%
CJS А=INITST,МАР=РЕ
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
CONT А=МВ,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=MANT
PUSH А=1023,МАР=РЕ,ALUS=ZА,RА=MANT,Н,ALUD=В,RВ=РС
;ПИШЕМ АДРЕС В АИСП.
CONT ALUS=ZА,RА=РС,Н,CI,ALUD=В,RВ=РС,ALU,YDST=ADRREG
>,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
;ПИШЕМ ИНВЕРТ.АДРЕС В КЭШ КОМАНД
CONT ALUS=ZА,RА=РС,FUNC=EXNOR,Н,ALU,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG1
CONT YDEV=PHYSAD,ARBI=CCWR
WА1К14:CJP А=WА1К14,МАР=РЕ,COND=ARBRDY,IСС
RFCT
;ЧИТАЕМ, СРАВНИВАЕМ
ССК14:PUSH А=1023,МАР=РЕ,ALUS=ZА,RА=MANT,Н,ALUD=В,RВ=РС
CONT ALUS=ZА,RА=РС,Н,CI,ALUD=В,RВ=РС,ALU,YDST=ADRREG
>,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
CONT YDEV=PHYSAD,ARBI=CCRD
CONT %CLRTYP%
;ВЫЧИСЛЯЕМ ЗАПИСАННОЕ ЧИСЛО; П/У НА П/П СРАВНЕНИЯ
CJS А=СМРСС,МАР=РЕ,ALUS=ZА,RА=РС,FUNC=EXNOR,Н,ALUD=В,RВ=DADR
RFCT
CJP А=ССК14,МАР=РЕ
;
;
КЭШ15:ENTRY
;===== ЗАПИСЬ ИНВЕРТ.АДРЕСА В КЭШ ОПЕРАНДОВ(!) ПО ВСЕМ АДРЕСАМ,ЧТЕНИЕ,СРАВНЕНИЕ
;   РС - АДРЕС, DADR = /РС, А = ДАННЫЕ, У = ТЕГ
;   INTR = 1, ЕСЛИ ЧИТАЕМ ДАННЫЕ; = 2, ЕСЛИ ЧИТАЕМ ТЕГ
;
CJP А=CONK15,МАР=РЕ
CONK15:CONT А=Н15,%Т%
CJS А=INITST,МАР=РЕ
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
CONT А=В8,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=MANT
PUSH А=1023,МАР=РЕ,ALUS=ZА,RА=MANT,Н,ALUD=В,RВ=РС
;ПИШЕМ АДРЕС В АИСП.
CONT ALUS=ZА,RА=РС,Н,CI,ALUD=В,RВ=РС,ALU,YDST=ADRREG
>,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
;ПИШЕМ ИНВЕРТ.АДРЕС В КЭШ ОПЕРАНДОВ
CONT ALUS=ZА,RА=РС,FUNC=EXNOR,Н,ALU,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
CONT YDEV=PHYSAD,ARBI=DCWR
WА1К15:CJP А=WА1К15,МАР=РЕ,COND=ARBRDY,IСС
RFCT
;ЧИТАЕМ, СРАВНИВАЕМ
ССК15:PUSH А=1023,МАР=РЕ,ALUS=ZА,RА=MANT,Н,ALUD=В,RВ=РС
CONT ALUS=ZА,RА=РС,Н,CI,ALUD=В,RВ=РС,ALU,YDST=ADRREG
>,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
CONT %CLRTYP%
CONT YDEV=PHYSAD,ARBI=DCRD
;ВЫЧИСЛЯЕМ ЗАПИСАННОЕ ЧИСЛО, П/У НА П/П СРАВНЕНИЯ
CJS А=CMPDC,МАР=РЕ,ALUS=ZА,RА=РС,FUNC=EXNOR,Н,ALUD=В,RВ=DADR
RFCT
CJP А=ССК15,МАР=РЕ
;
;
КЭШ16:ENTRY
;===== ЗАПИСЬ В ПАМЯТЬ(!) ПОПЕРЕМЕННО CONST,/CONST, ЧТЕНИЕ КЭШ ОПЕРАНДОВ;
;   СБРОС КЭША; ЧТЕНИЕ ОПЕРАНДА ИЗ ОЗУ; ЧТЕНИЕ КЭШ ОПЕРАНДОВ.
;   ЦИКЛ НА 1024 СЛОВА (РАЗМЕР ОЗУ КЭШ'А); ЗАПИСЬ - СКВОЗНАЯ: В ОЗУ И В КЭШ;
;   ПРОВЕРКА ВМЕСТЕ С РАЗРЯДАМИ ТЕГА = ДАННЫМ; ПРОГРАММА ТОЛЬКО ДЛЯ ОПЕРАНДОВ,
;   Т.К. В КЭШ КОМАНД ПИШЕТСЯ ТОЛЬКО ПРИ ЧТЕНИИ КОМАНДНОГО СЛОВА;
;   DADR = HALF - ЗАПИСЫВАЕМЫЕ ДАННЫЕ; А - ПРОЧИТАННЫЕ ДАННЫЕ; У - ТЕГ;
;   INTR - КОД ОШИБКИ (ИЛИ ТИП ПРОВЕРКИ):
;   1: НЕСОВПАДЕНИЕ В ДАННЫХ ПРИ ЧТЕНИИ КЭШ ПОСЛЕ ЗАПИСИ В ОЗУ; 2 - В ТЕГЕ;
;   3: НЕСОВПАДЕНИЕ В ДАННЫХ ПРИ ЧТЕНИИ ОПЕРАНДА ИЗ ОЗУ; 4 - В ТЕГЕ;
;   5: НЕСОВПАДЕНИЕ В ДАННЫХ ПРИ ЧТЕНИИ КЭШ ПОСЛЕ ЧТЕНИЯ ИЗ ОЗУ; 6 - В ТЕГЕ.
;
CJP А=CONK16,МАР=РЕ
CONK16:CONT А=Н16,%Т%
CJS А=INITST,МАР=РЕ
;УСТАНАВЛИВАЕМ БЛОКИРОВКИ В РР
СК16:CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
;CONST - В РГ.DADR (ДАННЫЕ)
CONT А=СААА,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=HALF
CONT ALUS=ZА,RА=HALF,Н,ALUD=В,RВ=DADR
;0 - В РГ.РС (АДРЕС)
PUSH А=1023,МАР=РЕ,ALUS=ZА,FUNC=AND,Н,ALUD=В,RВ=РС
;АДРЕС РС+1 - В АИСП, В РС
CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG,YDEV=МРМЕМ,WRY
>,IОМР,MPADR=3
;ИНВЕРТИРОВАННУЮ CONST ИЗ DADR - В RG3 ДАННЫХ И ТЕГА, В DADR
CONT ALUS=ZВ,RВ=DADR,FUNC=EXNOR,Н,ALUD=В,ALU,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
;ФИЗ.АДРЕС - В RG0, ЗАПУСК АРБИТРА НА ЗАПИСЬ ДАННЫХ
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
;ЖДЕМ ГОТ.АРБИТРА
WAWK16:CJP А=WAWK16,МАР=РЕ,COND=ARBRDY,IСС
RFCT
;ЧИТАЕМ КЭШ ОПЕРАНДОВ, ПРОВЕРЯЕМ; ОШ=1,2
CONT ALUS=ZА,RА=HALF,Н,ALUD=В,RВ=DADR
PUSH А=1023,МАР=РЕ,ALUS=ZА,FUNC=AND,Н,ALUD=В,RВ=РС
CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG
>,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=INTR
CJS А=CMPDC,МАР=РЕ,ALUS=ZВ,RВ=DADR,FUNC=EXNOR,Н,ALUD=В,YDEV=PHYSAD,ARBI=DCRD
RFCT
;ДЕЛАЕМ СБРОС КЭША, ЗАДЕРЖКА
PUSH А=410,МАР=РЕ,YDST=CCLR
RFCT
;ЗАПУСКАЕМ АРБИТР ДЛЯ СБРОСА "СБРОСА КЭША"
CONT YDEV=PHYSAD,ARBI=DRD
WАСС16:CJP А=WАСС16,МАР=РЕ,COND=ARBRDY,IСС
;ПРОВЕРЯЕИ: СНАЧАЛА ПРОСТО ЧИТАЕМ ИЗ ОЗУ; ОШ=3,4
CONT А=С2,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=INTR
CONT ALUS=ZА,RА=HALF,Н,ALUD=В,RВ=DADR
PUSH А=1023,МАР=РЕ,ALUS=ZА,FUNC=AND,Н,ALUD=В,RВ=РС
CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG
>,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
;ИНВЕРТИРОВАННУЮ CONST ИЗ DADR - В RG3 ДАННЫХ И ТЕГА, В DADR
CJS А=CMPDC,МАР=РЕ,ALUS=ZВ,RВ=DADR,FUNC=EXNOR,Н,ALUD=В,YDEV=PHYSAD
>,ЕСВ,WRB,BRA=RG0,ARBI=DRD
RFCT
;ЧИТАЕМ КЭШ ОПЕРАНДОВ, ПРОВЕРЯЕМ; ОШ=5,6
CONT ALUS=ZА,RА=HALF,Н,ALUD=В,RВ=DADR
PUSH А=1023,МАР=РЕ,ALUS=ZА,FUNC=AND,Н,ALUD=В,RВ=РС
CONT А=С4,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=INTR
CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
CJS А=CMPDC,МАР=РЕ,YDEV=PHYSAD,ARBI=DCRD,ALUS=ZВ,RВ=DADR,FUNC=EXNOR,Н,ALUD=В
RFCT
CJP А=СК16,МАР=РЕ
;
;
КЭШ17:ENTRY
;===== ЗАПИСЬ В ПАМЯТЬ, ВЫБОРКА КОМАНДНОГО СЛОВА, ЧТЕНИЕ КЭШ КОМАНД
;   ОБЯЗАТЕЛЬНО В ТЕСТЕ НАДО ДЕЛАТЬ СБРОС КЭША, Т.К. ПРИ ЗАПИСИ ПИШЕТСЯ В КЭШ
;   ОПЕРАНДОВ, А КЭШ КОМАНД ОСТАЕТСЯ СТАРЫМ; И ПРИ ВКС ПРИ СОВПАДЕНИИ АДРЕСОВ
;   БУДЕТ ЧТЕНИЕ ИЗ КЭША КОМАНД, А НЕ ИЗ ОЗУ !!!!
;   А - ПРОЧИТАННЫЕ ДАННЫЕ, У - ТЕГ; DADR - ЧТО Д.БЫТЬ; HALF - НЕИНВЕРТ.DADR
;   INTR = 1, ЕСЛИ ПРОВЕРЯЕМ КОМАНДУ ПОСЛЕ ВКС; 2 - ТЕГ;
;   3, ЕСЛИ ПРОВЕРЯЕМ КОМАНДУ ПОСЛЕ ЧТЕНИЯ КЭША КОМАНД; 4 - ТЕГ.
;
CJP А=CONK17,МАР=РЕ
CONK17:CONT А=Н17,%Т%
CJS А=INITST,МАР=РЕ
;УСТАНАВЛИВАЕМ БЛОКИРОВКИ В РР
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
;CONST - В РГ.DADR (ДАННЫЕ)
СК17:CONT А=СААА,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=HALF,YDST=CCLR
;ПИШЕМ
CONT ALUS=ZА,RА=HALF,Н,ALUD=В,RВ=DADR
PUSH А=1023,МАР=РЕ,ALUS=ZА,FUNC=AND,Н,ALUD=В,RВ=РС
CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
;ИНВЕРТИРОВАННУЮ CONST ИЗ DADR - В RG3 ДАННЫХ И ТЕГА, В DADR
CONT ALUS=ZВ,RВ=DADR,FUNC=EXNOR,Н,ALUD=В,ALU,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
;ФИЗ.АДРЕС - В RG0, ЗАПУСК АРБИТРА НА ЗАПИСЬ ДАННЫХ
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
;ЖДЕМ ГОТ.АРБИТРА
WAWK17:CJP А=WAWK17,МАР=РЕ,COND=ARBRDY,IСС
RFCT
;ЧИТАЕМ КОМАНДОЕ СЛОВО ИЗ ОЗУ; ПРОВЕРЯЕМ; ОШ=1,2
CONT ALUS=ZА,RА=HALF,Н,ALUD=В,RВ=DADR
PUSH А=1023,МАР=РЕ,ALUS=ZА,FUNC=AND,Н,ALUD=В,RВ=РС
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=INTR
CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
CJS А=СМРСС,МАР=РЕ,YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=FЕТСН,ALUS=ZВ,RВ=DADR
>,FUNC=EXNOR,Н,ALUD=В
RFCT
;ЧИТАЕМ КЭШ КОМАНД, ПРОВЕРЯЕМ, ОШ=3,4
PUSH А=1023,МАР=РЕ,ALUS=ZА,FUNC=AND,Н,ALUD=В,RВ=РС
CONT А=С2,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=INTR
CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
CJS А=СМРСС,МАР=РЕ,YDEV=PHYSAD,ARBI=CCRD,ALUS=ZВ,RВ=DADR,FUNC=EXNOR,Н,ALUD=В
RFCT
CJP А=СК17,МАР=РЕ
;
;
КЭШ18:ENTRY
;===== ПРОВЕРКА ОЗУ, КЭШ ОПЕРАНДОВ И СИГНАЛА "СБРОС КЭША"
;       ПИШЕМ 1024 СЛОВА В ОЗУ (ДАННЫЕ = АДРЕСУ);
; 1,2 - ЧИТАЕМ КЭШ ОПЕРАНДОВ, СРАВНИВАЕМ.
;       ПИШЕМ ТОЛЬКО В КЭШ (ДАННЫЕ=АДРЕСУ.OR.F0), СТИРАЕМ ЗАПИСАННОЕ РАНЬШЕ
;      (В ОЗУ СТРАНИЦ ПРИ ЭТОМ ЗАПИСЫВАЕТСЯ ТОТ ЖЕ НОМЕР СТРАНИЦЫ!);
; 3,4 - СНОВА ЧИТАЕМ КЭШ (АДРЕС.OR.F0), СРАВНИВАЕМ.
; 5,6 - ЧИТАЕМ ОЗУ, СРАВНИВАЕМ, Т.К. "СБРОСА КЭША" НЕ БЫЛО,
;       ОЗУ СТРАНИЦ - ПРЕЖНЕЕ, Д.ЧИТАТЬ ИЗ КЭША, Т.Е. АДРЕС.OR.F0.
;       ПОСЫЛАЕМ СИГНАЛ "СБРОС КЭША"; ЗАДЕРЖКА;
; 7,8 - ЧИТАЕМ ИЗ ОЗУ, ДОЛЖНЫ ЧИТАТЬ ДАННЫЕ = АДРЕСУ.
; 9,А - И ЕЩЕ РАЗ ЧИТАЕМ КЭШ: ДАННЫЕ = АДРЕСУ.
;       РС - АДРЕС; А - ДАННЫЕ; У - ТЕГ; Q - РЕЗ-Т СРАВНЕНИЯ; MANT - НАЧ.АДРЕС;
;       DADR - ЧТО ДОЛЖНО БЫТЬ; INTR - ТИП ПРОВЕРКИ = 1-10.
;
CJP А=CONK18,МАР=РЕ
CONK18:CONT А=Н18,%Т%
CJS А=INITST,МАР=РЕ
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
CONT А=В8,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=MANT
;ПИШЕМ ДАННЫЕ = АДРЕСУ В ОЗУ
PUSH А=1023,МАР=РЕ,ALUS=ZА,RА=MANT,Н,ALUD=В,RВ=РС
CONT ALUS=ZА,RА=РС,Н,CI,ALUD=В,RВ=РС,ALU,YDST=ADRREG
>,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
WА1К18:CJP А=WА1К18,МАР=РЕ,COND=ARBRDY,IСС
RFCT ALUS=ZА,RА=РС,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
;ЧИТАЕМ КЭШ ОПЕРАНДОВ, СРАВНИВАЕМ; INTR = ОШ = 1,2
ССК18:PUSH А=1023,МАР=РЕ,ALUS=ZА,RА=MANT,Н,ALUD=В,RВ=РС
CONT ALUS=ZА,RА=РС,Н,CI,ALUD=В,RВ=РС,ALU,YDST=ADRREG
CONT YDEV=PHYSAD,ARBI=DCRD,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=INTR
CJS А=CMPDC,МАР=РЕ,ALUS=ZА,RА=РС,Н,ALUD=В,RВ=DADR
RFCT
;ПИШЕМ АДРЕС.OR.FFF...000 ТОЛЬКО В КЭШ
PUSH А=1023,МАР=РЕ,ALUS=ZА,RА=MANT,Н,ALUD=В,RВ=РС
CONT ALUS=ZА,RА=РС,Н,CI,ALUD=В,RВ=РС,ALU,YDST=ADRREG,YDEV=МРМЕМ,WRY,IОМР
>,MPADR=3
CONT А=MNH,DSRC=PROM,ALUS=DА,RА=РС,FUNC=OR,Н,ALU,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
CONT YDEV=PHYSAD,ARBI=DCWR
WА3К18:CJP А=WА3К18,МАР=РЕ,COND=ARBRDY,IСС
RFCT
;ЧИТАЕМ КЭШ, СРАВНИВАЕМ (Д.Б.: АДРЕС.OR.FFF...000); INTR = ОШ = 3,4
PUSH А=1023,МАР=РЕ,ALUS=ZА,RА=MANT,Н,ALUD=В,RВ=РС
CONT А=С2,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=INTR
CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
;ВЫЧИСЛЯЕМ ЗАПИСАННОЕ ЧИСЛО
CONT А=MNH,DSRC=PROM,ALUS=DА,RА=РС,FUNC=OR,Н,ALUD=В,RВ=DADR
CJS А=CMPDC,МАР=РЕ,YDEV=PHYSAD,ARBI=DCRD
RFCT
;ЧИТАЕМ ИЗ ОЗУ, СРАВНИВАЕМ; Д.Б.ЧТЕНИЕ ИЗ КЭША, Т.Е.АДРЕС.OR.FF..00, А НЕ ТО,
;ЧТО НА САМОМ ДЕЛЕ В ОЗУ; INTR = ОШ = 5,6
PUSH А=1023,МАР=РЕ,ALUS=ZА,RА=MANT,Н,ALUD=В,RВ=РС
CONT А=С4,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=INTR
CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
;ВЫЧИСЛЯЕМ ЗАПИСАННОЕ ЧИСЛО
CONT А=MNH,DSRC=PROM,ALUS=DА,RА=РС,FUNC=OR,Н,ALUD=В,RВ=DADR
CJS А=CMPDC,МАР=РЕ,YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DRD
RFCT
;ДЕЛАЕМ СБРОС КЭША, ЗАДЕРЖКА (ЧУТЬ БОЛЬШЕ 200 МИКРОСЕКУНД!)
PUSH А=410,МАР=РЕ,YDST=CCLR
RFCT
;ДЕЛАЕМ ЗАПУСК АРБИТРА ДЛЯ СБРОСА "СБРОСА КЭША"
CONT YDEV=PHYSAD,ARBI=DRD
WАСС18:CJP А=WАСС18,МАР=РЕ,COND=ARBRDY,IСС
;ЧИТАЕМ ОЗУ, СРАВНИВАЕМ (Д.Б.ЧТЕНИЕ ИЗ ОЗУ, Т.Е. = АДРЕСУ); INTR = ОШ = 7,8
PUSH А=1023,МАР=РЕ,ALUS=ZА,RА=MANT,Н,ALUD=В,RВ=РС
CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
CONT А=С6,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=INTR
CJS А=CMPDC,МАР=РЕ,YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DRD,ALUS=ZА,RА=РС,Н
>,ALUD=В,RВ=DADR
RFCT
;ЕЩЕ РАЗ ЧИТАЕМ ИЗ КЭША ДАННЫЕ = АДРЕСУ, INTR = ОШ = 9,10
PUSH А=1023,МАР=РЕ,ALUS=ZА,RА=MANT,Н,ALUD=В,RВ=РС
CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
CONT А=С8,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=INTR
CJS А=CMPDC,МАР=РЕ,YDEV=PHYSAD,ARBI=DCRD,ALUS=ZА,RА=РС,Н
>,ALUD=В,RВ=DADR
RFCT
CJP А=ССК18,МАР=РЕ
;
;
КЭШ19:ENTRY
;===== ПРОВЕРКА ОЗУ, КЭШ КОМАНД И СИГНАЛА "СБРОС КЭША"
;       СБРАСЫВАЕМ КЭШ И ПИШЕМ 1024 СЛОВА В ОЗУ (ДАННЫЕ = АДРЕСУ);
; 1,2 - ЧИТАЕМ КОМАНДУ ИЗ ОЗУ, СРАВНИВАЕМ; ИНФОРМАЦИЯ ОСЕДАЕТ В КЭШЕ;
; 3,4 - ЧИТАЕМ КЭШ КОМАНД, СРАВНИВАЕМ;
;       ПИШЕМ ТОЛЬКО В КЭШ (ДАННЫЕ=АДРЕСУ.OR.F0), СТИРАЕМ ЗАПИСАННОЕ РАНЬШЕ
;       (В ОЗУ СТРАНИЦ ПРИ ЭТОМ ЗАПИСЫВАЕТСЯ ТОТ ЖЕ НОМЕР СТРАНИЦЫ!);
; 5,6 - СНОВА ЧИТАЕМ КЭШ (АДРЕС.OR.F0), СРАВНИВАЕМ;
; 7,8 - ЧИТАЕМ ОЗУ, СРАВНИВАЕМ, Т.К. "СБРОСА КЭША" НЕ БЫЛО,
;       ОЗУ СТРАНИЦ - ПРЕЖНЕЕ, Д.ЧИТАТЬ ИЗ КЭША, Т.Е. АДРЕС.OR.F0;
;       ПОСЫЛАЕМ СИГНАЛ "СБРОС КЭША";
; 9,А - ЧИТАЕМ ИЗ ОЗУ, ДОЛЖНЫ ЧИТАТЬ ДАННЫЕ = АДРЕСУ;
; В,С - ЕЩЕ РАЗ ЧИТАЕМ КЭШ КОМАНД, СРАВНИВАЕМ.
;       РС - АДРЕС, А - ДАННЫЕ; У - ТЕГ; Q - РЕЗ-Т СРАВНЕНИЯ; MANT - НАЧ.АДРЕС;
;       DADR - ЧТО ДОЛЖНО БЫТЬ; INTR = 1 РГ.БОПП = 0-12 = ТИП ПРОВЕРКИ
;
CJP А=CONK19,МАР=РЕ
CONK19:CONT А=Н19,%Т%
CJS А=INITST,МАР=РЕ
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
CONT А=В11,DSRC=PROM,ALUS=DZ,Н,CI,ALUD=В,RВ=MANT,YDST=CCLR
;ПИШЕМ ДАННЫЕ = АДРЕСУ В ОЗУ
PUSH А=1023,МАР=РЕ,ALUS=ZА,RА=MANT,Н,ALUD=В,RВ=РС
CONT ALUS=ZА,RА=РС,Н,CI,ALUD=В,RВ=РС,ALU,YDST=ADRREG
>,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
WА1К19:CJP А=WА1К19,МАР=РЕ,COND=ARBRDY,IСС
RFCT
;ЧИТАЕМ КОМАНДНОЕ СЛОВО, СРАВНИВАЕМ; INTR = ОШ = 1,2
ССК19:PUSH А=1023,МАР=РЕ,ALUS=ZА,RА=MANT,Н,ALUD=В,RВ=РС
CONT ALUS=ZА,RА=РС,Н,CI,ALUD=В,RВ=РС,ALU,YDST=ADRREG,YDEV=МРМЕМ,WRY,IОМР
>,MPADR=3
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=FЕТСН,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=INTR
CJS А=СМРСС,МАР=РЕ,ALUS=ZА,RА=РС,Н,ALUD=В,RВ=DADR
RFCT
;ЧИТАЕМ КЭШ КОМАНД, СРАВНИВАЕМ; INTR = ОШ = 3,4
PUSH А=1023,МАР=РЕ,ALUS=ZА,RА=MANT,Н,ALUD=В,RВ=РС
CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
CONT А=С2,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=INTR,YDEV=PHYSAD,ARBI=CCRD
CJS А=СМРСС,МАР=РЕ,ALUS=ZА,RА=РС,Н,ALUD=В,RВ=DADR
RFCT
;ПИШЕМ АДРЕС.OR.FFF...000 ТОЛЬКО В КЭШ
PUSH А=1023,МАР=РЕ,ALUS=ZА,RА=MANT,Н,ALUD=В,RВ=РС
CONT ALUS=ZА,RА=РС,Н,CI,ALUD=В,RВ=РС,ALU,YDST=ADRREG
CONT А=MNH,DSRC=PROM,ALUS=DА,RА=РС,FUNC=OR,Н,ALU,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG1
CONT YDEV=PHYSAD,ARBI=CCWR
WА3К19:CJP А=WА3К19,МАР=РЕ,COND=ARBRDY,IСС
RFCT
;ЧИТАЕМ КЭШ, СРАВНИВАЕМ (Д.Б.: АДРЕС.OR.FFF...000); INTR = ОШ = 5,6
PUSH А=1023,МАР=РЕ,ALUS=ZА,RА=MANT,Н,ALUD=В,RВ=РС
CONT А=С4,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=INTR
CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
;ВЫЧИСЛЯЕМ ЗАПИСАННОЕ ЧИСЛО
CONT А=MNH,DSRC=PROM,ALUS=DА,RА=РС,FUNC=OR,Н,ALUD=В,RВ=DADR
CJS А=СМРСС,МАР=РЕ,YDEV=PHYSAD,ARBI=CCRD
RFCT
;ЧИТАЕМ ИЗ ОЗУ, СРАВНИВАЕМ; Д.Б.ЧТЕНИЕ ИЗ КЭША, Т.Е.АДРЕС.OR.FF..00, А НЕ ТО,
;ЧТО НА САМОМ ДЕЛЕ В ОЗУ; INTR = ОШ = 7,8
PUSH А=1023,МАР=РЕ,ALUS=ZА,RА=MANT,Н,ALUD=В,RВ=РС
CONT А=С6,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=INTR
CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
;ВЫЧИСЛЯЕМ ЗАПИСАННОЕ ЧИСЛО
CONT А=MNH,DSRC=PROM,ALUS=DА,RА=РС,FUNC=OR,Н,ALUD=В,RВ=DADR
CJS А=СМРСС,МАР=РЕ,YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=FЕТСН
RFCT
;ДЕЛАЕМ СБРОС КЭША, ЗАДЕРЖКА (ЧУТЬ БОЛЬШЕ 200 МИКРОСЕКУНД)
PUSH А=410,МАР=РЕ,YDST=CCLR
RFCT
;ЗАПУСК АРБИТРА ДЛЯ СБРОСА "СБРОСА КЭША"
CONT YDEV=PHYSAD,ARBI=FЕТСН
WАСС19:CJP А=WАСС19,МАР=РЕ,COND=ARBRDY,IСС
;ЧИТАЕМ ОЗУ, СРАВНИВАЕМ (Д.Б.ЧТЕНИЕ ИЗ ОЗУ, Т.Е. = АДРЕСУ); INTR = ОШ = 9,10
PUSH А=1023,МАР=РЕ,ALUS=ZА,RА=MANT,Н,ALUD=В,RВ=РС
CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
CONT А=С8,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=INTR
CJS А=СМРСС,МАР=РЕ,YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=FЕТСН,ALUS=ZА,RА=РС,Н
>,ALUD=В,RВ=DADR
RFCT
;ЕЩЕ РАЗ ЧИТАЕМ ИЗ КЭША КОМАНДУ = АДРЕСУ, INTR = ОШ = 11,12
PUSH А=1023,МАР=РЕ,ALUS=ZА,RА=MANT,Н,ALUD=В,RВ=РС
CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
CONT А=С10,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=INTR
CJS А=СМРСС,МАР=РЕ,YDEV=PHYSAD,ARBI=CCRD,ALUS=ZА,RА=РС,Н
>,ALUD=В,RВ=DADR
RFCT
CJP А=ССК19,МАР=РЕ
;
;
КЭШ1А:ENTRY
;===== ПРОВЕРКА СИГНАЛА "СБРОС КЭША" НА ФОНЕ ЧТЕНИЯ ОПЕРАНДА
;       ПИШЕМ 1024 СЛОВА В ОЗУ (ДАННЫЕ = АДРЕСУ);
; 1,2 - ЧИТАЕМ ОЗУ (ИЛИ КЭШ ОПЕРАНДОВ), СРАВНИВАЕМ;
;       ПИШЕМ ТОЛЬКО В КЭШ (ДАННЫЕ=АДРЕСУ.OR.F0), СТИРАЕМ ЗАПИСАННОЕ РАНЬШЕ
;       (В ОЗУ СТРАНИЦ ПРИ ЭТОМ ЗАПИСЫВАЕТСЯ ТОТ ЖЕ НОМЕР СТРАНИЦЫ!);
; 3,4 - СНОВА ЧИТАЕМ КЭШ (АДРЕС.OR.F0), СРАВНИВАЕМ;
; 5,6 - ЧИТАЕМ ОЗУ, СРАВНИВАЕМ, Т.К. "СБРОСА КЭША" НЕ БЫЛО,
;       ОЗУ СТРАНИЦ - ПРЕЖНЕЕ, Д.ЧИТАТЬ ИЗ КЭША, Т.Е. АДРЕС.OR.F0;
;       ПОСЫЛАЕМ СИГНАЛ "СБРОС КЭША" БЕЗ ЗАДЕРЖКИ;
; 7,8 - ЧИТАЕМ ИЗ ОЗУ ДАННЫЕ = АДРЕСУ НА ФОНЕ СБРОСА КЭША.
;       РС - АДРЕС; А - ДАННЫЕ; У - ТЕГ; Q - РЕЗ-Т СРАВНЕНИЯ; MANT - НАЧ.АДРЕС;
;       DADR - ЧТО ДОЛЖНО БЫТЬ; INTR = 1 РГ.БОПП = 0-8 = ТИП ПРВЕРКИ.
;
CJP А=CONK1A,МАР=РЕ
CONK1A:CONT А=Н1А,%Т%
CJS А=INITST,МАР=РЕ
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
CONT А=В8,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=MANT
;ПИШЕМ ДАННЫЕ = АДРЕСУ В ОЗУ
PUSH А=1023,МАР=РЕ,ALUS=ZА,RА=MANT,Н,ALUD=В,RВ=РС
CONT ALUS=ZА,RА=РС,Н,CI,ALUD=В,RВ=РС,ALU,YDST=ADRREG
>,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
WА1К1А:CJP А=WА1К1А,МАР=РЕ,COND=ARBRDY,IСС
RFCT
;ЧИТАЕМ ДАННЫЕ=АДРЕСУ ИЗ ОЗУ, СРАВНИВАЕМ; INTR = ОШ = 1,2
ССК1А:PUSH А=1023,МАР=РЕ,ALUS=ZА,RА=MANT,Н,ALUD=В,RВ=РС
CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DRD,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=INTR
CJS А=CMPDC,МАР=РЕ,ALUS=ZА,RА=РС,Н,ALUD=В,RВ=DADR
RFCT
;ПИШЕМ АДРЕС.OR.FFF...000 ТОЛЬКО В КЭШ
PUSH А=1023,МАР=РЕ,ALUS=ZА,RА=MANT,Н,ALUD=В,RВ=РС
CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
CONT А=MNH,DSRC=PROM,ALUS=DА,RА=РС,FUNC=OR,Н,ALU,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
CONT YDEV=PHYSAD,ARBI=DCWR
WА3К1А:CJP А=WА3К1А,МАР=РЕ,COND=ARBRDY,IСС
RFCT
;ЧИТАЕМ КЭШ, СРАВНИВАЕМ (Д.Б.: АДРЕС.OR.FFF...000); INTR = ОШ = 3,4
PUSH А=1023,МАР=РЕ,ALUS=ZА,RА=MANT,Н,ALUD=В,RВ=РС
CONT А=С2,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=INTR
CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
;ВЫЧИСЛЯЕМ ЗАПИСАННОЕ ЧИСЛО
CONT А=MNH,DSRC=PROM,ALUS=DА,RА=РС,FUNC=OR,Н,ALUD=В,RВ=DADR
CJS А=CMPDC,МАР=РЕ,YDEV=PHYSAD,ARBI=DCRD
RFCT
;ЧИТАЕМ ИЗ ОЗУ, СРАВНИВАЕМ; Д.Б.ЧТЕНИЕ ИЗ КЭША, Т.Е.АДРЕС.OR.FF..00, А НЕ ТО,
;ЧТО НА САМОМ ДЕЛЕ В ОЗУ; INTR = ОШ = 5,6
PUSH А=1023,МАР=РЕ,ALUS=ZА,RА=MANT,Н,ALUD=В,RВ=РС
CONT А=С4,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=INTR
CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
;ВЫЧИСЛЯЕМ ЗАПИСАННОЕ ЧИСЛО
CONT А=MNH,DSRC=PROM,ALUS=DА,RА=РС,FUNC=OR,Н,ALUD=В,RВ=DADR
CJS А=CMPDC,МАР=РЕ,YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DRD
RFCT
;ДЕЛАЕМ СБРОС КЭША БЕЗ ЗАДЕРЖКИ
PUSH А=0,МАР=РЕ,YDST=CCLR
RFCT
;ЧИТАЕМ ОЗУ, СРАВНИВАЕМ (Д.Б.ЧТЕНИЕ ИЗ ОЗУ, Т.Е. = АДРЕСУ); INTR = ОШ = 7,8
PUSH А=1023,МАР=РЕ,ALUS=ZА,RА=MANT,Н,ALUD=В,RВ=РС
CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
CONT А=С6,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=INTR
CJS А=CMPDC,МАР=РЕ,YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DRD,ALUS=ZА,RА=РС,Н
>,ALUD=В,RВ=DADR
RFCT
CJP А=ССК1А,МАР=РЕ
;
;
КЭШ1В:ENTRY
;===== ПРОВЕРКА СБРОСА КЭША НА ФОНЕ ЧТЕНИЯ КОМАНДЫ ИЗ ОЗУ
;       СБРАСЫВАЕМ КЭШ И ПИШЕМ 1024 СЛОВА В ОЗУ (ДАННЫЕ = АДРЕСУ);
; 1,2 - ЧИТАЕМ КОМАНДУ ИЗ ОЗУ, СРАВНИВАЕМ; ИНФОРМАЦИЯ ОСЕДАЕТ В КЭШЕ;
; 3,4 - ЧИТАЕМ КЭШ КОМАНД, СРАВНИВАЕМ;
;       ПИШЕМ ТОЛЬКО В КЭШ (ДАННЫЕ=АДРЕСУ.OR.F0), СТИРАЕМ ЗАПИСАННОЕ РАНЬШЕ
;       (В ОЗУ СТРАНИЦ ПРИ ЭТОМ ЗАПИСЫВАЕТСЯ ТОТ ЖЕ НОМЕР СТРАНИЦЫ!);
; 5,6 - СНОВА ЧИТАЕМ КЭШ (АДРЕС.OR.F0), СРАВНИВАЕМ;
; 7,8 - ЧИТАЕМ ОЗУ, СРАВНИВАЕМ, Т.К. "СБРОСА КЭША" НЕ БЫЛО,
;       ОЗУ СТРАНИЦ - ПРЕЖНЕЕ, Д.ЧИТАТЬ ИЗ КЭША, Т.Е. АДРЕС.OR.F0;
;       ПОСЫЛАЕМ СИГНАЛ "СБРОС КЭША" БЕЗ ЗАДЕРЖКИ;
; 9,А - ЧИТАЕМ ИЗ ОЗУ, ДОЛЖНЫ ЧИТАТЬ ДАННЫЕ = АДРЕСУ.
;       РС - АДРЕС, А - ДАННЫЕ; У - ТЕГ; Q - РЕЗ-Т СРАВНЕНИЯ; MANT - НАЧ.АДРЕС;
;       DADR - ЧТО ДОЛЖНО БЫТЬ; INTR = 1 РГ.БОПП = ТИП ПРОВЕРКИ = 0-10
;
CJP А=CONT1B,МАР=РЕ
CONT1B:CONT А=Н1В,%Т%
CJS А=INITST,МАР=РЕ
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
CONT А=В11,DSRC=PROM,ALUS=DZ,Н,CI,ALUD=В,RВ=MANT,YDST=CCLR
;ПИШЕМ ДАННЫЕ = АДРЕСУ В ОЗУ
PUSH А=1023,МАР=РЕ,ALUS=ZА,RА=MANT,Н,ALUD=В,RВ=РС
CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG
>,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
WА1К1В:CJP А=WА1К1В,МАР=РЕ,COND=ARBRDY,IСС
RFCT ALUS=ZА,RА=РС,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
;ЧИТАЕМ КОМАНДНОЕ СЛОВО, СРАВНИВАЕМ; INTR=1,2
ССК1В:PUSH А=1023,МАР=РЕ,ALUS=ZА,RА=MANT,Н,ALUD=В,RВ=РС
CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=FЕТСН,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=INTR
CJS А=СМРСС,МАР=РЕ,ALUS=ZА,RА=РС,Н,ALUD=В,RВ=DADR
RFCT
;ЧИТАЕМ КЭШ КОМАНД, СРАВНИВАЕМ; INTR=3,4
PUSH А=1023,МАР=РЕ,ALUS=ZА,RА=MANT,Н,ALUD=В,RВ=РС
CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
CONT А=С2,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=INTR,YDEV=PHYSAD,ARBI=CCRD
CJS А=СМРСС,МАР=РЕ,ALUS=ZА,RА=РС,Н,ALUD=В,RВ=DADR
RFCT
;ПИШЕМ АДРЕС.OR.FFF...000 ТОЛЬКО В КЭШ
PUSH А=1023,МАР=РЕ,ALUS=ZА,RА=MANT,Н,ALUD=В,RВ=РС
CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
CONT А=MNH,DSRC=PROM,ALUS=DА,RА=РС,FUNC=OR,Н,ALU,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG1
CONT YDEV=PHYSAD,ARBI=CCWR
WА3К1В:CJP А=WА3К1В,МАР=РЕ,COND=ARBRDY,IСС
RFCT
;ЧИТАЕМ КЭШ, СРАВНИВАЕМ (Д.Б.: АДРЕС.OR.FFF...000); INTR=5,6
PUSH А=1023,МАР=РЕ,ALUS=ZА,RА=MANT,Н,ALUD=В,RВ=РС
CONT А=С4,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=INTR
CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
;ВЫЧИСЛЯЕМ ЗАПИСАННОЕ ЧИСЛО
CONT А=MNH,DSRC=PROM,ALUS=DА,RА=РС,FUNC=OR,Н,ALUD=В,RВ=DADR
CJS А=СМРСС,МАР=РЕ,YDEV=PHYSAD,ARBI=CCRD
RFCT
;ЧИТАЕМ ИЗ ОЗУ, СРАВНИВАЕМ; Д.Б.ЧТЕНИЕ ИЗ КЭША, Т.Е.АДРЕС.OR.FF..00, А НЕ ТО,
;ЧТО НА САМОМ ДЕЛЕ В ОЗУ; INTR=7,8
PUSH А=1023,МАР=РЕ,ALUS=ZА,RА=MANT,Н,ALUD=В,RВ=РС
CONT А=С6,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=INTR
CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
;ВЫЧИСЛЯЕМ ЗАПИСАННОЕ ЧИСЛО
CONT А=MNH,DSRC=PROM,ALUS=DА,RА=РС,FUNC=OR,Н,ALUD=В,RВ=DADR
CJS А=СМРСС,МАР=РЕ,YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=FЕТСН
RFCT
;ДЕЛАЕМ СБРОС КЭША БЕЗ ЗАДЕРЖКИ!
PUSH А=0,МАР=РЕ,YDST=CCLR
RFCT
;ЧИТАЕМ ОЗУ, СРАВНИВАЕМ (Д.Б.ЧТЕНИЕ ИЗ ОЗУ, Т.Е. = АДРЕСУ); INTR=9,10
PUSH А=1023,МАР=РЕ,ALUS=ZА,RА=MANT,Н,ALUD=В,RВ=РС
CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
CONT А=С8,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=INTR
CJS А=СМРСС,МАР=РЕ,YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=FЕТСН,ALUS=ZА,RА=РС,Н
>,ALUD=В,RВ=DADR
RFCT
CJP А=ССК1В,МАР=РЕ
;
;
КЭШ1С:ENTRY
;===== ПРОВЕРКА ЧТЕНИЯ КОМАНДЫ ИЗ ПАМЯТИ ВО ВРЕМЯ СБРОСА КЭША
;       ПИШЕМ 1024 СЛОВА В ОЗУ: CONST,/CONST;
; 1,2 - ЧИТАЕМ КОМАНДУ 1024 РАЗА, СРАВНИВАЕМ;
;       ПРИ ЭТОМ КЭШ КОМАНД ЗАПОЛНЯЕТСЯ ЧИСЛАМИ CONST,/CONST;
;       ПИШЕМ В ОЗУ ДАННЫЕ=АДРЕСУ ПО ТЕМ ЖЕ АДРЕСАМ, СТИРАЕМ ЗАПИСАННОЕ РАНЬШЕ
; 3,4 - ЧИТАЕМ ДАННЫЕ=АДРЕСУ ИЗ ОЗУ, СРАВНИВАЕМ;
;       Т.К.КОП АРБИТРА = ЧТЕНИЕ ОПЕРАНДА, КЭШ КОМАНД НЕ МЕНЯЕТСЯ;
;       ПОСЫЛАЕМ СИГНАЛ "СБРОС КЭША";
; 5,6 - ЧИТАЕМ КОМАНДУ = АДРЕСУ ИЗ ОЗУ НА ФОНЕ СБРОСА КЭША;
; 7,8 - ЕЩЕ РАЗ ЧИТАЕМ КОМАНДУ = АДРЕСУ (ЧАСТЬ - ИЗ ОЗУ, ОСТАЛЬНОЕ - ИЗ КЭША)
;       ЕСЛИ СБРОС ПРОШЕЛ ПЛОХО, БУДЕТ ЧИТАТЬСЯ CONST,/CONST ИЗ КЭША!
;       РС - АДРЕС, А - ДАННЫЕ; У - ТЕГ; Q - РЕЗ-Т СРАВНЕНИЯ; MANT - НАЧ.АДРЕС;
;       DADR - ЧТО ДОЛЖНО БЫТЬ; INTR = 1 РГ.БОПП = ТИП ПРОВЕРКИ = 0-10.
;
CJP А=CONT1C,МАР=РЕ
CONT1C:CONT А=Н1С,%Т%
CJS А=INITST,МАР=РЕ
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
;ЧИТАЕМ CONST, ДЕЛАЕМ СБРОС КЭША
ССК1С:CONT А=С555,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=HALF,YDST=CCLR
CONT А=В11,DSRC=PROM,ALUS=DZ,Н,CI,ALUD=В,RВ=MANT
;ПИШЕМ CONST,/CONST В ОЗУ
CONT ALUS=ZА,RА=HALF,Н,ALUD=В,RВ=DADR
PUSH А=1023,МАР=РЕ,ALUS=ZА,RА=MANT,Н,ALUD=В,RВ=РС
CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
CONT ALUS=ZВ,RВ=DADR,FUNC=EXNOR,Н,ALUD=В,ALU,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
WА1К1С:CJP А=WА1К1С,МАР=РЕ,COND=ARBRDY,IСС
RFCT
;ЧИТАЕМ КОМАНДНОЕ СЛОВО (CONST,/CONST), СРАВНИВАЕМ; INTR=1,2
CONT ALUS=ZА,RА=HALF,Н,ALUD=В,RВ=DADR
PUSH А=1023,МАР=РЕ,ALUS=ZА,RА=MANT,Н,ALUD=В,RВ=РС
CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=FЕТСН,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=INTR
CJS А=СМРСС,МАР=РЕ,ALUS=ZВ,RВ=DADR,FUNC=EXNOR,Н,ALUD=В
RFCT
;ПИШЕМ ДАННЫЕ = АДРЕСУ В ПАМЯТЬ
PUSH А=1023,МАР=РЕ,ALUS=ZА,RА=MANT,Н,ALUD=В,RВ=РС
CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG
>,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
WА3К11:CJP А=WА3К11,МАР=РЕ,COND=ARBRDY,IСС
RFCT ALUS=ZА,RА=РС,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
;ЧИТАЕМ ОПЕРАНД,СРАВНИВАЕМ (Д.Б.ДАННЫЕ=АДРЕСУ И ИЗ КЭША ОПЕРАНДОВ); INTR=3,4
PUSH А=1023,МАР=РЕ,ALUS=ZА,RА=MANT,Н,ALUD=В,RВ=РС
CONT А=С2,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=INTR
CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
;ПЕРЕПИСЫВАЕМ ДАННЫЕ = АДРЕСУ В DADR, ЧИТАЕМ, СРАВНИВАЕМ
CJS А=CMPDC,МАР=РЕ,YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DRD,ALUS=ZА,RА=РС,Н
>,ALUD=В,RВ=DADR
RFCT
;ДЕЛАЕМ СБРОС КЭША; ЗАДЕРЖКУ НЕ ДЕЛАЕМ!
PUSH А=0,МАР=РЕ,YDST=CCLR
RFCT
;ЧИТАЕМ КОМАНДУ НА ФОНЕ СБРОСА КЭША, СРАВНИВАЕМ
;(Д.Б.ЧТЕНИЕ ИЗ ОЗУ, Т.Е.= АДРЕСУ); INTR=5,6
PUSH А=1023,МАР=РЕ,ALUS=ZА,RА=MANT,Н,ALUD=В,RВ=РС
CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
CONT А=С4,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=INTR
CJS А=СМРСС,МАР=РЕ,YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=FЕТСН,ALUS=ZА,RА=РС,Н
>,ALUD=В,RВ=DADR
RFCT
;СНОВА ЧИТАЕМ КОМАНДУ, ЧАСТЬ - ИЗ ОЗУ (ЧТО ПРОШЛЫЙ ЦИКЛ ЧИТАЛОСЬ НА ФОНЕ СБРОСА)
;ОСТАЛЬНОЕ - ИЗ КЭША (ДАННЫЕ = АДРЕСУ); INTR=7,8
PUSH А=1023,МАР=РЕ,ALUS=ZА,RА=MANT,Н,ALUD=В,RВ=РС
CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
CONT А=С6,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=INTR
CJS А=СМРСС,МАР=РЕ,YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=FЕТСН,ALUS=ZА,RА=РС,Н
>,ALUD=В,RВ=DADR
RFCT
CJP А=ССК1С,МАР=РЕ
;
;
KЭШ1D:ENTRY
;===== ПРОВЕРКА СБРОСА КЭША КОМАНД (СХЕМЫ СРАВНЕНИЯ)
;     ВО ВРЕМЯ СБРОСА КЭША ОЗУ СТРАНИЦ ЗАПОЛНЯЕТСЯ "1", И ПРИ ЧТЕНИИ КЭША ПОСЛЕ
;     СБРОСА СХЕМА СРАВНЕНИЯ ВСЕГДА ВЫДАЕТ СИГНАЛ, ЧТО В КЭШЕ ИНФОРМАЦИИ НЕТ,
;     ЗАПИСЬ В БОИ НЕ ПРОИСХОДИТ (РГ. RG1 НЕ МЕНЯЕТСЯ!)
;     ПИШЕМ 1024 СЛОВА = АДРЕСУ В КЭШ КОМАНД
; 1,2 - ЧИТАЕМ КОМАНДУ 1024 РАЗА, СРАВНИВАЕМ;
;     ПОСЫЛАЕМ СИГНАЛ "СБРОС КЭША"; ЗАДЕРЖКА; ЗАПИСЫВАЕМ В RG1 CONST;
; 3,4 - ЧИТАЕМ КЭШ КОМАНД; RG1 НЕ ДОЛЖЕМ ИЗМЕНИТЬСЯ!
;     РС - АДРЕС; А - ДАННЫЕ; У - ТЕГ; Q - РЕЗ-Т СРАВНЕНИЯ; MANT - НАЧ.АДРЕС;
;     DADR - ЧТО ДОЛЖНО БЫТЬ; INTR = 1 РГ.БОПП = ТИП ПРОВЕРКИ = 1-4
;
CJP А=CONT1D,МАР=РЕ
CONT1D:CONT А=H1D,%Т%
CJS А=INITST,МАР=РЕ
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
;ЧИТАЕМ НАЧАЛЬНЫЙ АДРЕС: N СТРАНИЦЫ = -512 - 1 = FFF8 0000 - 1 = FFF7 FFFF
;ПИШЕМ В RG0, ЧТОБ ПРИ СБРОСЕ "СБРОСА КЭША" НЕ БЫЛО ПОСТОРОННИХ ПРЕРЫВАНИЙ
CONT А=В20,DSRC=PROM,ALUS=DZ,FUNC=SUBR,Н,ALUD=В,RВ=MANT
>,ALU,ЕСВ,WRB,BRA=RG0
PUSH А=410,МАР=РЕ,YDST=CCLR
RFCT
;ФИЗ.АДРЕС НА СБРОС "СБРОСА КЭША"
CONT YDEV=PHYSAD,ARBI=FЕТСН
WACC1D:CJP А=WACC1D,МАР=РЕ,COND=ARBRDY,IСС
;ПИШЕМ ДАННЫЕ = АДРЕСУ В КЭШ КОМАНД
PUSH А=1023,МАР=РЕ,ALUS=ZА,RА=MANT,Н,ALUD=В,RВ=РС
;ДОБАВЛЯЕМ К АДРЕСУ 101Н (1 СТР. И 1 СЛОВО)
CONT А=В9,DSRC=PROM,ALUS=DА,RА=РС,Н,CI,ALUD=В,RВ=РС,ALU,YDST=ADRREG
>,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG1
CONT YDEV=PHYSAD,ARBI=CCWR
WAK1D:CJP А=WAK1D,МАР=РЕ,COND=ARBRDY,IСС
RFCT ALUS=ZА,RА=РС,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
;ЧИТАЕМ КЭШ КОМАНД, СРАВНИВАЕМ (Д.Б.ДАННЫЕ=АДРЕСУ); INTR=1,2
PUSH А=1023,МАР=РЕ,ALUS=ZА,RА=MANT,Н,ALUD=В,RВ=РС
CONT А=ZER,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=INTR
CONT А=В9,DSRC=PROM,ALUS=DА,RА=РС,Н,CI,ALUD=В,RВ=РС,ALU,YDST=ADRREG
>,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
;ПЕРЕПИСЫВАЕМ ДАННЫЕ = АДРЕСУ В DADR, ЧИТАЕМ, СРАВНИВАЕМ
CJS А=СМРСС,МАР=РЕ,YDEV=PHYSAD,ARBI=CCRD,ALUS=ZА,RА=РС,Н,ALUD=В,RВ=DADR
RFCT
;ДЕЛАЕМ СБРОС КЭША;НА ФОНЕ СБРОСА ЧИТАЕМ ОПЕРАНД (ЧТОБ НЕ РАСПИСАЛСЯ КЭШ КОМАНД)
PUSH А=200,МАР=РЕ,YDST=CCLR
CONT А=С1,DSRC=PROM,ALUS=DZ,ALU,YDST=ADRREG
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DRD
WAWC1D:CJP А=WAWC1D,МАР=РЕ,COND=ARBRDY,IСС
RFCT
;ПИШЕМ CONST В RG1 ТЕГА И ОПЕРАНДА И В DADR ДЛЯ СРАВНЕНИЯ
CONT А=С555,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=DADR,ALU,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG1
;ЧИТАЕМ КЭШ КОМАНД, СРАВНИВАЕМ; INTR=3,4
;Т.К. ЗАПИСИ В КЭШ КОМАНД НЕ БЫЛО, УБЕДИМСЯ, ЧТО РГ.RG1 НЕ ИЗМЕНИЛСЯ
PUSH А=1023,МАР=РЕ,ALUS=ZА,RА=MANT,Н,ALUD=В,RВ=РС
CONT А=В9,DSRC=PROM,ALUS=DА,RА=РС,Н,CI,ALUD=В,RВ=РС,ALU,YDST=ADRREG
>,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
CONT А=С2,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=INTR
CJS А=СМРСС,МАР=РЕ,YDEV=PHYSAD,ARBI=CCRD
RFCT
CJP А=CONT1D,МАР=РЕ
END
*END
*NО LIST
*CALL MPSEND:CASH=800
*END F
*END FILE
