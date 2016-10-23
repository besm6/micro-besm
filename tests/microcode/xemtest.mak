*NАМЕ 9:XEMTEST
*       РЕЖИМЫ ОЗУ + ХЕММИНГ
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
ХЕМ:PROG;
;
;    РАСПРЕДЕЛЕНИЕ РЕГИСТРОВ   Б О П П   ДЛЯ ТЕСТОВ   О З У:
;    0   1   2   3   4   5   6   7   8   9   А   В   С   D   Е   F
;  I-----------I---------------I---I--------------------------------I
;  I   I   I   I   32Р.АДРЕС   ITEГI         Д  А  Н  Н  Ы  Е       I
;  I-----------I---------------I---I--------------------------------I
;   0 РГ.БОПП - НОМЕР ТЕСТА
;   1 РГ.БОПП - ТИП ПРОВЕРКИ ИЛИ НОМЕР ПОДТЕСТА, РГ.INTR
;   2 РГ.БОПП = 0, ЕСЛИ ТЕСТ "КРУТИТСЯ"; = FF, ЕСЛИ ОШИБКА
;   3 РГ.БОПП - МЛ.БАЙТ ЧИСЛА ЦИКЛОВ ТЕСТА:ПРИЗН.ТОГО,ЧТО ТЕСТ"КРУТИТСЯ",РГ.MANT
;   ИЛИ 3-6 РГ.БОПП = АДРЕСУ (РГ.РС).
;   ЕСЛИ СРАВНИВАЕМ АДРЕСА (НАПР.,В ТЕСТЕ BTR),
;   РАСЧЕТНЫЙ АДРЕС - В 8-В РГ.БОПП; ПРОЧИТАННЫЙ - В С-F РГ.БОПП
;
;     ===============================
;     ОДИНОЧНАЯ ЗАПИСЬ, ЧТЕНИЕ  О З У
;     ===============================
ОЗУ1:ENTRY
;===== ОДИНОЧНАЯ ЗАПИСЬ В ПАМЯТЬ ЗАДАННОГО ЧИСЛА ПО ЗАДАННОМУ АДРЕСУ
;   3-6 РГ.БОПП - АДРЕС; 7-15 РГ,БОПП - ДАННЫЕ + ТЕГ
;
EXTERN RDADR,OUTADR,RDDAT,OUTDAT,OUTEMH,RD4/6,ERRDAF,INITST,OUTPCH
EXTERN ERRTST,CTTSTP,INITSM
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
;     ===================================
;     РЕЖИМ БЛОЧНОЙ ПЕРЕДАЧИ (СИГНАЛ BTR)
;     ===================================
;
;===== ВНИМАНИЕ! В ТЕСТАХ  BTR4,5  ПОСЛЕ ВЫДАЧИ В БОПП ОШИБКИ, ОБНАРУЖЕННОЙ
;   В РЕЖИМЕ BTR, НАДО ЛИБО ПРОДОЛЖАТЬ ТЕСТ С ПРЕРВАННОГО МЕСТА (С CRTN),
;   ЛИБО ДЕЛАТЬ ОБЩИЙ СБРОС И НАЧИНАТЬ СНАЧАЛА, Т.К. ИНАЧЕ МОЖЕТ
;   ОСТАТЬСЯ НЕ СБРОШЕННЫМ РЕЖИМ BTR И МОЖЕТ "ЗАВИСАТЬ" АРБИТР.
;
BTR4:ENTRY
;===== ЗАПИСЬ В ОЗУ 9+1 СЛОВ В РЕЖИМЕ BTR И ИХ ЧТЕНИЕ
;   ДАННЫЕ = АДРЕСУ.OR.В33; НАЧАЛЬНЫЙ АДРЕС = 0000 1000Н
;   ПИШЕМ В ОЗУ 1-Й РАЗ, ПЕРЕСЫЛАЕМ АДРЕС, УСТАНАВЛИВАЕМ РЕЖИМ BTR;
;   1,2 - ЧИТАЕМ ИЗ ОЗУ ОБЫЧНО, НЕ В РЕЖИМЕ BTR, СРАВНИВАЕМ;
;   3,4 - ЧИТАЕМ 1-Й РАЗ: УСТАНАВЛИВАЕМ АДРЕС И РЕЖИМ BTR, СРАВНИВАЕМ;
;   5,6 - ЧИТАЕМ В РЕЖИМЕ BTR, СРАВНИВАЕМ;
;   INTR - ТИП ПРОВЕРКИ (1-6), ПЕРЕСЫЛАЕТСЯ В 1 РГ.БОПП.
;   В БОПП: 3-6: АДРЕС; 7: ТЕГ; 8-15: ДАННЫЕ; 2: 0, ЕСЛИ ОК; FF, ЕСЛИ ОШИБКА.
;
CJP А=CONTB4,МАР=РЕ
CONTB4:CONT А=Н4,%Т%
CJS А=INITST,МАР=РЕ
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
;CONST, КОТОРУЮ ДОБАВЛЯЕМ К АДРЕСУ ПРИ ЗАПИСИ - В РГ.EXPN
CONT А=В33,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=EXPN
;НАЧАЛЬНЫЙ АДРЕС 01000Н - В РГ.MANT, +1 -  В РС, В АИСП
CONT А=В13,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=MANT
;
ССВ4:CONT ALUS=ZА,RА=MANT,Н,CI,ALUD=В,RВ=РС,ALU,YDST=ADRREG
;ДАННЫЕ = АДРЕС.OR.CONST - В RG3
CONT ALUS=АВ,RА=РС,RВ=EXPN,FUNC=OR,Н,ALU,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
;1-Й ФИЗ.АДРЕС - В RG0, ЗАПУСК АРБИТРА В РЕЖИМЕ BTR
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=BTRWR
WА0В4:CJP А=WА0В4,МАР=РЕ,COND=ARBRDY,IСС
;
;ДАЛЬШЕ ПИШЕМ 9 СЛОВ В ЦИКЛЕ БЕЗ ПЕРЕДАЧИ АДРЕСА
PUSH А=8,МАР=РЕ
;ПИШЕМ ДАННЫЕ = АДРЕСУ (РС+1).OR.CONST - В RG3 БОИ ДАННЫХ, ЗАПУСКАЕМ АРБИТР
CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В
CONT ALUS=АВ,RА=РС,RВ=EXPN,FUNC=OR,Н,ALU,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
CONT YDEV=PHYSAD,ARBI=BTRWR
WА1В4:CJP А=WА1В4,МАР=РЕ,COND=ARBRDY,IСС
RFCT %TIK3%
;СБРОС BTR
CONT YDEV=PHYSAD,ARBI=0
;
;ЧИТАЕМ, СРАВНИВАЕМ; СНАЧАЛА - ВСЕ 9+1 АДРЕСОВ БЕЗ РЕЖИМА BTR; INTR=1,2
PUSH А=9,МАР=РЕ,ALUS=ZА,RА=MANT,Н,ALUD=В,RВ=РС
CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG
CJS А=CMPBTR,МАР=РЕ,YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DRD,ALUS=DZ,FUNC=AND,Н
>,ALUD=В,RВ=INTR
RFCT %TIK3%
;
;ЧИТАЕМ В РЕЖИМЕ BTR:
;ЧИТАЕМ 1 РАЗ: УСТАНАВЛИВАЕМРЕЖИМ BTR, ПЕРЕДАЕМ АДРЕС; INTR=3,4
CONT А=С2,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=INTR
CONT ALUS=ZА,RА=MANT,Н,CI,ALUD=В,RВ=РС,ALU,YDST=ADRREG
CJS А=CMPBTR,МАР=РЕ,YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=BTRRD
;
;ЧИТАЕМ В ЦИКЛЕ В РЕЖИМЕ BTR; INTR=5,6
PUSH А=8,МАР=РЕ
CONT А=С4,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=INTR
CJS А=CMPBTR,МАР=РЕ,YDEV=PHYSAD,ARBI=BTRRD,ALUS=ZВ,RВ=РС,Н,CI,ALUD=В
RFCT %TIK3%
;СБРОС BTR
CJP А=ССВ4,МАР=РЕ,YDEV=PHYSAD
;
;П/П ЧТЕНИЯ И СРАВНЕНИЯ ДАННЫХ И ТЕГА
CMPBTR:CONT ALUS=АВ,RА=РС,RВ=EXPN,FUNC=OR,Н,ALUD=Q
CONT ALUS=ZQ,Н,ALUD=В,RВ=DADR
WASBTR:CJP А=WASBTR,МАР=РЕ,COND=ARBRDY,IСС
CONT ЕСА,ARA=RG2,ALUS=DZ,Н,ALUD=В,RВ=А
CONT ALUS=АВ,RА=А,RВ=DADR,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRDAF,МАР=РЕ,COND=СТ,SТОРС=21,YDEVT=ECBTAG,BRA=RG2,DSRC=SHIFT,MPS
>,PSHF=SН0,SHF=LOG,ALUS=DZ,Н,ALUD=В,RВ=У
CONT ALUS=АВ,RА=DADR,RВ=У,FUNC=EXOR,Н,ALUD=Q
CONT А=МВ,DSRC=PROM,ALUS=DQ,FUNC=AND,Н,ALUD=Q,CEN
CONT SТОРС=20,%ТУРЕ%
CRTN COND=СТ,SТОРС=20
;ОШИБКА:
CJP А=ERRDAF,МАР=РЕ
;
;ПРОВЕРИТЬ: ЕСЛИ СБРОС BTR ДЕЛАТЬ НЕ ТАК:
CONT YDST=BTRCLR
;
;
BTR5:ENTRY
;===== ЗАПИСЬ, ЧТЕНИИЕ ОЗУ В РЕЖИМЕ BTR С ЧТЕНИЕМ РЕГИСТРА АДРЕСА ОЗУ
; - ЗАПИСЬ В ОЗУ В РЕЖИМЕ BTR БЛОКАМИ ПО 8 СЛОВ;
; - ЧТЕНИЕ РГ.АДРЕСА ОЗУ ПОСЛЕ СНЯТИЯ РЕЖИМА BTR;
; - ЧТЕНИЕ ИЗ ОЗУ В РЕЖИМЕ BTR БЛОКАМИ ПО 8 СЛОВ;
; - ЧТЕНИЕ РГ.АДРЕСА ОЗУ ПОСЛЕ СБРОСА BTR; ЦИКЛ ПО ВСЕЙ ПАМЯТИ.
;   ДАННЫЕ = АДРЕСУ .OR.FFFF FFFF 0000 0000
;   РС - РАСЧЕТНЫЙ АДРЕС (СЧЕТЧИК В РГ.МПС); ВУТЕ - МАСКА НА 20 РАЗРЯДОВ;
;   А - ПРОЧИТАННЫЕ ДАННЫЕ; У - ТЕГ; РССОРУ - ПРОЧИТАННЫЙ АДРЕС;
;   EXPN - CONST (FFF...000)
;   INTR = 1   - НЕСОВПАДЕНИЕ РГ.АДРЕСА ПРИ ЗАПИСИ ПОСЛЕ СБРОСА РЕЖИМА BTR
;          2,3 - НЕСОВПАДЕНИЕ ДАННЫХ/ТЕГА ПРИ ЧТЕНИИ ПО АДРЕСУ,УСТАН.РЕЖИМ BTR
;          4,5 - НЕСОВПАДЕНИЕ ДАННЫХ/ТЕГА ПРИ СДЕДУЮЩЕМ ЧТЕНИИ В РЕЖИМЕ BTR
;          6   - НЕСОВПАДЕНИЕ РГ.АДРЕСА ПРИ ЧТЕНИИ ПОСЛЕ СНЯТИЯ РЕЖИМА BTR
;  В БОПП: ЕСЛИ ОШИБКА В АДРЕСЕ, 8-11 - РАСЧЕТНЫЙ АДРЕС; 12-15 - ПРОЧИТАННЫЙ.
;          ЕСЛИ ОШИБКА В ДАННЫХ - 8-15 - ДАННЫЕ; 7 - ТЕГ; 3-6 - РАСЧЕТНЫЙ АДРЕС.
;
CJP А=CONTB5,МАР=РЕ
CONTB5:CONT А=Н5,%Т%
CJS А=INITST,МАР=РЕ
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
;МАСКУ НА 20 РАЗРЯДОВ - В РГ.ВУТЕ; CONST - В РГ.EXPN
CONT А=MADR,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=ВУТЕ
CONT А=MNH,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=EXPN
;НАЧАЛЬНЫЙ АДРЕС - В РС, В ОЗУ, УСТАНАВЛИВАЕМ РЕЖИМ BTR
CONT А=С1,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РС
;
;ПИШЕМ БЛОКАМИ ПО 8 СЛОВ, ПОТОМ СНИМАЕМ РЕЖИМ BTR,ЧТОБ НЕ БЫЛО "TIME-OUT"
;НАЧАЛЬНЫЙ АДРЕС БЛОКА - В АИСП.,УСТАНАВЛИВАЕМ РЕЖИМ BTR
WRMB5:CONT ALUS=ZА,RА=РС,ALU,YDST=ADRREG
;ДАННЫЕ = РС + FF...00 - В RG3
CONT ALUS=АВ,RА=РС,RВ=EXPN,FUNC=OR,Н,ALU,YDEVT=ECBTAG,ЕСВ
>,WRB,BRA=RG3
;1-Й В БЛОКЕ ФИЗ.АДРЕС - В RG0, ЗАПУСК АРБИТРА В РЕЖИМЕ BTR
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=BTRWR
WА0В5:CJP А=WА0В5,МАР=РЕ,COND=ARBRDY,IСС
;УВЕЛИЧИВАЕМ АДРЕС (КАК В ОЗУ - В КОНЦЕ ЦИКЛА)
CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
;
;ДАЛЬШЕ ПИШЕМ В ЦИКЛЕ БЕЗ ПЕРЕДАЧИ АДРЕСА
PUSH А=7,МАР=РЕ
CONT ALUS=АВ,RА=РС,RВ=EXPN,FUNC=OR,Н,ALU,YDEVT=ECBTAG,ЕСВ
>,WRB,BRA=RG3
CONT YDEV=PHYSAD,ARBI=BTRWR
WА1В5:CJP А=WА1В5,МАР=РЕ,COND=ARBRDY,IСС
;КОНЕЦ ПАМЯТИ?
CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
CONT А=МАХА1,DSRC=PROM,ALUS=DА,RА=РС,FUNC=SUBR,Н,CI,CEN
;ВЫХОД, ЕСЛИ РС >,= МАХ АДРЕСУ ПАМЯТИ
CONT SТОРС=26
CJPP А=ENDWRM,МАР=РЕ,COND=СТ,SТОРС=26
;КОНЕЦ БЛОКА?
RFCT
;СБРАСЫВАЕМ РЕЖИМ BTR, ЧИТАЕМ РГ.АДРЕСА, СРАВНИВАЕМ; INTR = 1
CONT А=С1,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=INTR,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=1
CJS А=CMPADR,МАР=РЕ,YDEV=PHYSAD,ARBI=0
CJP А=WRMB5,МАР=РЕ
;
;ЧИТАЕМ В РЕЖМИЕ BTR БЛОКАМИ ПО 8 СЛОВ: НАЧАЛЬНЫЙ АДРЕС - В РС
ENDWRM:CONT А=С1,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РС,YDEV=PHYSAD,ARBI=0
;АДРЕС - В АИСП., УСТАНАВЛИВАЕМ РЕЖИМ BTR; INTR = 2,3
RDMB5:CONT ALUS=ZА,RА=РС,ALU,YDST=ADRREG
CONT А=С1,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=INTR
;ПРОВЕРЯЕМ ДАННЫЕ, ТЕГ
CJS А=CMPBTR,МАР=РЕ,YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=BTRRD
;УВЕЛИЧИВАЕМ АДРЕС
CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
;
;ДАЛЬШЕ ЧИТАЕМ В ЦИКЛЕ БЕЗ ПЕРЕДАЧИ АДРЕСА БЛОКАМИ ПО 8 СЛОВ; INTR = 4,5
PUSH А=7,МАР=РЕ
CONT А=С3,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=INTR
CJS А=CMPBTR,МАР=РЕ,YDEV=PHYSAD,ARBI=BTRRD
;КОНЕЦ ПАМЯТИ?
CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
CONT А=МАХА1,DSRC=PROM,ALUS=DА,RА=РС,FUNC=SUBR,Н,CI,CEN
;ВЫХОД, ЕСЛИ РС БОЛЬШЕ ИЛИ РАВЕН МАХ АДРЕСУ ПАМЯТИ
CONT SТОРС=26
CJPP А=ENDRDM,МАР=РЕ,COND=СТ,SТОРС=26
;КОНЕЦ БЛОКА?
RFCT
;СБРОС BTR; П/У НА СРАВНЕНИЕ АДРЕСА; INTR = 6
CONT А=С6,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=INTR,YDEV=PHYSAD,ARBI=0
CJS А=CMPADR,МАР=РЕ
CJP А=RDMB5,МАР=РЕ
;КОНЕЦ ПАМЯТИ
ENDRDM:CJP А=CONTB5,МАР=РЕ,YDEV=PHYSAD,ARBI=0
;
;П/П ЧТЕНИЯ РГ.АДРЕСА ОЗУ И СРАВНЕНИЯ
CMPADR:CONT А=С1,DSRC=PROM,ALUS=DZ,FUNC=EXNOR,Н,ALU,YDST=ADRREG
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DRD
WASUBA:CJP А=WASUBA,МАР=РЕ,COND=ARBRDY,IСС
CONT ЕСА,ARA=RG2,ALUS=DА,RА=ВУТЕ,FUNC=AND,Н,ALUD=В,RВ=РССОРУ
CONT ALUS=АВ,RА=РС,RВ=РССОРУ,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=20
CRTN COND=СТ,SТОРС=20
CJS А=OUTPCH,МАР=РЕ
CJP А=ERRTST,МАР=РЕ
;
;
;     =============================
;     ЧТЕНИЕ - МОДИФИКАЦИЯ - ЗАПИСЬ
;     =============================
;
RMW6:ENTRY
;===== ЗАПИСЬ В ОЗУ"0",ЧТЕНИЕ В РЕЖИМЕ ЧТЕНИЕ-МОДИФИКАЦИЯ-ЗАПИСЬ 2РАЗА,СРАВНЕНИЕ
;   ЧИТАТЬ МОДИФИЦИРОВАННЫЕ СЛОВА ТОЛЬКО КОМАНДАМИ RDMWR!
;   ИНАЧЕ БУДЕТ ЧТЕНИЕ ИЗ КЭША, КУДА МОДИФИЦИРОВАННЫЕ СЛОВА НЕ ЗАПИСЫВАЮТСЯ!
;   А,У - ПРОЧИТАННОЕ ИЗ ОЗУ 1-Й РАЗ ("0"); ИЛИ 2-Й РАЗ ("1" В 56 РАЗРЯДЕ)
;   РС   - АДРЕС; INTR - ТИП ПРОВЕРКИ: 1,2 - ЕСЛИ 1-ОЕ ЧТЕНИЕ; 3,4 - ЕСЛИ 2-ОЕ.
;   В БОПП: 3-6: АДРЕС; 7: ТЕГ; 8-15: ДАННЫЕ;
;
CJP А=CONTM6,МАР=РЕ
CONTM6:CONT А=Н6,%Т%
CJS А=INITST,МАР=РЕ
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
;НАЧАЛЬНЫЙ АДРЕС - В РС (1)
CONT А=С1,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РС
;ПИШЕМ В ОЗУ
WRMM6:CONT ALUS=ZВ,RВ=РС,Н,ALU,YDST=ADRREG
CONT ALUS=DZ,FUNC=AND,Н,ALU,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
WAWM6:CJP А=WAWM6,МАР=РЕ,COND=ARBRDY,IСС
CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
CONT А=В18,DSRC=PROM,ALUS=DА,RА=РС,FUNC=EXOR,Н,CEN
CONT SТОРС=21
CJP А=WRMM6,МАР=РЕ,COND=СТ,SТОРС=21
;
;ЧИТАЕМ В РЕЖИМЕ ЧТЕНИЕ-МОДИФИКАЦИЯ-ЗАПИСЬ
CONT А=С1,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РС
RDMM6:CONT ALUS=ZВ,RВ=РС,ALU,YDST=ADRREG
;ЧИТАЕМ НЕМОДИФИЦИРОВАННОЕ (ОНО ТОЛЬКО ПИШЕТСЯ!), INTR=1,2
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=RDMWR,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=INTR
CJS А=WASBTR,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=DADR
CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
CONT А=В18,DSRC=PROM,ALUS=DА,RА=РС,FUNC=EXOR,Н,CEN
CONT SТОРС=21
CJP А=RDMM6,МАР=РЕ,COND=СТ,SТОРС=21
;
;ЧИТАЕМ МОДИФИЦИРОВАННОЕ, INTR=3,4
CONT А=С1,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РС
RDMM26:CONT ALUS=ZВ,RВ=РС,ALU,YDST=ADRREG
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=RDMWR
CONT А=С2,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=INTR
CONT А=В56,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=DADR
CJS А=WASBTR,МАР=РЕ,YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=RDMWR
CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
CONT А=В18,DSRC=PROM,ALUS=DА,RА=РС,FUNC=EXOR,Н,CEN
CONT SТОРС=21
CJP А=RDMM26,МАР=РЕ,COND=СТ,SТОРС=21
CJP А=CONTM6,МАР=РЕ
;
;
RMW7:ENTRY
;===== ЗАПИСЬ В ОЗУ 128 СЛОВ, ДАННЫЕ = АДРЕСУ .OR. CONST ИЛИ /CONST;
;   ЧТЕНИЕ ИХ В РЕЖИМЕ ЧТЕНИЕ-МОДИФИКАЦИЯ-ЗАПИСЬ; СРАВНЕНИЕ.
;   ЧИТАТЬ МОДИФИЦИРОВАННЫЕ СЛОВА ТОЛЬКО КОМАНДАМИ RDMWR!
;   РС - АДРЕС; MANT - НАЧАЛЬНЫЙ АДРЕС; ВУТЕ - НАЧАЛЬНАЯ CONST;
;   HALF - CONST ИЛИ /CONST; DADR - ТО, ЧТО Д.ПРОЧИТАТЬ; А,У - ЧТО ПРОЧИТАЛИ
;   INTR = 1,2 - ЕСЛИ ПРОСТОЕ ЧТЕНИЕ;
;          3,4 - ЕСЛИ 1-ОЕ ЧТЕНИЕ С МОДИФИКАЦИЕЙ;
;          5,6 - ЕСЛИ 2-ОЕ ЧТЕНИЕ; ЧИТАЕМ МОДИФИЦИРОВАННОЕ;
;
CJP А=CONTM7,МАР=РЕ
CONTM7:CONT А=Н7,%Т%
CJS А=INITST,МАР=РЕ
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
;НАЧАЛЬНЫЙ АДРЕС - В MANT (07FB Н)
CONT А=SL5ZZZ,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=MANT
;ЧИТАЕМ CONST В РГ. HALF, КОПИЯ - В ВУТЕ
CONT А=MNH,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=HALF
CONT ALUS=ZА,RА=HALF,Н,ALUD=В,RВ=ВУТЕ
;ПИШЕМ В ОЗУ
PUSH А=127,МАР=РЕ,ALUS=ZА,RА=MANT,Н,ALUD=В,RВ=РС
CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG
CONT ALUS=АВ,RА=РС,RВ=HALF,FUNC=OR,Н,ALU,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
;ИНВЕРТИРУЕМ CONST
CONT ALUS=ZВ,RВ=HALF,FUNC=EXNOR,Н,ALUD=В
WAWM7:CJP А=WAWM7,МАР=РЕ,COND=ARBRDY,IСС
RFCT %TIK3%
;ПРОСТО ЧИТАЕМ, СРАВНИВАЕМ; INTR=1,2
CONT ALUS=ZА,RА=ВУТЕ,Н,ALUD=В,RВ=HALF
PUSH А=127,МАР=РЕ,ALUS=ZА,RА=MANT,Н,ALUD=В,RВ=РС
CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=INTR
;ЧИТАЕМ
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DRD
>,ALUS=АВ,RА=РС,RВ=HALF,FUNC=OR,Н,ALUD=Q
CJS А=WASBTR,МАР=РЕ,ALUS=ZQ,Н,ALUD=В,RВ=DADR
;
;ЧИТАЕМ В РЕЖИМЕ ЧТЕНИЕ-МОДИФИКАЦИЯ-ЗАПИСЬ, СРАВНИВАЕМ, INTR=3,4
;ЧИТАЕМ НЕМОДИФИЦИРОВАННОЕ (ОНО ТОЛЬКО ПИШЕТСЯ!), ВЫЧИСЛЯЕМ CONST
CONT А=С2,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=INTR
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=RDMWR
>,ALUS=АВ,RА=РС,RВ=HALF,FUNC=OR,Н,ALUD=Q
CJS А=WASBTR,МАР=РЕ,ALUS=ZQ,Н,ALUD=В,RВ=DADR
;
;ЧИТАЕМ ЕЩЕ РАЗ ПО ТОМУ ЖЕ АДРЕСУ (МОДИФИЦИРОВАННОЕ); ФИЗ.АДРЕС - НА ШИНУ СНОВА
;ВЫЧИСЛЯЕМ МОДИФИЦИРОВАННУЮ CONST, INTR=5,6
CONT А=В56,DSRC=PROM,ALUS=DА,RА=DADR,FUNC=OR,Н,ALUD=В,RВ=DADR,YDEV=PHYSAD
>,ЕСВ,WRB,BRA=RG0,ARBI=RDMWR
CONT А=С4,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=INTR
CJS А=WASBTR,МАР=РЕ,%TIK3%
;ИНВЕРТИРУЕМ CONST ДЛЯ СЛЕД.ЦИКЛА
RFCT ALUS=ZВ,RВ=HALF,FUNC=EXNOR,Н,ALUD=В
CJP А=CONTM7,МАР=РЕ
;
;
;     ============================
;     ПРОВЕРКА ГЕНЕРАТОРА ХЕММИНГА
;     ============================
;
ХЕМ8:ENTRY
;===== ОДИНОЧНАЯ ЗАПИСЬ CONST В ОЗУ; ЧТЕНИЕ ЧИСЛА; ЧТЕНИЕ РЕГИСТРА СИНДРОМА
;   РС - АДРЕС ОЗУ; А,У - ЧИСЛО ИЗ ОЗУ; РССОРУ - ПРОЧИТАННЫЙ СИНДРОМ
;   В БОПП: 6: СИНДРОМ; 7: ТЕГ; 8-15: ДАННЫЕ
;
CJP А=CONTX8,МАР=РЕ
CONTX8:CONT А=Н8,%Т%
CJS А=INITST,МАР=РЕ
;УСТАНАВЛИВАЕМ ВСЕ БЛОКИРОВКИ В РР: 07С5 F000 (БП, БВП И Т.Д.)
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
;ОСТАНАВЛИВАЕТ ТАЙМЕР
CJS А=CTTSTP,МАР=РЕ
;ОТКРЫВАЕМ ПРЕРЫВАНИЯ (ДЛЯ ЛОВЛИ, НАПР., МНОГОКРАТНОЙ ОШИБКИ)
CONT А=МВ,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=ВУТЕ,FFCNT=SETEI
;"ВКЛЮЧАЕМ" ХЕММИНГ: ПИШЕМ "0" В СТАТУСНЫЙ РЕГИСТР ОЗУ
CONT А=В2,DSRC=PROM,ALUS=DZ,FUNC=EXNOR,ALU,YDST=ADRREG
CONT А=ZER,DSRC=PROM,ЕСА,WRA,ARA=RG3,YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
WASX8:CJP А=WASX8,МАР=РЕ,COND=ARBRDY,IСС
;
;ПИШЕМ CONST В ОЗУ
CONT А=В8,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РС,ALU,YDST=ADRREG
CONT А=В28,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=DADR,ALU,ЕСВ,WRB,BRA=RG3
CONT А=ZER,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=HALF,ALU,YDEVT=ECBTAG,WRB,BRA=RG3
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
WWX8:CJP А=WWX8,МАР=РЕ,COND=ARBRDY,IСС
;
;ДЕЛАЕМ СБРОС КЭША, ЧИТАЕМ CONST
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DRD,YDST=CCLR
WRX8:CJP А=WRX8,МАР=РЕ,COND=ARBRDY,IСС
;ПЕРЕПИСЫВАЕМ ИЗ БОИ В А,У ТО, ЧТО ПРОЧИТАЛИ ИЗ ОЗУ
CONT ЕСА,ARA=RG2,ALUS=DZ,Н,ALUD=В,RВ=А
CONT YDEVT=ECBTAG,BRA=RG2,DSRC=SHIFT,MPS,PSHF=SН0,SHF=LOG,ALUS=DА,RА=ВУТЕ
>,FUNC=AND,Н,ALUD=В,RВ=У
;ЧИТАЕМ РЕГИСТР СИНДРОМА (ЕСЛИ БЕЗ ОШИБОК, СИНДРОМ ЧИТАЕТСЯ СТАРЫЙ)
;АДРЕС РГ.СИНДРОМА FFFF FFFF
CONT А=МН,DSRC=PROM,ALUS=DZ,ALU,YDST=ADRREG
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DRD
WRRSX8:CJP А=WRRSX8,МАР=РЕ,COND=ARBRDY,IСС
CONT ЕСА,ARA=RG2,ALUS=DА,RА=ВУТЕ,FUNC=AND,Н,ALUD=В,RВ=РССОРУ
>,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=6
CJS А=OUTDAT,МАР=РЕ
SТОРХ8:CJP А=SТОРХ8,МАР=РЕ
;
;
ХЕМ9:ENTRY
;===== ИСПРАВЛЕНИЕ ОШИБКИ В КОНСТАНТЕ ХЕММИНГОМ ПО ФИКСИРОВАННОМУ АДРЕСУ ПАМЯТИ
; - ЗАПИСЬ CONST В ПАМЯТЬ С ХЕММИНГОМ; ОТКЛЮЧЕНИЕ ГЕНЕРАТОРА ХЕММИНГА;
; - ИЗМЕНЕНИЕ 1 РАЗРЯДА И ЗАПИСЬ; ЧТЕНИЕ С ХЕММИНГОМ, Т.Е. С КОРРЕКТИРОВКОЙ;
;   РС - АДРЕС; DADR - CONST В РАЗРЯДАХ ДАННЫХ; HALF - CONST В РАЗРЯДАХ ТЕГА;
;   А    - ЧТО ПРОЧИТАЛИ В РАЗРЯДАХ ДАННЫХ, У - ТЕГА; Q - РЕЗ-Т СРАВНЕНИЯ
;   INTR - 1,2 - ЕСЛИ ЧИТАЕМ CONST (ПРОВЕРЯЕМ, КАК ЗАПИСАЛОСЬ)
;          3,4 - ЧИТАЕМ CONST С ИЗМЕНЕННЫМ 1 РАЗРЯДОМ БЕЗ ХЕММИНГА
;          5,6 - ЧИТАЕМ CONST С ОШИБКОЙ И С ХЕММИНГОМ (Д.Б. ИСПРАВЛЕННОЕ!)
;   WR3,WR4 - РАЗРЯД, ИЗМЕНЯЕМЫЙ ПРИ ЗАПИСИ В ОЗУ БЕЗ ХЕММИНГА (ГДЕ ОШИБКА)
;   В БОПП: 7-15 - "ПЛОХИЕ" ДАННЫЕ; 6 - ПРОЧИТАННЫЙ СИНДРОМ;
;
CJP А=CONTX9,МАР=РЕ
CONTX9:CONT А=Н9,%Т%
CJS А=INITST,МАР=РЕ
CONT А=МВ,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=ВУТЕ
CJS А=CTTSTP,МАР=РЕ
;УСТАНАВЛИВАЕМ ВСЕ БЛОКИРОВКИ В РР: 07С5 F000, РАЗРЕШАЕМ ПРЕРЫВАНИЯ
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
>,FFCNT=SETEI
;ЧИТАЕМ БИТ, ИЗМЕНЯЕМЫЙ ПРИ ЗАПИСИ В ОЗУ БЕЗ ХЕММИНГА (ОШИБОЧНЫЙ РАЗРЯД)
;ДЛЯ РАЗРЯДОВ ДАННЫХ
СХ9:CONT А=В2,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=WR3
;ДЛЯ РАЗРЯДОВ ТЕГА
CONT А=ZER,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=WR4
;"ВКЛЮЧАЕМ" ХЕММИНГ ("0" - В СТАТУСНЫЙ РЕГИСТР)
CONT А=В2,DSRC=PROM,ALUS=DZ,FUNC=EXNOR,ALU,YDST=ADRREG
CONT А=ZER,DSRC=PROM,ЕСА,WRA,ARA=RG3,YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
WASXX9:CJP А=WASXX9,МАР=РЕ,COND=ARBRDY,IСС
;
;ЧИТАЕМ CONST В DADR ДЛЯ РАЗРЯДОВ ДАННЫХ; В HALF - ДЛЯ РАЗРЯДОВ ТЕГА, В РС - АДР
;ПИШЕМ CONST В ОЗУ С ХЕММИНГОМ (В ОЗУ ЗАПИСЫВАЮТСЯ КОНТРОЛЬНЫЕ РАЗРЯДЫ)
CONT А=В13,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РС,ALU,YDST=ADRREG
CONT А=СААА,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=DADR,ALU,ЕСВ,WRB,BRA=RG3
CONT А=СААА,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=HALF,ALU,YDEVT=ECBTAG,WRB,BRA=RG3
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
CWWAX9:CJP А=CWWAX9,МАР=РЕ,COND=ARBRDY,IСС
;
;ПРОВЕРЯЕМ CONST, INTR=1,2; СБРАСЫВАЕМ КЭШ, ЧТОБ ЧИТАЛОСЬ ИЗ ПАМЯТИ
CJS А=SUBPRX,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=INTR,YDST=CCLR
;
;"ВЫКЛЮЧАЕМ" ХЕММИНГ
CONT А=С2,DSRC=PROM,ALUS=DZ,FUNC=EXNOR,ALU,YDST=ADRREG
CONT А=С1,DSRC=PROM,ЕСА,WRA,ARA=RG3,YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
CXWAX9:CJP А=CXWAX9,МАР=РЕ,COND=ARBRDY,IСС
;
;ПИШЕМ ТО ЖЕ ЧИСЛО С "ОШИБКОЙ" В 1 РАЗРЯДЕ И БЕЗ ХЕММИНГА
CONT ALUS=АВ,RА=WR3,RВ=DADR,FUNC=EXOR,Н,ALUD=В,ALU,ЕСВ,WRB,BRA=RG3
CONT ALUS=АВ,RА=WR4,RВ=HALF,FUNC=EXOR,Н,ALUD=В,ALU,YDEVT=ECBTAG,WRB,BRA=RG3
CONT ALUS=ZВ,RВ=РС,ALUD=В,ALU,YDST=ADRREG
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
EWWAX9:CJP А=EWWAX9,МАР=РЕ,COND=ARBRDY,IСС
;
;ПРОВЕРЯЕМ CONST С ОШИБКОЙ БЕЗ ХЕММИНГА, INTR=3,4; ДЕЛАЕМ СБРОС КЭША
CONT А=С2,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=INTR
CJS А=SUBPRX,МАР=РЕ,YDST=CCLR
;
;"ВКЛЮЧАЕМ" ХЕММИНГ, ВОССТАНАВЛИВАЕМ CONST ДЛЯ СРАВНЕНИЯ
CONT А=С2,DSRC=PROM,ALUS=DZ,FUNC=EXNOR,ALU,YDST=ADRREG
CONT А=ZER,DSRC=PROM,ЕСА,WRA,ARA=RG3,YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
EWCX9:CJP А=EWCX9,МАР=РЕ,COND=ARBRDY,IСС
CONT ALUS=АВ,RА=WR3,RВ=DADR,FUNC=EXOR,Н,ALUD=В
CONT ALUS=АВ,RА=WR4,RВ=HALF,FUNC=EXOR,Н,ALUD=В
;
;ЧИТАЕМ "ОШИБОЧНУЮ" CONST С КОРРЕКТИРОВКОЙ, INTR=5,6
CONT А=С4,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=INTR
CJS А=SUBPRX,МАР=РЕ,YDST=CCLR
CJP А=СХ9,МАР=РЕ,%TIK%
;
;П/П ЧТЕНИЯ ИЗ ПАМЯТИ, СРАВНЕНИЯ С DADR И HALF И ВЫДАЧИ ИХ В БОПП
SUBPRX:CONT ALUS=ZВ,RВ=РС,ALU,YDST=ADRREG
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DRD
WASXWA:CJP А=WASXWA,МАР=РЕ,COND=ARBRDY,IСС
CONT ЕСА,ARA=RG2,ALUS=DZ,Н,ALUD=В,RВ=А
CONT %ТУРЕ%
CONT ALUS=АВ,RА=А,RВ=DADR,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=21,YDEVT=ECBTAG,BRA=RG2,DSRC=SHIFT,MPS,PSHF=SН0,SHF=LOG
>,ALUS=DА,RА=ВУТЕ,FUNC=AND,Н,ALUD=В,RВ=У
CJP А=ERRX,МАР=РЕ,COND=СТ,SТОРС=21,ALUS=АВ,RА=HALF,RВ=У,FUNC=EXOR,Н,ALUD=Q
CONT ALUS=AQ,RА=ВУТЕ,FUNC=AND,Н,ALUD=Q,CEN
CONT SТОРС=20,%ТУРЕ%
CRTN COND=СТ,SТОРС=20
;ОШИБКА: ЧИТАЕМ СИНДРОМ;  А,У И СИНДРОМ - В БОПП
ERRX:CONT А=МН,DSRC=PROM,ALUS=DZ,ALU,YDST=ADRREG
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DRD
WASSRX:CJP А=WASSRX,МАР=РЕ,COND=ARBRDY,IСС
CONT ЕСА,ARA=RG2,ALUS=DА,RА=ВУТЕ,FUNC=AND,Н,ALUD=В,RВ=РССОРУ
>,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=6
CJS А=OUTDAT,МАР=РЕ
CJP А=ERRTST,МАР=РЕ
;
;
ХЕМА:ENTRY
;===== ИСПРАВЛЕНИЕ ОШИБОК В КОНСТАНТЕ ХЕММИНГОМ; ЦИКЛ ПО ВСЕМ АДРЕСАМ ПАМЯТИ
;   ЗАПИСЬ CONST В ПАМЯТЬ С ХЕММИНГОМ; ОТКЛЮЧЕНИЕ ГЕНЕРАТОРА ХЕММИНГА;
;   ИЗМЕНЕНИЕ 1 РАЗРЯДА И ЗАПИСЬ; ЧТЕНИЕ С ХЕММИНГОМ, Т.Е. С КОРРЕКТИРОВКОЙ;
;   РС   - АДРЕС, НАЧИНАЯ С 1; DADR - CONST В РАЗРЯДАХ ДАННЫХ; HALF - ТЕГА
;   А    - ЧТО ПРОЧИТАЛИ В РАЗРЯДАХ ДАННЫХ, У - ТЕГА; Q - РЕЗ-Т СРАВНЕНИЯ
;   INTR = 1,2 - ЕСЛИ ЧИТАЕМ CONST
;          3,4 - ЧИТАЕМ CONST С ИЗМЕНЕННЫМ 1 РАЗРЯДОМ БЕЗ ХЕММИНГА
;          5,6 - ЧИТАЕМ CONST С ОШИБКОЙ И С ХЕММИНГОМ (Д.Б. ИСПРАВЛЕННОЕ!)
;   РССОРУ - СИНДРОМ (ЧИТАЕМ, ЕСЛИ ОШИБКА); EXPN - К-ВО ОШИБОК;
;   MANT - НОМЕР ЦИКЛА ЧТЕНИЯ (1-CONST; 2-С ОШИБКОЙ; 3,4,...- ИСПРАВЛЕННАЯ)
;   WR3,WR4 - БИТ, ИЗМЕНЯЕМЫЙ ПРИ ЗАПИСИ В ОЗУ БЕЗ ХЕММИНГА (ОШИБОЧНЫЙ)
;   В БОПП: 1 - КОД ОШИБКИ (РГ.INTR); 6: СИНДРОМ; 7: ТЕГ; 8-15: ДАННЫЕ;
;
CJP А=CONTXA,МАР=РЕ
CONTXA:CONT А=НА,%Т%
CJS А=INITST,МАР=РЕ
CJS А=CTTSTP,МАР=РЕ
;УСТАНАВЛИВАЕМ ВСЕ БЛОКИРОВКИ В РР: 07С5 F000, РАЗРЕШАЕМ ПРЕРЫВАНИЯ
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
CONT А=МВ,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=ВУТЕ,FFCNT=SETEI
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=MANT
;ЧИТАЕМ РАЗРЯД, КОТОРЫЙ БУДЕМ "ПОРТИТЬ" В РАЗРЯДАХ ДАННЫХ
CONT А=В2,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=WR3
;ИЛИ В РАЗРЯДАХ ТЕГА
CONT А=ZER,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=WR4
;
;"ВКЛЮЧАЕМ" ХЕММИНГ
CONT А=В2,DSRC=PROM,ALUS=DZ,FUNC=EXNOR,ALU,YDST=ADRREG
CONT А=ZER,DSRC=PROM,ЕСА,WRA,ARA=RG3,YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
WASXXA:CJP А=WASXXA,МАР=РЕ,COND=ARBRDY,IСС
;
;ЧИТАЕМ CONST В РГ.DADR ДЛЯ РАЗРЯДОВ ДАННЫХ; В РГ.HALF - ДЛЯ РАЗРЯДОВ ТЕГА
CONT А=СААА,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=DADR
CONT А=СААА,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=HALF
CNTXA:CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=РС
;
;ПИШЕМ CONST В ОЗУ С ХЕММИНГОМ (В ОЗУ ЗАПИСЫВАЮТСЯ КОНТРОЛЬНЫЕ РАЗРЯДЫ)
CWRMXA:CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG
>,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
CONT ALUS=ZА,RА=DADR,Н,ALU,ЕСВ,WRB,BRA=RG3
CONT ALUS=ZА,RА=HALF,ALU,YDEVT=ECBTAG,WRB,BRA=RG3
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
CWWAXA:CJP А=CWWAXA,МАР=РЕ,COND=ARBRDY,IСС,ALUS=ZА,RА=РС,Н,CI,ALUD=Q
CONT А=В18,DSRC=PROM,ALUS=DQ,FUNC=EXOR,CEN
CONT SТОРС=21
CJP А=CWRMXA,МАР=РЕ,COND=СТ,SТОРС=21
;
;ПРОВЕРЯЕМ CONST
;0 - В РГ.РС (АДРЕС), В EXPN (ЧИСЛО ОШИБОК), MANT+1 (N ЦИКЛА), INTR=1,2
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=РС
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=EXPN
CONT ALUS=ZВ,RВ=MANT,Н,CI,ALUD=В
CRDXA:CONT А=ZER,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=INTR
;П/У НА П/П ЧТЕНИЯ И СРАВНЕНИЯ, В DADR И HALF - ЧИСЛА, С КОТ.БУДЕМ СРАВНИВАТЬ
CJS А=SUBPRX,МАР=РЕ,ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
CONT ALUS=ZА,RА=РС,Н,CI,ALUD=Q
CONT А=В18,DSRC=PROM,ALUS=DQ,FUNC=EXOR,СЕМ
CONT SТОРС=37
CJP А=CRDXA,МАР=РЕ,COND=СТ,SТОРС=37
;
;ВЫДАЧА В БОПП N ЦИКЛА И ЧИСЛА ОШИБОК, ЗАДЕРЖКА
CJS А=OUTEMH,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR5
WАТЕХА:CONT А=В8,DSRC=PROM,ALUS=DА,RА=WR5,FUNC=EXOR,Н,CEN
CONT ALUS=ZВ,RВ=WR5,Н,CI,ALUD=В,SТОРС=21
CJP А=WАТЕХА,МАР=РЕ,COND=СТ,SТОРС=21
;
;"ВЫКЛЮЧАЕМ" ХЕММИНГ
CONT А=С2,DSRC=PROM,ALUS=DZ,FUNC=EXNOR,ALU,YDST=ADRREG
CONT А=С1,DSRC=PROM,ЕСА,WRA,ARA=RG3,YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
CXWAXA:CJP А=CXWAXA,МАР=РЕ,COND=ARBRDY,IСС
;
;ПИШЕМ ТО ЖЕ ЧИСЛО С "ОШИБКОЙ" В 1 РАЗРЯДЕ И БЕЗ ХЕММИНГА
;ЕСЛИ ОШИБКА В ДАННЫХ
CONT ALUS=АВ,RА=WR3,RВ=DADR,FUNC=EXOR,Н,ALUD=В
;ЕСЛИ ОШИБКА В ТЕГЕ
CONT ALUS=АВ,RА=WR4,RВ=HALF,FUNC=EXOR,Н,ALUD=В
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=РС
EWRMXA:CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG,YDEV=МРМЕМ,WRY,IОМР
>,MPADR=3
CONT ALUS=ZА,RА=DADR,Н,ALU,ЕСВ,WRB,BRA=RG3
CONT ALUS=ZА,RА=HALF,ALU,YDEVT=ECBTAG,WRB,BRA=RG3
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
EWWAXA:CJP А=EWWAXA,МАР=РЕ,COND=ARBRDY,IСС,ALUS=ZА,RА=РС,Н,CI,ALUD=Q
CONT А=В18,DSRC=PROM,ALUS=DQ,FUNC=EXOR,CEN
CONT SТОРС=21
CJP А=EWRMXA,МАР=РЕ,COND=СТ,SТОРС=21
;
;ПРОВЕРЯЕМ CONST С ОШИБКОЙ БЕЗ ХЕММИНГА
;0 - В РГ.РС (АДРЕС), В EXPN (ЧИСЛО ОШИБОК), MANT+1 (N ЦИКЛА), INTR=3,4
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=РС
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=EXPN
CONT ALUS=ZВ,RВ=MANT,Н,CI,ALUD=В
CRCEXA:CONT А=С2,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=INTR
;П/У НА П/П ЧТЕНИЯ И СРАВНЕНИЯ, В DADR И HALF - ЧИСЛА, С КОТ.БУДЕМ СРАВНИВАТЬ
CJS А=SUBPRX,МАР=РЕ,ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
CONT ALUS=ZА,RА=РС,Н,CI,ALUD=Q
CONT А=В18,DSRC=PROM,ALUS=DQ,FUNC=EXOR,СЕМ
CONT SТОРС=37
CJP А=CRCEXA,МАР=РЕ,COND=СТ,SТОРС=37
;
;ВЫДАЧА В БОПП N ЦИКЛА И ЧИСЛА ОШИБОК, ЗАДЕРЖКА
CJS А=OUTEMH,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR5
WTR1XA:CONT А=В8,DSRC=PROM,ALUS=DА,RА=WR5,FUNC=EXOR,Н,CEN
CONT ALUS=ZВ,RВ=WR5,Н,CI,ALUD=В,SТОРС=21
CJP А=WTR1XA,МАР=РЕ,COND=СТ,SТОРС=21
;
;"ВКЛЮЧАЕМ" ХЕММИНГ, ВОССТАНАВЛИВАЕМ CONST ДЛЯ СРАВНЕНИЯ
CONT А=С2,DSRC=PROM,ALUS=DZ,FUNC=EXNOR,ALU,YDST=ADRREG
CONT А=ZER,DSRC=PROM,ЕСА,WRA,ARA=RG3,YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
EWCXXA:CJP А=EWCXXA,МАР=РЕ,COND=ARBRDY,IСС
CONT ALUS=АВ,RА=WR3,RВ=DADR,FUNC=EXOR,Н,ALUD=В
CONT ALUS=АВ,RА=WR4,RВ=HALF,FUNC=EXOR,Н,ALUD=В
;
;ЧТЕНИЕ "ОШИБОЧНЫХ" ДАННЫХ С КОРРЕКТИРОВКОЙ
;0 - В РГ.РС (АДРЕС), В EXPN (ЧИСЛО ОШИБОК), MANT+1 (N ЦИКЛА), INTR=5,6
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=РС
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=EXPN
CONT ALUS=ZВ,RВ=MANT,Н,CI,ALUD=В
CCRXA:CONT А=С4,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=INTR
CJS А=SUBPRX,МАР=РЕ,ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
CONT ALUS=ZА,RА=РС,Н,CI,ALUD=Q
CONT А=В18,DSRC=PROM,ALUS=DQ,FUNC=EXOR,СЕМ
CONT SТОРС=37
CJP А=CCRXA,МАР=РЕ,COND=СТ,SТОРС=37
;
;ВЫДАЧА В БОПП N ЦИКЛА И ЧИСЛА ОШИБОК, ЗАДЕРЖКА
CJS А=OUTEMH,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR5
WTR3XA:CONT А=В8,DSRC=PROM,ALUS=DА,RА=WR5,FUNC=EXOR,Н,CEN
CONT ALUS=ZВ,RВ=WR5,Н,CI,ALUD=В,SТОРС=21
CJP А=WTR3XA,МАР=РЕ,COND=СТ,SТОРС=21
CJP А=CNTXA,МАР=РЕ
;
;
ХЕМВ:ENTRY
;===== ИСПРАВЛЕНИЕ "БЕГУЩИХ" ОШИБОЧНЫХ РАЗРЯДОВ В ДАННЫХ=АДРЕСУ.OR.CONST
;   ЗАПИСЬ ЧИСЛА В ПАМЯТЬ С ХЕММИНГОМ; ОТКЛЮЧЕНИЕ ГЕНЕРАТОРА ХЕММИНГА;
;   ИЗМЕНЕНИЕ 1 РАЗРЯДА И ЗАПИСЬ; ЧТЕНИЕ С ХЕММИНГОМ, Т.Е. С КОРРЕКТИРОВКОЙ;
;   ЦИКЛ ПО ВСЕМ АДРЕСАМ ПАМЯТИ И ПО ВСЕМ "ОШИБОЧНЫМ" РАЗРЯДАМ
;   РС   - АДРЕС, НАЧИНАЯ С 1; DADR - ДАННЫЕ; HALF - ТЕГ (= МЛ.БАЙТУ ДАННЫХ)
;   WR2  - CONST,ДОБАВЛЯЕМАЯ К АДРЕСУ ДЛЯ ПОЛУЧЕНИЯ ЧИСЛА ПРИ ЗАПИСИ В ПАМЯТЬ
;   WR3,WR4 - ОШИБОЧНЫЙ РАЗРЯД, ИЗМЕНЯЕМЫЙ ПРИ ЗАПИСИ В ПАМЯТЬ БЕЗ ХЕММИНГА
;       WR3      WR4
;   I.1.......I...:.....I "БЕГУЩИЙ" ОШИБОЧНЫЙ РАЗРЯД
;     ДАННЫЕ   ТЕГ МИМО
;   А    - ЧТО ПРОЧИТАЛИ В РАЗРЯДАХ ДАННЫХ, У - ТЕГА; Q - РЕЗ-Т СРАВНЕНИЯ
;   INTR = 1,2 - ЕСЛИ ЧИТАЕМ CONST
;          3,4 - ЧИТАЕМ CONST С ИЗМЕНЕННЫМ 1 РАЗРЯДОМ БЕЗ ХЕММИНГА
;          5,6 - ЧИТАЕМ CONST С ОШИБКОЙ И С ХЕММИНГОМ (Д.Б. ИСПРАВЛЕННОЕ!)
;   РССОРУ - СИНДРОМ (ЧИТАЕМ, ЕСЛИ ОШИБКА); EXPN - К-ВО ОШИБОК В ЦИКЛЕ
;   MANT - НОМЕР ЦИКЛА ЧТЕНИЯ (1-CONST; 2-С ОШИБКОЙ; 3,4,...- ИСПРАВЛЕННАЯ)
;   В БОПП: 1: КОД ОШИБКИ (РГ.INTR); 6: СИНДРОМ; 7: ТЕГ; 8-15: ДАННЫЕ
;
CJP А=CONTXB,МАР=РЕ
CONTXB:CONT А=НВ,%Т%
CJS А=INITST,МАР=РЕ
CJS А=CTTSTP,МАР=РЕ
;УСТАНАВЛИВАЕМ ВСЕ БЛОКИРОВКИ В РР: 07С5 F000, РАЗРЕШАЕМ ПРЕРЫВАНИЯ
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
CONT А=МВ,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=ВУТЕ,FFCNT=SETEI
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=MANT
;ЧИТАЕМ БИТ ОШИБКИ, КОТ. БУДЕМ ЦИКЛИЧЕСКИ СДВИГАТЬ В ПРЕДЕЛАХ 128 РАЗРЯДОВ,
;ИЗ КОТОРЫХ 72 СООТВЕТСТВУБТ РАЗРЯДАМ ПАМЯТИ, ОСТАЛЬНЫЕ НИКАК НЕ ВЛИЯЮТ,
;Т.Е. НЕ "ПОРТЯТ" ДАННЫЕ, СИНДРОМ = 0, ЕСЛИ НЕ ПРОЗОШЛО СЛУЧАЙНОГО СБОЯ.
CONT А=В64,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=WR3
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR4
;ЧИТАЕМ CONST В РГ.WR2 ДЛЯ ДОБАВЛЕНИЯ К АДРЕСУ
CONT А=MNH,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=WR2
;
;"ВКЛЮЧАЕМ" ХЕММИНГ, ОБНУЛЯЕМ РГ.АДРЕСА ПО ПАМЯТИ (РС)
CONT А=В2,DSRC=PROM,ALUS=DZ,FUNC=EXNOR,ALU,YDST=ADRREG
CONT А=ZER,DSRC=PROM,ЕСА,WRA,ARA=RG3,YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
WASX:CJP А=WASX,МАР=РЕ,COND=ARBRDY,IСС
CICLW:CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=РС
;
;ПИШЕМ ЧИСЛО В ОЗУ С ХЕММИНГОМ (С КОНТРОЛЬНЫМИ РАЗРЯДАМИ)
CWRM:CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
CONT ALUS=АВ,RА=РС,RВ=WR2,FUNC=OR,Н,ALU,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
CWWA:CJP А=CWWA,МАР=РЕ,COND=ARBRDY,IСС,ALUS=ZА,RА=РС,Н,CI,ALUD=Q
CONT А=В18,DSRC=PROM,ALUS=DQ,FUNC=EXOR,CEN
CONT SТОРС=21
CJP А=CWRM,МАР=РЕ,COND=СТ,SТОРС=21
;
;ПРОВЕРЯЕМ CONST
;0 - В РГ.РС (АДРЕС), В EXPN (ЧИСЛО ОШИБОК), MANT+1 (N ЦИКЛА), INTR=1,2
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=РС
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=EXPN
CONT ALUS=ZВ,RВ=MANT,Н,CI,ALUD=В
CRD:CONT А=ZER,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=INTR
;П/У НА П/П ЧТЕНИЯ И СРАВНЕНИЯ, В DADR И HALF - ЧИСЛО, С КОТ.БУДЕМ СРАВНИВАТЬ
CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
CONT ALUS=АВ,RА=РС,RВ=WR2,FUNC=OR,Н,ALUD=Q
CONT ALUS=ZQ,Н,ALUD=В,RВ=DADR
CJS А=SUBPRX,МАР=РЕ,ALUS=ZQ,Н,ALUD=В,RВ=HALF
CONT ALUS=ZА,RА=РС,Н,CI,ALUD=Q
CONT А=В18,DSRC=PROM,ALUS=DQ,FUNC=EXOR,СЕМ
CONT SТОРС=37
CJP А=CRD,МАР=РЕ,COND=СТ,SТОРС=37
;
;ВЫДАЧА В БОПП N ЦИКЛА И ЧИСЛА ОШИБОК, ЗАДЕРЖКА
CJS А=OUTEMH,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR5
WATER0:CONT А=В8,DSRC=PROM,ALUS=DА,RА=WR5,FUNC=EXOR,Н,CEN
CONT ALUS=ZВ,RВ=WR5,Н,CI,ALUD=В,SТОРС=21
CJP А=WATER0,МАР=РЕ,COND=СТ,SТОРС=21
;
;"ВЫКЛЮЧАЕМ" ХЕММИНГ
CONT А=С2,DSRC=PROM,ALUS=DZ,FUNC=EXNOR,ALU,YDST=ADRREG
CONT А=С1,DSRC=PROM,ЕСА,WRA,ARA=RG3,YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
CXWB:CJP А=CXWB,МАР=РЕ,COND=ARBRDY,IСС
;
;ПИШЕМ ТО ЖЕ ЧИСЛО С "ОШИБКОЙ" В 1 РАЗРЯДЕ И БЕЗ ХЕММИНГА
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=РС
EWRM:CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDST=ADRREG,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
CONT ALUS=АВ,RА=РС,RВ=WR2,FUNC=OR,Н,ALUD=Q
;ЕСЛИ ОШИБКА В РАЗРЯДАХ ДАННЫХ:
CONT ALUS=AQ,RА=WR3,FUNC=EXOR,Н,ALU,ЕСВ,WRB,BRA=RG3
;ЕСЛИ ОШИБКА В ТЕГЕ:
CONT ALUS=AQ,RА=WR4,FUNC=EXOR,ALU,YDEVT=ECBTAG,WRB,BRA=RG3
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
EWWA:CJP А=EWWA,МАР=РЕ,COND=ARBRDY,IСС,ALUS=ZА,RА=РС,Н,CI,ALUD=Q
CONT А=В18,DSRC=PROM,ALUS=DQ,FUNC=EXOR,CEN
CONT SТОРС=21
CJP А=EWRM,МАР=РЕ,COND=СТ,SТОРС=21
;
;ПРОВЕРЯЕМ ЧИСЛО С ОШИБКОЙ БЕЗ ХЕММИНГА
;0 - В РГ.РС (АДРЕС), В EXPN (ЧИСЛО ОШИБОК), MANT+1 (N ЦИКЛА), INTR=3,4
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=РС
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=EXPN
CONT ALUS=ZВ,RВ=MANT,Н,CI,ALUD=В
CRDCE:CONT А=С2,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=INTR
;П/У НА П/П ЧТЕНИЯ И СРАВНЕНИЯ, В DADR И HALF - ЧИСЛА, С КОТ.БУДЕМ СРАВНИВАТЬ
CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
CONT ALUS=АВ,RА=РС,RВ=WR2,FUNC=OR,Н,ALUD=Q
CONT ALUS=AQ,RА=WR3,FUNC=EXOR,Н,ALUD=В,RВ=DADR
CJS А=SUBPRX,МАР=РЕ,ALUS=AQ,RА=WR4,FUNC=EXOR,Н,ALUD=В,RВ=HALF
CONT ALUS=ZА,RА=РС,Н,CI,ALUD=Q
CONT А=В18,DSRC=PROM,ALUS=DQ,FUNC=EXOR,СЕМ
CONT SТОРС=37
CJP А=CRDCE,МАР=РЕ,COND=СТ,SТОРС=37
;
;ВЫДАЧА В БОПП N ЦИКЛА И ЧИСЛА ОШИБОК, ЗАДЕРЖКА
CJS А=OUTEMH,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR5
WATER1:CONT А=В8,DSRC=PROM,ALUS=DА,RА=WR5,FUNC=EXOR,Н,CEN
CONT ALUS=ZВ,RВ=WR5,Н,CI,ALUD=В,SТОРС=21
CJP А=WATER1,МАР=РЕ,COND=СТ,SТОРС=21
;
;"ВКЛЮЧАЕМ" ХЕММИНГ
CONT А=С2,DSRC=PROM,ALUS=DZ,FUNC=EXNOR,ALU,YDST=ADRREG
CONT А=ZER,DSRC=PROM,ЕСА,WRA,ARA=RG3,YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
EWACX:CJP А=EWACX,МАР=РЕ,COND=ARBRDY,IСС
;
;ЧТЕНИЕ "ОШИБОЧНЫХ" ДАННЫХ С КОРРЕКТИРОВКОЙ
CJP А=CONTR,МАР=РЕ
;0 - В РГ.РС (АДРЕС), В EXPN (ЧИСЛО ОШИБОК), MANT+1 (N ЦИКЛА), INTR=5,6
CONTR:CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=РС
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=EXPN
CONT ALUS=ZВ,RВ=MANT,Н,CI,ALUD=В
CCR:CONT А=С4,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=INTR
CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=3
CONT ALUS=АВ,RА=РС,RВ=WR2,FUNC=OR,Н,ALUD=Q
CONT ALUS=ZQ,Н,ALUD=В,RВ=DADR
CJS А=SUBPRX,МАР=РЕ,ALUS=ZQ,Н,ALUD=В,RВ=HALF
CONT ALUS=ZА,RА=РС,Н,CI,ALUD=Q
CONT А=В18,DSRC=PROM,ALUS=DQ,FUNC=EXOR,СЕМ
CONT SТОРС=37
CJP А=CCR,МАР=РЕ,COND=СТ,SТОРС=37
;
;ВЫДАЧА В БОПП N ЦИКЛА И ЧИСЛА ОШИБОК, ЗАДЕРЖКА
CJS А=OUTEMH,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=WR5
WATER3:CONT А=В8,DSRC=PROM,ALUS=DА,RА=WR5,FUNC=EXOR,Н,CEN
CONT ALUS=ZВ,RВ=WR5,Н,CI,ALUD=В,SТОРС=21
CJP А=WATER3,МАР=РЕ,COND=СТ,SТОРС=21
;
;СДВИГАЕМ ЦИКЛИЧЕСКИ ОШИБОЧНЫЙ РАЗРЯД
CONT ALUS=ZА,RА=WR4,Н,ALUD=Q
CONT ALUS=ZВ,RВ=WR3,Н,ALUD=RSBQ,SHMUX=RDRD
CONT ALUS=ZQ,Н,ALUD=В,RВ=WR4
;И СДВИГАЕМ ЦИКЛИЧЕСКИ CONST, ДОБАВЛЯЕМУЮ К РС ДЛЯ ПОЛУЧЕНИЯ ДАННЫХ
;СДВИГАЕМ НА 3, ЧТОБ НЕ БЫЛО КРАТНО СДВИГУ ОШИБОЧНОГО РАЗРЯДА
CJP А=CICLW,МАР=РЕ,ALUS=DZ,Н,ALUD=ВА,RА=WR2,RВ=WR2,ALU,DSRC=SHIFT,MPS
>,PSHF=SН0+3,SHF=LOG
END
XEMLD:PROG;
;===== СПИСОК ЗАГРУЖАЕМЫХ ПРОГРАММ:
EXTERN ХЕМ,INOUT,CTTSTP,SС00,SЕ00,RINT,SF80,SFC0,SFE0,SFF0,SFF8,SFFC,INTINP
END
*END
*NО LIST
*CALL MPSEND:XEMLD=800
*END F
*END FILE
