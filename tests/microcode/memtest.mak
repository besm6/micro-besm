*NАМЕ 7:MEMTEST
*       ТЕСТ ОЗУ
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
МЕМ:PROG;
;     ===============
;     ПРОВЕРКА  О З У
;     ===============
;
;    РАСПРЕДЕЛЕНИЕ РЕГИСТРОВ   Б О П П   ДЛЯ ВСЕХ ТЕСТОВ   О З У:
;    0   1   2   3   4   5   6   7   8   9   А   В   С   D   Е   F
;  I-----------I---------------I---I--------------------------------I
;  I   I   I   I 32РАЗР.АДРЕС  ITEГI         Д  А  Н  Н  Ы  Е       I
;  I-----------I---------------I---I--------------------------------I
;   0 РГ.БОПП - НОМЕР ТЕСТА
;   1 РГ.БОПП - ТИП ПРОВЕРКИ, РГ.INTR = НЕЧЕТ, ЕСЛИ ПРОВЕРЯЕМ ДАННЫЕ; ЧЕТ - ТЕГ;
;   2 РГ.БОПП = 0, ЕСЛИ ТЕСТ "КРУТИТСЯ"; = FF, ЕСЛИ ОШИБКА
;   3 РГ.БОПП - МЛ.БАЙТ ЧИСЛА ЦИКЛОВ ТЕСТА:ПРИЗН.ТОГО,ЧТО ТЕСТ"КРУТИТСЯ",РГ.MANT
;   ИЛИ 3-6 РГ.БОПП = ПЕРЕМЕННОМУ АДРЕСУ (РГ.РС), ЕСЛИ АДРЕС ПО ПАМЯТИ МЕНЯЕТСЯ;
;   В СЛУЧАЕ ОШИБКИ 3-6 РГ.БОПП = АДРЕСУ ПАМЯТИ, ГДЕ ОБНАРУЖЕНА ОШИБКА.
;
;   ПОСЛЕ ЦИКЛА ЧТЕНИЯ ВСЕЙ ПАМЯТИ  В    Б О П П   ПИШЕТСЯ:
;   8 - В РГ.:ЧИСЛО ОШИБОК
;   С - F РГ.:НОМЕР ЦИКЛА
;
ОЗУ1:ENTRY
;===== ОДИНОЧНАЯ ЗАПИСЬ В ПАМЯТЬ ЗАДАННОГО ЧИСЛА ПО ЗАДАННОМУ АДРЕСУ
;   3-6 РГ.БОПП - АДРЕС; 7-15 РГ,БОПП - ДАННЫЕ + ТЕГ
;
EXTERN RDADR,OUTADR,RDDAT,OUTDAT,OUTEMH,RD4/6,ERRDAF,INITST,INITSM
EXTERN OUT3/6,ERRTST
;
CJP А=СМЕМ1,МАР=РЕ
СМЕМ1:CONT А=Н1,%Т%
CJS А=INITSM,МАР=РЕ
;УСТАН.БЛОКИРОВКИ В РР ДЛЯ ТЕСТОВ:БП=БПНП=РОА=БЗО=БЗЗ=БПТЗ=БПИНТ=БЧС=БПТЧ=БЧОП=1
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
;ЧИТАЕМ АДРЕС ИЗ БОПП В РГ.РС, ДАННЫЕ - В РГ.DADR, ТЕГ - В РГ.HALF
CJS А=RDADR,МАР=РЕ
CJS А=RDDAT,МАР=РЕ
;ПИШЕМ В ОЗУ:
CONT ALUS=ZА,RА=РС,ALU,YDST=ADRREG
CONT ALUS=ZА,RА=DADR,Н,ALU,ЕСВ,WRB,BRA=RG3
CONT ALUS=ZА,RА=HALF,ALU,YDEVT=ECBTAG,WRB,BRA=RG3
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
WАМ1:CJP А=WАМ1,МАР=РЕ,COND=ARBRDY,IСС
SТРМ1:CJP А=SТРМ1,МАР=РЕ
;
;
ОЗУ2:ENTRY
;===== ОДИНОЧНОЕ ЧТЕНИЕ ДАННЫХ И ТЕГА ИЗ ПАМЯТИ ПО ЗАДАННОМУ АДРЕСУ
;   3-6 РГ.БОПП - ЗАДАВАЕМЫЙ АДРЕС; 7 РГ.БОПП - ПРОЧИТАННЫЙ ТЕГ; 8-15 - ДАННЫЕ
;
CJP А=СМЕМ2,МАР=РЕ
СМЕМ2:CONT А=Н2,%Т%
CJS А=INITSM,МАР=РЕ
;УСТАНВАЛИВАЕМ В РР БП=1 И Т.Д., ЧТО НАДО ДЛЯ ТЕСТОВ
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
;ЧИТАЕМ АДРЕС ИЗ БОПП В РГ.РС
CJS А=RDADR,МАР=РЕ,YDST=CCLR
;ЧИТАЕМ ИЗ ОЗУ:
CONT ALUS=ZА,RА=РС,ALU,YDST=ADRREG
CONT А=МВ,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=ВУТЕ,YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0
>,ARBI=DRD
WАМ2:CJP А=WАМ2,МАР=РЕ,COND=ARBRDY,IСС,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=РССОРУ
CJS А=OUTADR,МАР=РЕ,ЕСА,ARA=RG2,ALUS=DZ,Н,ALUD=В,RВ=А
CJS А=OUTDAT,МАР=РЕ,YDEVT=ECBTAG,BRA=RG2,DSRC=SHIFT,MPS,PSHF=SН0,SHF=LOG,ALUS=DА
>,RА=ВУТЕ,FUNC=AND,Н,ALUD=В,RВ=У
SТОРМ2:CJP А=SТОРМ2,МАР=РЕ
;
;
ОЗУ3:ENTRY
;===== ОДИНОЧНАЯ ВЫБОРКА КОМАНДНОГО СЛОВА И ТЕГА ИЗ ПАМЯТИ ПО ЗАДАННОМУ АДРЕСУ
;   3-7 РГ.БОПП - ЗАДАВАЕМЫЙ АДРЕС; 7 РГ.БОПП - ПРОЧИТАННЫЙ ТЕГ; 8-15 - ДАННЫЕ
;
CJP А=СМЕМ3,МАР=РЕ
СМЕМ3:CONT А=Н3,%Т%
CJS А=INITSM,МАР=РЕ
;УСТАНВАЛИВАЕМ В РР БП=1 И Т.Д., ЧТО НАДО ДЛЯ ТЕСТОВ
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
;ЧИТАЕМ АДРЕС ИЗ БОПП В РГ.РС
CJS А=RDADR,МАР=РЕ,YDST=CCLR
;ЧИТАЕМ ИЗ ОЗУ:
CONT ALUS=ZА,RА=РС,ALU,YDST=ADRREG
CONT А=МВ,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=ВУТЕ,YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0
>,ARBI=FЕТСН
WАМ3:CJP А=WАМ3,МАР=РЕ,COND=ARBRDY,IСС,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=РССОРУ
CJS А=OUTADR,МАР=РЕ,ЕСА,ARA=RG1,ALUS=DZ,Н,ALUD=В,RВ=А
CJS А=OUTDAT,МАР=РЕ,YDEVT=ECBTAG,BRA=RG1,DSRC=SHIFT,MPS,PSHF=SН0,SHF=LOG,ALUS=DА
>,RА=ВУТЕ,FUNC=AND,Н,ALUD=В,RВ=У
SТОРМ3:CJP А=SТОРМ3,МАР=РЕ
;
;
ОЗУ4:ENTRY
;===== ЗАПИСЬ CONST В ПАМЯТЬ; ЦИКЛ ПО ВСЕМ АДРЕСАМ; ЧТЕНИЕ; СРАВНЕНИЕ
;   РС - АДРЕС; А - ПРОЧИТАННЫЕ ДАННЫЕ; У - ТЕГ; DADR - ЗАПИСЫВАЕМЫЕ ДАННЫЕ;
;   HALF - ЗАПИСЫВАЕМЫЙ ТЕГ; Q - РЕЗ-Т СРАВНЕНИЯ; INTR - ТИП ПРОВЕРКИ;
;   EXPN - ЧИСЛО ОШИБОК; MANT - НОМЕР ЦИКЛА ЧТЕНИЯ.
;
CJP А=СМЕМ4,МАР=РЕ
СМЕМ4:CONT А=Н4,%Т%
CJS А=INITST,МАР=РЕ
;ПИШЕМ БЛОКИРОВКИ В РР (БП=1 И Т.Д.)
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=MANT
;ЧИТАЕМ CONST В РГ.DADR И HALF, КОТОРУЮ БУДЕМ ЗАПИСЫВАТЬ В ОЗУ
CONT А=CFFF,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=DADR
CONT А=CFFF,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=HALF
;ПИШЕМ CONST: "0" - В РГ.РС (АДРЕС)
CONT А=ZER,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РС
;АДРЕС РС+1 - В РС, АИСП.
CCWM4:CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG
;ДАННЫЕ И ТЕГ - В RG3 БОИ ДАННЫХ И ТЕГА
CJS А=OUTADR,МАР=РЕ,ALUS=ZА,RА=DADR,Н,ALU,ЕСВ,WRB,BRA=RG3
CONT ALUS=ZА,RА=HALF,ALU,YDEVT=ECBTAG,WRB,BRA=RG3
;ФИЗ.АДРЕС - В RG0
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
;ЖДЕМ ГОТ.АРБИТРА, РС+1 - В РГ.Q (ДЛЯ СРАВНЕНИЯ С МАХ ADR.+ 1)
WWM4:CJP А=WWM4,МАР=РЕ,COND=ARBRDY,IСС,ALUS=ZА,RА=РС,Н,CI,ALUD=Q
;СРАВНИВАЕМ АДРЕС
CONT А=В18,DSRC=PROM,ALUS=DQ,FUNC=EXOR,CEN
CONT SТОРС=21
CJP А=CCWM4,МАР=РЕ,COND=СТ,SТОРС=21
;
;ЦИКЛ НА ЧТЕНИЕ
;0 - В РГ.АДРЕСА (РС), 0 - В РГ.ЧИСЛА ОШИБОК (EXPN), +1 К РГ.НОМЕРА ЦИКЛА (MANT)
RМЕМ4:CONT А=ZER,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РС
CONT ALUS=ZВ,RВ=MANT,Н,CI,ALUD=В
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=EXPN
;П/У НА П/П ЧТЕНИЯ И СРАВНЕНИЯ ДАННЫХ
CCRM4:CJS А=DCMPDH,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=INTR
;СРАВНИВАЕМ АДРЕС (РС+1)
CJS А=OUTADR,МАР=РЕ,ALUS=ZА,RА=РС,Н,CI,ALUD=Q
CONT А=В18,DSRC=PROM,ALUS=DQ,FUNC=EXOR,СЕМ
CONT SТОРС=37
CJP А=CCRM4,МАР=РЕ,COND=СТ,SТОРС=37
;П/У НА ВЫДАЧУ В БОПП НОМЕРА ЦИКЛА И ЧИСЛА ОШИБОК
CJS А=OUTEMH,МАР=РЕ
CJP А=RМЕМ4,МАР=РЕ
;
;
DCMPDH:ENTRY
;П/П ЧТЕНИЯ ДАННЫХ, СРАВНЕНИЯ С DADR И HALF И ВЫДАЧИ ИХ В БОПП ПРИ НЕСОВПАДЕНИИ
CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG
;Ф.А. + КОП НА ЧТЕНИЕ ДАННЫХ
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DRD
;ЖДЕМ ГОТ.АРБИТРА
WRDCMP:CJP А=WRDCMP,МАР=РЕ,COND=ARBRDY,IСС
;ЧИТАЕМ ДАННЫЕ, СРАВНИВАЕМ
CONT ЕСА,ARA=RG2,ALUS=DZ,Н,ALUD=В,RВ=А
CONT ALUS=АВ,RА=А,RВ=DADR,FUNC=EXOR,Н,ALUD=Q,СЕМ
CONT SТОРС=37,%ТУРЕ%
;П/У НА ВЫДАЧУ РГ.В БОПП, ЕСЛИ НЕСОВПАДЕНИЕ, ЧИТАЕМ ТЕГ
CJS А=ERRCMP,МАР=РЕ,COND=СТ,SТОРС=37,YDEVT=ECBTAG,BRA=RG2
>,DSRC=SHIFT,MPS,PSHF=SН0,SHF=LOG,ALUS=DZ,Н,ALUD=В,RВ=У
CONT ALUS=АВ,RА=HALF,RВ=У,FUNC=EXOR,ALUD=Q
CONT А=МВ,DSRC=PROM,ALUS=DQ,FUNC=AND,Н,ALUD=Q,CEN
CONT SТОРС=20,%ТУРЕ%
CRTN COND=СТ,SТОРС=20
;+1 К ЧИСЛУ ОШИБОК; П/У НА ВЫДАЧУ ДАННЫХ В БОПП, ВОЗВРАТ
ERRCMP:CJP А=ERRDAF,МАР=РЕ,ALUS=ZВ,RВ=EXPN,Н,CI,ALUD=В
;
;П/П ЧТЕНИЯ ДАННЫХ, СРАВНЕНИЯ С DADR (ТЕГ = МЛ.РАЗРЯДАМ DADR), ВЫДАЧИ ИХ В БОПП
DCMPD0:ENTRY
CJP А=DCMPD+1,МАР=РЕ,ALUS=ZА,RА=РС,ALU,YDST=ADRREG
DCMPD:ENTRY
CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG
;Ф.А. + КОП НА ЧТЕНИЕ ДАННЫХ
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DRD
;ЖДЕМ ГОТ.АРБИТРА
CMPWA:CJP А=CMPWA,МАР=РЕ,COND=ARBRDY,IСС
;ЧИТАЕМ ДАННЫЕ, СРАВНИВАЕМ
CONT ЕСА,ARA=RG2,ALUS=DZ,Н,ALUD=В,RВ=А
CONT ALUS=АВ,RА=А,RВ=DADR,FUNC=EXOR,Н,ALUD=Q,СЕМ
CONT SТОРС=37,%ТУРЕ%
;П/У НА ВЫДАЧУ РГ.В БОПП, ЕСЛИ НЕСОВПАДЕНИЕ, ЧИТАЕМ ТЕГ
CJS А=ERRCMP,МАР=РЕ,COND=СТ,SТОРС=37,YDEVT=ECBTAG,BRA=RG2
>,DSRC=SHIFT,MPS,PSHF=SН0,SHF=LOG,ALUS=DZ,Н,ALUD=В,RВ=У
CONT ALUS=АВ,RА=DADR,RВ=У,FUNC=EXOR,ALUD=Q
CONT А=МВ,DSRC=PROM,ALUS=DQ,FUNC=AND,Н,ALUD=Q,CEN
CONT SТОРС=20,%ТУРЕ%
CRTN COND=СТ,SТОРС=20
;+1 К ЧИСЛУ ОШИБОК; П/У НА ВЫДАЧУ ДАННЫХ В БОПП, ВОЗВРАТ
CJP А=ERRDAF,МАР=РЕ,ALUS=ZВ,RВ=EXPN,Н,CI,ALUD=В
;
CCMPD:ENTRY
;П/П ЧТЕНИЯ КОМАНДНОГО СЛОВА, СРАВНЕНИЯ С DADR (ТЕГ = МЛ.РАЗРЯДАМ DADR)
CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG
;Ф.А. + КОП НА ЧТЕНИЕ КОМАНДНОГО СЛОВА
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=FЕТСН
;ЖДЕМ ГОТ.АРБИТРА
WАСМР:CJP А=WАСМР,МАР=РЕ,COND=ARBRDY,IСС
;ЧИТАЕМ КОМ.СЛОВО, СРАВНИВАЕМ
CONT ЕСА,ARA=RG1,ALUS=DZ,Н,ALUD=В,RВ=А
CONT ALUS=АВ,RА=А,RВ=DADR,FUNC=EXOR,Н,ALUD=Q,СЕМ
CONT SТОРС=37,%ТУРЕ%
;П/У НА ВЫДАЧУ РГ.В БОПП, ЕСЛИ НЕСОВПАДЕНИЕ, ЧИТАЕМ ТЕГ
CJS А=ERRCMP,МАР=РЕ,COND=СТ,SТОРС=37,YDEVT=ECBTAG,BRA=RG1
>,DSRC=SHIFT,MPS,PSHF=SН0,SHF=LOG,ALUS=DZ,Н,ALUD=В,RВ=У
CONT ALUS=АВ,RА=DADR,RВ=У,FUNC=EXOR,ALUD=Q
CONT А=МВ,DSRC=PROM,ALUS=DQ,FUNC=AND,Н,ALUD=Q,CEN
CONT SТОРС=20,%ТУРЕ%
CRTN COND=СТ,SТОРС=20
;+1 К ЧИСЛУ ОШИБОК; П/У НА ВЫДАЧУ ДАННЫХ В БОПП, ВОЗВРАТ
CJP А=ERRDAF,МАР=РЕ,ALUS=ZВ,RВ=EXPN,Н,CI,ALUD=В
;
СМРРСС:ENTRY
;П/П ЧТЕНИЯ ДАННЫХ ПО АДРЕСУ РССОРУ, СРАВНЕНИЯ С DADR И ВЫДАЧИ В БОПП ПРИ ОШ.
CONT ALUS=ZВ,RВ=РССОРУ,ALU,YDST=ADRREG
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DRD
WRDPCC:CJP А=WRDPCC,МАР=РЕ,COND=ARBRDY,IСС
;ЧИТАЕМ ДАННЫЕ, СРАВНИВАЕМ
CONT ЕСА,ARA=RG2,ALUS=DZ,Н,ALUD=В,RВ=А
CONT ALUS=АВ,RА=А,RВ=DADR,FUNC=EXOR,Н,ALUD=Q,СЕМ
CONT SТОРС=37,%ТУРЕ%
;П/У НА ВЫДАЧУ РГ.В БОПП, ЕСЛИ НЕСОВПАДЕНИЕ, ЧИТАЕМ ТЕГ
CJS А=ERRPCC,МАР=РЕ,COND=СТ,SТОРС=37,YDEVT=ECBTAG,BRA=RG2
>,DSRC=SHIFT,MPS,PSHF=SН0,SHF=LOG,ALUS=DZ,Н,ALUD=В,RВ=У
CONT ALUS=АВ,RА=DADR,RВ=У,FUNC=EXOR,ALUD=Q
CONT А=МВ,DSRC=PROM,ALUS=DQ,FUNC=AND,Н,ALUD=Q,CEN
CONT SТОРС=20,%ТУРЕ%
CRTN COND=СТ,SТОРС=20
;+1 К ЧИСЛУ ОШИБОК; П/У НА ВЫДАЧУ ДАННЫХ В БОПП, ВОЗВРАТ
ERRPCC:CJS А=OUTDAT,МАР=РЕ,ALUS=ZВ,RВ=EXPN,Н,CI,ALUD=В
CJS А=OUT3/6,МАР=РЕ,ALUS=ZА,RА=РССОРУ,ALUD=В,RВ=WR6
CJP А=ERRTST,МАР=РЕ
;
;
ОЗУ5:ENTRY
;===== ЗАПИСЬ ДАННЫХ=АДРЕСУ В ПРЯМОМ НАПРАВЛЕНИИ; ЛИНЕЙНЫЙ АЛГОРИТМ ТИПА N
;   ЗАПИСЬ В ПАМЯТЬ (ТЕГ=ДАННЫМ); ЧТЕНИЕ С ЗАДЕРЖКОЙ; СРАВНЕНИЕ
;   РС   - АДРЕС, НАЧИНАЯ С 1; ОН ЖЕ ДАННЫЕ
;   А    - ЧТО ПРОЧИТАЛИ В РАЗРЯДАХ ДАННЫХ, У - ТЕГА; Q - РЕЗ-Т СРАВНЕНИЯ
;   INTR = 1(ДАННЫЕ),2(ТЕГ), ЕСЛИ ПРОВЕРЯЕМ "ФОН"; = 3,4 - ЕСЛИ ОСТАЛЬНОЕ
;   MANT - НОМЕР ЦИКЛА ЧТЕНИЯ (0, ЕСЛИ ПРОВЕРЯЕМ "ФОН"); EXPN - К-ВО ОШИБОК.
;
CJP А=СМЕМ5,МАР=РЕ
СМЕМ5:CONT А=Н5,%Т%
CJS А=INITST,МАР=РЕ
;ПИШЕМ БЛОКИРОВКИ В РР (БП=1 И Т.Д.)
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
CONT А=МВ,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=ВУТЕ
;"ЗАПИСЬ ФОНА": РАСПИСЫВАЕМ ВСЮ ПАМЯТЬ FF...FF
;ЧИТАЕМ ФОНОВУЮ CONST В РГ.DADR, ОБНУЛЯЕМ РС
CONT А=CFFF,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=DADR
CONT А=ZER,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РС
;АДРЕС РС+1 - В РС, АИСП.
CCWFM5:CJS А=OUTADR,МАР=РЕ,ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG
;CONST - В RG3 БОИ ДАННЫХ И ТЕГА
CONT ALUS=ZА,RА=DADR,Н,ALU,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
;ФИЗ.АДРЕС - В RG0
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
;ЖДЕМ ГОТ.АРБИТРА, РС+1 - В РГ.Q (ДЛЯ СРАВНЕНИЯ С МАХ ADR.+ 1)
WWFM5:CJP А=WWFM5,МАР=РЕ,COND=ARBRDY,IСС,ALUS=ZА,RА=РС,Н,CI,ALUD=Q
;СРАВНИВАЕМ АДРЕС
CONT А=В18,DSRC=PROM,ALUS=DQ,FUNC=EXOR,CEN
CONT SТОРС=21
CJP А=CCWFM5,МАР=РЕ,COND=СТ,SТОРС=21
;
;ПРОВЕРЯЕМ "ФОН": ЧИТАЕМ FF...FF, ПИШЕМ ДАННЫЕ=АДРЕСУ; INTR=1,2
;УСТАН.В 0 РГ.РС (АДРЕС), N ЦИКЛА (MANT), ЧИСЛО ОШИБОК (EXPN)
CONT А=ZER,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РС
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=MANT
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=EXPN
;П/У НА П/П ЧТЕНИЯ "ФОНА", СРАВНЕНИЕ
CCWM5:CJS А=DCMPD,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=INTR
;ПИШЕМ ДАННЫЕ=АДРЕСУ - В RG3 БОИ ДАННЫХ И ТЕГА
CJS А=OUTADR,МАР=РЕ,ALUS=ZА,RА=РС,Н,ALU,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
;ФИЗ.АДРЕС - В RG0
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
;ЖДЕМ ГОТ.АРБИТРА, РС+1 - В РГ.Q (ДЛЯ СРАВНЕНИЯ С МАХ ADR.+ 1)
WWAM5:CJP А=WWAM5,МАР=РЕ,COND=ARBRDY,IСС,ALUS=ZА,RА=РС,Н,CI,ALUD=Q
;СРАВНИВАЕМ АДРЕС
CONT А=В18,DSRC=PROM,ALUS=DQ,FUNC=EXOR,CEN
CONT SТОРС=21
CJP А=CCWM5,МАР=РЕ,COND=СТ,SТОРС=21
;ВЫДАЧА В БОПП N ЦИКЛА И ЧИСЛА ОШИБОК
CJS А=OUTEMH,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR5
;ЗАДЕРЖКА, ПОКА РГ.WR5 НЕ БУДЕТ РАВЕН CONST ИЗ ПЗУ
WТМ5:CONT А=В20,DSRC=PROM,ALUS=DА,RА=WR5,FUNC=EXOR,Н,CEN
CONT ALUS=ZВ,RВ=WR5,Н,CI,ALUD=В,SТОРС=21
CJP А=WТМ5,МАР=РЕ,COND=СТ,SТОРС=21
;
;ЧТЕНИЕ ДАННЫХ = АДРЕСУ
;0 - В РГ.РС (АДРЕС), В EXPN (ЧИСЛО ОШИБОК), MANT+1 (N ЦИКЛА), INTR=3,4
CICLM5:CONT А=ZER,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РС
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=EXPN
CONT ALUS=ZВ,RВ=MANT,Н,CI,ALUD=В
CCR5:CONT А=С2,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=INTR
;П/У НА П/П ЧТЕНИЯ И СРАВНЕНИЯ, ПИШЕМ В DADR ЧИСЛО, С КОТ.БУДЕМ СРАВНИВАТЬ
CJS А=DCMPD,МАР=РЕ,ALUS=ZА,RА=РС,Н,CI,ALUD=В,RВ=DADR
;СРАВНИВАЕМ АДРЕС (РС+1)
CJS А=OUTADR,МАР=РЕ,ALUS=ZА,RА=РС,Н,CI,ALUD=Q
CONT А=В18,DSRC=PROM,ALUS=DQ,FUNC=EXOR,СЕМ
CONT SТОРС=37
CJP А=CCR5,МАР=РЕ,COND=СТ,SТОРС=37
;ВЫДАЧА В БОПП N ЦИКЛА И ЧИСЛА ОШИБОК, ЗАДЕРЖКА
CJS А=OUTEMH,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR5
WTRDM5:CONT А=В4,DSRC=PROM,ALUS=DА,RА=WR5,FUNC=EXOR,Н,CEN
CONT ALUS=ZВ,RВ=WR5,Н,CI,ALUD=В,SТОРС=21
CJP А=WTRDM5,МАР=РЕ,COND=СТ,SТОРС=21
CJP А=CICLM5,МАР=РЕ
;
;
ОЗУ6:ENTRY
;===== ЗАПИСЬ ДАННЫХ=АДРЕСУ,СДВИГАЕМОМУ В ПРЕДЕЛАХ 64 РАЗР.; ЛИН.АЛГОРИТМ ТИПА N
;   ЗАПИСЬ В ПАМЯТЬ (ТЕГ=ДАННЫМ); ЧТЕНИЕ С ЗАДЕРЖКОЙ; СРАВНЕНИЕ
;   РС - АДРЕС, НАЧИНАЯ С 1; ОН ЖЕ ДАННЫЕ, СДВИНУТЫЕ НА 0,16,32,48 РАЗР.ВПРАВО
;   А - ЧТО ПРОЧИТАЛИ В РАЗРЯДАХ ДАННЫХ, У - ТЕГА; Q - РЕЗ-Т СРАВНЕНИЯ
;   INTR = 1,2, ЕСЛИ ПРОВЕРЯЕМ "ФОН"; 3,4 - ЕСЛИ ОСТАЛЬНОЕ
;   MANT - НОМЕР ЦИКЛА ЧТЕНИЯ (0, ЕСЛИ ПРОВЕРЯЕМ "ФОН"); EXPN - К-ВО ОШИБОК
;   HALF - ЧИСЛО СДВИГОВ АДРЕСА ДЛЯ ПОЛУЧЕНИЯ ДАННЫХ
;
CJP А=СМЕМ6,МАР=РЕ
СМЕМ6:CONT А=Н6,%Т%
CJS А=INITST,МАР=РЕ
;ПИШЕМ БЛОКИРОВКИ В РР (БП=1 И Т.Д.)
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
CONT А=МВ,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=ВУТЕ
;ЧИТАЕМ ФОНОВУЮ CONST, ОБНУЛЯЕМ ЧИСЛО СДВИГОВ (HALF) И ЧИСЛО ЦИКЛОВ (MANT)
CONT А=CFFF,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=DADR
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=MANT
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=HALF
;"ЗАПИСЬ ФОНА": РАСПИСЫВАЕМ ВСЮ ПАМЯТЬ FF...FF
CICL6:CONT А=ZER,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РС
WFM6:CJS А=OUTADR,МАР=РЕ,ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG
;CONST - В RG3 БОИ ДАННЫХ И ТЕГА
CONT ALUS=ZА,RА=DADR,Н,ALU,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
;ФИЗ.АДРЕС - В RG0
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
;ЖДЕМ ГОТ.АРБИТРА, РС+1 - В РГ.Q (ДЛЯ СРАВНЕНИЯ С МАХ ADR.+ 1)
WWFM6:CJP А=WWFM6,МАР=РЕ,COND=ARBRDY,IСС,ALUS=ZА,RА=РС,Н,CI,ALUD=Q
;СРАВНИВАЕМ АДРЕС
CONT А=В18,DSRC=PROM,ALUS=DQ,FUNC=EXOR,CEN
CONT SТОРС=21
CJP А=WFM6,МАР=РЕ,COND=СТ,SТОРС=21
;
;ПРОВЕРЯЕМ "ФОН": ЧИТАЕМ FF...FF, ПИШЕМ ДАННЫЕ="СДВИНУТОМУ" АДРЕСУ
;УСТАН.В 0 РГ.РС (АДРЕС), ЧИСЛО ОШИБОК (EXPN); +1 К N ЦИКЛА (MANT); INTR=1,2
CONT А=ZER,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РС
CONT ALUS=ZВ,RВ=MANT,Н,CI,ALUD=В
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=EXPN
;ВЫЧИСЛЯЕМ ПАРАМЕТР СДВИГА - В РГ.ПАРАМЕТРА СДВИГА
CONT А=S0,DSRC=PROM,ALUS=DА,RА=HALF,ALU,YDST=PSHIFT
;П/У НА П/П ЧТЕНИЯ "ФОНА", СРАВНЕНИЕ
CCWM6:CJS А=DCMPD,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=INTR
;ПИШЕМ ДАННЫЕ=СДВИНУТОМУ АДРЕСУ - В RG3 БОИ ДАННЫХ И ТЕГА
CONT ALUS=DZ,Н,ALUD=ВА,RА=РС,RВ=WR4,ALU,DSRC=SHIFT,SHF=LOG
CJS А=OUTADR,МАР=РЕ,ALUS=ZА,RА=WR4,Н,ALU,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
;ФИЗ.АДРЕС - В RG0
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
;ЖДЕМ ГОТ.АРБИТРА, РС+1 - В РГ.Q (ДЛЯ СРАВНЕНИЯ С МАХ ADR.+ 1)
WWAM6:CJP А=WWAM6,МАР=РЕ,COND=ARBRDY,IСС,ALUS=ZА,RА=РС,Н,CI,ALUD=Q
;СРАВНИВАЕМ АДРЕС
CONT А=В18,DSRC=PROM,ALUS=DQ,FUNC=EXOR,CEN
CONT SТОРС=21
CJP А=CCWM6,МАР=РЕ,COND=СТ,SТОРС=21
;ВЫДАЧА В БОПП N ЦИКЛА И ЧИСЛА ОШИБОК
CJS А=OUTEMH,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR5
;ЗАДЕРЖКА, ПОКА РГ.WR5 НЕ БУДЕТ РАВЕН CONST ИЗ ПЗУ
WТМ6:CONT А=В20,DSRC=PROM,ALUS=DА,RА=WR5,FUNC=EXOR,Н,CEN
CONT ALUS=ZВ,RВ=WR5,Н,CI,ALUD=В,SТОРС=21
CJP А=WТМ6,МАР=РЕ,COND=СТ,SТОРС=21
;
;ЧТЕНИЕ ДАННЫХ = АДРЕСУ
;0 - В РГ.РС (АДРЕС), В EXPN (ЧИСЛО ОШИБОК), MANT+1 (N ЦИКЛА), INTR=3,4
CONT А=ZER,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РС
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=EXPN
CONT ALUS=ZВ,RВ=MANT,Н,CI,ALUD=В
;П/У НА П/П ЧТЕНИЯ И СРАВНЕНИЯ, ПИШЕМ В DADR ЧИСЛО, С КОТ.БУДЕМ СРАВНИВАТЬ
CCR6:CONT ALUS=ZА,RА=РС,Н,CI,ALUD=В,RВ=DADR
CONT А=С2,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=INTR
CJS А=DCMPD,МАР=РЕ,ALUS=DZ,Н,ALUD=ВА,RА=DADR,RВ=DADR,ALU,DSRC=SHIFT,SHF=LOG
;СРАВНИВАЕМ АДРЕС (РС+1)
CJS А=OUTADR,МАР=РЕ,ALUS=ZА,RА=РС,Н,CI,ALUD=Q
CONT А=В18,DSRC=PROM,ALUS=DQ,FUNC=EXOR,СЕМ
CONT SТОРС=37
CJP А=CCR6,МАР=РЕ,COND=СТ,SТОРС=37
;ВЫДАЧА В БОПП N ЦИКЛА И ЧИСЛА ОШИБОК, ЗАДЕРЖКА
CJS А=OUTEMH,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR5
WRDM6:CONT А=В4,DSRC=PROM,ALUS=DА,RА=WR5,FUNC=EXOR,Н,CEN
CONT ALUS=ZВ,RВ=WR5,Н,CI,ALUD=В,SТОРС=21
CJP А=WRDM6,МАР=РЕ,COND=СТ,SТОРС=21
;УВЕЛИЧИВЕМ ПАРАМЕТР СДВИГА, МАСКА НА 6 РАЗРЯДОВ
CONT А=В5,DSRC=PROM,ALUS=DА,RА=HALF,FUNC=ADD,Н,ALUD=В,RВ=HALF
CONT А=С63,DSRC=PROM,ALUS=DА,RА=HALF,FUNC=AND,Н,ALUD=В,RВ=HALF
CJP А=CICL6,МАР=РЕ
;
;
ОЗУ7:ENTRY
;===== ЗАПИСЬ ДАННЫХ=АДРЕСУ В ПРЯМОМ НАПРАВЛЕНИИ; ВКС; ЛИН.АЛГОРИТМ ТИПА N
;   ТО ЖЕ САМОЕ, ЧТО И ТЕСТ5, НО КОП АРБИТРА = ВКС!
;   (В ЛЮБОМ МЕСТЕ ДЛЯ ПРОВЕРКИ ВЫБОРКИ КОМАНДНОГО СЛОВА ДОСТАТОЧНО ЗАМЕНИТЬ
;   П/П ЧТЕНИЯ И СРАВНЕНИЯ: DCMPD  НА CCMPD !!!)
;   ЗАПИСЬ В ПАМЯТЬ (ТЕГ=ДАННЫМ); ВКС С ЗАДЕРЖКОЙ; СРАВНЕНИЕ
;   РС   - АДРЕС, НАЧИНАЯ С 1; ОН ЖЕ ДАННЫЕ
;   А    - ЧТО ПРОЧИТАЛИ В РАЗРЯДАХ ДАННЫХ, У - ТЕГА; Q - РЕЗ-Т СРАВНЕНИЯ
;   INTR = 1,2, ЕСЛИ ПРОВЕРЯЕМ "ФОН"; 3,4 - ЕСЛИ ОСТАЛЬНОЕ
;   MANT - НОМЕР ЦИКЛА ЧТЕНИЯ (0, ЕСЛИ ПРОВЕРЯЕМ "ФОН"); EXPN - ЧИСЛО ОШИБОК.
;
CJP А=СМЕМ7,МАР=РЕ,YDST=CCLR
СМЕМ7:CONT А=Н7,%Т%
CJS А=INITST,МАР=РЕ
;ПИШЕМ БЛОКИРОВКИ В РР (БП=1 И Т.Д.)
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
CONT А=МВ,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=ВУТЕ
;"ЗАПИСЬ ФОНА": РАСПИСЫВАЕМ ВСЮ ПАМЯТЬ FF...FF
CONT А=CFFF,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=DADR
CONT А=ZER,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РС
;АДРЕС РС+1 - В РС, АИСП.
CCWFM7:CJS А=OUTADR,МАР=РЕ,ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG
;CONST - В RG3 БОИ ДАННЫХ И ТЕГА
CONT ALUS=ZА,RА=DADR,Н,ALU,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
;ФИЗ.АДРЕС - В RG0
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
;ЖДЕМ ГОТ.АРБИТРА, РС+1 - В РГ.Q (ДЛЯ СРАВНЕНИЯ С МАХ ADR.+ 1)
WWFM7:CJP А=WWFM7,МАР=РЕ,COND=ARBRDY,IСС,ALUS=ZА,RА=РС,Н,CI,ALUD=Q
;СРАВНИВАЕМ АДРЕС
CONT А=В18,DSRC=PROM,ALUS=DQ,FUNC=EXOR,CEN
CONT SТОРС=21
CJP А=CCWFM7,МАР=РЕ,COND=СТ,SТОРС=21
;
;ПРОВЕРЯЕМ "ФОН": ЧИТАЕМ FF...FF, ПИШЕМ ДАННЫЕ=АДРЕСУ
;УСТАН.В 0 РГ.РС (АДРЕС), N ЦИКЛА (MANT), ЧИСЛО ОШИБОК (EXPN), INTR=1,2
CONT А=ZER,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РС
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=MANT
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=EXPN
;П/У НА П/П ЧТЕНИЯ "ФОНА", СРАВНЕНИЕ
CCWM7:CJS А=CCMPD,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=INTR
;ПИШЕМ ДАННЫЕ=АДРЕСУ - В RG3 БОИ ДАННЫХ И ТЕГА
CJS А=OUTADR,МАР=РЕ,ALUS=ZА,RА=РС,Н,ALU,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
;ФИЗ.АДРЕС - В RG0
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
;ЖДЕМ ГОТ.АРБИТРА, РС+1 - В РГ.Q (ДЛЯ СРАВНЕНИЯ С МАХ ADR.+ 1)
WWM7:CJP А=WWM7,МАР=РЕ,COND=ARBRDY,IСС,ALUS=ZА,RА=РС,Н,CI,ALUD=Q
;СРАВНИВАЕМ АДРЕС
CONT А=В18,DSRC=PROM,ALUS=DQ,FUNC=EXOR,CEN
CONT SТОРС=21
CJP А=CCWM7,МАР=РЕ,COND=СТ,SТОРС=21
;ВЫДАЧА В БОПП N ЦИКЛА И ЧИСЛА ОШИБОК
CJS А=OUTEMH,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR5
;ЗАДЕРЖКА, ПОКА РГ.WR5 НЕ БУДЕТ РАВЕН CONST ИЗ ПЗУ
WАТЕМ7:CONT А=В20,DSRC=PROM,ALUS=DА,RА=WR5,FUNC=EXOR,Н,CEN
CONT ALUS=ZВ,RВ=WR5,Н,CI,ALUD=В,SТОРС=21
CJP А=WАТЕМ7,МАР=РЕ,COND=СТ,SТОРС=21
;
;ЧТЕНИЕ КОМАНДНОГО СЛОВА = АДРЕСУ
;0 - В РГ.РС (АДРЕС), В EXPN (ЧИСЛО ОШИБОК), MANT+1 (N ЦИКЛА), INTR=3,4
CICLM7:CONT А=ZER,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РС
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=EXPN
CONT ALUS=ZВ,RВ=MANT,Н,CI,ALUD=В
CCRM7:CONT А=С2,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=INTR
;П/У НА П/П ЧТЕНИЯ И СРАВНЕНИЯ, ПИШЕМ В DADR ЧИСЛО, С КОТ.БУДЕМ СРАВНИВАТЬ
CJS А=CCMPD,МАР=РЕ,ALUS=ZА,RА=РС,Н,CI,ALUD=В,RВ=DADR
;СРАВНИВАЕМ АДРЕС (РС+1)
CJS А=OUTADR,МАР=РЕ,ALUS=ZА,RА=РС,Н,CI,ALUD=Q
CONT А=В18,DSRC=PROM,ALUS=DQ,FUNC=EXOR,СЕМ
CONT SТОРС=37
CJP А=CCRM7,МАР=РЕ,COND=СТ,SТОРС=37
;ВЫДАЧА В БОПП N ЦИКЛА И ЧИСЛА ОШИБОК, ЗАДЕРЖКА
CJS А=OUTEMH,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR5
WTRDM7:CONT А=В4,DSRC=PROM,ALUS=DА,RА=WR5,FUNC=EXOR,Н,CEN
CONT ALUS=ZВ,RВ=WR5,Н,CI,ALUD=В,SТОРС=21
CJP А=WTRDM7,МАР=РЕ,COND=СТ,SТОРС=21
CJP А=CICLM7,МАР=РЕ
;
;
ОЗУ8:ENTRY
;===== ЗАПИСЬ "БУГУЩЕГО 0" В ПАМЯТЬ В ОБРАТНОМ НАПР.; ЛИНЕЙНЫЙ АЛГОРИТМ ТИПА N
;   ЗАПИСЬ В ПАМЯТЬ (ТЕГ=ДАННЫМ); ЧТЕНИЕ С ЗАДЕРЖКОЙ; СРАВНЕНИЕ
;   РС   - АДРЕС, ОТ МАХ ДО 1, Т.Е. В ОБРАТНОМ НАПРАВЛЕНИИ!
;   DADR - СНАЧАЛА ФОНОВАЯ CONST, ЗАТЕМ ЧИСЛО С "БЕГУЩИМ 0" (=WR4 ПРИ ЗАПИСИ)
;   А    - ЧТО ПРОЧИТАЛИ В РАЗРЯДАХ ДАННЫХ, У - ТЕГА; Q - РЕЗ-Т СРАВНЕНИЯ
;   INTR = 1,2, ЕСЛИ ПРОВЕРЯЕМ "ФОН"; 3,4 - ЕСЛИ ОСТАЛЬНОЕ
;   MANT - НОМЕР ЦИКЛА ЧТЕНИЯ (0, ЕСЛИ ПРОВЕРЯЕМ "ФОН"); EXPN - ЧИСЛО ОШИБОК.
;
CJP А=СМЕМ8,МАР=РЕ
СМЕМ8:CONT А=Н8,%Т%
CONT А=INITST,МАР=РЕ
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
CONT А=МВ,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=ВУТЕ
;"ЗАПИСЬ ФОНА": РАСПИСЫВАЕМ ВСЮ ПАМЯТЬ FF...FF
;ЧИТАЕМ ФОНОВУЮ CONST В РГ.DADR, ПИШЕМ МАХ АДРЕС В РС
CONT А=CFFF,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=DADR
CONT А=В18,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РС
;АДРЕС РС-1 - В РС, АИСП.
CCWFM8:CJS А=OUTADR,МАР=РЕ,ALUS=ZВ,RВ=РС,FUNC=SUBR,Н,ALUD=В,ALU,YDST=ADRREG
;CONST - В RG3 БОИ ДАННЫХ И ТЕГА
CONT ALUS=ZА,RА=DADR,Н,ALU,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
;ФИЗ.АДРЕС - В RG0
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
;ЖДЕМ ГОТ.АРБИТРА
WWFM8:CJP А=WWFM8,МАР=РЕ,COND=ARBRDY,IСС
;ПРОВЕРЯЕМ АДРЕС: П/У НА ЦИКЛ, ЕСЛИ РС НЕ 1
CONT А=С1,DSRC=PROM,ALUS=DА,RА=РС,FUNC=EXOR,Н,СЕМ
CONT SТОРС=37
CJP А=CCWFM8,МАР=РЕ,COND=СТ,SТОРС=37
;
;ПРОВЕРЯЕМ "ФОН",  ПИШЕМ "БЕГУЩИЙ 0"
;РС = МАХ АДРЕСУ, N ЦИКЛА (MANT), ЧИСЛО ОШИБОК (EXPN), INTR=1,2
CONT А=В18,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РС
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=MANT
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=EXPN
;ПИШЕМ В WR4 FFF...FFE, КОТОРУЮ БУДЕМ СДВИГАТЬ
CONT А=С1,DSRC=PROM,ALUS=DZ,FUNC=EXNOR,Н,ALUD=В,RВ=WR4
CCWM8:CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=INTR
;РС-1 - В РС; П/У НА П/П ЧТЕНИЯ "ФОНА", СРАВНЕНИЕ
CJS А=DCMPD+1,МАР=РЕ,ALUS=ZВ,RВ=РС,FUNC=SUBR,Н,ALUD=В,ALU,YDST=ADRREG
;ПИШЕМ "БЕГУЩИЙ 0" - В RG3 БОИ ДАННЫХ И ТЕГА, СДВИГАЕМ ЦИЛИЧЕСКИ ВЛЕВО
CONT ALUS=ZА,RА=WR4,Н,ALUD=LSB,RВ=WR4,SHMUX=RSLRSL,ALU,YDEVT=ECBTAG,ЕСВ
>,WRB,BRA=RG3
;АДРЕС - ТОТ ЖЕ
CJS А=OUTADR,МАР=РЕ,YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
WWME8:CJP А=WWME8,МАР=РЕ,COND=ARBRDY,IСС
;ПРОВЕРЯЕМ АДРЕС
CONT А=С1,DSRC=PROM,ALUS=DА,RА=РС,FUNC=EXOR,Н,СЕМ
CONT SТОРС=37
CJP А=CCWM8,МАР=РЕ,COND=СТ,SТОРС=37
;ВЫДАЧА В БОПП N ЦИКЛА И ЧИСЛА ОШИБОК
CCLME8:CJS А=OUTEMH,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR5
;ЗАДЕРЖКА, ПОКА РГ.WR5 НЕ БУДЕТ РАВЕН CONST ИЗ ПЗУ
WАТЕМ8:CONT А=В20,DSRC=PROM,ALUS=DА,RА=WR5,FUNC=EXOR,Н,CEN
CONT ALUS=ZВ,RВ=WR5,Н,CI,ALUD=В,SТОРС=21
CJP А=WАТЕМ8,МАР=РЕ,COND=СТ,SТОРС=21
;
;ЦИКЛ НА ЧТЕНИЕ
;РС = МАХ АДРЕСУ; 0 - В EXPN (ЧИСЛО ОШИБОК), MANT+1 (N ЦИКЛА); INTR=3,4
CONT А=В18,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РС
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=EXPN
CONT ALUS=ZВ,RВ=MANT,Н,CI,ALUD=В
CONT А=С1,DSRC=PROM,ALUS=DZ,FUNC=EXNOR,Н,ALUD=В,RВ=WR4
CCRM8:CONT А=С2,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=INTR
;П/У НА П/П ЧТЕНИЯ И СРАВНЕНИЯ, ПИШЕМ В DADR ЧИСЛО, С КОТ.БУДЕМ СРАВНИВАТЬ
CJS А=OUTADR,МАР=РЕ,ALUS=ZВ,RВ=РС,FUNC=SUBR,Н,ALUD=В,ALU,YDST=ADRREG
CJS А=DCMPD+1,МАР=РЕ,ALUS=ZА,RА=WR4,Н,ALUD=В,RВ=DADR
CONT А=С1,DSRC=PROM,ALUS=DА,RА=РС,FUNC=EXOR,Н,СЕМ
CONT SТОРС=37,ALUS=ZВ,RВ=WR4,Н,ALUD=LSB,SHMUX=RSLRSL
CJP А=CCRM8,МАР=РЕ,COND=СТ,SТОРС=37
CJP А=CCLME8,МАР=РЕ
;
;
ОЗУ9:ENTRY
;===== "КРЕСТ" - ЛИНЕЙНЫЙ АЛГОРИТМ ТИПА N (РИС.3.11)
; - ЗАПИСЬ CONST ПО ВСЕМ АДРЕСАМ;
; - ВЫБОР КОНТРОЛЬНОГО АДРЕСА А(S,R); S=0,...255, R=0,...255;
; - ЧТЕНИЕ ПАМЯТИ ПО КОНТРОЛЬНОМУ АДРЕСУ А(S,R);
; - ЗАПИСЬ /CONST ПО АДРЕСУ А(I,J) - СОСЕДНЕМУ С КОНТРОЛЬНЫМ ПО СТРОКЕ И СТОЛБЦУ
; - ЧТЕНИЕ ПО КОНТРОЛЬНОМУ АДРЕСУ А(S,R) CONST;
; - ЧТЕНИЕ ПО СОСЕДНЕМУ С КОНТРОЛЬНЫМ АДРЕСУ А(I,J) /CONST;
; - ВОССТАНОВЛЕНИЕ CONST ПО СОСЕДНЕМУ С КОНТРОЛЬНЫМ АДРКСУ А(I,J);
; - ИНВЕРТИРОВАНИЕ CONST И ПОВТОРЕНИЕ.
;   МИКРОСХЕМА ПАМЯТИ РУ5 65536*1 РАЗРЯД = МАТРИЦА 256*256;
;   ЕМКОСТЬ ПЛАТЫ ОЗУ 2**17 СЛОВ = 8 + 8 + 1 РАЗРЯДОВ АДРЕСА;
;   ДЛИНА СЛОВА 72 РАЗРЯДА (64 ИНФОРМАЦИОННЫХ + 8 ТЕГ);
;   ПРИ ЧТЕНИИ/ЗАПИСИ ОРБАЩАЕМСЯ ОДНОВРЕМЕННО К 72 МИКРОСХЕМАМ ПАМЯТИ;
;
;           0   J,R - СТОЛБЦЫ   М(255)
;           -------------------------
;        0  I-I-I-I-I-I-I-I-I-I-I-I-I  0     А(S,R) - КОНТРОЛЬНЫЕ АДРЕСА
;        .  I-I                   I-I  .              МАТРИЦЫ ПАМЯТИ
;    I,S -  I-I                   I-I  .     А(I,J) - "СОСЕДНИЙ" С КОНТРОЛЬНЫМ
;   СТРОКИ  I-I                   I-I  .              АДРЕС
;        .  I-I                   I-I  .     А(L,М) - КОНЕЧНЫЙ АДРЕС
;    L(255) I-I-I-I-I-I-I-I-I-I-I-I-I L(255)
;           -------------------------
;           0  . . . . . . . .  М(255)
;
;  S = WR1 - СТРОКА      DADR = Т - CONST                  А - ДАННЫЕ
;  R = WR2 - СТОЛБЕЦ     MANT - НОМЕР ЦИКЛА                У - ТЕГ
;  I = WR3 - СТРОКА      EXRN - КОЛИЧЕСТВО ОШИБОК В ЦИКЛЕ  Q - РЕЗ-Т СРАВНЕНИЯ
;  J = WR4 - СТОЛБЕЦ     ВУТЕ - МАСКА НА БАЙТ
;  HALF    = 0, ЕСЛИ ОБРАЩЕНИЕ К 1-Й ПОЛОВИНЕ ПАМЯТИ;
;          = 1 В 17 РАЗРЯДЕ, ЕСЛИ КО 2-Й.
;  РС      - ПОЛНЫЙ АДРЕС = HALF + R<<8 + S
;  РССОРУ  - ПОЛНЫЙ СОСЕДНИЙ ПО "КРЕСТУ" АДРЕС = HALF + J<<8 + I
;  INTR    = 1,2: 1-ОЕ ЧТЕНИЕ ПО КОНТРОЛЬНОМУ АДРЕСУ ПОСЛЕ ЗАПИСИ ФОНА;
;            3,4: 2-ОЕ ЧТЕНИЕ ПО КОНТР.АДРЕСУ ПОСЛЕ ЗАПИСИ /CONST ПО СОСЕДНЕМУ;
;            5,6: ЧТЕНИЕ ПО СОСЕДНЕМУ С КОНТРОЛЬНЫМ АДРЕСУ (/CONST).
;
CJP А=CONTM9,МАР=РЕ
CONTM9:CONT А=Н9,%Т%
CJS А=INITST,МАР=РЕ
;ПИШЕМ БЛОКИРОВКИ В РР (БП=1 И Т.Д.)
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
CONT А=МВ,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=ВУТЕ
;ОБНУЛЯЕМ НОМЕР ЦИКЛА
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=MANT
;ЧИТАЕМ CONST (Т НА РИС.) ДЛЯ ЗАПИСИ И КОНТРОЛЯ
CONT А=ZER,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=DADR
;0 - В HALF (.EOR.С 1 В 17 РАЗРЯДЕ = ОБРАЩЕНИЕ К 1-Й ИЛИ 2-Й ПОЛОВИНЕ ПАМЯТИ)
CONT А=ZER,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=HALF
;
;"ЗАПИСЬ ФОНА": РАСПИСЫВАЕМ ВСЮ ПАМЯТЬ, АДРЕС - ПРОСТОЙ
WRMEM:CONT А=ZER,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РС
CCWF:CJS А=OUTADR,МАР=РЕ,ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG
CONT ALUS=ZА,RА=DADR,Н,ALU,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
;ЖДЕМ ГОТ.АРБИТРА, РС+1 - В РГ.Q (ДЛЯ СРАВНЕНИЯ С МАХ ADR.+ 1)
WWF:CJP А=WWF,МАР=РЕ,COND=ARBRDY,IСС,ALUS=ZА,RА=РС,Н,CI,ALUD=Q
;СРАВНИВАЕМ АДРЕС
CONT А=В18,DSRC=PROM,ALUS=DQ,FUNC=EXOR,CEN
CONT SТОРС=21
CJP А=CCWF,МАР=РЕ,COND=СТ,SТОРС=21
;ЗАДЕРЖКА ПОСЛЕ ЗАПИСИ
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR5
CWAITW:CONT А=В20,DSRC=PROM,ALUS=DА,RА=WR5,FUNC=EXOR,Н,CEN
CONT ALUS=ZВ,RВ=WR5,Н,CI,ALUD=В,SТОРС=21
CJP А=CWAITW,МАР=РЕ,COND=СТ,SТОРС=21
;
;УСТАНАВЛИВАЕМ НАЧАЛЬНЫЕ ЗНАЧЕНИЯ: ОБНУЛЯЕМ К-ВО ОШИБОК В ЦИКЛЕ
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=EXPN
;S (WR1) = 1, Т.К.ПО 0 АДРЕСУ НЕ ОБРАЩАЕМСЯ; R (WR2) = 0
CONT А=С1,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=WR1
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR2
;
;БОЛЬШОЙ ЦИКЛ! КОПИРУЕМ S,R В I,J
BCICLE:CONT ALUS=ZА,RА=WR1,Н,ALUD=В,RВ=WR3
CONT ALUS=ZА,RА=WR2,Н,ALUD=В,RВ=WR4
;
;ВЫЯСНЯЕМ, ГДЕ НАШ КОНТРОЛЬНЫЙ АДРЕС
;ПРОВЕРКА НА ЛЕВЫЙ ВЕРХНИЙ УГОЛ: S = R = 0?
;ЕСЛИ 1-Я ПОЛОВИНА ПАМЯТИ,ЛЕВЫХ ВЕРХНИХ УГЛА 2! (Т.К.ПО 0-ОМУ АДР.НЕ ОБРАЩАЕМСЯ)
;Т.Е.ЕСЛИ HALF=0, ДЕЛАЕМ ПРОВЕРКИ: S = 1, R = 0? ИЛИ S = 0, R = 1?
CONT ALUS=ZА,RА=HALF,Н,CEN
CONT SТОРС=20
CJP А=МНА1,МАР=РЕ,COND=СТ,SТОРС=20
;2-Я ПОЛОВИНА ПАМЯТИ, S = 0, R = 0?
CJP А=PSLU,МАР=РЕ,ALUS=ZА,RА=WR1,Н,CEN
;1-Я ПОЛОВИНА, S = 0, R = 1?
МНА1:CONT ALUS=ZА,RА=WR1,Н,CEN
CONT А=С1,DSRC=PROM,ALUS=DА,RА=WR2,FUNC=EXOR,Н,СЕМ,SТОРС=20
CJP А=NХТ11,МАР=РЕ,COND=СТ,SТОРС=20
;1-Я ПОЛОВИНА, S = 1, R = 0?
CONT А=С1,DSRC=PROM,ALUS=DА,RА=WR1,FUNC=EXOR,Н,CEN
PSLU:CONT SТОРС=21,ALUS=ZА,RА=WR2,Н,СЕМ
CJP А=NХТ1,МАР=РЕ,COND=СТ,SТОРС=21
NХТ11:CONT SТОРС=36
CJP А=LHU,МАР=РЕ,COND=СТ,SТОРС=36
;ЛЕВЫЙ НИЖНИЙ УГОЛ: S = FF, R = 0?
NХТ1:CONT А=МВ,DSRC=PROM,ALUS=DА,RА=WR1,FUNC=EXOR,Н,CEN
CONT SТОРС=21,ALUS=ZА,RА=WR2,Н,СЕМ
CJP А=NХТ2,МАР=РЕ,COND=СТ,SТОРС=21
CONT SТОРС=36
CJP А=LDU,МАР=РЕ,COND=СТ,SТОРС=36
;ПРАВЫЙ ВЕРХНИЙ УГОЛ: S = 0, R = FF?
NХТ2:CONT ALUS=ZА,RА=WR1,Н,CEN
CONT А=МВ,DSRC=PROM,ALUS=DА,RА=WR2,FUNC=EXOR,Н,СЕМ,SТОРС=21
CJP А=NХТ3,МАР=РЕ,COND=СТ,SТОРС=21
CONT SТОРС=36
CJP А=RHU,МАР=РЕ,COND=СТ,SТОРС=36
;ПРАВЫЙ НИЖНИЙ УГОЛ: S = R = FF?
NХТ3:CONT А=МВ,DSRC=PROM,ALUS=DА,RА=WR1,FUNC=EXOR,Н,CEN
CONT А=МВ,DSRC=PROM,ALUS=DА,RА=WR2,FUNC=EXOR,Н,СЕМ,SТОРС=21
CJP А=NХТ4,МАР=РЕ,COND=СТ,SТОРС=21
CONT SТОРС=36
CJP А=RDU,МАР=РЕ,COND=СТ,SТОРС=36
;ЛЕВЫЙ СТОЛБЕЦ: R = 0?
NХТ4:CONT ALUS=ZА,RА=WR2,Н,CEN
CONT SТОРС=20
CJP А=LS,МАР=РЕ,COND=СТ,SТОРС=20
;ВЕРХНЯЯ СТРОКА: S = 0?
CONT ALUS=ZА,RА=WR1,Н,CEN
CONT SТОРС=20
CJP А=HS,МАР=РЕ,COND=СТ,SТОРС=20
;ПРАВЫЙ СТОЛБЕЦ: R = FF?
CONT А=МВ,DSRC=PROM,ALUS=DА,RА=WR2,FUNC=EXOR,Н,CEN
CONT SТОРС=20
CJP А=RS,МАР=РЕ,COND=СТ,SТОРС=20
;НИЖНЯЯ СТРОКА: S = FF?
CONT А=МВ,DSRC=PROM,ALUS=DА,RА=WR1,FUNC=EXOR,Н,CEN
CONT SТОРС=20
CJP А=DS,МАР=РЕ,COND=СТ,SТОРС=20
;
;ВЫЧИСЛЯЕМ АДРЕСА "ПО КРЕСТУ" ОТ КОНТРОЛЬНОГО, ИДЕМ НА П/П ОБРАБОТКИ
;КОНТРОЛЬНЫЙ АДРЕС - В СРЕДИНЕ МАТРИЦЫ
;ПРОВЕРЯЕМ АДРЕС СВЕРХУ ОТ КОНТРОЛЬНОГО: I = S - 1
CJS А=SUBPRK,МАР=РЕ,ALUS=ZА,RА=WR1,FUNC=SUBR,Н,ALUD=В,RВ=WR3
;СНИЗУ: I = S + 1
CJS А=SUBPRK,МАР=РЕ,ALUS=ZА,RА=WR1,FUNC=ADD,Н,CI,ALUD=В,RВ=WR3
;СЛЕВА: I = S, J = R - 1
CONT ALUS=ZА,RА=WR1,Н,ALUD=В,RВ=WR3
CJS А=SUBPRK,МАР=РЕ,ALUS=ZА,RА=WR2,FUNC=SUBR,Н,ALUD=В,RВ=WR4
;СПРАВА: J = R + 1
CJS А=SUBPRK,МАР=РЕ,ALUS=ZА,RА=WR2,FUNC=ADD,Н,CI,ALUD=В,RВ=WR4
CJP А=ANAEND,МАР=РЕ
;
;ПРАВЫЙ ВЕРХНИЙ УГОЛ, ВЫЧИСЛЯЕМ АДРЕС СЛЕВА: J = R - 1
RHU:CJP А=PSLHU,МАР=РЕ,ALUS=ZА,RА=WR2,FUNC=SUBR,Н,ALUD=В,RВ=WR4
;ЛЕВЫЙ ВЕРХНИЙ УГОЛ, АДРЕС СПРАВА: J = R + 1
LHU:CONT ALUS=ZА,RА=WR2,FUNC=ADD,Н,CI,ALUD=В,RВ=WR4
PSLHU:CJS А=SUBPRK,МАР=РЕ
;ВНИЗУ: I = S + 1, J = R
CONT ALUS=ZА,RА=WR1,FUNC=ADD,Н,CI,ALUD=В,RВ=WR3
CJS А=SUBPRK,МАР=РЕ,ALUS=ZА,RА=WR2,Н,ALUD=В,RВ=WR4
CJP А=ANAEND,МАР=РЕ
;
;ПРАВЫЙ НИЖНИЙ УГОЛ, АДРЕС СЛЕВА: J = R - 1
RDU:CJP А=PSLDU,МАР=РЕ,ALUS=ZА,RА=WR2,FUNC=SUBR,Н,ALUD=В,RВ=WR4
;ЛЕВЫЙ НИЖНИЙ УГОЛ, АДРЕС СПРАВА: J = R + 1
LDU:CONT ALUS=ZА,RА=WR2,FUNC=ADD,Н,CI,ALUD=В,RВ=WR4
PSLDU:CJS А=SUBPRK,МАР=РЕ
;ВВЕРХУ: I = S - 1, J = R
CONT ALUS=ZА,RА=WR1,FUNC=SUBR,Н,ALUD=В,RВ=WR3
CJS А=SUBPRK,МАР=РЕ,ALUS=ZА,RА=WR2,Н,ALUD=В,RВ=WR4
CJP А=ANAEND,МАР=РЕ
;
;ПРАВЫЙ СТОЛБЕЦ, АДРЕС СЛЕВА: J = R - 1
RS:CJP А=PSLS,МАР=РЕ,ALUS=ZА,RА=WR2,FUNC=SUBR,Н,ALUD=В,RВ=WR4
;ЛЕВЫЙ СТОЛБЕЦ, АДРЕС СПРАВА: J = R + 1
LS:CONT ALUS=ZА,RА=WR2,FUNC=ADD,Н,CI,ALUD=В,RВ=WR4
PSLS:CJS А=SUBPRK,МАР=РЕ
;ВВЕРХУ: I = S - 1, J = R
CONT ALUS=ZА,RА=WR1,FUNC=SUBR,Н,ALUD=В,RВ=WR3
CJS А=SUBPRK,МАР=РЕ,ALUS=ZА,RА=WR2,Н,ALUD=В,RВ=WR4
;ВНИЗУ: I = S + 1
CJS А=SUBPRK,МАР=РЕ,ALUS=ZА,RА=WR1,Н,CI,ALUD=В,RВ=WR3
CJP А=ANAEND,МАР=РЕ
;
;НИЖНЯЯ СТРОКА, АДРЕС СВЕРХУ: I = S - 1
DS:CJP А=PSHS,МАР=РЕ,ALUS=ZА,RА=WR1,FUNC=SUBR,Н,ALUD=В,RВ=WR3
;ВЕРХНЯЯ СТРОКА, АДРЕС СНИЗУ: I = S + 1
HS:CONT ALUS=ZА,RА=WR1,Н,CI,ALUD=В,RВ=WR3
PSHS:CJS А=SUBPRK,МАР=РЕ
;СЛЕВА: I = S, J = R - 1
CONT ALUS=ZА,RА=WR1,Н,ALUD=В,RВ=WR3
CJS А=SUBPRK,МАР=РЕ,ALUS=ZА,RА=WR2,FUNC=SUBR,Н,ALUD=В,RВ=WR4
;СПРАВА: J = R + 1
CJS А=SUBPRK,МАР=РЕ,ALUS=ZА,RА=WR2,Н,CI,ALUD=В,RВ=WR4
;
;ПРОВЕРКА НА КОНЕЦ СТРОКИ И СТОЛБЦА: S = 255?
ANAEND:CONT А=МВ,DSRC=PROM,ALUS=DА,RА=WR1,FUNC=EXOR,Н,CEN
;S = S + 1
CONT ALUS=ZВ,RВ=WR1,Н,CI,ALUD=В,SТОРС=21
CJP А=BCICLE,МАР=РЕ,COND=СТ,SТОРС=21
;ДОБАВЛЯЕМ 1 К НОМЕРУ СТОЛБЦА, ЕСЛИ R НЕ РАВЕН 255, S = 0
CONT А=МВ,DSRC=PROM,ALUS=DА,RА=WR2,FUNC=EXOR,Н,CEN
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR1,SТОРС=21
CJP А=BCICLE,МАР=РЕ,COND=СТ,SТОРС=21,ALUS=ZА,RА=WR2,Н,CI,ALUD=В,RВ=WR2
;ПРОВЕРИЛИ ЛИ ВТОРУЮ ПОЛОВИНУ ПАМЯТИ?
CONT А=В17,DSRC=PROM,ALUS=DА,RА=HALF,FUNC=EXOR,Н,ALUD=В,RВ=HALF,CEN
;S (WR1) = R (WR2) = 0
CONT SТОРС=21,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR1
CJP А=BCICLE,МАР=РЕ,COND=СТ,SТОРС=21,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR2
;
;ВСЕ. ПИШЕМ В БОПП N ЦИКЛА И ЧИСЛО ОШИБОК; ЗАДЕРЖКА
CJS А=OUTEMH,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR5
CWAIT:CONT А=В4,DSRC=PROM,ALUS=DА,RА=WR5,FUNC=EXOR,Н,CEN
CONT ALUS=ZВ,RВ=WR5,Н,CI,ALUD=В,SТОРС=21
CJP А=CWAIT,МАР=РЕ,COND=СТ,SТОРС=21
;+1 К НОМЕРУ ЦИКЛА
CONT ALUS=ZВ,RВ=MANT,Н,CI,ALUD=В
;ИНВЕРТИРУЕМ CONST, ПОВТОРЯЕМ
CJP А=WRMEM,МАР=РЕ,ALUS=ZВ,RВ=DADR,FUNC=EXNOR,Н,ALUD=В
;
;П/П ЧТЕНИЯ ИЗ ПАМЯТИ, СРАВНЕНИЯ С DADR, ПОДСЧЕТА ОШИБОК И ВЫДАЧИ ИХ В БОПП
;ВЫЧИСЛЯЕМ КОНТРОЛЬНЫЙ АДРЕС А(S,R) - В РС:
SUBPRK:CONT ALUS=АВ,RА=HALF,RВ=WR1,Н,ALUD=Q,YDST=CCLR
CONT ALUS=DQ,FUNC=OR,Н,ALUD=ВА,RА=WR2,RВ=РС,ALU,DSRC=SHIFT,MPS,PSHF=SН0-8
>,SHF=LOG
;ЧИТАЕМ CONST ИЗ ПАМЯТИ ПО КОНТРОЛЬНОМУ АДРЕСУ (РС)
CONT ALUS=ZА,RА=РС,Н,ALU,YDST=ADRREG
CJS А=OUTADR,МАР=РЕ,YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DRD
WAS:CJP А=WAS,МАР=РЕ,COND=ARBRDY,IСС,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=INTR
CONT %ТУРЕ%
CONT ЕСА,ARA=RG2,ALUS=DZ,Н,ALUD=В,RВ=А
CONT ALUS=АВ,RА=А,RВ=DADR,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=21,YDEVT=ECBTAG,BRA=RG2,DSRC=SHIFT,MPS,PSHF=SН0,SHF=LOG
>,ALUS=DА,RА=ВУТЕ,FUNC=AND,Н,ALUD=В,RВ=У
CJS А=ERRS1,МАР=РЕ,COND=СТ,SТОРС=21,ALUS=АВ,RА=DADR,RВ=У,FUNC=EXOR,Н,ALUD=Q
CONT ALUS=AQ,RА=ВУТЕ,FUNC=AND,Н,ALUD=Q,CEN
CONT SТОРС=20,%ТУРЕ%
CJP А=SNXT2,МАР=РЕ,COND=СТ,SТОРС=20
;ОШИБКА: +1 К ЧИСЛУ ОШИБОК, П/У НА ВЫДАЧУ А,У В БОПП
ERRS1:CJS А=ERRDAF,МАР=РЕ,ALUS=ZВ,RВ=EXPN,Н,CI,ALUD=В
;
;ПИШЕМ /CONST ПО СОСЕДНЕМУ С КОНТРОЛЬНЫМ АДРЕСУ (РССОРУ):
SNXT2:CONT ALUS=АВ,RА=HALF,RВ=WR3,FUNC=OR,Н,ALUD=Q,YDST=CCLR
CONT ALUS=DQ,FUNC=OR,Н,ALUD=ВА,RА=WR4,RВ=РССОРУ,ALU,DSRC=SHIFT,MPS,PSHF=SН0-8
>,SHF=LOG
CONT ALUS=ZА,RА=РССОРУ,Н,ALU,YDST=ADRREG
CONT ALUS=ZА,RА=DADR,FUNC=EXNOR,Н,ALU,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
WASBON:CJP А=WASBON,МАР=РЕ,COND=ARBRDY,IСС
;
;ЕЩЕ РАЗ ЧИТАЕМ CONST ПО КОНТРОЛЬНОМУ АДРЕСУ (РС):
CONT ALUS=ZА,RА=РС,Н,ALU,YDST=ADRREG
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DRD
WASWAS:CJP А=WASWAS,МАР=РЕ,COND=ARBRDY,IСС
CONT %ТУРЕ%
CONT ЕСА,ARA=RG2,ALUS=DZ,Н,ALUD=В,RВ=А
CONT ALUS=АВ,RА=А,RВ=DADR,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=21,YDEVT=ECBTAG,BRA=RG2,DSRC=SHIFT,MPS,PSHF=SН0,SHF=LOG
>,ALUS=DА,RА=ВУТЕ,FUNC=AND,Н,ALUD=В,RВ=У
CJS А=ERRS2,МАР=РЕ,COND=СТ,SТОРС=21,ALUS=АВ,RА=DADR,RВ=У,FUNC=EXOR,Н,ALUD=Q
CONT ALUS=AQ,RА=ВУТЕ,FUNC=AND,Н,ALUD=Q,CEN
CONT SТОРС=20,%ТУРЕ%
CJP А=SNXT4,МАР=РЕ,COND=СТ,SТОРС=20
;ОШИБКА: +1 К ЧИСЛУ ОШИБОК, П/У НА ВЫДАЧУ А,У В БОПП
ERRS2:CJS А=ERRDAF,МАР=РЕ,ALUS=ZВ,RВ=EXPN,Н,CI,ALUD=В
;
;ЧИТАЕМ /CONST ПО СОСЕДНЕМУ С КОНТРОЛЬНЫМ АДРЕСУ (РССОРУ):
SNXT4:CONT ALUS=ZВ,RВ=РССОРУ,Н,ALU,YDST=ADRREG
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DRD,ALUS=ZВ,RВ=DADR,FUNC=EXNOR,Н,ALUD=В
WASWAK:CJP А=WASWAK,МАР=РЕ,COND=ARBRDY,IСС
CONT %ТУРЕ%
CONT ЕСА,ARA=RG2,ALUS=DZ,Н,ALUD=В,RВ=А
CONT ALUS=АВ,RА=А,RВ=DADR,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=21,YDEVT=ECBTAG,BRA=RG2,DSRC=SHIFT,MPS,PSHF=SН0,SHF=LOG
>,ALUS=DА,RА=ВУТЕ,FUNC=AND,Н,ALUD=В,RВ=У
CJS А=ERRS3,МАР=РЕ,COND=СТ,SТОРС=21,ALUS=АВ,RА=DADR,RВ=У,FUNC=EXOR,Н,ALUD=Q
CONT ALUS=AQ,RА=ВУТЕ,FUNC=AND,Н,ALUD=Q,CEN
CONT SТОРС=20,%ТУРЕ%
CJP А=SNXT5,МАР=РЕ,COND=СТ,SТОРС=20
;ОШИБКА: +1 К ЧИСЛУ ОШИБОК, П/У НА ВЫДАЧУ А,У В БОПП
ERRS3:CJS А=OUTDAT,МАР=РЕ,ALUS=ZВ,RВ=EXPN,Н,CI,ALUD=В
CJS А=OUT3/6,МАР=РЕ,ALUS=ZА,RА=РССОРУ,Н,ALUD=В,RВ=WR6
CJS А=ERRTST,МАР=РЕ
;
;ВОССТАНАВЛИВАЕМ CONST В DADR И ПО СОСЕДНЕМУ С КОНТРОЛЬНЫМ АДРЕСУ:
SNXT5:CONT ALUS=ZВ,RВ=DADR,FUNC=EXNOR,Н,ALUD=В
CONT ALUS=ZА,RА=РССОРУ,Н,ALU,YDST=ADRREG
CONT ALUS=ZА,RА=DADR,Н,ALU,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
WASB:CJP А=WASB,МАР=РЕ,COND=ARBRDY,IСС
CRTN
;
;
ОЗУА:ENTRY
;===== "ГАЛОП" - АЛГОРИТМ ТИПА N**2 (РИС.3.15)
;   ЗАПИСЫВАЕМ CONST ПО ВСЕМ АДРЕСАМ ПАМЯТИ;
;   ПО КОНТРОЛЬНОМУ АДРЕСУ (К) ЗАПИСЫВАЕМ /CONST;
;   СЧИТЫВАЕМ ПО АДРЕСАМ А(I), А(К), А(I); I=0,...N-1, КРОМЕ I=К; КОНТРОЛЬ;
;   ВОССТАНАВЛИВАЕМ CONST ПО АДРЕСУ А(К);
;   ПЕРЕХОДИМ К СЛЕДУЮЩЕМУ КОНТРОЛЬНОМУ: К = К + 1; И Т.Д.; К = 0,...N-1
;   РС   = К - КОНТРОЛЬНЫЙ АДРЕС; РССОРУ = I - ПЕРЕМЕННЫЙ АДРЕС; DADR - CONST
;   HALF = 0 ИЛИ 1 В 17 РАЗРЯДЕ: ОБРАЩЕНИЕ К 1-Й ИЛИ 2-Й ПОЛОВИНЕ ПАМЯТИ
;   А    - ЧТО ПРОЧИТАЛИ В РАЗРЯДАХ ДАННЫХ, У - ТЕГА; Q - РЕЗ-Т СРАВНЕНИЯ
;   INTR = 1,2, ЕСЛИ ЧИТАЕМ А(I), 3,4 - А(К), 5,6 - А(I)
;   MANT - НОМЕР ЦИКЛА ЧТЕНИЯ; EXPN - К-ВО ОШИБОК В ЦИКЛЕ
;   ВНИМАНИЕ!
;   НАЧАЛЬНЫЕ ЗНАЧЕНИЯ РС,HALF (КОНТРОЛЬНЫЙ АДРЕС, 1 ИЛИ 2 ПОЛОВИНА ПАМЯТИ)
;   ЗАДАЮТСЯ В 3-6 РГ.БОПП (РС = 0-17 РАЗР.,HALF = 17 РАЗР.);
;   РССОРУ (ПЕРЕМЕННЫЙ АДРЕС) ВСЕГДА НАЧИНАЕТСЯ С 1.
;
CJP А=СМЕМА,МАР=РЕ
СМЕМА:CONT А=НА,%Т%
CJS А=INITST,МАР=РЕ
;ПИШЕМ БЛОКИРОВКИ В РР (БП=1 И Т.Д.)
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
CONT А=МВ,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=ВУТЕ
;ОБНУЛЯЕМ НОМЕР ЦИКЛА
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=MANT
;ЧИТАЕМ CONST (Т НА РИС.) ДЛЯ ЗАПИСИ И КОНТРОЛЯ
CONT А=ZER,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=DADR
;
;ЧИТАЕМ В БОПП НАЧАЛЬНЫЕ ЗНАЧЕНИЯ РС,HALF, 1 - В РССОРУ
CJS А=RDADR,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=РССОРУ
;17Р.- В HALF (ОБРАЩЕНИЕ К 1-Й ИЛИ 2-Й ПОЛОВИНЕ ПАМЯТИ)
CONT А=В17,DSRC=PROM,ALUS=DА,RА=РС,FUNC=AND,Н,ALUD=В,RВ=HALF
;МАХА1 = МАХ АДРЕСУ 1 ПЛАТЫ ОЗУ, ВКЛЮЧАЯ 17 РАЗРЯД! (1FFFF)
CONT А=МАХА1,DSRC=PROM,ALUS=DА,RА=РС,FUNC=AND,Н,ALUD=В,RВ=РС,CEN
CONT ALUS=ZВ,RВ=РССОРУ,Н,CI,ALUD=В,SТОРС=21
CJP А=WRMEMA,МАР=РЕ,COND=СТ,SТОРС=21,ALUS=АВ,RА=HALF,RВ=РССОРУ,FUNC=OR,Н,ALUD=В
CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В
;
;ЗАПИСЫВАЕМ CONST В ПАМЯТЬ. АДРЕС - В РГ.EXPN, ЧТОБ НЕ ПОРТИТЬ ПРОЧИТАННОЕ РС.
WRMEMA:CONT А=ZER,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=EXPN
CCWFA:CONT ALUS=ZВ,RВ=EXPN,Н,CI,ALUD=В,ALU,YDST=ADRREG
CONT ALUS=ZА,RА=DADR,Н,ALU,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
CJS А=OUT3/6,МАР=РЕ,ALUS=ZА,RА=EXPN,ALUD=В,RВ=WR6,YDEV=PHYSAD
>,ЕСВ,WRB,BRA=RG0,ARBI=DWR
;ЖДЕМ ГОТ.АРБИТРА, АДРЕС+1 - В РГ.Q (ДЛЯ СРАВНЕНИЯ С МАХ ADR.+ 1)
WWFA:CJP А=WWFA,МАР=РЕ,COND=ARBRDY,IСС,ALUS=ZА,RА=EXPN,Н,CI,ALUD=Q
;СРАВНИВАЕМ АДРЕС
CONT А=В18,DSRC=PROM,ALUS=DQ,FUNC=EXOR,CEN
CONT SТОРС=21
CJP А=CCWFA,МАР=РЕ,COND=СТ,SТОРС=21
;ЗАДЕРЖКА ПОСЛЕ ЗАПИСИ
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR5
CWTWA:CONT А=В20,DSRC=PROM,ALUS=DА,RА=WR5,FUNC=EXOR,Н,CEN
CONT ALUS=ZВ,RВ=WR5,Н,CI,ALUD=В,SТОРС=21
CJP А=CWTWA,МАР=РЕ,COND=СТ,SТОРС=21
;
;УСТАНАВЛИВАЕМ НАЧАЛЬНЫЕ ЗНАЧЕНИЯ: ОБНУЛЯЕМ ЧИСЛО ОШИБОК
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=EXPN
;БОЛЬШОЙ ЦИКЛ ПО К: ПИШЕМ ПО КОНТРОЛЬНОМУ АДРЕСУ /CONST
BCICLA:CONT ALUS=ZА,RА=РС,ALU,YDST=ADRREG
CONT ALUS=ZА,RА=DADR,FUNC=EXNOR,Н,ALU,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
WANCA:CJP А=WANCA,МАР=РЕ,COND=ARBRDY,IСС
;ЕСЛИ I(РССОРУ)=0, ТО I=I+1, Т.К. ПО 0 АДР.НЕ ОБРАЩАЕМСЯ
CONT ALUS=ZА,RА=РССОРУ,Н,СЕМ
CONT SТОРС=37
CJP А=LCICLA,МАР=РЕ,COND=СТ,SТОРС=37
CONT ALUS=ZВ,RВ=РССОРУ,Н,CI,ALUD=В
;
;МАЛЕНЬКИЙ ЦИКЛ, ЧИТАЕМ А(I)=CONST, А(К)=/CONST, А(I)=CONST, I=0,...N-1
;ЕСЛИ I = К, НЕ ПРОВЕРЯМ
LCICLA:CONT ALUS=АВ,RА=РС,RВ=РССОРУ,FUNC=EXOR,CEN
CONT SТОРС=20
CJP А=ADDIA,МАР=РЕ,COND=СТ,SТОРС=20
;
;ПРОВЕРЯЕМ АДРЕС А(I), СРАВНИВАЕМ С CONST, INTR=1,2
CJS А=СМРРСС,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=INTR,YDST=CCLR
;ПРОВЕРЯЕМ А(К), СРАВНИВАЕМ С /CONST; INTR = 3,4
CJS А=OUTADR,МАР=РЕ,ALUS=ZА,RА=DADR,FUNC=EXNOR,Н,ALUD=В,RВ=DADR
CJS А=DCMPD+1,МАР=РЕ,ALUS=ZА,RА=РС,ALU,YDST=ADRREG
;СНОВА - А(I), ВОССТАНАВЛИВАЕМ CONST В DADR, INTR = 5,6
CJS А=СМРРСС,МАР=РЕ,ALUS=ZА,RА=DADR,FUNC=EXNOR,Н,ALUD=В,RВ=DADR,YDST=CCLR
;
;I = I + 1, ПРОВЕРИЛИ ПОЛПАМЯТИ? (РАВНЫ 0 МЛАДШИЕ 16 РАЗРЯДОВ?)
ADDIA:CONT ALUS=ZВ,RВ=РССОРУ,Н,CI,ALUD=В
CONT А=MQ,DSRC=PROM,ALUS=DА,RА=РССОРУ,FUNC=AND,Н,CEN
CONT SТОРС=21
CJP А=LCICLA,МАР=РЕ,COND=СТ,SТОРС=21
;ВОССТАНАВЛИВАЕМ ПО КОНТРОЛЬНОМУ АДРЕСУ А(К) CONST; I(РССОРУ) = HALF
CONT ALUS=ZА,RА=РС,ALU,YDST=ADRREG
CONT ALUS=ZА,RА=DADR,Н,ALU,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR,ALUS=ZА,RА=HALF,Н,ALUD=В,RВ=РССОРУ
WAWRCA:CJP А=WAWRCA,МАР=РЕ,COND=ARBRDY,IСС
;
;К = К + 1, КОНЕЦ? 1-16 РАЗР.= FFFF ?
CONT А=MQ,DSRC=PROM,ALUS=DА,RА=РС,FUNC=AND,Н,ALUD=В,RВ=WR5
CONT А=MQ,DSRC=PROM,ALUS=DА,RА=WR5,FUNC=EXOR,Н,CEN
CONT SТОРС=21,ALUS=ZВ,RВ=РС,Н,CI,ALUD=В
CJP А=BCICLA,МАР=РЕ,COND=СТ,SТОРС=21
;ПРОВЕРИЛИ ЛИ ВТОРУЮ ПОЛОВИНУ ПАМЯТИ?
CONT А=В17,DSRC=PROM,ALUS=DА,RА=HALF,FUNC=EXOR,Н,ALUD=В,RВ=HALF,CEN
CONT SТОРС=21,ALUS=ZА,RА=HALF,Н,ALUD=В,RВ=РССОРУ
CJP А=BCICLA,МАР=РЕ,COND=СТ,SТОРС=21,ALUS=ZА,RА=HALF,Н,ALUD=В,RВ=РС
;
;ВСЕ. ПИШЕМ В БОПП N ЦИКЛА И ЧИСЛО ОШИБОК; ЗАДЕРЖКА
CJS А=OUTEMH,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR5
CWAITA:CONT А=В4,DSRC=PROM,ALUS=DА,RА=WR5,FUNC=EXOR,Н,CEN
CONT ALUS=ZВ,RВ=WR5,Н,CI,ALUD=В,SТОРС=21
CJP А=CWAITA,МАР=РЕ,COND=СТ,SТОРС=21
;+1 К НОМЕРУ ЦИКЛА
CONT ALUS=ZВ,RВ=MANT,Н,CI,ALUD=В
;ИНВЕРСИЯ CONST, ПОВТОРЕНИЕ; КОНТРОЛЬНЙ АДРЕС = 1; ПЕРЕМЕННЫЙ = 2
CONT А=С1,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РС
CONT А=С2,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РССОРУ
CJP А=WRMEMA,МАР=РЕ,ALUS=ZВ,RВ=DADR,FUNC=EXNOR,Н,ALUD=В
;
;
ОЗУВ:ENTRY
;===== "ПОПАРНАЯ ЗАПИСЬ - СЧИТЫВАНИЕ С ПОЛНЫМ ПЕРЕБОРОМ" - ТИПА N**2 (РИС.3.17)
;   В ПАМЯТЬ ПО ВСЕМ АДРЕСАМ ЗАПИСЫВАЕТСЯ "ФОН";
;   ПО ПЕРЕМЕННОМУ АДРЕСУ А(I) ЗАПИСЫВАЕТСЯ /CONST,
;   ПО КОНТРОЛЬНОМУ А(К) - CONST; СЧИТЫВАНИЕ А(I), А(К);
;   ЗАПИСЬ ПО А(I), А(К) - CONST, СЧИТЫВАНИЕ А(I), А(К);
;   ЦИКЛ ДЛЯ КАЖДОГО К I = 0,...N-1.
;   РС   = К - КОНТРОЛЬНЫЙ АДРЕС; РССОРУ = I - ПЕРЕМЕННЫЙ АДРЕС; DADR = CONST
;   HALF = 0 ИЛИ 1 В 17 РАЗРЯДЕ: ОБРАЩЕНИЕ К 1-Й ИЛИ 2-Й ПОЛОВИНЕ ПАМЯТИ
;   А    - ЧТО ПРОЧИТАЛИ В РАЗРЯДАХ ДАННЫХ, У - ТЕГА; Q - РЕЗ-Т СРАВНЕНИЯ
;   INTR - 1,2, ЕСЛИ ЧИТАЕМ А(I) 1-Й РАЗ; 3,4, ЕСЛИ ЧИТАЕМ А(К) 1-Й РАЗ;
;           5,6 ЕСЛИ ЧИТАЕМ А(I) 2-Й РАЗ; 7,8, ЕСЛИ ЧИТАЕМ А(К) 2-Й РАЗ.
;   MANT   - N ЦИКЛА ЧТЕНИЯ; EXPN - ЧИСЛО ОШИБОК;
;   НАЧАЬНЫЕ ЗНАЧЕНИЯ РС И HALF ЗАДАЮТСЯ В 3-6 РГ.БОПП (1-16 И 17 РАЗРЯДЫ)
;
CJP А=CONTWB,МАР=РЕ
CONTWB:CONT А=НВ,%Т%
CJS А=INITSM,МАР=РЕ
;ПИШЕМ БЛОКИРОВКИ В РР (БП=1 И Т.Д.)
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
CONT А=МВ,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=ВУТЕ
;ОБНУЛЯЕМ НОМЕР ЦИКЛА
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=MANT
;ЧИТАЕМ ФОНОВУЮ CONST (Т НА РИС.) ДЛЯ ЗАПИСИ
CONT А=СААА,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=DADR
;
;ЧИТАЕМ НАЧ.ЗНАЧЕНИЯ РС,HALF ИЗ РГ.БОПП; 1 - В РССОРУ
CJS А=RDADR,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=РССОРУ
CONT А=В17,DSRC=PROM,ALUS=DА,RА=РС,FUNC=AND,Н,ALUD=В,RВ=HALF
CONT А=МАХА1,DSRC=PROM,ALUS=DА,RА=РС,FUNC=AND,Н,ALUD=В,RВ=РС,CEN
CONT SТОРС=21,ALUS=ZВ,RВ=РССОРУ,Н,CI,ALUD=В
CJP А=WRMEMB,МАР=РЕ,COND=СТ,SТОРС=21
>,ALUS=АВ,RА=HALF,RВ=РССОРУ,FUNC=OR,Н,ALUD=В
CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В
;
;ЗАПИСЫВАЕМ "ФОН" В ПАМЯТЬ
WRMEMB:CONT А=ZER,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=EXPN
CCWFB:CONT ALUS=ZВ,RВ=EXPN,Н,CI,ALUD=В,ALU,YDST=ADRREG
CJS А=OUTADR,МАР=РЕ,ALUS=ZА,RА=DADR,Н,ALU,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
;ЖДЕМ ГОТ.АРБИТРА, АДРЕС+1 - В РГ.Q (ДЛЯ СРАВНЕНИЯ С МАХ АДР.+ 1)
WWFB:CJP А=WWFB,МАР=РЕ,COND=ARBRDY,IСС,ALUS=ZА,RА=EXPN,Н,CI,ALUD=Q
;СРАВНИВАЕМ АДРЕС
CONT А=В18,DSRC=PROM,ALUS=DQ,FUNC=EXOR,CEN
CONT SТОРС=21
CJP А=CCWFB,МАР=РЕ,COND=СТ,SТОРС=21
;ЧИТАЕМ CONST В DADR
CONT А=ZER,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=DADR
;
;УСТАНАВЛИВАЕМ НАЧАЛЬНЫЕ ЗНАЧЕНИЯ: ОБНУЛЯЕМ К-ВО ОШИБОК В ЦИКЛЕ
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=EXPN
;БОЛЬШОЙ ЦИКЛ: ЕСЛИ I=0, ТО I=I+1
BCICLB:CONT ALUS=ZА,RА=РССОРУ,Н,СЕМ
CONT SТОРС=37
CJP А=LCICLB,МАР=РЕ,COND=СТ,SТОРС=37
CONT ALUS=ZВ,RВ=РССОРУ,Н,CI,ALUD=В
;
;МАЛЕНЬКИЙ ЦИКЛ: ЕСЛИ I = К, НЕ ПРОВЕРЯЕМ
LCICLB:CONT ALUS=АВ,RА=РС,RВ=РССОРУ,FUNC=EXOR,CEN
CONT SТОРС=20
CJP А=ADDIB,МАР=РЕ,COND=СТ,SТОРС=20
;ПИШЕМ ПО А(I) - /CONST
CJS А=OUTADR,МАР=РЕ,ALUS=ZА,RА=РССОРУ,ALU,YDST=ADRREG
CONT ALUS=ZА,RА=DADR,FUNC=EXNOR,Н,ALU,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
WAWIAB:CJP А=WAWIAB,МАР=РЕ,COND=ARBRDY,IСС
;ПИШЕМ ПО КОНТРОЛЬНОМУ АДРЕСУ А(К) CONST
CONT ALUS=ZА,RА=РС,ALU,YDST=ADRREG
CONT ALUS=ZА,RА=DADR,Н,ALU,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
WANCB:CJP А=WANCB,МАР=РЕ,COND=ARBRDY,IСС
;
;ПРОВЕРЯЕМ АДРЕС РССОРУ=А(I), СРАВНИВАЕМ С /CONST; INTR=1,2
CONT ALUS=ZА,RА=DADR,FUNC=EXNOR,Н,ALUD=В,RВ=DADR
CJS А=СМРРСС,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=INTR,YDST=CCLR
;ВОССТАНАВЛИВАЕМ CONST В DADR, ПРОВЕРЯЕМ РС=А(К), СРАВНИВАЕМ С CONST; INTR=3,4
CONT ALUS=ZА,RА=DADR,FUNC=EXNOR,Н,ALUD=В,RВ=DADR
CJS А=DCMPD+1,МАР=РЕ,ALUS=ZА,RА=РС,ALU,YDST=ADRREG
;
;ПИШЕМ ВТОРОЙ РАЗ: ПО А(I) - CONST
CONT ALUS=ZА,RА=РССОРУ,ALU,YDST=ADRREG
CONT ALUS=ZА,RА=DADR,Н,ALU,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
WAWIRB:CJP А=WAWIRB,МАР=РЕ,COND=ARBRDY,IСС
;ТО ЖЕ - ПО КОНТРОЛЬНОМУ АДРЕСУ
CONT ALUS=ZА,RА=РС,ALU,YDST=ADRREG
CONT ALUS=ZА,RА=DADR,Н,ALU,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
WANCRB:CJP А=WANCRB,МАР=РЕ,COND=ARBRDY,IСС
;
;ПРОВЕРЯЕМ АДРЕС А(I), СРАВНИВАЕМ С CONST; INTR=5,6
CJS А=СМРРСС,МАР=РЕ,YDST=CCLR
;А(К); INTR=7,8
CJS А=DCMPD+1,МАР=РЕ,ALUS=ZА,RА=РС,ALU,YDST=ADRREG
;
;I = I + 1, ДОШЛИ ЛИ ДО КОНЦА ПОЛОВИНЫ ПАМЯТИ? (16 МЛ.РАЗРЯДОВ = 0?)
ADDIB:CONT А=MQ,DSRC=PROM,ALUS=DА,RА=РССОРУ,FUNC=AND,Н,ALUD=В,RВ=WR5
CONT А=MQ,DSRC=PROM,ALUS=DА,RА=WR5,FUNC=EXOR,Н,CEN
CONT SТОРС=21,ALUS=ZВ,RВ=РССОРУ,Н,CI,ALUD=В
CJP А=LCICLB,МАР=РЕ,COND=СТ,SТОРС=21
;К = К + 1, КОНЕЦ?
CONT А=MQ,DSRC=PROM,ALUS=DА,RА=РС,FUNC=AND,Н,ALUD=В,RВ=WR5
CONT А=MQ,DSRC=PROM,ALUS=DА,RА=WR5,FUNC=EXOR,Н,CEN
CONT SТОРС=21,ALUS=ZВ,RВ=РС,Н,CI,ALUD=В
CJP А=BCICLB,МАР=РЕ,COND=СТ,SТОРС=21,ALUS=ZА,RА=HALF,Н,ALUD=В,RВ=РССОРУ
;
;ПРОВЕРИЛИ ЛИ ВТОРУЮ ПОЛОВИНУ ПАМЯТИ?
CONT А=В17,DSRC=PROM,ALUS=DА,RА=HALF,FUNC=EXOR,Н,ALUD=В,RВ=HALF,CEN
CONT SТОРС=21,ALUS=ZА,RА=HALF,Н,ALUD=В,RВ=РС
CJP А=BCICLB,МАР=РЕ,COND=СТ,SТОРС=21,ALUS=ZА,RА=HALF,Н,ALUD=В,RВ=РССОРУ
;ВСЕ. ПИШЕМ В БОПП N ЦИКЛА И ЧИСЛО ОШИБОК; ЗАДЕРЖКА
CJS А=OUTEMH,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR5
CWAITB:CONT А=В4,DSRC=PROM,ALUS=DА,RА=WR5,FUNC=EXOR,Н,CEN
CONT ALUS=ZВ,RВ=WR5,Н,CI,ALUD=В,SТОРС=21
CJP А=CWAITB,МАР=РЕ,COND=СТ,SТОРС=21
;+1 К НОМЕРУ ЦИКЛА
CONT ALUS=ZВ,RВ=MANT,Н,CI,ALUD=В
CONT А=С1,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РС
CONT А=С2,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РССОРУ
;ИНВЕРСИЯ CONST, ПОВТОРЕНИЕ
CJP А=WRMEMB,МАР=РЕ,ALUS=ZВ,RВ=DADR,FUNC=EXNOR,Н,ALUD=В
;
;
ОЗУС:ENTRY
;===== "БЕГУЩИЙ СТОЛБЕЦ" - АЛГОРИТМ ТИПА N**3/2 (РИС.3.19)
;   ОЗУ - МАТРИЦА С АДРЕСАМИ А(I,J) И А(I,R); I - СТРОКИ, J,R - СТОЛБЦЫ;
;   ЗАПИСЫВАЕТСЯ CONST В ПАМЯТЬ ПО ВСЕМ АДРЕСАМ А(I,J);
;   В "БЕГУЩИЙ" СТОЛБЕЦ А(I,R), ГДЕ I=0,...L, ЗАПИСЫВАЕТСЯ /CONST;
;   ЧТЕНИЕ ВСЕЙ ПАМЯТИ, СРАВНЕНИЕ: "БЕГУЩИЙ" СТОЛБЕЦ А(I,R) - С /CONST,
;   ВСЕ ОСТАЛЬНЫЕ АДРЕСА А(I,J), ГДЕ J НЕ РАВЕН R, - С CONST;
;   ВОССТАНАВЛИВАЕТСЯ CONST В "БЕГУЩЕМ" СТОЛБЦЕ А(I,R);
;   ПЕРЕХОД К СЛЕДУЮЩЕМУ: R = R + 1. ПОЛНЫЙ АДРЕС = HALF + J<<8 + I;
;   ПОЛНЫЙ АДРЕС "БЕГУЩЕГО" СТОЛБЦА = HALF + R<<8 + I
;   HALF   = 0 ИЛИ 1 В 17 РАЗРЯДЕ: ОБРАЩЕНИЕ К 1-Й ИЛИ 2-Й ПОЛОВИНЕ ПАМЯТИ
;   А      - ЧТО ПРОЧИТАЛИ В РАЗРЯДАХ ДАННЫХ, У - ТЕГА, Q - РЕЗ-Т СРАВНЕНИЯ
;   INTR   = 1,2, ЕСЛИ ЧИТАЕМ СТОЛБЦЫ А(I,J) - CONST;
;          = 3,4, ЕСЛИ ЧИТАЕМ СТОЛБЕЦ А(I,R) - /CONST.
;   MANT   - НОМЕР ЦИКЛА ЧТЕНИЯ; EXPN - КОЛ-ВО ОШИБОК В ЦИКЛЕ; DADR = CONST
;   WR1    - 1-Й АДРЕС СТРОКИ I В 1-Й (1) ИЛИ 2-Й (0) ПОЛОВИНЕ ПАМЯТИ
;   WR2    = R - СТОЛБЕЦ;  WR3 = I - СТРОКА;  WR4 = J - СТОЛБЕЦ;
;
CJP А=CONTMC,МАР=РЕ
CONTMC:CONT А=НС,%Т%
CJS А=INITST,МАР=РЕ
;ПИШЕМ БЛОКИРОВКИ В РР (БП=1 И Т.Д.)
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
CONT А=МВ,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=ВУТЕ
;ОБНУЛЯЕМ НОМЕР ЦИКЛА
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=MANT
;ЧИТАЕМ CONST (Т НА РИС.) ДЛЯ ЗАПИСИ И КОНТРОЛЯ
CONT А=ZER,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=DADR
;0 - В HALF (.OR.С 1 В 17 РАЗРЯДЕ = ОБРАЩЕНИЕ К 1-Й ИЛИ 2-Й ПОЛОВИНЕ ПАМЯТИ)
CONT А=ZER,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=HALF
;
;ЗАПИСЫВАЕМ CONST В ПАМЯТЬ
WRMEMC:CONT А=ZER,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РС
CCWFC:CJS А=OUTADR,МАР=РЕ,ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG
CONT ALUS=ZА,RА=DADR,Н,ALU,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
;ЖДЕМ ГОТ.АРБИТРА, РС+1 - В РГ.Q (ДЛЯ СРАВНЕНИЯ С МАХ ADR.+ 1)
WWFC:CJP А=WWFC,МАР=РЕ,COND=ARBRDY,IСС,ALUS=ZА,RА=РС,Н,CI,ALUD=Q
;СРАВНИВАЕМ АДРЕС
CONT А=В18,DSRC=PROM,ALUS=DQ,FUNC=EXOR,CEN
CONT SТОРС=21
CJP А=CCWFC,МАР=РЕ,COND=СТ,SТОРС=21
;ЗАДЕРЖКА ПОСЛЕ ЗАПИСИ
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR5
WAITWC:CONT А=В20,DSRC=PROM,ALUS=DА,RА=WR5,FUNC=EXOR,Н,CEN
CONT ALUS=ZВ,RВ=WR5,Н,CI,ALUD=В,SТОРС=21
CJP А=WAITWC,МАР=РЕ,COND=СТ,SТОРС=21
;
;УСТАНАВЛИВАЕМ НАЧАЛЬНЫЕ ЗНАЧЕНИЯ: ОБНУЛЯЕМ ЧИСЛО ОШИБОК
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=EXPN
;1-Й АДРЕС СТРОКИ I ДЛЯ R=0 И 1-Й ПОЛОВИНЫ ПАМЯТИ = 1 (ПО 0 АДРЕСУ НЕ ОБРАЩАЕМСЯ
CONT А=С1,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=WR1
;R (WR2) = 0
НА2С:CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR2
;
;БОЛЬШОЙ ЦИКЛ:
;I (WR3) = 1-ОМУ АДРЕСУ ТЕКУЩЕЙ ПОЛОВИНЫ ПАМЯТИ ИЗ WR1, ЕСЛИ R=0, ИНАЧЕ I = 0
BCICLC:CONT ALUS=ZА,RА=WR2,Н,CEN
CONT SТОРС=21,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR3
CJP А=LCIC1C,МАР=РЕ,COND=СТ,SТОРС=21
CONT ALUS=ZА,RА=WR1,Н,ALUD=В,RВ=WR3
;
;1-Й МАЛЕНЬКИЙ ЦИКЛ: ПИШЕМ В "БЕГУЩИЙ" СТОЛБЕЦ А(I,R) - /CONST, I=0,...255
;ВЫЧИСЛЯЕМ ПОЛНЫЙ АДРЕС:
LCIC1C:CONT ALUS=АВ,RА=HALF,RВ=WR3,Н,ALUD=Q
CONT ALUS=DQ,Н,ALUD=ВА,RА=WR2,RВ=РС,ALU,DSRC=SHIFT,MPS,PSHF=SН0-8,SHF=LOG
;ПИШЕМ В ПАМЯТЬ
CJS А=OUTADR,МАР=РЕ,ALUS=ZА,RА=РС,ALU,YDST=ADRREG
CONT ALUS=ZА,RА=DADR,FUNC=EXNOR,Н,ALU,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
WAWIBC:CJP А=WAWIBC,МАР=РЕ,COND=ARBRDY,IСС
;I = 255? I = I + 1
CONT А=МВ,DSRC=PROM,ALUS=DА,RА=WR3,FUNC=EXOR,Н,CEN
CONT ALUS=ZВ,RВ=WR3,Н,CI,ALUD=В,SТОРС=21
CJP А=LCIC1C,МАР=РЕ,COND=СТ,SТОРС=21
;
;СРЕДНИЙ ЦИКЛ: ПРОВЕРКА ВСЕЙ МАТРИЦЫ А(I,J)
;ЕСЛИ J = R, СРАВНИВАЕМ С /CONST, ИНАЧЕ - С CONST
;I (WR3) = 1 ИЛИ 0, ЕСЛИ 1-Я ИЛИ 2-Я ПОЛОВИНА ПАМЯТИ; J (WR4) = 0
CJS А=OUTADR,МАР=РЕ,ALUS=ZА,RА=WR1,Н,ALUD=В,RВ=WR3
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR4
MCICEC:CONT ALUS=АВ,RА=WR4,RВ=WR2,FUNC=EXOR,Н,CEN,YDST=CCLR
;ВЫЧИСЛЯЕМ АДРЕС
CONT ALUS=АВ,RА=HALF,RВ=WR3,Н,ALUD=Q,SТОРС=21
CJP А=NEQC,МАР=РЕ,COND=СТ,SТОРС=21,ALUS=DQ,Н,ALUD=ВА,RА=WR4,RВ=РС,ALU
>,DSRC=SHIFT,MPS,PSHF=SН0-8,SHF=LOG
;"БЕГУЩИЙ" СТОЛБЕЦ, R = J, СРАВНИВАЕМ С /CONST; INTR = 3,4
CONT А=С2,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=INTR
CJS А=DCMPD0,МАР=РЕ,ALUS=ZВ,RВ=DADR,FUNC=EXNOR,Н,ALUD=В,YDST=CCLR
;ВОССТАНАВЛИВАЕМ CONST
CJP А=NХТС,МАР=РЕ,ALUS=ZВ,RВ=DADR,FUNC=EXNOR,Н,ALUD=В
;R НЕ РАВНО J, СРАВНЕНИЕ С CONST, INTR = 1,2
NEQC:CJS А=DCMPD0,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=INTR,YDST=CCLR
;I = 255? I = I + 1
NХТС:CONT А=МВ,DSRC=PROM,ALUS=DА,RА=WR3,FUNC=EXOR,Н,CEN
CONT ALUS=ZВ,RВ=WR3,Н,CI,ALUD=В,SТОРС=21
CJP А=MCICEC,МАР=РЕ,COND=СТ,SТОРС=21
;I = 255: J = 255? J = J + 1, I = 0
CONT А=МВ,DSRC=PROM,ALUS=DА,RА=WR4,FUNC=EXOR,Н,CEN
CONT ALUS=ZВ,RВ=WR4,Н,CI,ALUD=В,SТОРС=21
CJP А=MCICEC,МАР=РЕ,COND=СТ,SТОРС=21,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR3
;
;I = 0 ИЛИ 1
CONT ALUS=ZА,RА=WR2,Н,CEN
CONT SТОРС=21,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR3
CJP А=LCIC2C,МАР=РЕ,COND=СТ,SТОРС=21
CONT ALUS=ZА,RА=WR1,Н,ALUD=В,RВ=WR3
;2-Й МАЛЕНЬКИЙ ЦИКЛ: ВОССТАНАВЛИВАЕМ В "БЕГУЩЕМ" СТОЛБЦЕ CONST
LCIC2C:CONT ALUS=АВ,RА=HALF,RВ=WR3,Н,ALUD=Q
CONT ALUS=DQ,Н,ALUD=ВА,RА=WR2,RВ=РС,ALU,DSRC=SHIFT,MPS,PSHF=SН0-8,SHF=LOG
CONT ALUS=ZА,RА=РС,ALU,YDST=ADRREG
CONT ALUS=ZА,RА=DADR,Н,ALU,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
CJS А=OUTADR,МАР=РЕ,YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
WAWICC:CJP А=WAWICC,МАР=РЕ,COND=ARBRDY,IСС
;I = 255? I = I + 1
CONT А=МВ,DSRC=PROM,ALUS=DА,RА=WR3,FUNC=EXOR,Н,CEN
CONT ALUS=ZВ,RВ=WR3,Н,CI,ALUD=В,SТОРС=21
CJP А=LCIC2C,МАР=РЕ,COND=СТ,SТОРС=21
;
;R = 255? R = R + 1
CONT А=МВ,DSRC=PROM,ALUS=DА,RА=WR2,FUNC=EXOR,Н,CEN
CONT ALUS=ZВ,RВ=WR2,Н,CI,ALUD=В,SТОРС=21
CJP А=BCICLC,МАР=РЕ,COND=СТ,SТОРС=21
;
;ПРОВЕРИЛИ ЛИ ВТОРУЮ ПОЛОВИНУ ПАМЯТИ?
CONT А=В17,DSRC=PROM,ALUS=DА,RА=HALF,FUNC=EXOR,Н,ALUD=В,RВ=HALF,CEN
;ЕСЛИ НЕТ, ТО ДЛЯ 2-Й ПОЛОВИНЫ 1-Й АДРЕС СТРОКИ УСТАНАВЛИВАЕМ В 0
CONT SТОРС=21,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR1
CJP А=НА2С,МАР=РЕ,COND=СТ,SТОРС=21
;ВСЕ. ПИШЕМ В БОПП N ЦИКЛА И ЧИСЛО ОШИБОК; ЗАДЕРЖКА
CJS А=OUTEMH,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR5
CWAITC:CONT А=В4,DSRC=PROM,ALUS=DА,RА=WR5,FUNC=EXOR,Н,CEN
CONT ALUS=ZВ,RВ=WR5,Н,CI,ALUD=В,SТОРС=21
CJP А=CWAITC,МАР=РЕ,COND=СТ,SТОРС=21
;+1 К НОМЕРУ ЦИКЛА
CONT ALUS=ZВ,RВ=MANT,Н,CI,ALUD=В
;ИНВЕРСИЯ CONST, ПОВТОРЕНИЕ
CJP А=WRMEMC,МАР=РЕ,ALUS=ZВ,RВ=DADR,FUNC=EXNOR,Н,ALUD=В
;
;
OЗYD:ENTRY
;===== "БАТТЕРФЛЯЙ" - АЛГОРИТМ ТИПА N**3/2 (РИС.3.23)
;   ОЗУ ЕСТЬ МАТРИЦА С АДРЕСАМИ А(I,J) И А(S,R); I,S - СТРОКИ, J,R - СТОЛБЦЫ;
;   В КОНТРОЛЬНЫЙ АДРЕС А(S,R) ЗАПИСЫВАЕТСЯ /CONST, ВО ВСЕ ДРУГИЕ - CONST;
;   ЗАТЕМ А(S,R) ПОПАРНО СЧИТЫВАЕТСЯ С ТЕКУЩИМИ АДРЕСАМИ СТРОКИ И СТОЛБЦА,
;   НА КОТОРЫХ РАСПОЛОЖЕН КОНТРОЛЬНЫЙ АДРЕС А(S,R):
;   ЦИКЛ ПО СТРОКЕ: А(S,R) - /CONST, ПО А(S,J) - CONST, J=0,...М, КРОМЕ J=R;
;   ЦИКЛ ПО СТОЛБЦУ: А(S,R) - /CONST, ПО А(I,R) - CONST, I=0,...L, КРОМЕ I=S;
;   ЗАТЕМ ПО АДРЕСУ А(S,R) ЗАПИСЫВАЕТСЯ CONST И ПРОВЕРЯЕТСЯ.
;   РС     - ПОЛНЫЙ КОНТРОЛЬНЫЙ АДРЕС А(S,R) = HALF + R<<8 + S
;   РССОРУ - ПЕРЕМЕННЫЙ АДРЕС А(I,J) = HALF + J<<8 + I;  DADR = CONST
;   HALF   = 0 ИЛИ 1 В 17 РАЗРЯДЕ: ОБРАЩЕНИЕ К 1-Й ИЛИ 2-Й ПОЛОВИНЕ ПАМЯТИ
;   А      - ЧТО ПРОЧИТАЛИ В РАЗРЯДАХ ДАННЫХ, У - ТЕГА, Q - РЕЗ-Т СРАВНЕНИЯ
;   INTR   = 1,2, ЕСЛИ ЧИТАЕМ А(I,J) = CONST, ЦИКЛ ПО J
;            3,4, ЕСЛИ ЧИТАЕМ А(R,S) = /CONST, ЦИКЛ ПО J
;            5,6, ЕСЛИ ЧИТАЕМ А(I,J) = CONST, ЦИКЛ ПО I
;            7,8, ЕСЛИ ЧИТАЕМ А(S,R) = /CONST, ЦИКЛ ПО I
;            9,А, ЕСЛИ ЧИТАЕМ АДРЕС А(S,R) = CONST
;   MANT   - НОМЕР ЦИКЛА ЧТЕНИЯ; EXPN - КОЛ-ВО ОШИБОК В ЦИКЛЕ;
;   WR1    = S - СТРОКА; WR2 = R - СТОЛБЕЦ; WR3 = I - СТРОКА; WR4 = J - СТОЛБЕЦ
;
CJP А=CONTMD,МАР=РЕ
CONTMD:CONT А=HD,%Т%
CJS А=INITST,МАР=РЕ
;ПИШЕМ БЛОКИРОВКИ В РР (БП=1 И Т.Д.)
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
CONT А=МВ,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=ВУТЕ
;ОБНУЛЯЕМ НОМЕР ЦИКЛА
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=MANT
;ЧИТАЕМ CONST
CONT А=ZER,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=DADR
;0 - В HALF (.OR.С 1 В 17 РАЗРЯДЕ = ОБРАЩЕНИЕ К 1-Й ИЛИ 2-Й ПОЛОВИНЕ ПАМЯТИ)
CONT А=ZER,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=HALF
;
;ЗАПИСЫВАЕМ CONST В ПАМЯТЬ
WRMEMD:CONT А=ZER,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РС
CCWFD:CJS А=OUTADR,МАР=РЕ,ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG
CONT ALUS=ZА,RА=DADR,Н,ALU,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
;ЖДЕМ ГОТ.АРБИТРА, РС+1 - В РГ.Q (ДЛЯ СРАВНЕНИЯ С МАХ ADR.+ 1)
WWFD:CJP А=WWFD,МАР=РЕ,COND=ARBRDY,IСС,ALUS=ZА,RА=РС,Н,CI,ALUD=Q
;СРАВНИВАЕМ АДРЕС
CONT А=В18,DSRC=PROM,ALUS=DQ,FUNC=EXOR,CEN
CONT SТОРС=21
CJP А=CCWFD,МАР=РЕ,COND=СТ,SТОРС=21
;ЗАДЕРЖКА ПОСЛЕ ЗАПИСИ
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR5
CWTWD:CONT А=В20,DSRC=PROM,ALUS=DА,RА=WR5,FUNC=EXOR,Н,CEN
CONT ALUS=ZВ,RВ=WR5,Н,CI,ALUD=В,SТОРС=21
CJP А=CWTWD,МАР=РЕ,COND=СТ,SТОРС=21
;
;ОБНУЛЯЕМ К-ВО ОШИБОК В ЦИКЛЕ
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=EXPN
;R (WR2) = 0; S (WR1) = 1 ДЛЯ 1-Й ПОЛОВИНЫ ПАМЯТИ
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR2
CONT А=С1,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=WR1
;
;БОЛЬШОЙ ЦИКЛ: ПИШЕМ ПО АДРЕСУ А(S,R) - /CONST
BCCLED:CONT ALUS=АВ,RА=HALF,RВ=WR1,Н,ALUD=Q
CONT ALUS=DQ,Н,ALUD=ВА,RА=WR2,RВ=РС,ALU,DSRC=SHIFT,MPS,PSHF=SН0-8,SHF=LOG
CJS А=OUTADR,МАР=РЕ,ALUS=ZА,RА=РС,Н,ALU,YDST=ADRREG
CONT ALUS=ZА,RА=DADR,FUNC=EXNOR,Н,ALU,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
WAWRD:CJP А=WAWRD,МАР=РЕ,COND=ARBRDY,IСС
;
;КОНТРОЛЬ: ЧТЕНИЕ А(S,R)=/CONST, А(I,J)=CONST, I=S,J=0,...255; I=0,...255,J=R
;ЦИКЛ ПО СТРОКЕ: I = S, J = 0,...255, КРОМЕ J = R
;ЕСЛИ 1-Я ПОЛОВИНА ПАМЯТИ (HALF=0) И 0-Я СТРОКА (S=0), ТО ЦИКЛ ПО J - С 1!
;I (WR3) = S (WR1); J (WR4) = 0 ИЛИ 1
CONT ALUS=ZА,RА=HALF,Н,CEN
CONT ALUS=ZА,RА=WR1,Н,ALUD=В,RВ=WR3,СЕМ,SТОРС=21
CJP А=JCCLED,МАР=РЕ,COND=СТ,SТОРС=21,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR4
CONT SТОРС=37
CJP А=JCCLED,МАР=РЕ,COND=СТ,SТОРС=37
CONT ALUS=ZВ,RВ=WR4,Н,CI,ALUD=В
;ОБХОД, ЕСЛИ J = R
JCCLED:CONT ALUS=АВ,RА=WR4,RВ=WR2,FUNC=EXOR,Н,CEN
CONT SТОРС=20
CJP А=ADDJD,МАР=РЕ,COND=СТ,SТОРС=20
;ЧИТАЕМ А(S,R), П/У НА П/П СРАВНЕНИЯ, INTR=3,4
CONT ALUS=АВ,RА=HALF,RВ=WR1,Н,ALUD=Q,YDST=CCLR
CONT ALUS=DQ,Н,ALUD=ВА,RА=WR2,RВ=РС,ALU,DSRC=SHIFT,MPS,PSHF=SН0-8,SHF=LOG
CONT А=С2,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=INTR
CJS А=DCMPD0,МАР=РЕ,ALUS=ZВ,RВ=DADR,FUNC=EXNOR,Н,ALUD=В
CONT ALUS=ZВ,RВ=DADR,FUNC=EXNOR,Н,ALUD=В
;
;ЧИТАЕМ А(I,J), INTR = 1,2
CONT ALUS=АВ,RА=HALF,RВ=WR3,Н,ALUD=Q,YDST=CCLR
CONT ALUS=DQ,Н,ALUD=ВА,RА=WR4,RВ=РССОРУ,ALU,DSRC=SHIFT,MPS,PSHF=SН0-8,SHF=LOG
CJS А=СМРРСС,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=INTR
;
;J = 255? J = J + 1
ADDJD:CONT А=МВ,DSRC=PROM,ALUS=DА,RА=WR4,FUNC=EXOR,Н,CEN
CONT ALUS=ZВ,RВ=WR4,Н,CI,ALUD=В,SТОРС=21
CJP А=JCCLED,МАР=РЕ,COND=СТ,SТОРС=21
;ЦИКЛ ПО СТОЛБЦУ: J = R, I = 0,...255, КРОМЕ I = S
;ЕСЛИ 1-Я ПОЛОВИНА ПАМЯТИ (HALF=0) И 0-Й СТОЛБЕЦ (R=0), I = 1(!),...255
;J (WR4) = R (WR2); I (WR3) = 0 ИЛИ 1
CONT ALUS=ZА,RА=HALF,Н,CEN
CONT ALUS=ZА,RА=WR2,Н,ALUD=В,RВ=WR4,СЕМ,SТОРС=21
CJP А=ICCLED,МАР=РЕ,COND=СТ,SТОРС=21,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR3
CONT SТОРС=37
CJP А=ICCLED,МАР=РЕ,COND=СТ,SТОРС=37
CONT ALUS=ZВ,RВ=WR3,Н,CI,ALUD=В
;ОБХОД, ЕСЛИ I = S
ICCLED:CONT ALUS=АВ,RА=WR1,RВ=WR3,FUNC=EXOR,Н,CEN
CONT SТОРС=20
CJP А=ADDID,МАР=РЕ,COND=СТ,SТОРС=20
;ЧИТАЕМ А(S,R), П/У НА П/П СРАВНЕНИЯ, INTR = 7,8
CONT ALUS=АВ,RА=HALF,RВ=WR1,Н,ALUD=Q,YDST=CCLR
CONT ALUS=DQ,Н,ALUD=ВА,RА=WR2,RВ=РС,ALU,DSRC=SHIFT,MPS,PSHF=SН0-8,SHF=LOG
CONT А=С6,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=INTR
CJS А=DCMPD0,МАР=РЕ,ALUS=ZВ,RВ=DADR,FUNC=EXNOR,Н,ALUD=В
CONT ALUS=ZВ,RВ=DADR,FUNC=EXNOR,Н,ALUD=В
;
;ЧИТАЕМ А(I,J), INTR = 5,6
CONT А=С4,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=INTR
CONT ALUS=АВ,RА=HALF,RВ=WR3,Н,ALUD=Q,YDST=CCLR
CJS А=СМРРСС,МАР=РЕ
>,ALUS=DQ,Н,ALUD=ВА,RА=WR4,RВ=РССОРУ,ALU,DSRC=SHIFT,MPS,PSHF=SН0-8,SHF=LOG
;
;I = 255? I = I + 1
ADDID:CONT А=МВ,DSRC=PROM,ALUS=DА,RА=WR3,FUNC=EXOR,Н,CEN
CONT ALUS=ZВ,RВ=WR3,Н,CI,ALUD=В,SТОРС=21
CJP А=ICCLED,МАР=РЕ,COND=СТ,SТОРС=21
;
;ПИШЕМ ПО А(S,R) - CONST, КОНТРОЛЬ, РС - НЕ ИСПОРЧЕНО; INTR = 9,А
CONT ALUS=ZА,RА=РС,ALU,YDST=ADRREG
CONT ALUS=ZА,RА=DADR,Н,ALU,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
CONT А=С8,DSRC=PROM,Н,ALUD=В,RВ=INTR,YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
WAWUD:CJP А=WAWUD,МАР=РЕ,COND=ARBRDY,IСС
CJS А=DCMPD+1,МАР=РЕ,YDST=CCLR
;
;S = 255? S = S + 1
CONT А=МВ,DSRC=PROM,ALUS=DА,RА=WR1,FUNC=EXOR,Н,CEN
CONT ALUS=ZВ,RВ=WR1,Н,CI,ALUD=В,SТОРС=21
CJP А=BCCLED,МАР=РЕ,COND=СТ,SТОРС=21
;
;S = 255: R = 255? R = R + 1, S = 0
CONT А=МВ,DSRC=PROM,ALUS=DА,RА=WR2,FUNC=EXOR,Н,CEN
CONT ALUS=ZВ,RВ=WR2,Н,CI,ALUD=В,SТОРС=21
CJP А=BCCLED,МАР=РЕ,COND=СТ,SТОРС=21,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR1
;
;ПРОВЕРИЛИ ЛИ ВТОРУЮ ПОЛОВИНУ ПАМЯТИ? R = S = 0 ДЛЯ 2-Й ПОЛОВИНЫ ПАМЯТИ
CONT А=В17,DSRC=PROM,ALUS=DА,RА=HALF,FUNC=EXOR,Н,ALUD=В,RВ=HALF,CEN
CONT SТОРС=21,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR1
CJP А=BCCLED,МАР=РЕ,COND=СТ,SТОРС=21,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR2
;ВСЕ. ПИШЕМ В БОПП N ЦИКЛА И ЧИСЛО ОШИБОК; ЗАДЕРЖКА
CJS А=OUTEMH,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR5
WAITCD:CONT А=В4,DSRC=PROM,ALUS=DА,RА=WR5,FUNC=EXOR,Н,CEN
CONT ALUS=ZВ,RВ=WR5,Н,CI,ALUD=В,SТОРС=21
CJP А=WAITCD,МАР=РЕ,COND=СТ,SТОРС=21
;+1 К НОМЕРУ ЦИКЛА
CONT ALUS=ZВ,RВ=MANT,Н,CI,ALUD=В
;ИНВЕРСИЯ CONST, ПОВТОРЕНИЕ
CJP А=WRMEMD,МАР=РЕ,ALUS=ZВ,RВ=DADR,FUNC=EXNOR,Н,ALUD=В
;
;
ОЗУЕ:ENTRY
;===== "ВОЗБУЖДЕНИЕ НАКОПИТЕЛЯ МНОГОКРАТНЫМ СЧИТЫВАНИЕМ" -
;   ДЛЯ ДИНАМИЧЕСКОГО ОЗУ, АЛГОРИТМ ТИПА N**3/2 (РИС.3.29)
;   ОЗУ - МАТРИЦА С АДРЕСАМИ А(I,J) И А(I,R); I - СТРОКИ, J,R - СТОЛБЦЫ;
;   В ОЗУ ПО А(I,J), КРОМЕ КОНТРОЛЬНОГО СТОЛБЦА, ЗАПИСЫВАЕТСЯ CONST;
;   В СТОЛБЕЦ А(I,R) - /CONST, ЕСЛИ I+R - ЧЕТНОЕ, ИНАЧЕ - CONST;
;   ПАУЗА: СЧИТЫВНИЕ СТОЛБЦА А(I,J), I=0,...L, J НЕ РАВНО R;
;   КОНТРОЛЬ: СЧИТЫВАНИЕ КОНТРОЛЬНОГО СТОЛБЦА А(I,R), I=0,...L;
;   ВОССТАНОВЛЕНИЕ CONST В А(I,R). ПЕРЕХОД К СЛЕДУЮЩЕМУ СТОЛБЦУ: R = R + 1.
;   РС = А(I,R) - ПОЛНЫЙ АДРЕС КОНТРОЛЬНОГО СТОЛБЦА = HALF + R<<8 + I
;   РССОРУ = А(I,J) - ПОЛНЫЙ АДРЕС "ПОСТОРОННЕГО" СТОЛБЦА = HALF + J<<8 + I
;   HALF   = 0 ИЛИ 1 В 17 РАЗРЯДЕ: ОБРАЩЕНИЕ К 1-Й ИЛИ 2-Й ПОЛОВИНЕ ПАМЯТИ
;   А      - ЧТО ПРОЧИТАЛИ В РАЗРЯДАХ ДАННЫХ, У - ТЕГА, Q - РЕЗ-Т СРАВНЕНИЯ
;   INTR   = 1,2, ЕСЛИ ЧИТАЕМ СТОЛБЦЫ А(I,J) - CONST;
;            3,4, ЕСЛИ ЧИТАЕМ СТОЛБЕЦ А(I,R) - /CONST.
;            5,6, ЕСЛИ ЧИТАЕМ СТОЛБЕЦ А(I,R) - CONST
;   MANT   - НОМЕР ЦИКЛА ЧТЕНИЯ; EXPN - К-ВО ОШИБОК В ЦИКЛЕ; DADR = CONST.
;   WR1    - 1 ИЛИ 0, ЕСЛИ 1-Я ИЛИ 2-Я ПОЛОВИНЫ ПАМЯТИ
;   WR2    = R - СТОЛБЕЦ;  WR3 = I - СТРОКА;  WR4 = J - СТОЛБЕЦ.
;
CJP А=CONTE,МАР=РЕ
CONTE:CONT А=НЕ,%Т%
CJS А=INITST,МАР=РЕ
;ПИШЕМ БЛОКИРОВКИ В РР (БП=1 И Т.Д.)
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
CONT А=МВ,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=ВУТЕ
;ОБНУЛЯЕМ НОМЕР ЦИКЛА
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=MANT
;ЧИТАЕМ CONST
CONT А=ZER,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=DADR
;0 - В HALF (.OR.С 1 В 17 РАЗРЯДЕ = ОБРАЩЕНИЕ К 1-Й ИЛИ 2-Й ПОЛОВИНЕ ПАМЯТИ)
CONT А=ZER,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=HALF
;
;ЗАПИСЫВАЕМ CONST В ПАМЯТЬ
WRMEME:CONT А=ZER,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РС
CCWFE:CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG
CJS А=OUTADR,МАР=РЕ,ALUS=ZА,RА=DADR,Н,ALU,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
;ЖДЕМ ГОТ.АРБИТРА, РС+1 - В РГ.Q (ДЛЯ СРАВНЕНИЯ С МАХ ADR.+ 1)
WWFE:CJP А=WWFE,МАР=РЕ,COND=ARBRDY,IСС,ALUS=ZА,RА=РС,Н,CI,ALUD=Q
;СРАВНИВАЕМ АДРЕС
CONT А=В18,DSRC=PROM,ALUS=DQ,FUNC=EXOR,CEN
CONT SТОРС=21
CJP А=CCWFE,МАР=РЕ,COND=СТ,SТОРС=21
;ЗАДЕРЖКА ПОСЛЕ ЗАПИСИ
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR5
WAITWE:CONT А=В20,DSRC=PROM,ALUS=DА,RА=WR5,FUNC=EXOR,Н,CEN
CONT ALUS=ZВ,RВ=WR5,Н,CI,ALUD=В,SТОРС=21
CJP А=WAITWE,МАР=РЕ,COND=СТ,SТОРС=21
;
;УСТАНАВЛИВАЕМ НАЧАЛЬНЫЕ ЗНАЧЕНИЯ: ОБНУЛЯЕМ КОЛИЧЕСТВО ОШИБОК В ЦИКЛЕ
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=EXPN
;R (WR2) = 0, WR1 = 1 ДЛЯ 1-Й ПОЛОВИНЫ ПАМЯТИ
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR2
CONT А=С1,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=WR1
;
;БОЛЬШОЙ ЦИКЛ:
;I (WR3) = 0; ЕСЛИ R = 0, I=1 ДЛЯ 1-Й ПОЛОВИНЫ ПАМЯТИ; =0 ДЛЯ 2-Й (ЧИСЛО ИЗ WR1)
BCILEE:CONT ALUS=ZА,RА=WR2,Н,CEN
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR3,SТОРС=21
CJP А=LCIL1E,МАР=РЕ,COND=СТ,SТОРС=21
CONT ALUS=ZА,RА=WR1,Н,ALUD=В,RВ=WR3
;1-Й ЦИКЛ: ПИШЕМ В СТОЛБЕЦ А(I,R) - /CONST, ЕСЛИ I+R - ЧЕТНОЕ, ИНАЧЕ - CONST
;ВЫЧИСЛЯЕМ ПОЛНЫЙ АДРЕС, I+R - ЧЕТНОЕ?
LCIL1E:CONT ALUS=АВ,RА=WR3,RВ=WR2,FUNC=ADD,Н,ALUD=Q
CONT А=С1,DSRC=PROM,ALUS=DQ,FUNC=AND,Н,CEN
CONT ALUS=АВ,RА=HALF,RВ=WR3,Н,ALUD=Q,SТОРС=21
CJP А=NZCMPE,МАР=РЕ,COND=СТ,SТОРС=21
>,ALUS=DQ,Н,ALUD=ВА,RА=WR2,RВ=РС,ALU,DSRC=SHIFT,MPS,PSHF=SН0-8,SHF=LOG
;ЧЕТНОЕ, ПИШЕМ /CONST
CJP А=TOGEE,МАР=РЕ,ALUS=ZА,RА=DADR,FUNC=EXNOR,Н,ALU,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
;НЕЧЕТНОЕ, ПИШЕМ CONST
NZCMPE:CONT ALUS=ZА,RА=DADR,Н,ALU,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
TOGEE:CONT ALUS=ZА,RА=РС,Н,ALUD=В,RВ=РССОРУ,ALU,YDST=ADRREG
CJS А=OUTADR,МАР=РЕ,YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
WAWIDE:CJP А=WAWIDE,МАР=РЕ,COND=ARBRDY,IСС
;I = 255? I = I + 1
CONT А=МВ,DSRC=PROM,ALUS=DА,RА=WR3,FUNC=EXOR,Н,CEN
CONT ALUS=ZВ,RВ=WR3,Н,CI,ALUD=В,SТОРС=21
CJP А=LCIL1E,МАР=РЕ,COND=СТ,SТОРС=21
;
;НАЧАЛО ПАУЗЫ:
;2-Й ЦИКЛ:ПРОВЕРКА НА CONST "ПОСТОРОННЕГО" СТОЛБЦА А(I,J);I=0,...L, J НЕ РАВНО R
;I (WR3) = 0, J (WR4) = 1; ЕСЛИ J = R, J = J + 1, INTR = 1,2
CONT А=С1,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=WR4
CONT ALUS=АВ,RА=WR4,RВ=WR2,FUNC=EXOR,Н,CEN
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR3,SТОРС=21
CJP А=LCIL2E,МАР=РЕ,COND=СТ,SТОРС=21,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=INTR
CONT ALUS=ZВ,RВ=WR4,Н,CI,ALUD=В
;ВЫЧИСЛЯЕМ АДРЕС
LCIL2E:CONT ALUS=АВ,RА=HALF,RВ=WR3,Н,ALUD=Q,YDST=CCLR
CONT ALUS=DQ,Н,ALUD=ВА,RА=WR4,RВ=РССОРУ,ALU
>,DSRC=SHIFT,MPS,PSHF=SН0-8,SHF=LOG
CJS А=СМРРСС,МАР=РЕ
;ВЕСЬ СТОЛБЕЦ? I = 255? I = I + 1
CONT А=МВ,DSRC=PROM,ALUS=DА,RА=WR3,FUNC=EXOR,Н,CEN
CONT ALUS=ZВ,RВ=WR3,Н,CI,ALUD=В,SТОРС=21
CJP А=LCIL2E,МАР=РЕ,COND=СТ,SТОРС=21
;КОНЕЦ ПАУЗЫ
;
;3-Й ЦИКЛ: ПРОВЕРКА КОНТРОЛЬНОГО СТОЛБЦА А(I,R), I=0,...L
;ЕСЛИ I+R - ЧЕТНОЕ, СРАВНИВАЕМ С /CONST: INTR=3,4; ИНАЧЕ - С CONST: INTR=5,6
;I = 0 ИЛИ 1
CONT ALUS=ZА,RА=WR2,Н,CEN
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR3,SТОРС=21
CJP А=LCIL3E,МАР=РЕ,COND=СТ,SТОРС=21
CONT ALUS=ZА,RА=WR1,Н,ALUD=В,RВ=WR3
;I + R - ЧЕТНОЕ?
LCIL3E:CONT ALUS=АВ,RА=WR2,RВ=WR3,FUNC=ADD,Н,ALUD=Q
CONT А=С1,DSRC=PROM,ALUS=DQ,FUNC=AND,Н,CEN
;ВЫЧИСЛЯЕМ АДРЕС HALF + R(WR2)<<8 + I(WR3)
CONT ALUS=АВ,RА=HALF,RВ=WR3,Н,ALUD=Q,SТОРС=21
CJP А=NEQ1E,МАР=РЕ,COND=СТ,SТОРС=21,ALUS=DQ,Н,ALUD=ВА,RА=WR2,RВ=РС,ALU
>,DSRC=SHIFT,MPS,PSHF=SН0-8,SHF=LOG
;I + R - ЧЕТНОЕ, СРАВНИВАЕМ С /CONST; INTR = 3,4
CONT А=С2,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=INTR,YDST=CCLR
CJS А=DCMPD0,МАР=РЕ,ALUS=ZВ,RВ=DADR,FUNC=EXNOR,Н,ALUD=В
;ВОССТАНАВЛИВАЕМ CONST
CJP А=NХТЕ,МАР=РЕ,ALUS=ZВ,RВ=DADR,FUNC=EXNOR,Н,ALUD=В
;R + I - НЕЧЕТНОЕ, СРАВНЕНИЕ С CONST, INTR = 5,6
NEQ1E:CONT А=С4,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=INTR,YDST=CCLR
CJS А=DCMPD0,МАР=РЕ
;КОНЕЦ СТОЛБЦА? I = 255? I = I + 1
NХТЕ:CONT А=МВ,DSRC=PROM,ALUS=DА,RА=WR3,FUNC=EXOR,Н,CEN
CONT ALUS=ZВ,RВ=WR3,Н,CI,ALUD=В,SТОРС=21
CJP А=LCIL3E,МАР=РЕ,COND=СТ,SТОРС=21
;
;I = 0 ИЛИ 1
CONT ALUS=ZА,RА=WR2,Н,CEN
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR3,SТОРС=21
CJP А=LCIL4E,МАР=РЕ,COND=СТ,SТОРС=21
CONT ALUS=ZА,RА=WR1,Н,ALUD=В,RВ=WR3
;4-Й ЦИКЛ: ВОССТАНАВЛИВАЕМ В КОНТРОЛЬНОМ СТОЛБЦЕ А(I,R) CONST
LCIL4E:CONT ALUS=АВ,RА=HALF,RВ=WR3,Н,ALUD=Q
CONT ALUS=DQ,Н,ALUD=ВА,RА=WR2,RВ=РС,ALU,DSRC=SHIFT,MPS,PSHF=SН0-8,SHF=LOG
CONT ALUS=ZА,RА=РС,ALU,YDST=ADRREG
CONT ALUS=ZА,RА=DADR,Н,ALU,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
WAWIEE:CJP А=WAWIEE,МАР=РЕ,COND=ARBRDY,IСС
;I = 255? I = I + 1
CONT А=МВ,DSRC=PROM,ALUS=DА,RА=WR3,FUNC=EXOR,Н,CEN
CONT ALUS=ZВ,RВ=WR3,Н,CI,ALUD=В,SТОРС=21
CJP А=LCIL4E,МАР=РЕ,COND=СТ,SТОРС=21
;
;R = 255? R = R + 1
CONT А=МВ,DSRC=PROM,ALUS=DА,RА=WR2,FUNC=EXOR,Н,CEN
CONT ALUS=ZВ,RВ=WR2,Н,CI,ALUD=В,SТОРС=21
CJP А=BCILEE,МАР=РЕ,COND=СТ,SТОРС=21
;
;ПРОВЕРИЛИ ЛИ ВТОРУЮ ПОЛОВИНУ ПАМЯТИ? R = 0, WR1 = 0 (ДЛЯ НАЧАЛЬНОГО АДРЕСА I)
CONT А=В17,DSRC=PROM,ALUS=DА,RА=HALF,FUNC=EXOR,Н,ALUD=В,RВ=HALF,CEN
CONT SТОРС=21,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR2
CJP А=BCILEE,МАР=РЕ,COND=СТ,SТОРС=21,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR1
;ВСЕ. ПИШЕМ В БОПП N ЦИКЛА И ЧИСЛО ОШИБОК; ЗАДЕРЖКА
CJS А=OUTEMH,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR5
CWAITE:CONT А=В4,DSRC=PROM,ALUS=DА,RА=WR5,FUNC=EXOR,Н,CEN
CONT ALUS=ZВ,RВ=WR5,Н,CI,ALUD=В,SТОРС=21
CJP А=CWAITE,МАР=РЕ,COND=СТ,SТОРС=21
;+1 К НОМЕРУ ЦИКЛА
CONT ALUS=ZВ,RВ=MANT,Н,CI,ALUD=В
;ИНВЕРСИЯ CONST, ПОВТОРЕНИЕ
CJP А=WRMEME,МАР=РЕ,ALUS=ZВ,RВ=DADR,FUNC=EXNOR,Н,ALUD=В
END
*END
*NО LIST
*CALL MPSEND:МЕМ=800
*END F
*END FILE
