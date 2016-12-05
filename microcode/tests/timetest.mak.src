*NАМЕ 6:TIMETEST
*       ЧАСЫ,ТАЙМЕР СВ
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
TIME:PROG;
;      ==============================
;      ЧАСЫ И ТАЙМЕР СЧЕТНОГО ВРЕМЕНИ
;      ==============================
;
;    РАСПРЕДЕЛЕНИЕ РЕГИСТРОВ БОПП ДЛЯ ЧАСОВ И ТАЙМЕРОВ:
;    0   1   2   3   4   5   6   7   8   9   А   В   С   D   Е   F
;  I-------------------------------I-------------------------------I
;  I               I               I      ЧТО ПИШЕМ ИЛИ ЧИТАЕМ     I
;  I-------------------------------I-------------------------------I
;  0 РГ.БОПП - НОМЕР ТЕСТА
;  1 РГ.БОПП - НОМЕР ПОДТЕСТА (ИЛИ ТИП ПРОВЕРКИ В ТЕСТЕ)
;  2 РГ.БОПП = 0, ЕСЛИ ЦИКЛ; FF, ЕСЛИ ОШИБКА
;  3 РГ.БОПП - МЛ.БАЙТ ЧИСЛА ЦИКЛОВ (ПРИЗНАК ТОГО, ЧТО ТЕСТ "ТИКАЕТ"), РГ.WR3
;
;===== ВНИМАНИЕ!
; - ЗАПИСЫВАТЬ И ЧИТАТЬ ПО 2 БАЙТА В ЧАСЫ И ТАЙМЕРЫ
;   ЛУЧШЕ С МАСКОЙ ПРЕРЫВАНИЙ, Т.К. ЗАПИСЬ ИДЕТ НЕСКОЛЬКО МИКРОКОМАНД!
; - НЕТ ЗАЕМА ИЗ СТАРШЕГО КВАДРАНТА ПРИ ПЕРВОМ ВЫЧИТАНИИ 1 ИЗ 0.
;   ПРОДУМАТЬ, КАКУЮ CONST ЗАГРУЖАТЬ В ЧАСЫ.
;   НАПРИМЕР, 8000 8000 8000 8000, ЗАТЕМ ДЕЛАТЬ УПАКОВКУ НА 60 РАЗРЯДОВ;
;   ИЛИ FFFF FFFF FFFF FFFF, А НЕ 0;
;   ИЛИ СЧИТАТЬ В РЕЖИМЕ 3 БЕЗ УПАКОВКИ.
; - В ТАЙМЕРАХ ИСПОЛЬЗУЕМ ТОЛЬКО 16 РАЗРЯДОВ, Т.К. ВО ВСЕХ РЕЖИМАХ
;   СЧЕТЧИКИ ЛИБО ПЕРЕСТАЮТ СЧИТАТЬ ПОСЛЕ ДОСТИЖЕНИЯ ТЕРМИНАЛЬНОГО КОДА,
;   ЛИБО ПРИ ПЕРЕХОДЕ ЧЕРЕЗ "0" ПЕРЕЗАГРУЖАЮТСЯ СТАРЫМ ЗНАЧЕНИЕМ
;   СЧЕТЧИКА (А НЕ FFFF); И ПОЭТОМУ НА СЕГОДНЯ НЕ СДЕЛАН СИГНАЛ ЗАПИСИ
;   В СТАРШУЮ ПОЛОВИНУ ТАЙМЕРА (ГДЕ 17-32 РАЗРЯДЫ)
;
EXTERN OUTAYH,RD8/F,RD8/В,OUTC/F,OUT4/7,OUT8/F,INII3,ERRTST
;
CTWR:ENTRY
;===== П/П ЗАПИСИ РГ.А В ЧАСЫ СЧЕТНОГО ВРЕМЕНИ (64 РАЗРЯДА), РЕЖИМ 3!
;   ПОСЛЕДОВАТЕЛЬНОЕ ОБРАЩЕНИЕ К СТАРШЕМУ И МЛАДШЕМУ БАЙТАМ
;   РГ.А - ЧТО ПИШЕМ; WR6 - КОМ.СЛОВО; WR5 - РАБОЧИЙ РЕГИСТР
;
;ПИШЕМ В ЧАСЫ КОМАНДНОЕ СЛОВО: NN ОО RRR D = 00 11 011 0 = 36Н
;NN=00: N КАНАЛА 0 (МЛАДШИЕ 32 РАЗРЯДА ЧАСОВ)
;ОО=11: ПОСЛЕДОВАТЕЛЬНОЕ ОБРАЩЕНИЕ
;RRR=011: РЕЖИМ 3 (ДЕЛИТЕЛЬ ЧАСТОТЫ) - В ТЕСТАХ, В РАБОТЕ - Д.Б. 2!!!
;D=0: ДВОИЧНЫЙ СЧЕТ
CONT А=R3СН0,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=WR6
;
CTWRM:ENTRY
;===== ЗАПИСЬ РГ.А В ЧАСЫ СЧ.ВРЕМЕНИ С КОМ.СЛОВОМ,ЗАДАННЫМ В РГ.WR6 ДЛЯ КАНАЛА 0
;
CONT ALUS=ZА,RА=WR6,ALU,YDTIM=CTIME,WTIME=WТ,IОМР,FFCNT=3
CONT ALUS=ZА,RА=WR6,ALU,YDTIM=CTIME,WTIME=WТ,WRD,IОМР,FFCNT=3
PUSH А=1,МАР=РЕ,ALUS=ZА,RА=WR6,ALU,YDTIM=CTIME,WTIME=WТ,IОМР,FFCNT=3
RFCT
;ПИШЕМ 1-8, 17-24 РАЗРЯДЫ В ЧАСЫ, А1,А0=00
CONT ALUS=ZА,RА=А,ALU,YDTIM=CTIME,WTIME=WТ,IОМР,FFCNT=0
CONT ALUS=ZА,RА=А,ALU,YDTIM=CTIME,WTIME=WТ,WRD,IОМР,FFCNT=0
PUSH А=1,МАР=РЕ,ALUS=ZА,RА=А,ALU,YDTIM=CTIME,WTIME=WТ,IОМР,FFCNT=0
;ПИШЕМ СТАРШИЕ БАЙТЫ, 9-16, 25-32 РАЗРЯДЫ
RFCT ALUS=DZ,Н,ALUD=ВА,RА=А,RВ=WR5,ALU,DSRC=SHIFT,MPS,PSHF=SН0+8,SHF=LOG
CONT ALUS=ZА,RА=WR5,ALU,YDTIM=CTIME,WTIME=WТ,IОМР,FFCNT=0
CONT ALUS=ZА,RА=WR5,ALU,YDTIM=CTIME,WTIME=WТ,WRD,IОМР,FFCNT=0
CONT ALUS=ZА,RА=WR5,ALU,YDTIM=CTIME,WTIME=WТ,IОМР,FFCNT=0
;ТО ЖЕ САМОЕ - ДЛЯ СТАРШЕЙ ПОЛОВИНЫ ЧАСОВ (КАНАЛ 1), МЛАДШИЙ БАЙТ
;КОМАНДНОЕ СЛОВО УВЕЛИЧИВАЕМ НА НОМЕР КАНАЛА: + 01 00 000 0 = 40Н
CONT А=СОРС1,DSRC=PROM,ALUS=DА,RА=WR6,Н,ALUD=В,RВ=WR6
CONT ALUS=ZА,RА=WR6,ALU,YDTIM=CTIME,WTIME=WТ,IОМР,FFCNT=3
CONT ALUS=ZА,RА=WR6,ALU,YDTIM=CTIME,WTIME=WТ,WRD,IОМР,FFCNT=3
PUSH А=1,МАР=РЕ,ALUS=ZА,RА=WR6,ALU,YDTIM=CTIME,WTIME=WТ,IОМР,FFCNT=3
RFCT ALUS=DZ,Н,ALUD=ВА,RА=А,RВ=WR5,ALU,DSRC=SHIFT,MPS,PSHF=SН0+32,SHF=LOG
CONT ALUS=ZА,RА=WR5,ALU,YDTIM=CTIME,WTIME=WТ,IОМР,FFCNT=1
CONT ALUS=ZА,RА=WR5,ALU,YDTIM=CTIME,WTIME=WТ,WRD,IОМР,FFCNT=1
PUSH А=1,МАР=РЕ,ALUS=ZА,RА=WR5,ALU,YDTIM=CTIME,WTIME=WТ,IОМР,FFCNT=1
;СТАРШАЯ ПОЛОВИНА ЧАСОВ, СТАРШИЙ БАЙТ
RFCT ALUS=DZ,Н,ALUD=ВА,RА=А,RВ=WR5,ALU,DSRC=SHIFT,MPS,PSHF=SН0+40,SHF=LOG
CONT ALUS=ZА,RА=WR5,ALU,YDTIM=CTIME,WTIME=WТ,IОМР,FFCNT=1
CONT ALUS=ZА,RА=WR5,ALU,YDTIM=CTIME,WTIME=WТ,WRD,IОМР,FFCNT=1
CONT ALUS=ZА,RА=WR5,ALU,YDTIM=CTIME,WTIME=WТ,IОМР,FFCNT=1
;CLOCK НА ЗАПИСЬ
PUSH А=1,МАР=РЕ,FFCNT=22
RFCT
CRTN FFCNT=20
;
;
CTRD:ENTRY
;===== П/П ЧТЕНИЯ РГ.СЧЕТНОГО ВРЕМЕНИ (64 РАЗРЯДА) - В РГ.У
;   СЧИТАЕМ, ЧТО ПОСЛЕДОВАТЕЛЬНОЕ ОБРАЩЕНИЕ К СТАРШЕМУ И МЛАДШЕМУ БАЙТАМ
;   ЗАДАНО ВО ВРЕМЯ ЗАПИСИ ДАННЫХ (ВСЕ РАВНО ДРУГОГО ПУТИ НЕТ).
;   ПИШЕМ ТОЛЬКО КОМАНДНОЕ СЛОВО НА КОПИРОВАНИЕ
;   РГ.У - ЧТО ПРОЧИТАЛИ; WR6 - РАБОЧИЙ РЕГИСТР
;
;ПИШЕМ КОМАНДНОЕ СЛОВО НА КОПИРОВАНИЕ 0 КАНАЛА
CONT ALUS=ZА,FUNC=AND,ALU,YDTIM=CTIME,WTIME=WТ,IОМР,FFCNT=3
CONT ALUS=ZА,FUNC=AND,ALU,YDTIM=CTIME,WTIME=WТ,WRD,IОМР,FFCNT=3
PUSH А=1,МАР=РЕ,ALUS=ZА,FUNC=AND,ALU,YDTIM=CTIME,WTIME=WТ,IОМР,FFCNT=3
RFCT
;ЧИТАЕМ 1-8, 17-24 РАЗРЯДЫ В РГ.У, А1,А0=00
CONT А= MTIME,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=WR6,YDTIM=CTIME,IОМР,FFCNT=0
CONT YDTIM=CTIME,RTIME=RТ,IОМР,FFCNT=0
PUSH А=1,МАР=РЕ,YDTIM=CTIME,RTIME=RТ,IОМР,FFCNT=0,ЕСВ,WRB,BRA=RG3,ЕСА,ARA=RG3
>,ALUS=DА,RА=WR6,FUNC=AND,Н,ALUD=В,RВ=У
RFCT
;ЧИТАЕМ 9-16, 25-32 РАЗРЯДЫ, ОБ'ЕДИНЯЕМ
CONT А=MTIME,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=WR6
>,YDTIM=CTIME,IОМР,FFCNT=0
CONT YDTIM=CTIME,RTIME=RТ,IОМР,FFCNT=0
CONT YDTIM=CTIME,RTIME=RТ,IОМР,FFCNT=0,ЕСВ,WRB,BRA=RG3,ЕСА,ARA=RG3
>,ALUS=DА,RА=WR6,FUNC=AND,Н,ALUD=В,RВ=WR6
CONT ALUS=DZ,Н,ALUD=ВА,RА=WR6,RВ=WR6,ALU,DSRC=SHIFT,MPS,PSHF=SН0-8,SHF=LOG
CONT ALUS=АВ,RА=WR6,RВ=У,FUNC=OR,Н,ALUD=В
;ТО ЖЕ САМОЕ - ДЛЯ СТАРШЕЙ ПОЛОВИНЫ ЧАСОВ (КАНАЛ 1), МЛАДШИЙ БАЙТ
;КОМ.СЛОВО НА КОПИРОВАНИЕ 1 КАНАЛА
CONT А=СОРС1,DSRC=PROM,ALUS=DZ,ALUD=В,RВ=WR6
CONT ALUS=ZА,RА=WR6,ALU,YDTIM=CTIME,WTIME=WТ,IОМР,FFCNT=3
CONT ALUS=ZА,RА=WR6,ALU,YDTIM=CTIME,WTIME=WТ,WRD,IОМР,FFCNT=3
PUSH А=1,МАР=РЕ,ALUS=ZА,RА=WR6,ALU,YDTIM=CTIME,WTIME=WТ,IОМР,FFCNT=3
RFCT
;СТАРШАЯ ПОЛОВИНА ЧАСОВ, МЛАДШИЙ БАЙТ
CONT А=MTIME,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=WR6
>,YDTIM=CTIME,IОМР,FFCNT=1
CONT YDTIM=CTIME,RTIME=RТ,IОМР,FFCNT=1
CONT YDTIM=CTIME,RTIME=RТ,IОМР,FFCNT=1,ЕСВ,WRB,BRA=RG3,ЕСА,ARA=RG3
>,ALUS=DА,RА=WR6,FUNC=AND,Н,ALUD=В,RВ=WR6
CONT ALUS=DZ,Н,ALUD=ВА,RА=WR6,RВ=WR6,ALU,DSRC=SHIFT,MPS,PSHF=SН0-32,SHF=LOG
CONT ALUS=АВ,RА=WR6,RВ=У,Н,ALUD=В
;СТАРШАЯ ПОЛОВИНА ЧАСОВ, СТАРШИЙ БАЙТ
CONT А=MTIME,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=WR6
>,YDTIM=CTIME,IОМР,FFCNT=1
CONT YDTIM=CTIME,RTIME=RТ,IОМР,FFCNT=1
CONT YDTIM=CTIME,RTIME=RТ,IОМР,FFCNT=1,ЕСВ,WRB,BRA=RG3,ЕСА,ARA=RG3
>,ALUS=DА,RА=WR6,FUNC=AND,Н,ALUD=В,RВ=WR6
CONT ALUS=DZ,Н,ALUD=ВА,RА=WR6,RВ=WR6,ALU,DSRC=SHIFT,MPS,PSHF=SН0-40,SHF=LOG
CRTN ALUS=АВ,RА=WR6,RВ=У,FUNC=OR,Н,ALUD=В
;
;
CTTWR:ENTRY
;===== П/П ЗАПИСИ РГ.А В ТАЙМЕР СЧЕТНОГО ВРЕМЕНИ (16 РАЗРЯДОВ), РЕЖИМ 0!
;   ПОСЛЕДОВАТЕЛЬНОЕ ОБРАЩЕНИЕ К СТАРШЕМУ И МЛАДШЕМУ БАЙТАМ, КАНАЛ 2
;   РГ.А - ЧТО ПИШЕМ; WR6 - КОМ.СЛОВО; WR5 - РАБОЧИЙ
;
;ПИШЕМ В ТАЙМЕР КОМАНДНОЕ СЛОВО: NN ОО RRR D = 10 11 000 0 = В0Н
;NN=10: N КАНАЛА 2
;ОО=11: ПОСЛЕДОВАТЕЛЬНОЕ ОБРАЩЕНИЕ
;RRR=000: РЕЖИМ 0 (ГЕНЕРАЦИЯ ЗАДЕРЖАННОГО СИГНАЛА ПРЕРЫВАНИЯ)
;D=0: ДВОИЧНЫЙ СЧЕТ
CONT А=R0СН2,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=WR6
;
CTTWRM:ENTRY
;===== ЗАПИСЬ РГ.А В ТАЙМЕР СЧ.ВРЕМЕНИ С КОМ.СЛОВОМ,ЗАДАННЫМ В РГ.WR6, КАНАЛ 2
;
CONT ALUS=ZА,RА=WR6,ALU,YDTIM=CTIME,WTIME=WТ,IОМР,FFCNT=3
CONT ALUS=ZА,RА=WR6,ALU,YDTIM=CTIME,WTIME=WТ,WRD,IОМР,FFCNT=3
PUSH А=1,МАР=РЕ,ALUS=ZА,RА=WR6,ALU,YDTIM=CTIME,WTIME=WТ,IОМР,FFCNT=3
RFCT
;ПИШЕМ 1-8 РАЗРЯДЫ, А1,А0=10
CONT ALUS=ZА,RА=А,ALU,YDTIM=CTIME,WTIME=WТ,IОМР,FFCNT=2
CONT ALUS=ZА,RА=А,ALU,YDTIM=CTIME,WTIME=WТ,WRD,IОМР,FFCNT=2
PUSH А=1,МАР=РЕ,ALUS=ZА,RА=А,ALU,YDTIM=CTIME,WTIME=WТ,IОМР,FFCNT=2
;ПИШЕМ СТАРШИЕ БАЙТЫ, 9-16 РАЗРЯДЫ
RFCT ALUS=DZ,Н,ALUD=ВА,RА=А,RВ=WR5,ALU,DSRC=SHIFT,MPS,PSHF=SН0+8,SHF=LOG
CONT ALUS=ZА,RА=WR5,ALU,YDTIM=CTIME,WTIME=WТ,IОМР,FFCNT=2
CONT ALUS=ZА,RА=WR5,ALU,YDTIM=CTIME,WTIME=WТ,WRD,IОМР,FFCNT=2
PUSH А=30,МАР=РЕ,ALUS=ZА,RА=WR5,ALU,YDTIM=CTIME,WTIME=WТ,IОМР,FFCNT=2
;ЖДЕМ ЗАПИСИ
;СИГНАЛ CLOCK, ПО КОТОРОМУ ДЕЛАЕТСЯ ЗАПИСЬ, ПРИХОДИТ 1 РАЗ В 10 MKS = 20 МК
RFCT
CRTN
;
;
CTTRD:ENTRY
;===== П/П ЧТЕНИЯ ТАЙМЕРА СЧЕТНОГО ВРЕМЕНИ (16 РАЗРЯДОВ) - В РГ.У
;   СЧИТАЕМ, ЧТО ПОСЛЕДОВАТЕЛЬНОЕ ОБРАЩЕНИЕ К СТАРШЕМУ И МЛАДШЕМУ БАЙТАМ
;   ЗАДАНО ВО ВРЕМЯ ЗАПИСИ ДАННЫХ (ВСЕ РАВНО ДРУГОГО ПУТИ НЕТ).
;   ПИШЕМ ТОЛЬКО КОМАНДНОЕ СЛОВО НА КОПИРОВАНИЕ ( = НОМЕРУ КАНАЛА)
;   У - ЧТО ЧИТАЕМ; WR6 - РАБОЧИЙ
;
;КОМ.СЛОВО НА КОПИРОВАНИЕ 2 КАНАЛА
CONT А=СОРС2,DSRC=PROM,ALUS=DZ,ALUD=В,RВ=WR6
CONT ALUS=ZА,RА=WR6,ALU,YDTIM=CTIME,WTIME=WТ,IОМР,FFCNT=3
CONT ALUS=ZА,RА=WR6,ALU,YDTIM=CTIME,WTIME=WТ,WRD,IОМР,FFCNT=3
PUSH А=1,МАР=РЕ,ALUS=ZА,RА=WR6,ALU,YDTIM=CTIME,WTIME=WТ,IОМР,FFCNT=3
RFCT
;ЧИТАЕМ 1-8 РАЗРЯДЫ В РГ.У, А1,А0=10
CONT А=МВ,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=WR6
>,YDTIM=CTIME,IОМР,FFCNT=2
CONT YDTIM=CTIME,RTIME=RТ,IОМР,FFCNT=2
PUSH А=1,МАР=РЕ,YDTIM=CTIME,RTIME=RТ,IОМР,FFCNT=2,ЕСВ,WRB,BRA=RG3,ЕСА,ARA=RG3
>,ALUS=DА,RА=WR6,FUNC=AND,Н,ALUD=В,RВ=У
RFCT
;ЧИТАЕМ 9-16 РАЗРЯДЫ, ОБ'ЕДИНЯЕМ
CONT А=МВ,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=WR6
>,YDTIM=CTIME,IОМР,FFCNT=2
CONT YDTIM=CTIME,RTIME=RТ,IОМР,FFCNT=2
CONT YDTIM=CTIME,RTIME=RТ,IОМР,FFCNT=2,ЕСВ,WRB,BRA=RG3,ЕСА,ARA=RG3
>,ALUS=DА,RА=WR6,FUNC=AND,Н,ALUD=В,RВ=WR6
CONT ALUS=DZ,Н,ALUD=ВА,RА=WR6,RВ=WR6,ALU,DSRC=SHIFT,MPS,PSHF=SН0-8,SHF=LOG
CRTN ALUS=АВ,RА=WR6,RВ=У,FUNC=OR,Н,ALUD=В
;
;
ЧАСЫ1:ENTRY
;===== ИЗ БОПП - В ЧАСЫ СЧ.ВРЕМЕНИ (64Р.),КОМ.СЛОВО ЗАДАЕМ В БОПП; ЧИТАЕМ В БОПП
;   7 РГ.БОПП - КОМ.СЛОВО ДЛЯ КАНАЛА 0,ОБЯЗАТЕЛЬНО ДВОЙНОЕ ОБР-Е! (0011 RRRD)
;   ТО ЖЕ КОМ.СЛОВО - ДЛЯ КАНАЛА 1 С ТОЧНОСТЬЮ ДО НОМЕРА КАНАЛА (МЕНЯЕМ В МП)
;   КОМАНДНОЕ СЛОВО НА КОПИРОВАНИЕ = N КАНАЛА
;   8-15 РГ.БОПП - ЗАПИСЫВАЕМОЕ ЧИСЛО; ТАМ ЖЕ - ПРОЧИТАННОЕ; 15 РГ.= МЛ.БАЙТУ
;
CJP А=CONT1,МАР=РЕ
CONT1:CONT А=Н1,%Т%
CJS А=INII3,МАР=РЕ
;ЧИТАЕМ 8-15 РГ.БОПП - В РГ.А (ЧЕРЕЗ WR6)
CJS А=RD8/F,МАР=РЕ
CONT ALUS=ZА,RА=WR6,Н,ALUD=В,RВ=А
;ЧИТАЕМ ИЗ 0 РГ.БОПП КОМАНДНОЕ СЛОВО ДЛЯ КАНАЛА 0, КОПИРУЕМ В 17-24 РАЗРЯДЫ
CONT А=МВ,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=WR6
CONT YDEV=МРМЕМ,IОМР,MPADR=7,DSRC=SHIFT,MPS,PSHF=SН0,SHF=LOG,ALUS=DА,RА=WR6
>,FUNC=AND,ALUD=В,RВ=WR6
;П/У НА П/П ЗАПИСИ РГ.А В ЧАСЫ СЧ.ВРЕМЕНИ С ЗАДАННЫМ КОМ.СЛОВОМ
CJS А=CTWRM,МАР=РЕ,YDEV=МРМЕМ,IОМР,MPADR=0,DSRC=SHIFT,MPS,PSHF=SН0-16,SHF=LOG
>,ALUS=DА,RА=WR6,FUNC=OR,ALUD=В,RВ=WR6
;П/У НА ЗАДЕРЖКУ И ЧТЕНИЕ
CJP А=WСТ,МАР=РЕ
;
;
ЧАСЫ2:ENTRY
;===== ИЗ БОПП - В ТАЙМЕР СВ (16Р.), КОМ.СЛОВО ЗАДАЕМ В БОПП; ЧИТАЕМ В БОПП
;   КОМАНДНОЕ СЛОВО, В ЧАСТНОСТИ РЕЖИМ, МОЖНО МЕНЯТЬ!
;   КОМАНДНОЕ СЛОВО ДЛЯ КОПИРОВАНИЯ В БУФЕРНЫЙ РЕГИСТР = N КАНАЛА (80).
;   7 РГ.БОПП - КОМАНДНОЕ СЛОВО ДЛЯ КАНАЛА 2, ДВОЙНОЕ ОБРАЩЕНИЕ (1011 RRR D)
;   10,11 - ЧТО ПИШЕМ; 15,15 - ЧТО ЧИТАЕМ
;
CJP А=CONT2,МАР=РЕ
CONT2:CONT А=Н2,%Т%
CJS А=INII3,МАР=РЕ
;ЧИТАЕМ 10-11 РГ.БОПП - В РГ.А (ЧЕРЕЗ WR6)
CJS А=RD8/В,МАР=РЕ
CONT ALUS=ZА,RА=WR6,Н,ALUD=В,RВ=А
;ЧИТАЕМ КОМ.СЛОВО ДЛЯ КАНАЛА 2, КОПИРУЕМ В 17-24 РАЗРЯДЫ
CONT А=МВ,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=WR6
;П/У НА П/П ЗАПИСИ В ТАЙМЕР СЧ.ВРЕМЕНИ С ЗАДАННЫМ КОМ.СЛОВОМ
CJS А=CTTWRM,МАР=РЕ,YDEV=МРМЕМ,IОМР,MPADR=7,DSRC=SHIFT,MPS,PSHF=SН0,SHF=LOG
>,ALUS=DА,RА=WR6,FUNC=AND,ALUD=В,RВ=WR6
;ИДЕМ НА П/П ЗАДЕРЖКИ И ЧТЕНИЯ
CJP А=WСТТ,МАР=РЕ
;
;
ЧАСЫ3:ENTRY
;===== ИЗ 8-15 РГ.БОПП (64 РАЗРЯДА) - В РГ.А, ОТТУДА -  В РГ.СЧЕТНОГО ВРЕМЕНИ;
;   ЧТЕНИЕ РГ.СЧЕТНОГО ВРЕМЕНИ - В РГ.У, ВЫДАЧА РГ.У - В 8-15 РГ.БОПП
;   РЕЖИМ - СТАНДАРТНЫЙ (В ТЕСТАХ ДЛЯ ЧАСОВ - 3!)
;
CJP А=CONT3,МАР=РЕ
CONT3:CONT А=Н3,%Т%
CJS А=INII3,МАР=РЕ
;П/У НА П/П ЧТЕНИЯ 8-15 РГ.БОПП В РГ.А (ЧЕРЕЗ РГ.WR6)
CJS А=RD8/F,МАР=РЕ
;П/У НА П/П ЗАПИСИ РГ.А В РГ.СЧЕТНОГО ВРЕМЕНИ
CJS А=CTWR,МАР=РЕ,ALUS=ZА,RА=WR6,Н,ALUD=В,RВ=А
;
WСТ:ENTRY
;===== ЗАДЕРЖКА, ЗАТЕМ - ЧТЕНИЕ
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR5
CICL3:CONT А=В8,DSRC=PROM,ALUS=DА,RА=WR5,FUNC=EXOR,Н,CEN
CONT SТОРС=21
CJP А=CICL3,МАР=РЕ,COND=СТ,SТОРС=21,ALUS=ZВ,RВ=WR5,Н,CI,ALUD=В
;
;
ЧАСЫ4:ENTRY
;===== ЧТЕНИЕ РГ.СЧЕТНОГО ВРЕМЕНИ - В РГ.У, ВЫДАЧА РГ.У В 8-15 РГ.БОПП
;
CJP А=CONT4,МАР=РЕ
CONT4:CONT А=Н4,%Т%
CJS А=INII3,МАР=РЕ
CJS А=CTRD,МАР=РЕ
CJS А=OUT8/F,МАР=РЕ,ALUS=ZА,RА=У,Н,ALUD=В,RВ=WR6
SТР4:CJP А=SТР4,МАР=РЕ
;
;
ЧАСЫ5:ENTRY
;===== ИЗ 10-11 РГ.БОПП - В РГ.А, ОТТУДА - В ТАЙМЕР СЧЕТНОГО ВРЕМЕНИ;
;   ЧТЕНИЕ ТАЙМЕРА СЧЕТНОГО ВРЕМЕНИ - В РГ.У, ВЫДАЧА РГ.У - В 14-15 РГ.БОПП
;   РЕЖИМ - СТАНДАРТНЫЙ (ДЛЯ ТАЙМЕРОВ - 0!)
;
CJP А=CONT5,МАР=РЕ
CONT5:CONT А=Н5,%Т%
CJS А=INII3,МАР=РЕ
;П/У НА ЧТЕНИЕ 10-11 РГ.БОПП В РГ.А ЧЕРЕЗ WR6
CJS А=RD8/В,МАР=РЕ
;П/У НА П/П ЗАПИСИ РГ.А - В РГ.СЧЕТНОГО ВРЕМЕНИ
CJS А=CTTWR,МАР=РЕ,ALUS=ZА,RА=WR6,Н,ALUD=В,RВ=А
;
WСТТ:ENTRY
;===== ЗАДЕРЖКА, ЗАТЕМ - ЧТЕНИЕ
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR5
CICL5:CONT А=В8,DSRC=PROM,ALUS=DА,RА=WR5,FUNC=EXOR,Н,CEN
CONT SТОРС=21
CJP А=CICL5,МАР=РЕ,COND=СТ,SТОРС=21,ALUS=ZВ,RВ=WR5,Н,CI,ALUD=В
;
;
ЧАСЫ6:ENTRY
;===== ЧТЕНИЕ ТАЙМЕРА СЧЕТНОГО ВРЕМЕНИ В РГ.У, ВЫДАЧА РГ.У - В 14-15 РГ.БОПП
;
CJP А=CONT6,МАР=РЕ
CONT6:CONT А=Н6,%Т%
CJS А=INII3,МАР=РЕ
CJS А=CTTRD,МАР=РЕ
CJS А=OUTC/F,МАР=РЕ,ALUS=ZА,RА=У,Н,ALUD=В,RВ=WR6
SТР6:CJP А=SТР6,МАР=РЕ
;
;
ЧАСЫ7:ENTRY
;===== ВЫДАЧА СОДЕРЖИМОГО СЧЕТЧИКА В РГ.МПС И ЧАСОВ СЧЕТНОГО ВРЕМЕНИ
;   А - СЧЕТЧИК В РГ.МПС, У - ПРОЧИТАННОЕ С ЧАСОВ
;   4-7 РГ.БОПП - МЛАДШАЯ ПОЛОВИНА СЧЕТЧИКА В РГ.МПС, 8-15 РГ.БОПП - ЧАСЫ.
;   НЕВЕРНО, Т.К. НЕТ ЗАЕМА!!!
;
CJP А=CONT7,МАР=РЕ
CONT7:CONT А=Н7,%Т%
CJS А=INII3,МАР=РЕ
;ЧИТАЕМ ПЕРЕМЕННУЮ ДЛЯ ЗАДЕРЖКИ ПОСЛЕ ЗАПИСИ:
CICL7:CONT А=В20,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РС
;CONST - В РГ.А, В ЧАСЫ СЧЕТНОГО ВРЕМЕНИ (ИЗ РГ.А)
CONT А=CFFF,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А
CJS А=CTWR,МАР=РЕ
;ЗАДЕРЖКА: 4 МК ЦИКЛА = 2 МКСЕК, КОТОРЫЕ ВЫЧИТАЮТСЯ ЗА 1 ЦИКЛ ИЗ ЧАСОВ
WAIT7:CONT А=С2,DSRC=PROM,ALUS=DА,RА=А,FUNC=SUBR,Н,CI,ALUD=В,RВ=А
;ЦИКЛ, ПОКА ПЕРЕМЕННАЯ ДЛЯ ЗАДЕРЖКИ НЕ БУДЕТ РАВНА 0
CONT ALUS=ZВ,RВ=РС,FUNC=SUBR,Н,ALUD=В,CEN
CONT SТОРС=21
CJP А=WAIT7,МАР=РЕ,COND=СТ,SТОРС=21,%TIK3%
;ЧИТАЕМ ЧАСЫ; П/У НА ВЫДАЧУ ЧАСОВ И СЧЕТЧИКА В МПС - В БОПП
CJS А=CTRD,МАР=РЕ
CJS А=OUT8/F,МАР=РЕ,ALUS=ZА,RА=У,Н,ALUD=В,RВ=WR6
CJS А=OUT4/7,МАР=РЕ,ALUS=ZА,RА=А,Н,ALUD=В,RВ=WR6
;ЖДЕМ ЧУТЬ-ЧУТЬ
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR5
CWA7:CONT ALUS=ZВ,RВ=WR5,Н,CI,ALUD=В
CONT А=В20,DSRC=PROM,ALUS=DА,RА=WR5,FUNC=EXOR,Н,CEN
CONT SТОРС=/NZ
CJP А=CWA7,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK3%
CJP А=CICL7,МАР=РЕ
;
;
ЧАСЫ8:ENTRY
;===== ВЫДАЧА СОДЕРЖИМОГО СЧЕТЧИКА В РГ.МПС И ТАЙМЕРА СЧЕТНОГО ВРЕМЕНИ
;   А - СЧЕТЧИК В РГ.МПС, У - ПРОЧИТАННОЕ С ТАЙМЕРА
;   10-11 РГ.БОПП - СЧЕТЧИК В РГ.МПС, 14-15 РГ.БОПП - ТАЙМЕР
;
CJP А=CONT8,МАР=РЕ
CONT8:CONT А=Н8,%Т%
CJS А=INII3,МАР=РЕ
;ЧИТАЕМ ПЕРЕМЕННУЮ ДЛЯ ЗАДЕРЖКИ ПОСЛЕ ЗАПИСИ ПЕРЕД ЧТЕНИЕМ
CICL8:CONT А=В10,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РС
;CONST - В РГ.А, В ТАЙМЕР СЧЕТНОГО ВРЕМЕНИ (ИЗ РГ.А)
CONT А=CFFF,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А
CJS А=CTTWR,МАР=РЕ
;ЗАДЕРЖКА: 20 МК ЦИКЛА = 10 МКСЕК, ЗА КОТОРЫЕ ВЫЧИТАЕТСЯ 1 ИЗ ТАЙМЕРА
WAIT8:CONT А=С1,DSRC=PROM,ALUS=DА,RА=А,FUNC=SUBR,Н,CI,ALUD=В,RВ=А
;ЦИКЛ, ПОКА ПЕРЕМЕННАЯ ДЛЯ ЗАДЕРЖКИ НЕ БУДЕТ РАВНА 0
PUSH А=16,МАР=РЕ,ALUS=ZВ,RВ=РССОРУ,FUNC=SUBR,Н,ALUD=В,CEN
RFCT SТОРС=21
CJP А=WAIT8,МАР=РЕ,COND=СТ,SТОРС=21,%TIK3%
;ЧИТАЕМ ТАЙМЕР; П/У НА ВЫДАЧУ ТАЙМЕРА И СЧЕТЧИКА В РГ.МПС - В БОПП
CJS А=CTTRD,МАР=РЕ
CJS А=OUTAYH,МАР=РЕ
;ЖДЕМ
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR5
CWA8:CONT ALUS=ZВ,RВ=WR5,Н,CI,ALUD=В
CONT А=В20,DSRC=PROM,ALUS=DА,RА=WR5,FUNC=AND,Н,CEN
CONT SТОРС=/NZ
CJP А=CWA8,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK3%
CJP А=CICL8,МАР=РЕ
;
;
ЧАСЫ9:ENTRY
;===== ВЫДАЧА В БОПП СЧЕТА ЧАСОВ И ТАЙМЕРА СЧЕТНОГО ВРЕМЕНИ
;   8-15 РГ.БОПП - ЧАСЫ СЧЕТНОГО ВРЕМЕНИ (ЗАПИСЫВАЮТСЯ, ЧИТАЮТСЯ ВТОРЫМИ)
;   4-7 РГ.БОПП - ТАЙМЕР СЧЕТНОГО ВРЕМЕНИ; РС,WR5 - CONST ДЛЯ ЗАДЕРЖКИ;
;   ТАЙМЕР ДОЛЖЕН СЧИТАТЬ В 10 РАЗ МЕДЛЕННЕЕ!
;   В КОМ.СЛОВЕ ЗАДАЕМ СЧЕТ ДВОИЧНО-ДЕСЯТИЧНЫЙ! РЕЖИМ ЧАСОВ - 2, ТАЙМЕРОВ - 0.
;
CJP А=CONT9,МАР=РЕ
CONT9:CONT А=Н9,%Т%
CJS А=INII3,МАР=РЕ
;ЧИТАЕМ ЗАДЕРЖКУ
CICL9:CONT А=В20,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РС
;ЧИТАЕМ НАЧАЛЬНЫЕ CONST ДЛЯ ЗАГРУЗКИ ЧАСОВ, ПИШЕМ ИХ В ЧАСЫ
CONT А=ZER,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А
;КОМАНДНОЕ СЛОВО С ДВ.-ДЕС.РЕЖИМОМ - В WR6
CONT А=R0СН2,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=WR6
CONT А=В17,DSRC=PROM,ALUS=DА,RА=WR6,Н,CI,ALUD=В,RВ=WR6
CJS А=CTTWRM,МАР=РЕ
CONT А=R2СН0,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=WR6
CONT А=В17,DSRC=PROM,ALUS=DА,RА=WR6,Н,CI,ALUD=В,RВ=WR6
CJS А=CTWRM,МАР=РЕ
;ЗАДЕРЖКА
WТ9:CONT ALUS=ZВ,RВ=РС,FUNC=SUBR,Н,ALUD=В,CEN
CONT SТОРС=/NZ
CJP А=WТ9,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK3%
;ЧИТАЕМ, ПЕРЕСЫЛАЕМ В БОПП
CJS А=CTTRD,МАР=РЕ
CJS А=CTRD,МАР=РЕ,ALUS=ZА,RА=У,Н,ALUD=В,RВ=А
CJS А=OUT8/F,МАР=РЕ,ALUS=ZА,RА=У,Н,ALUD=В,RВ=WR6
CJS А=OUT4/7,МАР=РЕ,ALUS=ZА,RА=А,Н,ALUD=В,RВ=WR6
;ЖДЕМ
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR5
CWA9:CONT ALUS=ZВ,RВ=WR5,Н,CI,ALUD=В
CONT А=В20,DSRC=PROM,ALUS=DА,RА=WR5,FUNC=EXOR,Н,CEN
CONT SТОРС=/NZ
CJP А=CWA9,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK3%
CJP А=CICL9,МАР=РЕ
;
;
ЧАСЫА:ENTRY
;===== СРАВНЕНИЕ ДВОИЧНО-ДЕСЯТИЧНОГО СЧЕТА ЧАСОВ И ТАЙМЕРА СЧЕТНОГО ВРЕМЕНИ
;   ЧАСЫ - СДВИГ ВПРАВО НА 10 РАЗРЯДОВ, Т.К. СЧИТАЮТ В 10 РАЗ МЕДЛЕННЕЕ!
;   В СЛУЧАЕ НЕСОВПАДЕНИЯ:
;   8-15 РГ.БОПП - ЧАСЫ СЧЕТНОГО ВРЕМЕНИ (ЗАПИСЫВАЮТСЯ, ЧИТАЮТСЯ ВТОРЫМИ)
;   4-7 РГ.БОПП - ТАЙМЕР СЧЕТНОГО ВРЕМЕНИ
;   В КОМ.СЛОВЕ ЗАДАЕМ СЧЕТ ДВОИЧНО-ДЕСЯТИЧНЫЙ! РЕЖИМ ЧАСОВ - 2, ТАЙМЕРОВ - 0!
;
CJP А=CONTA,МАР=РЕ
CONTA:CONT А=НА,%Т%
CJS А=INII3,МАР=РЕ
;ЧИТАЕМ НАЧАЛЬНЫЕ CONST ДЛЯ ЗАГРУЗКИ ЧАСОВ, ПИШЕМ ИХ В ЧАСЫ
CONT А=ZER,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А
;КОМАНДНОЕ СЛОВО С ДВ.-ДЕС. РЕЖИМОМ - В WR6
CONT А=R0СН2,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=WR6
CONT А=В17,DSRC=PROM,ALUS=DА,RА=WR6,Н,CI,ALUD=В,RВ=WR6
CJS А=CTTWRM,МАР=РЕ
CONT А=R2СН0,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=WR6
CONT А=В17,DSRC=PROM,ALUS=DА,RА=WR6,Н,CI,ALUD=В,RВ=WR6
CJS А=CTWRM,МАР=РЕ
;ЧИТАЕМ, СДВИГАЕМ ЧАСЫ (У) НА 4 РАЗРЯДА ВПРАВО (Т.К.ОНИ В 10 РАЗ МЕДЛЕННЕЕ!)
CICLA:CJS А=CTTRD,МАР=РЕ
CJS А=CTRD,МАР=РЕ,ALUS=ZА,RА=У,Н,ALUD=В,RВ=А
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=DADR,ALU,DSRC=SHIFT,MPS,PSHF=SН0+4,SHF=LOG
;СРАВНИВАЕМ
CONT ALUS=АВ,RА=А,RВ=DADR,FUNC=EXOR,Н,ALUD=Q
;МАСКА НА 16-4=12 РАЗРЯДОВ
CONT А=МРР,DSRC=PROM,ALUS=DQ,FUNC=AND,Н,ALUD=Q,CEN
;ОК, ЕСЛИ СОВПАЛО
CONT SТОРС=20
CJP А=NХТА,МАР=РЕ,COND=СТ,SТОРС=20
;ПЕРЕСЫЛАЕМ В БОПП:
CJS А=OUT4/7,МАР=РЕ,ALUS=ZА,RА=А,Н,ALUD=В,RВ=WR6
CJS А=OUT8/F,МАР=РЕ,ALUS=ZА,RА=У,Н,ALUD=В,RВ=WR6
CJS А=ERRTST,МАР=РЕ
NХТА:CJP А=CICLA,МАР=РЕ,%TIK3%
;
;
ЧАСЫВ:ENTRY
;===== ПИШЕМ CONST ИЗ ПЗУ В ЧАСЫ СЧ.ВРЕМЕНИ,СРАВНИВАЕМ С ТОЧНОСТЬЮ ДО N РАЗРЯДОВ
;   КОЛИЧЕСТВО УБИРАЕМЫХ РАЗРЯДОВ - РАЗНОЕ, В ЗАВИСИМОСТИ ОТ ЗАПИСЫВАЕМОЙ CONST!
;   0 - НЕСОВПАДЕНИЕ НА 16 РАЗР.,Т.К.НЕТ ЗАЕМА; FF..FF - 5Р., АА..АА - 6Р.
;   4-7 РГ.БОПП - МЛ.ПОЛОВИНА ТОГО, ЧТО ПИСАЛИ; 8-15 РГ.БОПП - ЧТО ПРОЧИТАЛИ.
;
CJP А=CONTB,МАР=РЕ
CONTB:CONT А=НВ,%Т%
CJS А=INII3,МАР=РЕ
;ЧИТАЕМ CONST ИЗ ПЗУ В РГ.А, ПИШЕМ В ЧАСЫ
CONT А=СААА,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А
CKLB:CJS А=CTWR,МАР=РЕ
;ЧИТАЕМ, СРАВНИВАЕМ
CJS А=CTRD,МАР=РЕ
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,Н,ALUD=Q
;УБИРАЕМ МЛАДШИЕ РАЗРЯДЫ (СКОЛЬКО РАЗ СДВИНЕМ)
PUSH А=5,МАР=РЕ
RFCT ALUS=ZQ,Н,ALUD=RSBQ,RВ=WR6,SHMUX=LSLSL
;ПРОВЕРЯЕМ НА 0
CONT ALUS=ZQ,Н,CEN
CONT SТОРС=21
CJS А=OUT8/F,МАР=РЕ,COND=СТ,SТОРС=21,ALUS=ZА,RА=У,Н,ALUD=В,RВ=WR6
CJS А=OUT4/7,МАР=РЕ,ALUS=ZА,RА=А,Н,ALUD=В,RВ=WR6
CJS А=ERRTST,МАР=РЕ
CJP А=CKLB,МАР=РЕ,%TIK3%
;
;
ЧАСЫС:ENTRY
;===== ПИШЕМ CONST ИЗ ПЗУ В ТАЙМЕР СЧ. ВРЕМЕНИ, СРАВНИВАЕМ С ТОЧН.ДО N РАЗРЯДОВ
;   10-11 РГ.БОПП - ЧТО ПИСАЛИ; 14-15  РГ.БОПП - ЧТО ПРОЧИТАЛИ.
;
CJP А=CONTC,МАР=РЕ
CONTC:CONT А=НС,%Т%
CJS А=INII3,МАР=РЕ
;ЧИТАЕМ CONST ИЗ ПЗУ В РГ.А, ПИШЕМ В ТАЙМЕР
CONT А=СААА,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А
CKLC:CJS А=CTTWR,МАР=РЕ
;ЧИТАЕМ, СРАВНИВАЕМ
CJS А=CTTRD,МАР=РЕ
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,Н,ALUD=Q
;МАСКА НА 16 РАЗРЯДОВ
CONT А=MQ,DSRC=PROM,ALUS=DQ,FUNC=AND,Н,ALUD=Q
;УБИРАЕМ МЛАДШИЕ РАЗРЯДЫ (СКОЛЬКО РАЗ СДВИНЕМ)
PUSH А=0,МАР=РЕ
RFCT ALUS=ZQ,Н,ALUD=RSBQ,RВ=WR6,SHMUX=LSLSL
;ПРОВЕРЯЕМ НА 0
CJS А=OUTAYH,МАР=РЕ,ALUS=ZQ,Н,CEN
CONT SТОРС=21
CJS А=ERRTST,МАР=РЕ,COND=СТ,SТОРС=21
CJP А=CKLC,МАР=РЕ,%TIK3%
;
;
ЧACЫD:ENTRY
;===== ПРОВЕРЯЕМ ИЗМЕНЕНИЕ СЧЕТА ЧАСОВ СЧЕТНОГО ВРЕМЕНИ
;   4-7 РГ.БОПП - МЛ.ПОЛОВИНА ТОГО, ЧТО БЫЛО; 8-15 РГ.БОПП - ЧТО ПРОЧИТАЛИ
;
CJP А=CONTD,МАР=РЕ
CONTD:CONT А=HD,%Т%
CJS А=INII3,МАР=РЕ
CONT А=ZER,МАР=РЕ,ALUS=DZ,Н,ALUD=В,RВ=А
CJS А=CTWR,МАР=РЕ
;ЖДЕМ 2 МК = 1 MKS, ПОСЛЕ ЧЕГО ЧАСЫ МОЖНО ЧИТАТЬ (ПОКЗАНИЯ ДОЛЖНЫ ИЗМЕНИТЬСЯ!)
CCD:PUSH А=0,МАР=РЕ
RFCT
;ЧИТАЕМ, СРАВНИВАЕМ
CJS А=CTRD,МАР=РЕ
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,Н,ALUD=Q,CEN
CJS А=OUT8/F,МАР=РЕ,COND=СТ,SТОРС=20,ALUS=ZА,RА=У,Н,ALUD=В,RВ=WR6
CJS А=OUT4/7,МАР=РЕ,ALUS=ZА,RА=А,Н,ALUD=В,RВ=WR6
;ОШИБКА, ЕСЛИ ПОКАЗАНИЯ ЧАСОВ НЕ ИЗМЕНИЛИСЬ (СОВПАЛИ)
CONT SТОРС=20,%TIK3%
CJS А=ERRTST,МАР=РЕ,COND=СТ,SТОРС=20
;ПОСЛЕ ИЗМЕНЕНИЯ СЧЕТА В НОВОМ ЦИКЛЕ СРАВНЕНИЕ ПРОСХОДИТ С ВНОВЬ ПРОЧИТАННЫМ!
CJP А=CCD,МАР=РЕ,ALUS=ZА,RА=У,Н,ALUD=В,RВ=А
;
;
ЧАСЫЕ:ENTRY
;===== ПРОВЕРЯЕМ ИЗМЕНЕНИЕ СЧЕТА ТАЙМЕРА СЧЕТНОГО ВРЕМЕНИ
;   ЧТОБ ТАЙМЕР НЕ ОСТАНАВЛИВАЛСЯ, ЗАДАЕМ РЕЖИМ 2 ПРИ ЗАПИСИ!
;
CJP А=CONTE,МАР=РЕ
CONTE:CONT А=НЕ,%Т%
CJS А=INII3,МАР=РЕ
CONT А=ZER,МАР=РЕ,ALUS=DZ,Н,ALUD=В,RВ=А
;ЧИТАЕМ КОМ.СЛОВО С РЕЖИМОМ 2
CONT А=R2СН2,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=WR6
CJS А=CTTWRM,МАР=РЕ
;ЖДЕМ 20 МК = 10 MKS, ПОСЛЕ ЧЕГО ТАЙМЕР МОЖНО ЧИТАТЬ, ПОКЗАНИЯ ДОЛЖНЫ ИЗМЕНИТЬСЯ
ССЕ:PUSH А=20,МАР=РЕ
RFCT
;ЧИТАЕМ, СРАВНИВАЕМ
CJS А=CTTRD,МАР=РЕ
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,Н,ALUD=Q
CONT А=MQ,DSRC=PROM,ALUS=DQ,FUNC=AND,Н,ALUD=Q,CEN
CJS А=OUTAYH,МАР=РЕ,%TIK3%
;ОШИБКА, ЕСЛИ ПОКАЗАНИЯ ТАЙМЕРА НЕ ИЗМЕНИЛИСЬ
CONT SТОРС=20
CJS А=ERRTST,МАР=РЕ,COND=СТ,SТОРС=20
;ПОСЛЕ ИЗМЕНЕНИЯ СЧЕТА В НОВОМ ЦИКЛЕ СРАВНЕНИЕ ПРОСХОДИТ С ВНОВЬ ПРОЧИТАННЫМ!
CJP А=ССЕ,МАР=РЕ,ALUS=ZА,RА=У,Н,ALUD=В,RВ=А
;
;
ЧACЫF:ENTRY
;===== ПРОВЕРКА ОТНОСИТЕЛЬНОГО ИЗМЕНЕНИЯ СЧЕТА ЧАСОВ СЧЕТНОГО ВРЕМЕНИ В 2 РАЗА
;   ЗА N И N+N МИКРОПРОГРАММНЫХ ЦИКЛА
;   А - НАЧАЛЬНОЕ ЗНАЧЕНИЕ (ИЛИ ТОЧКА ОТСЧЕТА ПРИ ОЧЕРЕДНОЙ ИТЕРАЦИИ)
;   У - ПРОЧИТАННОЕ С ЧАСОВ В П/П ЧТЕНИЯ; Q - РЕЗ-Т СРАВНЕНИЯ
;   DADR - ПРОЧИТАННОЕ 1-Й РАЗ; HALF - ПРОЧИТАННОЕ 2-Й РАЗ
;   EXPN - 1-Я РАЗНИЦА, УМНОЖЕННАЯ НА 2; MANT - 2-Я РАЗНИЦА
;
CJP А=CONTF,МАР=РЕ
CONTF:CONT А=HF,%Т%
CJS А=INII3,МАР=РЕ
;0 - В ЧАСЫ
CJS А=CTWR,МАР=РЕ,ALUS=ZА,FUNC=AND,Н,ALUD=В,RВ=А
;ЖДЕМ
CCF:PUSH А=$FFF,МАР=РЕ
RFCT
;ЧИТАЕМ 1-Й РАЗ
CJS А=CTRD,МАР=РЕ
;ВЫЧИСЛЯЕМ РАЗНИЦУ, УМНОЖАЕМ НА 2, ПИШЕМ В EXPN
CONT ALUS=АВ,RА=А,RВ=У,FUNC=SUBS,Н,CI,ALUD=Q
CONT ALUS=ZQ,Н,ALUD=LSB,RВ=EXPN,SHMUX=LSLSL
;ЖДЕМ ЕЩЕ СТОЛЬКО ЖЕ
PUSH А=$FFF,МАР=РЕ
RFCT
;ЧИТАЕМ 2-Й РАЗ, ПЕРЕПИСЫВЕМ ПРОЧИТАННОЕ 1-Й РАЗ В DADR
CJS А=CTRD,МАР=РЕ,ALUS=ZА,RА=У,Н,ALUD=В,RВ=DADR
;ВЫЧИСЛЯЕМ РАЗНИЦУ, ПИШЕМ В MANT
CONT ALUS=АВ,RА=У,RВ=А,FUNC=SUBR,Н,CI,ALUD=Q
CONT ALUS=ZQ,Н,ALUD=В,RВ=MANT
;ПЕРЕПИСЫВАЕМ ПРОЧИТАННОЕ 2-Й РАЗ
CONT ALUS=ZА,RА=У,Н,ALUD=В,RВ=HALF
;СРАВНИВАЕМ РАЗНИЦУ С ПРЕДЫДУЩЕЙ
CONT ALUS=АВ,RА=EXPN,RВ=MANT,FUNC=EXOR,Н,ALUD=Q
;СДВИГАЕМ НА N РАЗРЯДОВ ВПРАВО (СРАВНИВАЕМ С ТОЧНОСТЬЮ ДО N РАЗРЯДОВ)
PUSH А=2,МАР=РЕ
RFCT ALUS=ZQ,Н,ALUD=RSBQ,RВ=WR6,SHMUX=LSLSL
CONT ALUS=ZQ,Н,CEN
CJS А=OUT8/F,МАР=РЕ,ALUS=ZА,RА=У,Н,ALUD=В,RВ=WR6
CJS А=OUT4/7,МАР=РЕ,ALUS=ZА,RА=А,Н,ALUD=В,RВ=WR6
CONT SТОРС=21
CJS А=ERRTST,МАР=РЕ,COND=СТ,SТОРС=21
;ЧИТАЕМ СНОВА ДЛЯ СЛЕДУЮЩЕЙ ИТЕРАЦИИ
CJS А=CTRD,МАР=РЕ,%TIK3%
CJP А=CCF,МАР=РЕ,ALUS=ZА,RА=А,Н,ALUD=В,RВ=У
;
;
ЧАСЫ10:ENTRY
;===== ПРОВЕРКА ОТНОСИТЕЛЬНОГО ИЗМЕНЕНИЯ СЧЕТА ТАЙМЕРА СЧЕТНОГО ВРЕМЕНИ В 2 РАЗА
;   ЗА N И N+N МИКРОПРОГРАММНЫХ ЦИКЛА
;   А - НАЧАЛЬНОЕ ЗНАЧЕНИЕ (ИЛИ ТОЧКА ОТСЧЕТА ПРИ ОЧЕРЕДНОЙ ИТЕРАЦИИ)
;   У - ПРОЧИТАННОЕ С ТАЙМЕРА В П/П ЧТЕНИЯ; Q - РЕЗ-Т СРАВНЕНИЯ
;   DADR - ПРОЧИТАННОЕ 1-Й РАЗ; HALF - ПРОЧИТАННОЕ 2-Й РАЗ
;   EXPN - 1-Я РАЗНИЦА, УМНОЖЕННАЯ НА 2; MANT - 2-Я РАЗНИЦА
;
CJP А=CONT10,МАР=РЕ
CONT10:CONT А=Н10,%Т%
CJS А=INII3,МАР=РЕ
;0 - В ТАЙМЕР
CJS А=CTTWR,МАР=РЕ,ALUS=ZА,FUNC=AND,Н,ALUD=В,RВ=А
;ЖДЕМ
СС10:PUSH А=$FFF,МАР=РЕ
RFCT
;ЧИТАЕМ 1-Й РАЗ
CJS А=CTTRD,МАР=РЕ
;ВЫЧИСЛЯЕМ РАЗНИЦУ, УМНОЖАЕМ НА 2, ПИШЕМ В EXPN
CONT ALUS=АВ,RА=А,RВ=У,FUNC=SUBS,Н,CI,ALUD=Q
CONT ALUS=ZQ,Н,ALUD=LSB,RВ=EXPN,SHMUX=LSLSL
;ЖДЕМ ЕЩЕ СТОЛЬКО ЖЕ
PUSH А=$FFF,МАР=РЕ
RFCT
;ЧИТАЕМ 2-Й РАЗ, ПЕРЕПИСЫВЕМ ПРОЧИТАННОЕ 1-Й РАЗ В DADR
CJS А=CTTRD,МАР=РЕ,ALUS=ZА,RА=У,Н,ALUD=В,RВ=DADR
;ВЫЧИСЛЯЕМ РАЗНИЦУ, ПИШЕМ В MANT
CONT ALUS=АВ,RА=У,RВ=А,FUNC=SUBR,Н,CI,ALUD=Q
CONT ALUS=ZQ,Н,ALUD=В,RВ=MANT
;ПЕРЕПИСЫВАЕМ ПРОЧИТАННОЕ 2-Й РАЗ
CONT ALUS=ZА,RА=У,Н,ALUD=В,RВ=HALF
;СРАВНИВАЕМ РАЗНИЦУ С ПРЕДЫДУЩЕЙ
CONT ALUS=АВ,RА=EXPN,RВ=MANT,FUNC=EXOR,Н,ALUD=Q
;МАСКА НА 16 РАЗРЯДОВ
CONT А=MQ,DSRC=PROM,ALUS=DQ,FUNC=AND,Н,ALUD=Q
;СДВИГАЕМ НА N РАЗРЯДОВ ВПРАВО (СРАВНИВАЕМ С ТОЧНОСТЬЮ ДО N РАЗРЯДОВ)
PUSH А=1,МАР=РЕ
RFCT ALUS=ZQ,Н,ALUD=RSBQ,RВ=WR6,SHMUX=LSLSL
CJS А=OUTAYH,МАР=РЕ,ALUS=ZQ,Н,CEN
CONT SТОРС=21
CJS А=ERRTST,МАР=РЕ,COND=СТ,SТОРС=21
;ЧИТАЕМ СНОВА ДЛЯ СЛЕДУЮЩЕЙ ИТЕРАЦИИ
CJS А=CTTRD,МАР=РЕ
CJP А=СС10,МАР=РЕ,ALUS=ZА,RА=У,Н,ALUD=В,RВ=А
END
*END
*NО LIST
*CALL MPSEND:TIME=800
*END F
*END FILE
