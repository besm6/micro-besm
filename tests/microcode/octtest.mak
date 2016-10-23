*NАМЕ 11:OCTTEST1
*       ДОПОЛНИТЕЛЬНЫЕ ТЕСТЫ
*TIME:01.00
*DISC:664/SYSTEM,microb
*FILE:arc,30,W
*file:lib,67,r
*LIBRA:23,25
*CALL ficMEMORY
*peRSO:67
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
ОСТ:PROG;
;     ====================================================
;     ТЕСТЫ ПАМЯТИ ПП, ДОСТУПНОЙ ЦП. АДРЕСА: F0000 - F07FF
;     ====================================================
;
;    РАСПРЕДЕЛЕНИЕ РЕГИСТРОВ   Б О П П  ДЛЯ ТЕСТОВ:
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
EXTERN RDADR,OUTADR,RDDAT,OUTDAT,OUTEMH,INITST,INITSM
EXTERN ERRTST,OUT4/7,OUT8/F,ERRINH,CTTSTP,ERRDAF,ERRINQ,ERRINF
;
ОЗУ1:ENTRY
;===== ОДИНОЧНАЯ ЗАПИСЬ ЗАДАННОГО ЧИСЛА ПО ЗАДАННОМУ АДРЕСУ
;   3-6 РГ.БОПП - АДРЕС; 8-15 РГ.БОПП - ДАННЫЕ; 7 РГ.БОПП - ТЕГ
;   ТЕСТЫ ОЗУ1-3 МОЖНО ИСПОЛЬЗОВАТЬ ДЛЯ ЗАПИСИ/ЧТЕНИЯ В/У, В ЧАСТНОСТИ, ПП,
;   ЗАДАВАЯ СООТВЕТСТВУЮЩИМ ОБРАЗОМ АДРЕС В 0-3 РГ.БОПП!
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
ОЗУПП4:ENTRY
;===== ЗАПИСЬ CONST В ПАМЯТЬ ПП; ЦИКЛ ПО ВСЕМ АДРЕСАМ; ЧТЕНИЕ; СРАВНЕНИЕ
;   РС - АДРЕС; А - ПРОЧИТАННЫЕ ДАННЫЕ; У - ТЕГ; DADR - ЗАПИСЫВАЕМЫЕ ДАННЫЕ;
;   HALF - ЗАПИСЫВАЕМЫЙ ТЕГ; Q - РЕЗ-Т СРАВНЕНИЯ; INTR - ТИП ПРОВЕРКИ;
;   EXPN - ЧИСЛО ОШИБОК; MANT - НОМЕР ЦИКЛА ЧТЕНИЯ.
;
CJP А=СРР4,МАР=РЕ
СРР4:CONT А=Н4,%Т%
CJS А=INITST,МАР=РЕ
;ПИШЕМ БЛОКИРОВКИ В РР (БП=1 И Т.Д.)
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=MANT
;ЧИТАЕМ CONST В РГ.DADR И HALF, КОТОРУЮ БУДЕМ ЗАПИСЫВАТЬ В ОЗУ
CONT А=CFFF,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=DADR,ALU,ЕСВ,WRB,BRA=RG3
CONT А=CFFF,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=HALF,ALU,YDEVT=ECBTAG,WRB,BRA=RG3
;НАЧАЛЬНЫЙ АДРЕС "FFFF 0000" - В РГ.РС
CONT А=В17,DSRC=PROM,ALUS=DZ,FUNC=SUBR,Н,CI,ALUD=В,RВ=РС,ALU,YDST=ADRREG
PUSH А=$7FF,МАР=РЕ
;ПИШЕМ В ОЗУ: ФИЗ.АДРЕС - В RG0, ДАННЫЕ - УЖЕ В БОИ!
CJS А=OUTADR,МАР=РЕ,YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
WРР4:CJP А=WРР4,МАР=РЕ,COND=ARBRDY,IСС
RFCT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG
;
;ЦИКЛ НА ЧТЕНИЕ
;"F0000-1"- В РГ.РС, 0 - В РГ.ЧИСЛА ОШИБОК (EXPN), +1 К РГ.НОМЕРА ЦИКЛА (MANT)
RМРР4:CONT А=В17,DSRC=PROM,ALUS=DZ,FUNC=SUBR,Н,ALUD=В,RВ=РС
CONT ALUS=ZВ,RВ=MANT,Н,CI,ALUD=В
PUSH А=$7FF,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=EXPN
;П/У НА П/П ЧТЕНИЯ И СРАВНЕНИЯ ДАННЫХ
CJS А=CMPDH,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=INTR
RFCT
;П/У НА ВЫДАЧУ В БОПП НОМЕРА ЦИКЛА И ЧИСЛА ОШИБОК
CJS А=OUTEMH,МАР=РЕ
CJP А=RМРР4,МАР=РЕ
;
;
;П/П ЧТЕНИЯ ДАННЫХ, СРАВНЕНИЯ С DADR И HALF И ВЫДАЧИ ИХ В БОПП ПРИ НЕСОВПАДЕНИИ
CMPDH:CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG
;Ф.А. + КОП НА ЧТЕНИЕ ДАННЫХ
CJS А=OUTADR,МАР=РЕ,YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DRD
;ЖДЕМ ГОТ.АРБИТРА
WRDCMP:CJP А=WRDCMP,МАР=РЕ,COND=ARBRDY,IСС
;ЧИТАЕМ ДАННЫЕ, СРАВНИВАЕМ
CONT ЕСА,ARA=RG2,ALUS=DZ,Н,ALUD=В,RВ=А
CONT %ТУРЕ%
CONT ALUS=АВ,RА=А,RВ=DADR,FUNC=EXOR,Н,ALUD=Q,СЕМ
;П/У НА ВЫДАЧУ РГ.В БОПП, ЕСЛИ НЕСОВПАДЕНИЕ, ЧИТАЕМ ТЕГ
CJS А=ERRCMP,МАР=РЕ,COND=СТ,SТОРС=37,YDEVT=ECBTAG,BRA=RG2
>,DSRC=SHIFT,MPS,PSHF=SН0,SHF=LOG,ALUS=DZ,Н,ALUD=В,RВ=У
CONT ALUS=АВ,RА=HALF,RВ=У,FUNC=EXOR,ALUD=Q
CONT А=МВ,DSRC=PROM,ALUS=DQ,FUNC=AND,Н,ALUD=Q,CEN
CRTN COND=СТ,SТОРС=20,%ТУРЕ%
;+1 К ЧИСЛУ ОШИБОК; П/У НА ВЫДАЧУ ДАННЫХ В БОПП, ВОЗВРАТ
ERRCMP:CJP А=ERRDAF,МАР=РЕ,ALUS=ZВ,RВ=EXPN,Н,CI,ALUD=В
;
;П/П ЧТЕНИЯ ДАННЫХ, СРАВНЕНИЯ С DADR (ТЕГ = МЛ.РАЗРЯДАМ DADR), ВЫДАЧИ ИХ В БОПП
CMPD0:CJP А=CMPD+1,МАР=РЕ,ALUS=ZА,RА=РС,ALU,YDST=ADRREG
CMPD:CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG
;Ф.А. + КОП НА ЧТЕНИЕ ДАННЫХ
CJS А=OUTADR,МАР=РЕ,YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DRD
;ЖДЕМ ГОТ.АРБИТРА
CMPWA:CJP А=CMPWA,МАР=РЕ,COND=ARBRDY,IСС
;ЧИТАЕМ ДАННЫЕ, СРАВНИВАЕМ
CONT ЕСА,ARA=RG2,ALUS=DZ,Н,ALUD=В,RВ=А
CONT %ТУРЕ%
CONT ALUS=АВ,RА=А,RВ=DADR,FUNC=EXOR,Н,ALUD=Q,СЕМ
;П/У НА ВЫДАЧУ РГ.В БОПП, ЕСЛИ НЕСОВПАДЕНИЕ, ЧИТАЕМ ТЕГ
CJS А=ERRCMP,МАР=РЕ,COND=СТ,SТОРС=37,YDEVT=ECBTAG,BRA=RG2
>,DSRC=SHIFT,MPS,PSHF=SН0,SHF=LOG,ALUS=DZ,Н,ALUD=В,RВ=У
CONT ALUS=АВ,RА=DADR,RВ=У,FUNC=EXOR,ALUD=Q
CONT А=МВ,DSRC=PROM,ALUS=DQ,FUNC=AND,Н,ALUD=Q,CEN
CRTN COND=СТ,SТОРС=20,%ТУРЕ%
;+1 К ЧИСЛУ ОШИБОК; П/У НА ВЫДАЧУ ДАННЫХ В БОПП, ВОЗВРАТ
CJP А=ERRDAF,МАР=РЕ,ALUS=ZВ,RВ=EXPN,Н,CI,ALUD=В
;
;
ОЗУПП5:ENTRY
;===== ЗАПИСЬ ФОНА; ЗАПИСЬ ДАННЫХ=АДРЕСУ В ПРЯМОМ НАПРАВ.;ЛИН.АЛГОРИТМ ТИПА N
;   ЗАПИСЬ В ПАМЯТЬ (ТЕГ=ДАННЫМ); ЧТЕНИЕ С ЗАДЕРЖКОЙ; СРАВНЕНИЕ
;   РС   - АДРЕС, НАЧИНАЯ С 1; ОН ЖЕ ДАННЫЕ
;   А    - ЧТО ПРОЧИТАЛИ В РАЗРЯДАХ ДАННЫХ, У - ТЕГА; Q - РЕЗ-Т СРАВНЕНИЯ
;   INTR = 1(ДАННЫЕ),2(ТЕГ), ЕСЛИ ПРОВЕРЯЕМ "ФОН"; = 3,4 - ЕСЛИ ОСТАЛЬНОЕ
;   MANT - НОМЕР ЦИКЛА (НЕЧЕТ - ФОН, ЧЕТ - АДРЕС); EXPN - К-ВО ОШИБОК.
;
CJP А=PSPP5,МАР=РЕ
PSPP5:CONT А=Н5,%Т%
CJS А=INITST,МАР=РЕ
;ПИШЕМ БЛОКИРОВКИ В РР (БП=1 И Т.Д.)
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
CONT А=МВ,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=ВУТЕ
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=MANT
;"ЗАПИСЬ ФОНА": РАСПИСЫВАЕМ ВСЮ ПАМЯТЬ FF...FF
;ФОНОВУЮ CONST - В РГ.DADR, В БОИ; НАЧАЛЬНЫЙ АДРЕС ПАМЯТИ - В РС
СМРР5:CONT А=CFFF,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=DADR,ALU,YDEVT=ECBTAG,ЕСВ
>,WRB,BRA=RG3
CONT А=В17,DSRC=PROM,ALUS=DZ,FUNC=SUBR,Н,CI,ALUD=В,RВ=РС,ALU,YDST=ADRREG
PUSH А=$7FF,МАР=РЕ,ALUS=ZВ,RВ=MANT,Н,CI,ALUD=В
;ФИЗ.АДРЕС - В RG0
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
;ЖДЕМ ГОТ.АРБИТРА
WWFM5:CJP А=WWFM5,МАР=РЕ,COND=ARBRDY,IСС
RFCT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG
;
;ПРОВЕРЯЕМ "ФОН": ЧИТАЕМ FF...FF, ПИШЕМ ДАННЫЕ=АДРЕСУ; INTR=1,2
;"FFFF0000-1"- В РГ.РС (АДРЕС), N ЦИКЛА+1 - В РГ.MANT, 0 - В ЧИСЛО ОШИБОК (EXPN)
CONT А=В17,DSRC=PROM,ALUS=DZ,FUNC=SUBR,Н,ALUD=В,RВ=РС
PUSH А=$7FF,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=EXPN
;П/У НА П/П ЧТЕНИЯ "ФОНА", СРАВНЕНИЕ
CJS А=CMPD,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=INTR
;ПИШЕМ ДАННЫЕ=АДРЕСУ - В RG3 БОИ ДАННЫХ И ТЕГА
CONT ALUS=ZА,RА=РС,Н,ALU,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
;ФИЗ.АДРЕС - В RG0
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
;ЖДЕМ ГОТ.АРБИТРА
WWAM5:CJP А=WWAM5,МАР=РЕ,COND=ARBRDY,IСС
RFCT
;ВЫДАЧА В БОПП N ЦИКЛА И ЧИСЛА ОШИБОК
CJS А=OUTEMH,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR5
;ЗАДЕРЖКА, ПОКА РГ.WR5 НЕ БУДЕТ РАВЕН CONST ИЗ ПЗУ
WТРР5:CONT А=В4,DSRC=PROM,ALUS=DА,RА=WR5,FUNC=EXOR,Н,CEN
CJP А=WТРР5,МАР=РЕ,COND=СТ,SТОРС=21,ALUS=ZВ,RВ=WR5,Н,CI,ALUD=В
;
;ЧТЕНИЕ ДАННЫХ = АДРЕСУ
;НАЧАЛЬНЫЙ АДРЕС - В РС; 0 - В EXPN (ЧИСЛО ОШИБОК), MANT+1 (N ЦИКЛА), INTR=3,4
CONT А=В17,DSRC=PROM,ALUS=DZ,FUNC=SUBR,Н,ALUD=В,RВ=РС
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=EXPN
PUSH А=$7FF,МАР=РЕ,ALUS=ZВ,RВ=MANT,Н,CI,ALUD=В
CONT А=С2,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=INTR
;П/У НА П/П ЧТЕНИЯ И СРАВНЕНИЯ, ПИШЕМ В DADR ЧИСЛО, С КОТ.БУДЕМ СРАВНИВАТЬ
CJS А=CMPD,МАР=РЕ,ALUS=ZА,RА=РС,Н,CI,ALUD=В,RВ=DADR
RFCT
;ВЫДАЧА В БОПП N ЦИКЛА И ЧИСЛА ОШИБОК, ЗАДЕРЖКА
CJS А=OUTEMH,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR5
WTRPP5:CONT А=В4,DSRC=PROM,ALUS=DА,RА=WR5,FUNC=EXOR,Н,CEN
CJP А=WTRPP5,МАР=РЕ,COND=СТ,SТОРС=21,ALUS=ZВ,RВ=WR5,Н,CI,ALUD=В
CJP А=СМРР5,МАР=РЕ
;
;
ОЗУПП6:ENTRY
;===== ЗАПИСЬ ФОНА; ЗАПИСЬ ДАННЫХ=АДРЕСУ, СДВИГАЕМОМУ В ПРЕДЕЛАХ 64 РАЗР.
;   ЗАПИСЬ В ПАМЯТЬ (ТЕГ=ДАННЫМ); ЧТЕНИЕ С ЗАДЕРЖКОЙ; СРАВНЕНИЕ
;   РС - АДРЕС, НАЧИНАЯ С 1; ОН ЖЕ ДАННЫЕ, СДВИНУТЫЕ НА 0,16,32,48 РАЗР.ВПРАВО
;   А - ЧТО ПРОЧИТАЛИ В РАЗРЯДАХ ДАННЫХ, У - ТЕГА; Q - РЕЗ-Т СРАВНЕНИЯ
;   INTR = 1,2, ЕСЛИ ПРОВЕРЯЕМ "ФОН"; 3,4 - ЕСЛИ ОСТАЛЬНОЕ
;   MANT - НОМЕР ЦИКЛА ЧТЕНИЯ (0, ЕСЛИ ПРОВЕРЯЕМ "ФОН"); EXPN - К-ВО ОШИБОК
;   HALF - ЧИСЛО СДВИГОВ АДРЕСА ДЛЯ ПОЛУЧЕНИЯ ДАННЫХ
;
CJP А=СМРР6,МАР=РЕ
СМРР6:CONT А=Н6,%Т%
CJS А=INITST,МАР=РЕ
;ПИШЕМ БЛОКИРОВКИ В РР (БП=1 И Т.Д.)
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
CONT А=МВ,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=ВУТЕ
;ЧИТАЕМ ФОНОВУЮ CONST, ОБНУЛЯЕМ ЧИСЛО СДВИГОВ (HALF) И ЧИСЛО ЦИКЛОВ (MANT)
CONT А=CFFF,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=DADR,ALU,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=MANT
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=HALF
;"ЗАПИСЬ ФОНА": РАСПИСЫВАЕМ ВСЮ ПАМЯТЬ FF...FF
ССРР6:CONT А=В17,DSRC=PROM,ALUS=DZ,FUNC=SUBR,Н,CI,ALUD=В,RВ=РС,ALU,YDST=ADRREG
PUSH А=$7FF,МАР=РЕ
;ФИЗ.АДРЕС НА ЗАПИСЬ
CJS А=OUTADR,МАР=РЕ,YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
WWFM6:CJP А=WWFM6,МАР=РЕ,COND=ARBRDY,IСС
RFCT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG
;
;ПРОВЕРЯЕМ "ФОН": ЧИТАЕМ FF...FF, ПИШЕМ ДАННЫЕ="СДВИНУТОМУ" АДРЕСУ
;НАЧАЛЬНЫЙ АДРЕС - В РС; УСТАН.В 0 ЧИСЛО ОШИБОК (EXPN); INTR=1,2
CONT А=В17,DSRC=PROM,ALUS=DZ,FUNC=SUBR,Н,ALUD=В,RВ=РС
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=EXPN
;ВЫЧИСЛЯЕМ ПАРАМЕТР СДВИГА - В РГ.ПАРАМЕТРА СДВИГА; +1 К N ЦИКЛА (MANT)
CONT А=S0,DSRC=PROM,ALUS=DА,RА=HALF,ALU,YDST=PSHIFT
PUSH А=$7FF,МАР=РЕ,ALUS=ZВ,RВ=MANT,Н,CI,ALUD=В
;П/У НА П/П ЧТЕНИЯ "ФОНА", СРАВНЕНИЕ
CJS А=CMPD,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=INTR
;ПИШЕМ ДАННЫЕ=СДВИНУТОМУ АДРЕСУ - В RG3 БОИ ДАННЫХ И ТЕГА
CONT ALUS=DZ,Н,ALUD=ВА,RА=РС,RВ=WR4,ALU,DSRC=SHIFT,SHF=LOG
CONT ALUS=ZА,RА=WR4,Н,ALU,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
;ФИЗ.АДРЕС НА ЗАПИСЬ
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
WWAM6:CJP А=WWAM6,МАР=РЕ,COND=ARBRDY,IСС
RFCT
;ВЫДАЧА В БОПП N ЦИКЛА И ЧИСЛА ОШИБОК
CJS А=OUTEMH,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR5
;ЗАДЕРЖКА, ПОКА РГ.WR5 НЕ БУДЕТ РАВЕН CONST ИЗ ПЗУ
WТМ6:CONT А=В4,DSRC=PROM,ALUS=DА,RА=WR5,FUNC=EXOR,Н,CEN
CJP А=WТМ6,МАР=РЕ,COND=СТ,SТОРС=21,ALUS=ZВ,RВ=WR5,Н,CI,ALUD=В
;
;ЧТЕНИЕ ДАННЫХ = АДРЕСУ
;НАЧАЛЬНЫЙ АДРЕС - В РС; 0 - В EXPN (ЧИСЛО ОШИБОК), MANT+1 (N ЦИКЛА), INTR=3,4
CONT А=В17,DSRC=PROM,ALUS=DZ,FUNC=SUBR,Н,ALUD=В,RВ=РС
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=EXPN
PUSH А=$7FF,МАР=РЕ,ALUS=ZВ,RВ=MANT,Н,CI,ALUD=В
;П/У НА П/П ЧТЕНИЯ И СРАВНЕНИЯ, ПИШЕМ В DADR ЧИСЛО, С КОТ.БУДЕМ СРАВНИВАТЬ
CONT ALUS=ZА,RА=РС,Н,CI,ALUD=В,RВ=DADR
CONT А=С2,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=INTR
CJS А=CMPD,МАР=РЕ,ALUS=DZ,Н,ALUD=ВА,RА=DADR,RВ=DADR,ALU,DSRC=SHIFT,SHF=LOG
RFCT
;ВЫДАЧА В БОПП N ЦИКЛА И ЧИСЛА ОШИБОК, ЗАДЕРЖКА
CJS А=OUTEMH,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR5
WRDM6:CONT А=В4,DSRC=PROM,ALUS=DА,RА=WR5,FUNC=EXOR,Н,CEN
CJP А=WRDM6,МАР=РЕ,COND=СТ,SТОРС=21,ALUS=ZВ,RВ=WR5,Н,CI,ALUD=В
;УВЕЛИЧИВЕМ ПАРАМЕТР СДВИГА, МАСКА НА 6 РАЗРЯДОВ
CONT А=В5,DSRC=PROM,ALUS=DА,RА=HALF,FUNC=ADD,Н,ALUD=В,RВ=HALF
CONT А=С63,DSRC=PROM,ALUS=DА,RА=HALF,FUNC=AND,Н,ALUD=В,RВ=HALF
CJP А=ССРР6,МАР=РЕ
;
;
ОЗУПП7:ENTRY
;===== ЗАПИСЬ "БУГУЩЕГО 0" В ПАМЯТЬ В ОБРАТНОМ НАПРАВЛЕНИИ
;   ЗАПИСЬ В ПАМЯТЬ (ТЕГ=ДАННЫМ); ЧТЕНИЕ С ЗАДЕРЖКОЙ; СРАВНЕНИЕ
;   РС   - АДРЕС, ОТ МАХ ДО 1, Т.Е. В ОБРАТНОМ НАПРАВЛЕНИИ!
;   DADR - СНАЧАЛА ФОНОВАЯ CONST, ЗАТЕМ ЧИСЛО С "БЕГУЩИМ 0" (=WR4 ПРИ ЗАПИСИ)
;   А    - ЧТО ПРОЧИТАЛИ В РАЗРЯДАХ ДАННЫХ, У - ТЕГА; Q - РЕЗ-Т СРАВНЕНИЯ
;   INTR = 1,2, ЕСЛИ ПРОВЕРЯЕМ "ФОН"; 3,4 - ЕСЛИ ОСТАЛЬНОЕ
;   MANT - НОМЕР ЦИКЛА ЧТЕНИЯ (0, ЕСЛИ ПРОВЕРЯЕМ "ФОН"); EXPN - ЧИСЛО ОШИБОК.
;
CJP А=СМРР7,МАР=РЕ
СМРР7:CONT А=Н7,%Т%
CONT А=INITST,МАР=РЕ
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
CONT А=МВ,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=ВУТЕ
;"ЗАПИСЬ ФОНА": РАСПИСЫВАЕМ ВСЮ ПАМЯТЬ FF...FF
;ЧИТАЕМ ФОНОВУЮ CONST В РГ.DADR, ПИШЕМ МАХ АДРЕС В РС: FFFF 0800
CONT А=CFFF,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=DADR,ALU,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
CONT А=В17,DSRC=PROM,ALUS=DZ,FUNC=SUBR,Н,CI,ALUD=В,RВ=РС
CONT А=В12,DSRC=PROM,ALUS=DА,RА=РС,FUNC=OR,Н,ALUD=В,RВ=РССОРУ
PUSH А=$7FF,МАР=РЕ,ALUS=ZА,RА=РССОРУ,FUNC=SUBR,Н,ALUD=В,RВ=РС,ALU,YDST=ADRREG
;ФИЗ.АДРЕС - В RG0
CJS А=OUTADR,МАР=РЕ,YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
;ЖДЕМ ГОТ.АРБИТРА
WWFM7:CJP А=WWFM7,МАР=РЕ,COND=ARBRDY,IСС
RFCT ALUS=ZВ,RВ=РС,FUNC=SUBR,Н,ALUD=В,ALU,YDST=ADRREG
;
;ПРОВЕРЯЕМ "ФОН",  ПИШЕМ "БЕГУЩИЙ 0"
;РС = МАХ АДРЕСУ, N ЦИКЛА (MANT), ЧИСЛО ОШИБОК (EXPN), INTR=1,2
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=MANT
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=EXPN
;ПИШЕМ В WR4 FFF...FFE, КОТОРУЮ БУДЕМ СДВИГАТЬ
CONT А=С1,DSRC=PROM,ALUS=DZ,FUNC=EXNOR,Н,ALUD=В,RВ=WR4
PUSH А=$7FF,МАР=РЕ,ALUS=ZА,RА=РССОРУ,Н,ALUD=В,RВ=РС
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=INTR
;РС-1 - В РС; П/У НА П/П ЧТЕНИЯ "ФОНА", СРАВНЕНИЕ
CJS А=CMPD+1,МАР=РЕ,ALUS=ZВ,RВ=РС,FUNC=SUBR,Н,ALUD=В,ALU,YDST=ADRREG
;ПИШЕМ "БЕГУЩИЙ 0" - В RG3 БОИ ДАННЫХ И ТЕГА, СДВИГАЕМ ЦИЛИЧЕСКИ ВЛЕВО
CONT ALUS=ZА,RА=WR4,Н,ALUD=LSB,RВ=WR4,SHMUX=RSLRSL,ALU,YDEVT=ECBTAG,ЕСВ
>,WRB,BRA=RG3
;АДРЕС - ТОТ ЖЕ
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
WWMPP7:CJP А=WWMPP7,МАР=РЕ,COND=ARBRDY,IСС
RFCT
;ВЫДАЧА В БОПП N ЦИКЛА И ЧИСЛА ОШИБОК
ССРР7:CJS А=OUTEMH,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR5
;ЗАДЕРЖКА, ПОКА РГ.WR5 НЕ БУДЕТ РАВЕН CONST ИЗ ПЗУ
WАТЕМ7:CONT А=В4,DSRC=PROM,ALUS=DА,RА=WR5,FUNC=EXOR,Н,CEN
CJP А=WАТЕМ7,МАР=РЕ,COND=СТ,SТОРС=21,ALUS=ZВ,RВ=WR5,Н,CI,ALUD=В
;
;ЦИКЛ НА ЧТЕНИЕ
;РС = МАХ АДРЕСУ; 0 - В EXPN (ЧИСЛО ОШИБОК), MANT+1 (N ЦИКЛА); INTR=3,4
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=EXPN
CONT ALUS=ZВ,RВ=MANT,Н,CI,ALUD=В
CONT А=С1,DSRC=PROM,ALUS=DZ,FUNC=EXNOR,Н,ALUD=В,RВ=WR4
PUSH А=$7FF,МАР=РЕ,ALUS=ZА,RА=РССОРУ,Н,ALUD=В,RВ=РС
CONT А=С2,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=INTR
;П/У НА П/П ЧТЕНИЯ И СРАВНЕНИЯ, ПИШЕМ В DADR ЧИСЛО, С КОТ.БУДЕМ СРАВНИВАТЬ
CONT ALUS=ZВ,RВ=РС,FUNC=SUBR,Н,ALUD=В,ALU,YDST=ADRREG
CJS А=CMPD+1,МАР=РЕ,ALUS=ZА,RА=WR4,Н,ALUD=В,RВ=DADR
RFCT ALUS=ZВ,RВ=WR4,Н,ALUD=LSB,SHMUX=RSLRSL
CJP А=ССРР7,МАР=РЕ
;
;
;      ======================================
;      ЧАСЫ И ТАЙМЕР АСТРОНОМИЧЕСКОГО ВРЕМЕНИ
;      ======================================
;
;   ПРОСТО ПИСАТЬ И ЧИТАТЬ ЧАСЫ И ТАЙМЕР АСТРОНОМИЧЕСКОГО ВРЕМЕНИ
;   МОЖНО ПРОГРАММАМИ ОДИНОЧНОГО ЧТЕНИЯ/ЗАПИСИ ОЗУ
;   С ЗАДАННЫМ В 3-6 РГ.БОПП АДРЕСОМ!
;
ATWR:ENTRY
;===== ЗАПИСЬ РГ.А В ЧАСЫ АСТРОНОМИЧЕСКОГО ВРЕМЕНИ (64 РАЗРЯДА)
;
;АДРЕС ЧАСОВ АСТР.ВРЕМЕНИ - В АИСП., RG0 (ЧТОБ НЕ ЗАВИСЕТЬ ОТ БП!)
CONT А=С7,DSRC=PROM,ALUS=DZ,FUNC=EXNOR,Н,ALU,YDST=ADRREG,ЕСВ,WRB,BRA=RG0
;ПИШЕМ В ОЗУ:
CONT ALUS=ZА,RА=А,Н,ALU,ЕСВ,WRB,BRA=RG3
CONT YDEV=PHYSAD,ARBI=DWR
WWAT:CJP А=WWAT,МАР=РЕ,COND=ARBRDY,IСС
CRTN
;
;
ATRD:ENTRY
;===== ЧТЕНИЕ ЧАСОВ АСТРОНОМИЧЕСКОГО ВРЕМЕНИ В РГ.У
;
;АДРЕС ЧАСОВ АСТРОН.ВРЕМЕНИ - В АИСП., RG0 (ЧТОБ НЕ ЗАВИСЕТЬ ОТ БП!)
CONT А=С7,DSRC=PROM,ALUS=DZ,FUNC=EXNOR,Н,ALU,YDST=ADRREG,ЕСВ,WRB,BRA=RG0
;ЧИТАЕМ ИЗ ОЗУ:
CONT YDEV=PHYSAD,ARBI=DRD
WRAT:CJP А=WRAT,МАР=РЕ,COND=ARBRDY,IСС
CRTN ЕСА,ARA=RG2,ALUS=DZ,Н,ALUD=В,RВ=У
;
;
ATTWR:ENTRY
;===== ЗАПИСЬ РГ.А В ТАЙМЕР АСТРОНОМИЧЕСКОГО ВРЕМЕНИ (64 РАЗРЯДА)
;
;АДРЕС ТАЙМЕРА АСТР.ВРЕМЕНИ - В АИСП., RG0 (ЧТОБ НЕ ЗАВИСЕТЬ ОТ БП!)
CONT А=В3,DSRC=PROM,ALUS=DZ,FUNC=EXNOR,Н,ALU,YDST=ADRREG,ЕСВ,WRB,BRA=RG0
;ПИШЕМ В ОЗУ:
CONT ALUS=ZА,RА=А,Н,ALU,ЕСВ,WRB,BRA=RG3
CONT YDEV=PHYSAD,ARBI=DWR
WWATT:CJP А=WWATT,МАР=РЕ,COND=ARBRDY,IСС
CRTN
;
;
ATTRD:ENTRY
;===== ЧТЕНИЕ ТАЙМЕРА АСТРОНОМИЧЕСКОГО ВРЕМЕНИ В РГ.У
;
;АДРЕС ТАЙМЕРА АСТРОН.ВРЕМЕНИ - В АИСП., RG0 (ЧТОБ НЕ ЗАВИСЕТЬ ОТ БП!)
CONT А=В3,DSRC=PROM,ALUS=DZ,FUNC=EXNOR,Н,ALU,YDST=ADRREG,ЕСВ,WRB,BRA=RG0
;ЧИТАЕМ ИЗ ОЗУ:
CONT YDEV=PHYSAD,ARBI=DRD
WRATT:CJP А=WRATT,МАР=РЕ,COND=ARBRDY,IСС
CRTN ЕСА,ARA=RG2,ALUS=DZ,Н,ALUD=В,RВ=У
;
;
ЧАВ8:ENTRY
;===== ВЫДАЧА В БОПП СОДЕРЖИМОГО СЧЕТЧИКА ИЗ РГ.МПС И ЧАСОВ АСТРОНОМ.ВРЕМЕНИ
;   А - СЧЕТЧИК В РГ.МПС, У - ПРОЧИТАННОЕ С ЧАСОВ; ЧИСЛА НЕ СРАВНИВАЕМ В МП!
;   4-7 РГ.БОПП - МЛАДШАЯ ПОЛОВИНА СЧЕТЧИКА В РГ.МПС, 8-15 РГ.БОПП - ЧАСЫ.
;
CJP А=CONT8,МАР=РЕ
CONT8:CONT А=Н8,%Т%
CJS А=INITST,МАР=РЕ
;БЛОКИРОВКИ - В РР, Т.К. К ЧАСАМ ДОСТУП ПО ШИНЕ!
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
;CONST - В РГ.А
CONT А=CFFF,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А
;ПИШЕМ ТО ЖЕ ИЗ РГ.А - В ЧАСЫ АСТРОНОМ.ВРЕМЕНИ (КАЖДЫЙ ЦИКЛ - РАЗНОЕ)
CICL8:CJS А=ATWR,МАР=РЕ
;ЧИТАЕМ ПЕРЕМЕННУЮ ДЛЯ ЗАДЕРЖКИ ПОСЛЕ ЗАПИСИ В ЧАСЫ АВ
CONT А=В10,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РС
;ЗАДЕРЖКА: 4 МК ЦИКЛА = 2 МКСЕК, КОТОРЫЕ ВЫЧИТАЮТСЯ ЗА 1 ЦИКЛ ИЗ ЧАСОВ
WAIT8:CONT А=С2,DSRC=PROM,ALUS=DА,RА=А,FUNC=SUBR,Н,CI,ALUD=В,RВ=А
;ЦИКЛ, ПОКА ПЕРЕМЕННАЯ ДЛЯ ЗАДЕРЖКИ НЕ БУДЕТ РАВНА 0
CONT ALUS=ZВ,RВ=РС,FUNC=SUBR,Н,ALUD=В,CEN
CJP А=WAIT8,МАР=РЕ,COND=СТ,SТОРС=21,%TIK%
;ЧИТАЕМ ЧАСЫ; П/У НА ВЫДАЧУ ЧАСОВ И СЧЕТЧИКА В МПС - В БОПП
CJS А=ATRD,МАР=РЕ
CJS А=OUT8/F,МАР=РЕ,ALUS=ZА,RА=У,Н,ALUD=В,RВ=WR6
CJS А=OUT4/7,МАР=РЕ,ALUS=ZА,RА=А,Н,ALUD=В,RВ=WR6
;ЖДЕМ ЧУТЬ-ЧУТЬ (ЧТОБ МОЖНО БЫЛО УВИДЕТЬ)
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR5
CWA8:CONT ALUS=ZВ,RВ=WR5,Н,CI,ALUD=В
CONT А=В20,DSRC=PROM,ALUS=DА,RА=WR5,FUNC=EXOR,Н,CEN
CJP А=CWA8,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
CJP А=CICL8,МАР=РЕ
;
;
ЧАВ9:ENTRY
;===== ПИШЕМ CONST ИЗ ПЗУ В ЧАСЫ СЧ.ВРЕМЕНИ,СРАВНИВАЕМ С ТОЧНОСТЬЮ ДО N РАЗРЯДОВ
;   КОЛИЧЕСТВО УБИРАЕМЫХ РАЗРЯДОВ - РАЗНОЕ, В ЗАВИСИМОСТИ ОТ ЗАПИСЫВАЕМОЙ CONST!
;   0 - НЕСОВПАДЕНИЕ НА 64 РАЗР.(СРАЗУ -1!); FF..FF - 5Р., АА..АА - 6Р.
;   4-7 РГ.БОПП - МЛ.ПОЛОВИНА ТОГО, ЧТО ПИСАЛИ; 8-15 РГ.БОПП - ЧТО ПРОЧИТАЛИ.
;
CJP А=CONT9,МАР=РЕ
CONT9:CONT А=Н9,%Т%
CJS А=INITST,МАР=РЕ
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
;ЧИТАЕМ CONST ИЗ ПЗУ В РГ.А, ПИШЕМ В ЧАСЫ
CONT А=СААА,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А
CKL9:CJS А=ATWR,МАР=РЕ
;ЧИТАЕМ, СРАВНИВАЕМ
CJS А=ATRD,МАР=РЕ
;ПЕРЕСЫЛАЕМ В БОПП
CJS А=OUT8/F,МАР=РЕ,ALUS=ZА,RА=У,Н,ALUD=В,RВ=WR6
CJS А=OUT4/7,МАР=РЕ,ALUS=ZА,RА=А,Н,ALUD=В,RВ=WR6
;СРАВНИВАЕМ
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,Н,ALUD=Q
;УБИРАЕМ МЛАДШИЕ РАЗРЯДЫ (СКОЛЬКО РАЗ СДВИНЕМ)
PUSH А=5,МАР=РЕ
RFCT ALUS=ZQ,Н,ALUD=RSBQ,RВ=WR6,SHMUX=LSLSL
;ПРОВЕРЯЕМ НА 0
CONT ALUS=ZQ,Н,CEN
CJS А=ERRTST,МАР=РЕ,COND=СТ,SТОРС=/NZ
CJP А=CKL9,МАР=РЕ,%TIK%
;
;
ЧАВА:ENTRY
;===== ПИШЕМ CONST ИЗ ПЗУ В ТАЙМЕР АСТРОНОМИЧЕСКОГО ВРЕМЕНИ, СРАВНИВАЕМ
;   8-15  РГ.БОПП - ЧТО ПРОЧИТАЛИ
;
CJP А=CONTA,МАР=РЕ
CONTA:CONT А=НА,%Т%
CJS А=INITST,МАР=РЕ
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
;ЧИТАЕМ CONST ИЗ ПЗУ В РГ.А, ПИШЕМ В ТАЙМЕР
CONT А=СААА,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А
CKLA:CJS А=ATTWR,МАР=РЕ
;ЧИТАЕМ
CJS А=ATTRD,МАР=РЕ
CJS А=OUT8/F,МАР=РЕ,ALUS=ZА,RА=У,Н,ALUD=В,RВ=WR6
;СРАВНИВАЕМ ВСЕ 64 РАЗРЯДА (ТАЙМЕР АВ НЕ СЧИТАЕТ!)
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,Н,ALUD=Q,CEN
CJS А=ERRTST,МАР=РЕ,COND=СТ,SТОРС=/NZ
CJP А=CKLA,МАР=РЕ,%TIK%
;
;
ЧАВВ:ENTRY
;===== ПИШЕМ ПЕРЕМЕННУЮ В ТАЙМЕР АСТРОНОМИЧЕСКОГО ВРЕМЕНИ, СРАВНИВАЕМ
;   8-15  РГ.БОПП - ЧТО ПРОЧИТАЛИ
;
CJP А=CONTB,МАР=РЕ
CONTB:CONT А=НВ,%Т%
CJS А=INITST,МАР=РЕ
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
;ЧИТАЕМ НАЧАЛЬНОЕ ЗНАЧЕНИЕ CONST ИЗ ПЗУ В РГ.А
CONT А=ZER,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А
;ПИШЕМ В ТАЙМЕР
CKLB:CJS А=ATTWR,МАР=РЕ,ALUS=ZВ,RВ=А,Н,CI,ALUD=В
;ЧИТАЕМ
CJS А=ATTRD,МАР=РЕ
CJS А=OUT8/F,МАР=РЕ,ALUS=ZА,RА=У,Н,ALUD=В,RВ=WR6
;СРАВНИВАЕМ ВСЕ 64 РАЗРЯДА (ТАЙМЕР АВ НЕ СЧИТАЕТ!)
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,Н,ALUD=Q,CEN
CJS А=ERRTST,МАР=РЕ,COND=СТ,SТОРС=/NZ
CJP А=CKLB,МАР=РЕ,%TIK%
;
;
ЧАВС:ENTRY
;===== ПРОВЕРЯЕМ ИЗМЕНЕНИЕ СЧЕТА ЧАСОВ АСТРОНОМИЧЕСКОГО ВРЕМЕНИ
;   4-7 РГ.БОПП - МЛ.ПОЛОВИНА ТОГО, ЧТО БЫЛО; 8-15 РГ.БОПП - ЧТО ПРОЧИТАЛИ
;
CJP А=CONTC,МАР=РЕ
CONTC:CONT А=НС,%Т%
CJS А=INITST,МАР=РЕ
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
CONT А=ZER,МАР=РЕ,ALUS=DZ,Н,ALUD=В,RВ=А
CJS А=ATWR,МАР=РЕ
;ЖДЕМ 2 МК = 1 MKS, ПОСЛЕ ЧЕГО ЧАСЫ МОЖНО ЧИТАТЬ (ПОКЗАНИЯ ДОЛЖНЫ ИЗМЕНИТЬСЯ!)
ССС:PUSH А=0,МАР=РЕ
RFCT
;ЧИТАЕМ, СРАВНИВАЕМ
CJS А=ATRD,МАР=РЕ
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,Н,ALUD=Q,CEN
;ОШИБКА, ЕСЛИ ПОКАЗАНИЯ ЧАСОВ НЕ ИЗМЕНИЛИСЬ (СОВПАЛИ)
CJS А=ERRTST,МАР=РЕ,COND=СТ,SТОРС=NZ,%TIK%
;ПОСЛЕ ИЗМЕНЕНИЯ СЧЕТА В НОВОМ ЦИКЛЕ СРАВНЕНИЕ ПРОСХОДИТ С ВНОВЬ ПРОЧИТАННЫМ!
CJP А=ССС,МАР=РЕ,ALUS=ZА,RА=У,Н,ALUD=В,RВ=А
;
;
ЧABD:ENTRY
;===== ПРОВЕРКА ОТНОСИТЕЛЬНОГО ИЗМЕНЕНИЯ СЧЕТА ЧАСОВ АСТРОНОМИЧЕСКОГО ВРЕМЕНИ
;   В 2 РАЗА ЗА N И N+N МИКРОПРОГРАММНЫХ ЦИКЛА
;   А - НАЧАЛЬНОЕ ЗНАЧЕНИЕ (ИЛИ ТОЧКА ОТСЧЕТА ПРИ ОЧЕРЕДНОЙ ИТЕРАЦИИ)
;   У - ПРОЧИТАННОЕ С ЧАСОВ В П/П ЧТЕНИЯ; Q - РЕЗ-Т СРАВНЕНИЯ
;   DADR - ПРОЧИТАННОЕ 1-Й РАЗ; HALF - ПРОЧИТАННОЕ 2-Й РАЗ
;   EXPN - 1-Я РАЗНИЦА, УМНОЖЕННАЯ НА 2; ВУТЕ - 2-Я РАЗНИЦА
;
CJP А=CONTD,МАР=РЕ
CONTD:CONT А=HD,%Т%
CJS А=INITST,МАР=РЕ
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
;0 - В ЧАСЫ
CJS А=ATWR,МАР=РЕ,ALUS=ZА,FUNC=AND,Н,ALUD=В,RВ=А
;ЖДЕМ
CCD:PUSH А=$FFF,МАР=РЕ
RFCT
;ЧИТАЕМ 1-Й РАЗ
CJS А=ATRD,МАР=РЕ
;ВЫЧИСЛЯЕМ РАЗНИЦУ, УМНОЖАЕМ НА 2, ПИШЕМ В EXPN
CONT ALUS=АВ,RА=А,RВ=У,FUNC=SUBS,Н,CI,ALUD=Q
CONT ALUS=ZQ,Н,ALUD=LSB,RВ=EXPN,SHMUX=LSLSL
;ЖДЕМ ЕЩЕ СТОЛЬКО ЖЕ
PUSH А=$FFF,МАР=РЕ
RFCT
;ЧИТАЕМ 2-Й РАЗ, ПЕРЕПИСЫВЕМ ПРОЧИТАННОЕ 1-Й РАЗ В DADR
CJS А=ATRD,МАР=РЕ,ALUS=ZА,RА=У,Н,ALUD=В,RВ=DADR
;ВЫЧИСЛЯЕМ РАЗНИЦУ, ПИШЕМ В ВУТЕ
CONT ALUS=АВ,RА=У,RВ=А,FUNC=SUBR,Н,CI,ALUD=Q
CONT ALUS=ZQ,Н,ALUD=В,RВ=ВУТЕ
;ПЕРЕПИСЫВАЕМ ПРОЧИТАННОЕ 2-Й РАЗ
CONT ALUS=ZА,RА=У,Н,ALUD=В,RВ=HALF
;СРАВНИВАЕМ РАЗНИЦУ С ПРЕДЫДУЩЕЙ
CONT ALUS=АВ,RА=EXPN,RВ=ВУТЕ,FUNC=EXOR,Н,ALUD=Q
;СДВИГАЕМ НА N РАЗРЯДОВ ВПРАВО (СРАВНИВАЕМ С ТОЧНОСТЬЮ ДО N РАЗРЯДОВ)
PUSH А=2,МАР=РЕ
RFCT ALUS=ZQ,Н,ALUD=RSBQ,RВ=WR6,SHMUX=LSLSL
CONT ALUS=ZQ,Н,CEN
CJS А=OUT8/F,МАР=РЕ,ALUS=ZА,RА=У,Н,ALUD=В,RВ=WR6
CJS А=OUT4/7,МАР=РЕ,ALUS=ZА,RА=А,Н,ALUD=В,RВ=WR6
CJS А=ERRTST,МАР=РЕ,COND=СТ,SТОРС=21
;ЧИТАЕМ СНОВА ДЛЯ СЛЕДУЮЩЕЙ ИТЕРАЦИИ
CJS А=ATRD,МАР=РЕ,%TIK%
CJP А=CCD,МАР=РЕ,ALUS=ZА,RА=А,Н,ALUD=В,RВ=У
;
;
;     ====================
;     ДОПОЛНИТЕЛЬНЫЕ ТЕСТЫ
;     ====================
;
ОЗУЕ:ENTRY
;===== ЗАПИСЬ ДАННЫХ = АДРЕСУ В ПРЯМОМ НАПРАВЛЕНИИ, ДАННЫЕ В БОИ - ПОСЛЕ Ф.А.!
;   ЗАПИСЬ В ПАМЯТЬ (ТЕГ=ДАННЫМ); ЧТЕНИЕ С ЗАДЕРЖКОЙ; СРАВНЕНИЕ
;   РС   - АДРЕС, НАЧИНАЯ С 1; ОН ЖЕ ДАННЫЕ
;   А    - ЧТО ПРОЧИТАЛИ В РАЗРЯДАХ ДАННЫХ, У - ТЕГА; Q - РЕЗ-Т СРАВНЕНИЯ
;   INTR = 1(ДАННЫЕ),2(ТЕГ), ЕСЛИ ПРОВЕРЯЕМ "ФОН"; = 3,4 - ЕСЛИ ОСТАЛЬНОЕ
;   MANT - НОМЕР ЦИКЛА ЧТЕНИЯ (НЕЧЕТ, ЕСЛИ ПРОВЕРЯЕМ "ФОН"); EXPN - К-ВО ОШИБОК.
;   ВНИМАНИЕ! ДАННЫЕ = АДРЕСУ ПИШЕМ В БОИ В СЛЕДУЮЩЕЙ МК ПОСЛЕ ФИЗ.АДРЕСА !!!
;
CJP А=СМЕМЕ,МАР=РЕ
СМЕМЕ:CONT А=НЕ,%Т%
CJS А=INITST,МАР=РЕ
;ПИШЕМ БЛОКИРОВКИ В РР (БП=1 И Т.Д.)
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
CONT А=МВ,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=ВУТЕ
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=MANT
;"ЗАПИСЬ ФОНА": РАСПИСЫВАЕМ ВСЮ ПАМЯТЬ FF...FF
;ЧИТАЕМ ФОНОВУЮ CONST В РГ.DADR, ОБНУЛЯЕМ РС
CICLME:CONT А=CFFF,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=DADR,ALU,YDEVT=ECBTAG,ЕСВ
>,WRB,BRA=RG3
CONT А=ZER,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РС
;АДРЕС РС+1 - В РС, АИСП.
CCWFME:CJS А=OUTADR,МАР=РЕ,ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG
;ФИЗ.АДРЕС - В RG0, CONST ДЛЯ ЗАПИСИ УЖЕ В БОИ!
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
;ЖДЕМ ГОТ.АРБИТРА, РС+1 - В РГ.Q (ДЛЯ СРАВНЕНИЯ С МАХ ADR.+ 1)
WWFME:CJP А=WWFME,МАР=РЕ,COND=ARBRDY,IСС,ALUS=ZА,RА=РС,Н,CI,ALUD=Q
;СРАВНИВАЕМ АДРЕС
CONT А=В18,DSRC=PROM,ALUS=DQ,FUNC=EXOR,CEN
CJP А=CCWFME,МАР=РЕ,COND=СТ,SТОРС=21
;
;ПРОВЕРЯЕМ "ФОН": ЧИТАЕМ FF...FF, ПИШЕМ ДАННЫЕ=АДРЕСУ; INTR=1,2
;УСТАН.В 0 РГ.РС (АДРЕС), N ЦИКЛА (MANT), ЧИСЛО ОШИБОК (EXPN)
CONT А=ZER,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РС
CONT ALUS=ZВ,RВ=MANT,Н,CI,ALUD=В
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=EXPN
;П/У НА П/П ЧТЕНИЯ "ФОНА", СРАВНЕНИЕ
CCWME:CJS А=CMPD,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=INTR
;ФИЗ.АДРЕС НА ЗАПИСЬ: ДО ДАННЫХ!!
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
;ПИШЕМ ДАННЫЕ=АДРЕСУ - В RG3 БОИ ДАННЫХ И ТЕГА ПОСЛЕ ФИЗ.АДРЕСА!!
CONT ALUS=ZА,RА=РС,Н,ALU,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
;ЖДЕМ ГОТ.АРБИТРА, РС+1 - В РГ.Q (ДЛЯ СРАВНЕНИЯ С МАХ ADR.+ 1)
WWAME:CJP А=WWAME,МАР=РЕ,COND=ARBRDY,IСС,ALUS=ZА,RА=РС,Н,CI,ALUD=Q
;СРАВНИВАЕМ АДРЕС
CONT А=В18,DSRC=PROM,ALUS=DQ,FUNC=EXOR,CEN
CJP А=CCWME,МАР=РЕ,COND=СТ,SТОРС=21
;ВЫДАЧА В БОПП N ЦИКЛА И ЧИСЛА ОШИБОК
CJS А=OUTEMH,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR5
;ЗАДЕРЖКА, ПОКА РГ.WR5 НЕ БУДЕТ РАВЕН CONST ИЗ ПЗУ
WТМЕ:CONT А=В20,DSRC=PROM,ALUS=DА,RА=WR5,FUNC=EXOR,Н,CEN
CJP А=WТМЕ,МАР=РЕ,COND=СТ,SТОРС=21,ALUS=ZВ,RВ=WR5,Н,CI,ALUD=В
;
;ЧТЕНИЕ ДАННЫХ = АДРЕСУ
;0 - В РГ.РС (АДРЕС), В EXPN (ЧИСЛО ОШИБОК), MANT+1 (N ЦИКЛА), INTR=3,4
CONT А=ZER,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РС
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=EXPN
CONT ALUS=ZВ,RВ=MANT,Н,CI,ALUD=В
CCRE:CONT А=С2,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=INTR
;П/У НА П/П ЧТЕНИЯ И СРАВНЕНИЯ, ПИШЕМ В DADR ЧИСЛО, С КОТ.БУДЕМ СРАВНИВАТЬ
CJS А=CMPD,МАР=РЕ,ALUS=ZА,RА=РС,Н,CI,ALUD=В,RВ=DADR
;СРАВНИВАЕМ АДРЕС (РС+1)
CONT ALUS=ZА,RА=РС,Н,CI,ALUD=Q
CONT А=В18,DSRC=PROM,ALUS=DQ,FUNC=EXOR,СЕМ
CJP А=CCRE,МАР=РЕ,COND=СТ,SТОРС=37
;ВЫДАЧА В БОПП N ЦИКЛА И ЧИСЛА ОШИБОК, ЗАДЕРЖКА
CJS А=OUTEMH,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR5
WTRDME:CONT А=В4,DSRC=PROM,ALUS=DА,RА=WR5,FUNC=EXOR,Н,CEN
CJP А=WTRDME,МАР=РЕ,COND=СТ,SТОРС=21,ALUS=ZВ,RВ=WR5,Н,CI,ALUD=В
CJP А=CICLME,МАР=РЕ
;
;
CTHДF:ENTRY
;===== ИЗМЕНЕНИЕ ТКК ВМЕСТЕ С ФИЗ.АДРЕСОМ: ДОЛЖНА "ЗАЩЕЛКНУТЬСЯ" НОВАЯ КОМАНДА!
;   КОМАНДНОЕ СЛОВО = 0...0F...F (ИЛИ F...F0...0), НОВЫЙ РЕЖИМ
;   Q - ПРОЧИТАННАЯ ИНФОРМАЦИЯ; HALF - МАСКА НА 32 РАЗР.; А - ПЕРЕМ.КОМ.СЛОВО
;   ОШИБКИ: 01 - ЧИТАЕМ АК = 0; 02 - ЧИТАЕМ АК = F..F.
;
CJP А=PSSTF,МАР=РЕ
PSSTF:CONT А=HF,%Т%
CJS А=INITST,МАР=РЕ
;УСТАНАВЛИВАЕМ РГ/ТГ ДЛЯ ТЕСТОВ; 1 - В ПКК,ТКК (УСТАНАВЛИВАЕМ ПР.ПРАВОЙ КОМАНДЫ)
CONT А=CTEST,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=EXPN
CONT А=В29,DSRC=PROM,ALUS=DА,RА=EXPN,FUNC=OR,ALU,YDST=CNT,FFCNT=SЕТТКК
;ЧИТАЕМ CONST 00...FF - В РГ.HALF
CONT А=МН,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=HALF
;ПИШЕМ КОМАНДНОЕ СЛОВО (0...0F...F) - В RG1, В РГ.А
CONT А=МН,DSRC=PROM,ЕСА,WRA,ARA=RG1,ALUS=DZ,Н,ALUD=В,RВ=А
;
;ПРОВЕРЯЕМ, КАКОЙ АК ЧИТАЕТСЯ ПОСЛЕ Ф.А.И СМЕНЫ ТКК
CSTF:CONT А=С7,DSRC=PROM,ALUS=DZ,ALU,YDST=ADRREG
;СМЕНА ТКК НА ЛК; АК ЛК = 0!
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR,FFCNT=СНТКК
;ЧИТАЕМ АК!
CONT %RСА%,CEN
WAWF:CJP А=WAWF,%WА%,%CLRTYP%
CJS А=ERRINQ,МАР=РЕ,COND=СТ,SТОРС=/NZ,%ТУРЕ%
;
;ПЕРЕХОДИМ К КОМАНДЕ F...F!
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DRD,FFCNT=СНТКК
CONT %RСА%,CEN
CONT %ТУРЕ%
WARF:CJP А=WARF,%WА%
CONT ALUS=AQ,RА=HALF,FUNC=EXOR,CEN
CJS А=ERRINQ,МАР=РЕ,COND=СТ,SТОРС=21,%TIK%
;ИНВЕРТИРУЕМ КОМАНДНОЕ СЛОВО, МЕНЯЕМ ТКК (НАЧИНАЕМ С ДРУГОЙ ПОЛОВИНЫ)
CJP А=CSTF,МАР=РЕ,ALUS=ZА,RА=А,FUNC=EXNOR,Н,ALUD=В,RВ=А,ALU,ЕСВ,WRB,BRA=RG1
>,FFCNT=СНТКК
;
;
БОПП10:ENTRY
;===== ОСНОВАТЕЛЬНАЯ ПРОВЕРКА 4-15 РГ.БОПП
;   ПИШЕМ ПЕРЕМЕННУЮ В 4 РГ.БОПП, ОТТУДА - В 5,6,...15, 15-Й ЧИТАЕМ И СРАВНИВАЕМ
;   А - ЧТО ПИШЕМ В 4 РГ.; Q - ЧТО ПРОЧИТАЛИ С РГ.БОПП; У - РЕЗ-Т СРАВНЕНИЯ
;
CJP А=PSMP10,МАР=РЕ
PSMP10:CONT А=Н10,%Т%
CJS А=INITST,МАР=РЕ
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=А
СМР10:CONT ALUS=ZВ,RВ=А,Н,CI,ALUD=В,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=4
CONT YDEV=МРМЕМ,IОМР,MPADR=4,%TRSH%,ALUS=DZ,ALUD=Q
CONT ALUS=ZQ,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=5
CONT YDEV=МРМЕМ,IОМР,MPADR=5,%TRSH%,ALUS=DZ,ALUD=Q
CONT ALUS=ZQ,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=6
CONT YDEV=МРМЕМ,IОМР,MPADR=6,%TRSH%,ALUS=DZ,ALUD=Q
CONT ALUS=ZQ,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=7
CONT YDEV=МРМЕМ,IОМР,MPADR=7,%TRSH%,ALUS=DZ,ALUD=Q
CONT ALUS=ZQ,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=8
CONT YDEV=МРМЕМ,IОМР,MPADR=8,%TRSH%,ALUS=DZ,ALUD=Q
CONT ALUS=ZQ,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=9
CONT YDEV=МРМЕМ,IОМР,MPADR=9,%TRSH%,ALUS=DZ,ALUD=Q
CONT ALUS=ZQ,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=10
CONT YDEV=МРМЕМ,IОМР,MPADR=10,%TRSH%,ALUS=DZ,ALUD=Q
CONT ALUS=ZQ,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=11
CONT YDEV=МРМЕМ,IОМР,MPADR=11,%TRSH%,ALUS=DZ,ALUD=Q
CONT ALUS=ZQ,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=12
CONT YDEV=МРМЕМ,IОМР,MPADR=12,%TRSH%,ALUS=DZ,ALUD=Q
CONT ALUS=ZQ,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=13
CONT YDEV=МРМЕМ,IОМР,MPADR=13,%TRSH%,ALUS=DZ,ALUD=Q
CONT ALUS=ZQ,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=14
CONT YDEV=МРМЕМ,IОМР,MPADR=14,%TRSH%,ALUS=DZ,ALUD=Q
CONT ALUS=ZQ,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=15
CONT YDEV=МРМЕМ,IОМР,MPADR=15,%TRSH%,ALUS=DZ,ALUD=Q
CONT ALUS=AQ,RА=А,FUNC=EXOR,ALUD=В,RВ=У
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0-56,SHF=LOG,CEN
CJS А=ERRTST,МАР=РЕ,COND=СТ,SТОРС=/NZ
CJP А=СМР10,МАР=РЕ,%TIK%
;
;
СТСС11:ENTRY
;===== ПРОВЕРКА УСЛОВИЯ СТ СУСС В 2-Х МП ТАКТАХ: 1 - ВЫХОД МПС; 2 - С РГ.СУСС
;   ТЕСТ - ЛИШНИЙ, Т.К. УСЛОВИЕ СУСС ПРОВЕРЯЕМ В 1 МК!
;   Т.Е.ПОСЛЕДОВАТЕЛЬНОСТЬ МК МОЖНО ПРЕРЫВАТЬ.
;   НО ЕСЛИ ПРЕРЫВАНИЙ НЕТ (В ТЕСТАХ, В КОМАНДАХ С МАСКОЙ ПРЕРЫВАНИЙ),
;   ТО М.Б.ТАКАЯ ПРОВЕРКА БУДЕТ БЫСТРЕЕ (УСЛОВИЕ РАНЬШЕ "ДОЙДЕТ" ДО БМПУ!).
;   ОШ = 1: Z; 2 - N; 3 - V; 4 - С
;
CJP А=PSCT11,МАР=РЕ
PSCT11:CONT А=Н11,%Т%
CJS А=INITST,МАР=РЕ
ССТ11:CONT %CLRTYP%
;0 - В N; ВЫПОЛНЯЕМ ОПЕРАЦИЮ, В РЕЗ-ТЕ КОТОРОЙ Z УСТАНАВЛИВАЕТСЯ В 1:
CONT А=С555,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А,SТОРС=3,CEN
;ПРОВЕРЯЕМ УСЛОВИЕ В 2 КОМАНДЫ:
CONT А=С555,DSRC=PROM,ALUS=DА,RА=А,FUNC=SUBS,Н,CI,ALUD=В,RВ=У,CEN,SТОРС=/IZ
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=/NZ,%ТУРЕ%
;
;NN = 1
CONT А=СААА,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А,CEN
;ВЫПОЛНЯЕМ ОПЕРАЦИЮ, В РЕЗ-ТЕ КОТОРОЙ N (ПР.ЗНАКА) УСТАН.В 0
CONT А=СААА,DSRC=PROM,ALUS=DА,RА=А,FUNC=SUBS,Н,CI,ALUD=В,RВ=У,CEN,SТОРС=IN
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=NN,%ТУРЕ%
;
;0 - В N; ВЫПОЛНЯЕМ ОПЕРАЦИЮ, В РЕЗ-ТЕ КОТОРОЙ V УСТАНАВЛИВАЕТСЯ В 1:
CONT А=В64,DSRC=PROM,ALUS=DZ,FUNC=EXNOR,Н,ALUD=В,RВ=А,SТОРС=3,CEN
;СОЛОЖЕНИЕ 7F...F ПО ВХОДАМ А И В; ПЕРЕПОЛНЕНИЕ: V = 1
CONT ALUS=АВ,RА=А,RВ=А,FUNC=ADD,Н,ALUD=Q,CEN,SТОРС=/IV
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=/NV,%ТУРЕ%
;
;NС = 1
CONT А=СААА,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А,SТОРС=1,CEN
;ВЫПОЛНЯЕМ ОПЕРАЦИЮ, В РЕЗ-ТЕ КОТОРОЙ С (ПЕРЕНОС) УСТАН.В 0
CONT А=С555,DSRC=PROM,ALUS=DА,RА=А,FUNC=ADD,Н,ALUD=В,RВ=У,CEN,SТОРС=IС
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=NС,%ТУРЕ%
CJP А=ССТ11,МАР=РЕ,%TIK%
;
;
СТСС12:ENTRY
;===== ПЕРЕХОД ПО УСЛОВИЮ СТ СУСС, ПРОВЕРЯЕМОМУ В 1 МК!!!
;   ОШ = 1: Z; 2 - N; 3 - V; 4 - С
;
CJP А=PSCT12,МАР=РЕ
PSCT12:CONT А=Н12,%Т%
CJS А=INITST,МАР=РЕ
ССТ12:CONT %CLRTYP%,SТОРС=SЕТМ,СЕМ
;0 - В N; ВЫПОЛНЯЕМ ОПЕРАЦИЮ, В РЕЗ-ТЕ КОТОРОЙ Z УСТАНАВЛИВАЕТСЯ В 1:
CONT А=С555,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А,SТОРС=3,CEN
;ПРОВЕРЯЕМ УСЛОВИЕ В 1 КОМАНДЕ, А В ПРЕДЫДУЩЕЙ УСТАНАВЛИВАЕМ ПРОТИВОПОЛ.УСЛОВИЕ!
CONT А=С555,DSRC=PROM,ALUS=DА,RА=А,FUNC=SUBS,Н,CI,ALUD=В,RВ=У,CEN,SТОРС=MZ,IСС
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=/NZ,%ТУРЕ%
;
;NN = 1
CONT А=СААА,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А,CEN
;ВЫПОЛНЯЕМ ОПЕРАЦИЮ, В РЕЗУЛЬТАТЕ КОТОРОЙ N (ПР.ЗНАКА) УСТАН.В 0
CONT А=СААА,DSRC=PROM,ALUS=DА,RА=А,FUNC=SUBS,Н,CI,ALUD=В,RВ=У,CEN,SТОРС=MN,IСС
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=NN,%ТУРЕ%
;
;0 - В N; ВЫПОЛНЯЕМ ОПЕРАЦИЮ, В РЕЗ-ТЕ КОТОРОЙ V УСТАНАВЛИВАЕТСЯ В 1:
CONT А=В64,DSRC=PROM,ALUS=DZ,FUNC=EXNOR,Н,ALUD=В,RВ=А,SТОРС=3,CEN
;СОЛОЖЕНИЕ 7F...F ПО ВХОДАМ А И В; ПЕРЕПОЛНЕНИЕ: V = 1
CONT ALUS=АВ,RА=А,RВ=А,FUNC=ADD,Н,ALUD=Q,CEN,SТОРС=MV,IСС
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=/NV,%ТУРЕ%
;
;NС = 1
CONT А=СААА,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А,SТОРС=1,CEN
;ВЫПОЛНЯЕМ ОПЕРАЦИЮ, В РЕЗ-ТЕ КОТОРОЙ С (ПЕРЕНОС) УСТАН.В 0
CONT А=С555,DSRC=PROM,ALUS=DА,RА=А,FUNC=ADD,Н,ALUD=В,RВ=У,CEN,SТОРС=МС,IСС
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=NС,%ТУРЕ%
CJP А=ССТ12,МАР=РЕ,%TIK%
;
;
СТСС13:ENTRY
;===== ОРГАНИЗАЦИЯ ЗАДЕРЖКИ НА РЕГИСТРЕ МПС В 1 МИКРОКОМАНДУ; У - СЧЕТЧИК
;
CJP А=ССТ13,МАР=РЕ
ССТ13:CONT А=Н13,%Т%
CJS А=INITST,МАР=РЕ
;ЗАГРУЖАЕМ CONST В РГ.У (ЗАДЕРЖКА); NZ=0, ЧТОБ НЕ ВЫШЕЛ ИЗ ЦИКЛА В 1 МК!
CBEG13:CONT А=В10,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=У,SТОРС=CLRN,CEN
;ЗАДЕРЖКА, ПОКА РГ.У НЕ БУДЕТ РАВЕН 0
WТ13:CJP А=WТ13,МАР=РЕ,COND=СТ,SТОРС=/NZ,ALUS=ZВ,RВ=У,FUNC=SUBR,Н,ALUD=В,CEN
;ПРОВЕРЯЕМ РЕЗУЛЬТАТ
CJS А=OUT8/F,МАР=РЕ,ALUS=ZА,RА=У,Н,CI,ALUD=В,RВ=WR6,CEN
CJS А=ERRTST,МАР=РЕ,COND=СТ,SТОРС=/NZ
CJP А=CBEG13,МАР=РЕ,%TIK%
;
;
DOPF:ENTRY
;===== ПРОВЕРКА ДОП.ФОРМАТА КОМАНД: КОП КОМАНДЫ В 21-28 РАЗР.= 3F
;   ДОП.КОП ЛК = 1 В 13-20 РАЗР;, КОП ПК = 3, ЕГО И ЧИТАЕМ ПО DSRC=ОРС
;   А - Д.БЫТЬ; У - ЧТО ПРОЧИТАЛИ; DADR - КОМ.СЛОВО; HALF,ВУТЕ - CONST
;
CJP А=PSDF,МАР=РЕ
PSDF:CONT А=H3F,%Т%
CJS А=INITST,МАР=РЕ
;ФОРМИРУЕМ КОМ.СЛОВО С КОП=3F В 21-28 РАЗРЯДАХ КОМАНДЫ;
CONT А=H3F,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А
CONT ALUS=DZ,Н,ALUD=ВА,RА=А,RВ=WR2,ALU,DSRC=SHIFT,MPS,PSHF=SН0-20
>,SHF=LOG
CONT А=В13,DSRC=PROM,ALUS=DА,RА=WR2,FUNC=OR,Н,ALUD=В,RВ=WR2
;ТО ЖЕ - ДЛЯ ЛЕВОЙ КОМАНДЫ
CONT ALUS=DА,RА=WR2,FUNC=OR,Н,ALUD=ВА,RВ=WR3,ALU,DSRC=SHIFT,MPS
>,PSHF=SН0-32,SHF=LOG
;ПИШЕМ В RG1
CONT А=В14,DSRC=PROM,ALUS=DА,RА=WR3,FUNC=OR,Н,ALUD=В,RВ=DADR,ALU
>,ЕСВ,WRB,BRA=RG1,FFCNT=CLRTKK
;CONST ДЛЯ СРАВНЕНИЯ
CONT А=МВ,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=ВУТЕ
CONT А=С1,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А
CONT А=В2,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=HALF
;
;ЧИТАЕМ ПО ОЧЕРЕДИ КОП ЛК,ПК, СРАВНИВАЕМ
CICLE:CONT DSRC=ОРС,ALUS=DА,RА=ВУТЕ,FUNC=AND,Н,ALUD=В,RВ=У,ALU,YDEV=МРМЕМ
>,WRY,IОМР,MPADR=11
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;МЕНЯЕМ КОП ДЛЯ СРАВНЕНИЯ
CJP А=CICLE,МАР=РЕ,ALUS=АВ,RА=HALF,RВ=А,FUNC=EXOR,ALUD=В,FFCNT=СНТКК
;
;
ОСТ1:ENTRY
;     ===============
;     О З У  ОСТАНОВА
;     ===============
;
;===== ВСЕ МАТ.АДРЕСА: НЕТ "ОСТАНОВА"; ЧИТАЕМ ФИЗ.АДРЕС С ОТКРЫТЫМИ ПРЕРЫВАНИЯМИ
;   ЗАПИСЫВАЕМ "1" В ОЗУ ОСТАНОВА 0,1 (УБИРАЕМ "ОСТАНОВ")
;   ПО ВСЕМ НОМЕРАМ СТРАНИЦЫ И СЛОВА И КОП АРБИТРА
;   РГ.А - ПРИ ЗАПИСИ ПЕРЕМЕННЫЙ КОП АРБИТРА, У - ПЕРЕМЕННЫЙ МАТ.АДРЕС
;
CJP А=PSOCT1,МАР=РЕ
PSOCT1:CONT А=Н1,%TN%
CJS А=INITST,МАР=РЕ
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
CONT А=С20,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А
;ПИШЕМ В РГ.КОП АРБИТРА, ИЗМЕНЯЯ В ЦИКЛЕ 2 СТ.И 2 МЛ. РАЗРЯДА
СНОРС:CONT А=С5,DSRC=PROM,ALUS=DА,RА=А,FUNC=SUBR,CI,ALUD=В,RВ=А,ALU
>,YDST=ARBOPC,CEN
;ПИШЕМ В РГ.АИСП. ВСЕ НОМЕРА СТРАНИЦЫ И СЛОВА, НАЧИНАЯ С 0
PUSH А=1023,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=У,ALU,YDST=ADRREG
;"1" - В ОЗУ ОСТАНОВА 0,1; ПО СТ. И МЛ. АДРЕСАМ
CONT А=С1,DSRC=PROM,ALUS=DZ,ALU,YDEV=SТОРМ0,WRY
CONT А=С1,DSRC=PROM,ALUS=DZ,ALU,YDEV=SТОРМ1,WRY
RFCT А=PG1W1,DSRC=PROM,ALUS=DА,RА=У,FUNC=ADD,Н,ALUD=В,RВ=У,ALU,YDST=ADRREG
;П/У НА ИЗМЕНЕНИЕ КОП АРБИТРА, ЕСЛИ НЕ ВСЕ КОМБИНАЦИИ ПЕРЕБРАЛИ
CJP А=СНОРС,МАР=РЕ,COND=СТ,SТОРС=/NZ
;
;ЗАПИШЕМ В ПАМЯТЬ ПО 1-ОМУ АДРЕСУ ЧЕГО-НИБУДЬ БЕЗОПАСНОЕ С ТЕГОМ КОМАНДЫ:
CONT А=С1,DSRC=PROM,ALUS=DZ,Н,ALU,YDST=ADRREG,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
CJS А=CTTSTP,МАР=РЕ,YDEV=PHYSAD,ARBI=DWR
W0:CJP А=W0,%WА%
;
;ЧИТАЕМ ФИЗ.АДРЕС ПО ВСЕМ МАТ.АДРЕСАМ
СС:CONT А=В20,DSRC=PROM,ALUS=DZ,FUNC=SUBR,Н,CI,ALUD=В,RВ=У,ALU,YDST=ADRREG
>,FFCNT=SETEI
;ЗНАЧЕНИЕ БП НЕСУЩЕСТВЕННО, Т.К. ОСТАНОВ ПО СОДЕРЖИМОМУ АИСП.,А RG0 = 1
;ПЕРЕБИРАЕМ ВСЕ РАЗУМНЫЕ ЗНАЧЕНИЯ КОП АРБИТРА, "ОСТАНОВА" НЕ ДОЛЖНО БЫТЬ!
CARB:CONT %CLRTYP%
CJS А=OUT8/F,МАР=РЕ,YDEV=PHYSAD,ARBI=FЕТСН,ALUS=ZА,RА=У,Н,ALUD=В,RВ=WR6
W1:CJP А=W1,%WА%
CONT %ТУРЕ%,ISE
CONT YDEV=PHYSAD,ARBI=DRD
W2:CJP А=W2,%WА%
CONT %ТУРЕ%,ISE
CONT YDEV=PHYSAD,ARBI=DWR
W3:CJP А=W3,%WА%
CONT %ТУРЕ%,ISE
CONT YDEV=PHYSAD,ARBI=RDMWR
W4:CJP А=W4,%WА%
CONT %ТУРЕ%,ISE
CONT YDEV=PHYSAD,ARBI=BTRWR
W5:CJP А=W5,%WА%
CONT YDEV=PHYSAD
CONT %ТУРЕ%,ISE
CONT YDEV=PHYSAD,ARBI=BTRRD
W6:CJP А=W6,%WА%
CONT ALUS=ZВ,RВ=У,FUNC=ADD,Н,CI,ALUD=В,ALU,YDST=ADRREG,ISE
CONT А=В20,DSRC=PROM,ALUS=DА,RА=У,FUNC=EXOR,CEN
CJP А=CARB,МАР=РЕ,COND=СТ,SТОРС=/NZ
CJP А=СС,МАР=РЕ,%TIK%
;
;
ОСТ2:ENTRY
;===== В ЦИКЛЕ ПОПЕРЕМЕННО 2 МАТ.АДРЕСА: НЕТ "ОСТАНОВА", ЕСТЬ "ОСТАНОВ";
;   "ОСТАНОВ"- ПО 1 МАТ.АДРЕСУ; НЕТ "ОСТАНОВА" - ВСЕ МАТ.АДРЕСА, КРОМЕ ОДНОГО.
;   ПРОВЕРЯТЬ: С ОСЦИЛЛОГРАФОМ, ИЛИ С БЛОСТАД=1,
;   ИЛИ ПОСЛЕ ПРЕРЫВАНИЯ ДЕЛАТЬ СБРОС ТГ.HALT + УСТАНОВКУ ТГ.RUN,
;   А В МП РЕАКЦИИ НА ПРЕРЫВАНИЕ ЭТО ПРОВЕРЯТЬ!
;
;ЗАПИСЫВАЕМ "1" В ОЗУ ОСТАНОВА 0,1 (УБИРАЕМ "ОСТАНОВ")
CJP А=PSOCT2,МАР=РЕ
PSOCT2:CONT А=Н2,%TN%
CJS А=INITST,МАР=РЕ
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
;ЗАПИШЕМ ПО 1-ОМУ АДРЕСУ В ОЗУ ЧЕГО-НИБУДЬ БЕЗОПАСНОЕ
CONT А=С1,DSRC=PROM,ALUS=DZ,Н,ALU,YDST=ADRREG,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
CONT YDEV=PHYSAD,ARBI=DWR
WА02:CJP А=WА02,%WА%
CONT А=С20,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А
;ПИШЕМ В РГ.КОП АРБИТРА, ИЗМЕНЯЯ В ЦИКЛЕ 2 СТ.И 2 МЛ. РАЗРЯДА
СНОРС2:CONT А=С5,DSRC=PROM,ALUS=DА,RА=А,FUNC=SUBR,CI,ALUD=В,RВ=А,ALU
>,YDST=ARBOPC,CEN
;ПИШЕМ В РГ.АИСП. ВСЕ НОМЕРА СТРАНИЦЫ И СЛОВА, НАЧИНАЯ С 0
PUSH А=1023,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=У,ALU,YDST=ADRREG
;"1" - В ОЗУ ОСТАНОВА 0,1; ПО СТ. И МЛ. АДРЕСАМ
CONT А=С1,DSRC=PROM,ALUS=DZ,ALU,YDEV=SТОРМ0,WRY
CONT А=С1,DSRC=PROM,ALUS=DZ,ALU,YDEV=SТОРМ1,WRY
RFCT А=PG1W1,DSRC=PROM,ALUS=DА,RА=У,FUNC=ADD,Н,ALUD=В,RВ=У,ALU,YDST=ADRREG
;П/У НА ИЗМЕНЕНИЕ КОП АРБИТРА, ЕСЛИ НЕ ВСЕ КОМБИНАЦИИ ПЕРЕБРАЛИ
CJP А=СНОРС2,МАР=РЕ,COND=СТ,SТОРС=/NZ
;
;УСТАНАВЛИВАЕМ ОСТАНОВ:
;ПИШЕМ КОП АРБИТРА (9 - ЧТЕНИЕ ОПЕРАНДА)
CONT А=С9,DSRC=PROM,ALUS=DZ,ALU,YDST=ARBOPC
;МАТ.АДРЕС "ОСТАНОВА" - В АИСП. И В WR1
CONT А=В20,DSRC=PROM,ALUS=DZ,FUNC=SUBR,Н,CI,ALUD=В,RВ=РССОРУ,ALU,YDST=ADRREG
;НЕТ ОСТАНОВА - В ОЗУ ОСТАНОВА 1
CONT А=С1,DSRC=PROM,ALUS=DZ,ALU,YDEV=SТОРМ1,WRY
;ОСТАНОВ - В ОЗУ ОСТАНОВА 0:
CJS А=CTTSTP,МАР=РЕ,ALUS=DZ,FUNC=AND,ALU,YDEV=SТОРМ0,WRY
;
;ЧИТАЕМ ФИЗ.АДРЕС ПО ВСЕМ МАТ.АДРЕСАМ С КОП АРБ.= ЧТЕНИЕ ОПЕРАНДА
ССВ2:CONT ALUS=ZА,RА=РССОРУ,Н,CI,ALUD=В,RВ=У,ALU,YDST=ADRREG
>,FFCNT=SETEI
;ЗНАЧЕНИЕ БП НЕСУЩЕСТВЕННО, Т.К. ОСТАНОВ ПО СОДЕРЖИМОМУ АИСП.,А RG0 = 1
СС2:CONT %CLRTYP%
;Ф.А. БЕЗ ОСТАНОВА:
CJS А=OUT8/F,МАР=РЕ,YDEV=PHYSAD,ARBI=DRD,ALUS=ZА,RА=У,Н,ALUD=В,RВ=WR6
WD1:CJP А=WD1,%WА%
CONT ISE,%ТУРЕ%
;Ф.А. С ОСТАНОВОМ:
CONT ALUS=ZА,RА=РССОРУ,ALU,YDST=ADRREG
CONT YDEV=PHYSAD,ARBI=DRD
WD2:CJP А=WD2,%WА%
CONT ISE,%ТУРЕ%
CONT ALUS=ZВ,RВ=У,FUNC=ADD,Н,CI,ALUD=В,ALU,YDST=ADRREG
CONT А=В20,DSRC=PROM,ALUS=DА,RА=У,FUNC=EXOR,CEN
CJP А=СС2,МАР=РЕ,COND=СТ,SТОРС=/NZ
CJP А=ССВ2,МАР=РЕ,%TIK%
;
;
ОСТ3:ENTRY
;===== ВСЕ МАТ.АДРЕСА: ЕСТЬ "ОСТАНОВ"!!!
;   ЗАПИСЫВАЕМ "0" В ОЗУ ОСТАНОВА 0,1 (СТАВИМ "ОСТАНОВ")
;   ПО ВСЕМ НОМЕРАМ СТРАНИЦЫ И СЛОВА И КОП АРБИТРА
;   А - ПЕРЕМЕННЫЙ КОП АРБИТРА, У - ПЕРЕМЕННЫЙ МАТ.АДРЕС
;
CJP А=PSOCT3,МАР=РЕ
PSOCT3:CONT А=Н3,%TN%
CJS А=INITST,МАР=РЕ
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
;ПИШЕМ В ОЗУ ПО 1-ОМУ АДРЕСУ ЧЕГО-НИБУДЬ:
CONT А=С1,DSRC=PROM,ALUS=DZ,Н,ALU,YDST=ADRREG,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
CJS А=CTTSTP,МАР=РЕ,YDEV=PHYSAD,ARBI=DWR
WА03:CJP А=WА03,%WА%
CONT А=С20,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А
;ПИШЕМ В РГ.КОП АРБИТРА, ИЗМЕНЯЯ В ЦИКЛЕ 2 СТ.И 2 МЛ. РАЗРЯДА
СНОРС3:CONT А=С5,DSRC=PROM,ALUS=DА,RА=А,FUNC=SUBR,CI,ALUD=В,RВ=А,ALU
>,YDST=ARBOPC,CEN
;ПИШЕМ В РГ.АИСП. ВСЕ НОМЕРА СТРАНИЦЫ И СЛОВА, НАЧИНАЯ С 0
PUSH А=1023,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=У,ALU,YDST=ADRREG
;"0" - В ОЗУ ОСТАНОВА 0,1; ПО СТ. И МЛ. АДРЕСАМ
CONT ALUS=DZ,FUNC=AND,ALU,YDEV=SТОРМ0,WRY
CONT ALUS=DZ,FUNC=AND,ALU,YDEV=SТОРМ1,WRY
RFCT А=PG1W1,DSRC=PROM,ALUS=DА,RА=У,FUNC=ADD,Н,ALUD=В,RВ=У,ALU,YDST=ADRREG
;П/У НА ИЗМЕНЕНИЕ КОП АРБИТРА, ЕСЛИ НЕ ВСЕ КОМБИНАЦИИ ПЕРЕБРАЛИ
CJP А=СНОРС3,МАР=РЕ,COND=СТ,SТОРС=/NZ
;
;ЧИТАЕМ ФИЗ.АДРЕС ПО ВСЕМ МАТ.АДРЕСАМ
СС3:CONT А=В20,DSRC=PROM,ALUS=DZ,FUNC=SUBR,Н,CI,ALUD=В,RВ=У,ALU,YDST=ADRREG
>,FFCNT=SETEI
;ЗНАЧЕНИЕ БП НЕСУЩЕСТВЕННО, Т.К. ОСТАНОВ ПО СОДЕРЖИМОМУ АИСП.,А RG0 = 1
;ПЕРЕБИРАЕМ ВСЕ РАЗУМНЫЕ ЗНАЧЕНИЯ КОП АРБИТРА, "ОСТАНОВА" НЕ ДОЛЖНО БЫТЬ!
CARB3:CONT %CLRTYP%
CJS А=OUT8/F,МАР=РЕ,YDEV=PHYSAD,ARBI=FЕТСН,ALUS=ZА,RА=У,Н,ALUD=В,RВ=WR6
W31:CJP А=W31,%WА%
CONT %ТУРЕ%,ISE
CONT YDEV=PHYSAD,ARBI=DRD
W32:CJP А=W32,%WА%
CONT %ТУРЕ%,ISE
CONT YDEV=PHYSAD,ARBI=DWR
W33:CJP А=W33,%WА%
CONT %ТУРЕ%,ISE
CONT YDEV=PHYSAD,ARBI=RDMWR
W34:CJP А=W34,%WА%
CONT %ТУРЕ%,ISE
CONT YDEV=PHYSAD,ARBI=BTRWR
W35:CJP А=W35,%WА%
CONT YDEV=PHYSAD
CONT %ТУРЕ%,ISE
CONT YDEV=PHYSAD,ARBI=BTRRD
W36:CJP А=W36,%WА%
CONT ALUS=ZВ,RВ=У,FUNC=ADD,Н,CI,ALUD=В,ALU,YDST=ADRREG,ISE
CONT А=В20,DSRC=PROM,ALUS=DА,RА=У,FUNC=EXOR,CEN
CJP А=CARB3,МАР=РЕ,COND=СТ,SТОРС=/NZ
CJP А=СС3,МАР=РЕ,%TIK%
;
;
ОСТ4:ENTRY
;===== ЗАПИСЬ: НЕТ ОСТАНОВА; ЧТЕНИЕ ОПЕРАНДА: ЕСТЬ ОСТАНОВ; ЦИКЛ ПО ВСЕМ М.А.!
;
;ЗАПИСЫВАЕМ В ОЗУ ОСТАНОВА 0,1: "1" - С КОП = DWR; "1" - С КОП =DRD
CJP А=PSOCT4,МАР=РЕ
PSOCT4:CONT А=Н4,%TN%
CJS А=INITST,МАР=РЕ
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
;ПИШЕМ В ОЗУ ПО 1-ОМУ АДРЕСУ
CONT А=С1,DSRC=PROM,ALUS=DZ,Н,ALU,YDST=ADRREG,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
CJS А=CTTSTP,МАР=РЕ,YDEV=PHYSAD,ARBI=DRD
WА04:CJP А=WА04,%WА%
;ПИШЕМ В РГ.АИСП. ВСЕ НОМЕРА СТРАНИЦЫ И СЛОВА, НАЧИНАЯ С 0
PUSH А=1023,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=У,ALU,YDST=ADRREG
;КОП АРБИТРА = DWR - ЗАПИСЬ ОПЕРАНДА
CONT А=С10,DSRC=PROM,ALUS=DZ,ALU,YDST=ARBOPC
;НЕТ ОСТАНОВА: "1" - В ОЗУ ОСТАНОВА 0,1; ПО СТ. И МЛ. АДРЕСАМ
CONT А=С1,DSRC=PROM,ALUS=DZ,ALU,YDEV=SТОРМ0,WRY
CONT А=С1,DSRC=PROM,ALUS=DZ,ALU,YDEV=SТОРМ1,WRY
;КОП АРБИТРА = DRD - ЧТЕНИЕ ОПЕРАНДА
CONT А=С9,DSRC=PROM,ALUS=DZ,ALU,YDST=ARBOPC
;ЕСТЬ ОСТАНОВ: "0" - В ОЗУ ОСТАНОВА 0,1
CONT ALUS=DZ,FUNC=AND,ALU,YDEV=SТОРМ0,WRY
CONT ALUS=DZ,FUNC=AND,ALU,YDEV=SТОРМ1,WRY
RFCT А=PG1W1,DSRC=PROM,ALUS=DА,RА=У,FUNC=ADD,Н,ALUD=В,RВ=У,ALU,YDST=ADRREG
;
;ЧИТАЕМ ФИЗ.АДРЕС ПО ВСЕМ МАТ.АДРЕСАМ
СС4:CONT А=В20,DSRC=PROM,ALUS=DZ,FUNC=SUBR,Н,CI,ALUD=В,RВ=У,ALU,YDST=ADRREG
>,FFCNT=SETEI
;ЗНАЧЕНИЕ БП НЕСУЩЕСТВЕННО, Т.К. ОСТАНОВ ПО СОДЕРЖИМОМУ АИСП.,А RG0 = 1
СА4:CONT %CLRTYP%
;ОСТАНОВА НЕ Д.БЫТЬ!
CONT А=С1,DSRC=PROM,ЕСА,WRA,ARA=RG0,YDEV=PHYSAD,ARBI=DWR
W41:CJP А=W41,%WА%
CONT %ТУРЕ%,ISE
;Д.БЫТЬ ОСТАНОВ!
CJS А=OUT8/F,МАР=РЕ,YDEV=PHYSAD,ARBI=DRD,ALUS=ZА,RА=У,Н,ALUD=В,RВ=WR6
W42:CJP А=W42,%WА%
CONT %ТУРЕ%,ISE
CONT ALUS=ZВ,RВ=У,FUNC=ADD,Н,CI,ALUD=В,ALU,YDST=ADRREG
CONT А=В20,DSRC=PROM,ALUS=DА,RА=У,FUNC=EXOR,CEN
CJP А=СА4,МАР=РЕ,COND=СТ,SТОРС=/NZ
CJP А=СС4,МАР=РЕ,%TIK%
;
;
СТСС14:ENTRY
;===== ЗАПИСЬ,ЧТЕНИЕ РГ.N СУСС, 7-10 РАЗРЯДЫ; ПИШЕМ ПОПЕРЕМЕННО 0,F
;   Т.К.ЗАПИСИ В РГ.N С ШИНЫ У НЕТ, ЗАПИСЫВАЕМ СНАЧАЛА В РГ.М,
;   ОДНОВРЕМЕННО М КОПИРУЕМ В N; ЗАТЕМ ДЕЛАЕМ ОБМЕН МЕЖДУ РЕГИСТРАМИ.
;
CJP А=PSCT14,МАР=РЕ
PSCT14:CONT А=Н14,%Т%
CJS А=INITST,МАР=РЕ
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=А
;ПИШЕМ В РГ.N
СТ14:CONT А=MIND,DSRC=PROM,ALUS=DА,RА=А,FUNC=EXOR,ALUD=В,RВ=А,ALU
>,DDEV=STATUS,WRD,SТОРС=0,СЕМ,CEN
CONT SТОРС=MCN,СЕМ,CEN
;ЧИТАЕМ РГ.N
CONT SТОРС=20,DDEV=STATUS,ALUS=DZ,ALUD=В,RВ=У
CONT А=MIND,DSRC=PROM,ALUS=DА,RА=У,FUNC=AND,Н,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ
CJP А=СТ14,МАР=РЕ,%TIK%
;
;
ОЗУ15:ENTRY
;===== ЗАПИСЬ "1" В ОЗУ, ЧТЕНИЕ, УВЕЛИЧЕНИЕ РГ.НА ПРОЧИТАННОЕ ЧИСЛО, СРАВНЕНИЕ
;   РЕЗУЛЬТАТ СЛОЖЕНИЯ С "1" ЗАПИСЫВАЕМ В БУФЕР В ОЗУ (512 СЛОВ).
;   АДРЕС "1" СОВПАДАЕТ С АДРЕСОМ ОДНОГО ИЗ СЛОВ БУФЕРА С ТОЧН.ДО N СТРАНИЦЫ!!
;   РС - ПЕРЕМЕННЫЙ АДРЕС ПО БУФЕРУ; РССОРУ - АДРЕС "1";
;   А - КОНТРОЛЬНОЕ ЧИСЛО; У - РЕЗУЛЬТАТ СЛОЖЕНИЯ С ПРОЧИТАННОЙ "1".
;   ТЕСТ - СО СБРОСОМ КЭША 1 РАЗ ВНАЧАЛЕ И С ОТКРЫТЫМИ ПРЕРЫВАНИЯМИ!
;
CJP А=CON15,МАР=РЕ
CON15:CONT А=Н15,%Т%
CJS А=INITST,МАР=РЕ,YDST=CCLR
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=ADRREG,FFCNT=SETEI
;
;ПИШЕМ 1 В ОЗУ ПО АДРЕСУ DВ! "0" - В РГ.А,У
CONT А=HDB,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РССОРУ,ALU,YDST=ADRREG
CONT А=С1,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=DADR,ALU,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
CONT %PHAW%,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=А
WAL:CJP А=WAL,%WА%,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=У
;
;АДРЕС НАЧАЛА БУФЕРА - 44F-1 - В РГ.РС
CICLBL:CONT А=В11,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РС
CONT А=Н4Е,DSRC=PROM,ALUS=DА,RА=РС,FUNC=OR,Н,ALUD=В,RВ=РС
;
PUSH А=511,МАР=РЕ
;ЧИТАЕМ "1" ИЗ ОЗУ ПО АДРЕСУ DВ, УВЕЛИЧИВАЕМ НА "1" ЧИСЛО В РГ.А ДЛЯ СРАВНЕНИЯ
CONT ALUS=ZА,RА=РССОРУ,ALU,YDST=ADRREG
CONT %PHAR%,ALUS=ZВ,RВ=А,Н,CI,ALUD=В
WAR1:CJP А=WAR1,%WА%
;ДОБАВЛЯЕМ ПРОЧИТАННОЕ К РГ.У
CONT ЕСА,ARA=RG2,ALUS=DА,RА=У,FUNC=ADD,Н,ALUD=В,RВ=У
;СРАВНИВАЕМ А И У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,Н,ALUD=Q,CEN
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=/NZ
;ЗАПИСЫВАЕМ РЕЗУЛЬТАТ СЛОЖЕНИЯ В БУФЕР
CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG
CJS А=OUTADR,МАР=РЕ,%PHAW%
WAWC:CJP А=WAWC,%WА%
RFCT
CJP А=CICLBL,МАР=РЕ
;
;
OCT17:ENTRY
;=====
;   ЧТЕНИЕ АДРЕСА КОМАНДЫ ВО ВРЕМЯ РАБОТЫ АРБИТРА В РЭ
;
CJP А=CON17,МАР=РЕ,CYSTR=NT3
CON17:CONT А=Н17,%Т%,CYSTR=NT3
CJS А=INITST,МАР=РЕ,YDST=CCLR,FFCNT=CLREI
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT,CYSTR=NT3
;
;ПИШЕМ M48 (B РЭ = FFF) В ОЗУ C АДРЕСA DВ(H) 2048 РАЗ!
CONT А=HDB,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РС,CYSTR=NT3
CONT А=M48,DSRC=PROM,ALUS=DZ,Н,ALU,ЕСВ,WRB,BRA=RG3,CYSTR=NT3
CONT A=C3,DSRC=PROM,ALUS=DZ,ALU,YDEVT=ECBTAG,WRB,BRA=RG3,CYSTR=NT3
PUSH A=2048,MAP=PE,CYSTR=NT3
CONT ALUS=ZA,RA=PC,CI,ALUD=B,RB=PC,ALU,YDST=ADRREG
CONT %PHAW%,CYSTR=NT4
WAL17:CJP А=WAL17,%WА%,CYSTR=NT3
RFCT,CYSTR=NT3
;
;КОМ.СЛОВО - B RG1: УСТАНАВЛИВАЕМ РЭ!
CONT A=M48,DSRC=PROM,ALUS=DZ,H,ALUD=B,RB=DADR,CYSTR=NT3
CONT A=CINI,DSRC=PROM,ALUS=DA,RA=DADR,FUNC=EXOR,H,ALUD=B,RB=DADR,CYSTR=NT3
CONT A=C55FF,DSRC=PROM,ALUS=DA,RA=DADR,FUNC=AND,H,ALUD=B,RB=DADR,ALU
>,ECB,WRB,BRA=RG3,CYSTR=NT3
CONT ALUS=ZA,RA=PC,CI,ALU,YDST=ADRREG
CONT %PHAW%,CYSTR=NT4
COMW17:CJP A=COMW17,%WA%
CONT YDEV=PHYSAD,ECB,WRB,BRA=RG0,ARBI=FETCH,CYSTR=NT4
COMR17:CJP A=COMR17,%WA%,CYSTR=NT5
CONT ALUS=DZ,H,ALUD=BA,RA=DADR,RB=A,ALU,DSRC=SHIFT,MPS,PSHF=SH0+12
>,SHF=LOG,FFCNT=CLRTKK,CYSTR=NT3
;ВЫЧИСЛЯЕМ АДРЕС КОМАНДЫ
CONT A=M15,DSRC=PROM,ALUS=DA,RA=A,FUNC=AND,H,ALUD=B,RB=A,FFCNT=CLRRCB
>,CYSTR=NT3
;
;ЧИТАЕМ ИЗ ОЗУ ОПЕРАНД 2048 PАЗ, НАЧИНАЯ C АДРЕСA DВ+1
CKL17:CONT A=HDB,DSRC=PROM,ALUS=DZ,ALUD=B,RB=PC,CYSTR=NT3
PUSH A=2047,MAP=PE,CYSTR=NT3
CJS A=OUTADR,MAP=PE,ALUS=ZB,RB=PC,CI,ALUD=B,ALU,YDST=ADRREG
;ПОСЛЕ ФА АДРЕС КОМАНДЫ ЧИТАЕТСЯ ТОЛЬКО ПРИ ДЛИТЕЛЬНОСТИ 3 НТ!
CONT %PHAR%,FFCNT=CHTKK,CYSTR=NT4
CONT DSRC=COMA,ALUS=DZ,ALUD=B,RB=Y,CYSTR=NT3
CONT DSRC=COMA,ALUS=DZ,ALUD=B,RB=WR1,CYSTR=NT5
CONT DSRC=COMA,ALUS=DZ,ALUD=B,RB=WR2,CYSTR=NT6
CONT DSRC=COMA,ALUS=DZ,ALUD=B,RB=WR3,CYSTR=NT7
CONT DSRC=COMA,ALUS=DZ,ALUD=B,RB=WR4,CYSTR=NT8
CONT %RCA%,CYSTR=NT9
CONT DSRC=COMA,ALUS=DZ,ALUD=B,RB=WR5,CYSTR=NT10
CONT DSRC=COMA,ALUS=DZ,ALUD=B,RB=PCCOPY,CYSTR=NT4
WAR17:CJP А=WAR17,%WА%,CYSTR=NT3
;СРАВНИВАЕМ AK! 1-Е ЧТЕНИЕ
CONT %CLRTYP%,CYSTR=NT3
CONT ALUS=AB,RA=A,RB=Y,FUNC=EXOR,CEN,CYSTR=NT4
CJS A=ERRINH,MAP=PE,COND=CT,STOPC=/NZ,%TYPE%
;2
CONT ALUS=ZA,RA=WR1,ALUD=B,RB=Y,CYSTR=NT3
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,CEN,CYSTR=NT4
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TYPE%
;3
CONT ALUS=ZA,RA=WR2,ALUD=B,RB=Y,CYSTR=NT3
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,CEN,CYSTR=NT4
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TYPE%
;4
CONT ALUS=ZA,RA=WR3,ALUD=B,RB=Y,CYSTR=NT3
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,CEN,CYSTR=NT4
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TYPE%
;5
CONT ALUS=ZA,RA=WR4,ALUD=B,RB=Y,CYSTR=NT3
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,CEN,CYSTR=NT4
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TYPE%
;6
CONT ALUS=ZQ,ALUD=B,RB=Y,CYSTR=NT3
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,CEN,CYSTR=NT4
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TYPE%
;7
CONT ALUS=ZA,RA=WR5,ALUD=B,RB=Y,CYSTR=NT3
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,CEN,CYSTR=NT4
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TYPE%
;8
CONT ALUS=ZA,RA=PCCOPY,ALUD=B,RB=Y,CYSTR=NT3
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,CEN,CYSTR=NT4
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TYPE%
RFCT FFCNT=CLRTKK,CYSTR=NT3
CJP А=CKL17,МАР=РЕ,CYSTR=NT3
END
LDOCT:PROG;
;===== СПИСОК ЗАГРУЖАЕМЫХ ПРОГРАММ:
EXTERN ОСТ,INOUT,CTTWR,CTTSTP,SС00,SЕ00,RINT
EXTERN SF80,SFC0,SFE0,SFF0,SFF8,SFFC,INTINP
END
*END
*NО LIST
*CALL MPSEND:LDOCT=800
*END F
*END FILE
