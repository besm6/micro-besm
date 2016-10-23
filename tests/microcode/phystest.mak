*NАМЕ 5:PHYSTEST
*       РНП+АИСП+РФС+РП+ОЗУ БББ+ПС
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
PHYS:PROG;
;      =======
;      Р  Н  П
;      =======
;
EXTERNAL INITST,ERRINQ,ERRINH,RD8/В,OUTC/F,RD4/7
;
РНП1:ENTRY
;===== ПИШЕМ ИЗ 11 РГ.БОПП - В РНП, ЧИТАЕМ РНП, ПИШЕМ В 15 РГ.БОПП
;
CJP А=PSADR1,МАР=РЕ
PSADR1:CONT А=Н1,%TN%
CJS А=INITST,МАР=РЕ
;ЧИТАЕМ 11-Й РЕГИСТР БОПП, ПИШЕМ В РНП
CONT YDEV=МРМЕМ,IОМР,MPADR=11,YDST=PROCN
;ЧИТАЕМ РНП, ПИШЕМ В 15 РГ.БОПП
CONT DSRC=PROCN,ALUS=DZ,ALUD=В,RВ=У,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=15
SТР1:CJP А=SТР1,МАР=РЕ
;
;
РНП2:ENTRY
;===== ПИШЕМ 00 ИЛИ FF В РНП; ЧТЕНИЕ В МПС; СРАВНЕНИЕ
;   РГ.А - ЧТО ПИШЕМ; Q - ЧТО ЧИТАЕМ; У - РЕЗУЛЬТАТ СРАВНЕНИЯ; ТЕСТ БЕЗ ПЗУ
;
CJP А=PSADR2,МАР=РЕ
PSADR2:CONT А=Н2,%TN%
CJS А=INITST,МАР=РЕ
;0 - В РГ.А
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=А
;ЦИКЛ: ПИШЕМ В РНП 0 ИЛИ FF ПОПЕРЕМЕННО
CADR2:CONT ALUS=ZА,RА=А,ALU,YDST=PROCN
;ЧИТАЕМ РНП, СРАВНИВАЕМ
CONT DSRC=PROCN,ALUS=DZ,ALUD=Q
CONT ALUS=AQ,RА=А,FUNC=EXOR,ALUD=В,RВ=У
;СДВИГАЕМ В СДВИГАТЕЛЕ В СТ.РАЗРЯДЫ (УБИРАЕМ МУСОР БЕЗ ПЗУ), ПРОВЕРЯЕМ НА 0
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0-56,SHF=LOG,CEN
CONT SТОРС=/NZ
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;ИНВЕРТИРУЕМ РГ.А
CJP А=CADR2,МАР=РЕ,ALUS=DА,RА=А,FUNC=EXNOR,Н,ALUD=В,RВ=А
;
;
РНП3:ENTRY
;===== ПИШЕМ ПЕРЕМЕННОЕ ЧИСЛО В РНП; ЧТЕНИЕ В МПС; СРАВНЕНИЕ
;   А - ЗАПИСЫВАЕМОЕ ЧИСЛО; Q - ПРОЧИТАННОЕ; У - РЕЗ-Т СРАВНЕНИЯ; ТЕСТ БЕЗ ПЗУ!
;
CJP А=PSADR3,МАР=РЕ
PSADR3:CONT А=Н3,%TN%
CJS А=INITST,МАР=РЕ
;0 - В А;
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=А
;ЦИКЛ: ПИШЕМ В РНП ПЕРЕМННОЕ ЧИСЛО
CADR3:CONT ALUS=ZА,RА=А,ALU,YDST=PROCN
;ЧИТАЕМ РНП, СРАВНИВАЕМ
CONT DSRC=PROCN,ALUS=DZ,ALUD=Q
CONT ALUS=AQ,RА=А,FUNC=EXOR,ALUD=В,RВ=У
;СДВИГАЕМ В СДВИГАТЕЛЕ В СТ.РАЗРЯДЫ (УБИРАЕМ МУСОР БЕЗ ПЗУ), ПРОВЕРЯЕМ НА 0
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0-56,SHF=LOG,CEN
CONT SТОРС=/NZ
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;УВЕЛИЧИВАЕМ ЗАПИСЫВАЕМОЕ ЧИСЛО НА 1
CJP А=CADR3,МАР=РЕ,ALUS=ZВ,RВ=А,CI,ALUD=В
;
;
;     ==========================
;     РГ. ИСПОЛНИТЕЛЬНОГО АДРЕСА
;     ==========================
;
АИСП4:ENTRY
;===== ЧИТАЕМ 8-11 РГ.БОПП,ПИШЕМ В АИСП; ЧИТАЕМ АИСП, ПИШЕМ В 12-15 РГ.БОПП,20Р.
;
CJP А=PSADR4,МАР=РЕ
PSADR4:CONT А=Н4,%TN%
CJS А=INITST,МАР=РЕ
;ЧИТАЕМ 8-11 РЕГИСТРЫ БОПП, ПИШЕМ В АИСП.
CJS А=RD8/В,МАР=РЕ
CONT ALUS=ZА,RА=WR6,ALU,YDST=ADRREG
;ЧИТАЕМ АИСП.; СДВИГАЕМ В СТ.РАЗРЯДЫ, ПОТОМ В МЛАДШИЕ (УБИРАЕМ МУСОР БЕЗ ПЗУ)
CONT YDEV=RADRR,DSRC=SHIFT,MPS,PSHF=SН0-44,SHF=LOG,ALUS=DZ,Н,ALUD=В,RВ=У
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=WR6,ALU,DSRC=SHIFT,MPS,PSHF=SН0+44,SHF=LOG
;ПИШЕМ В 12-15 РГ.БОПП., МЛАДШИЕ 20 РАЗРЯДОВ = АИСП.
CJS А=OUTC/F,МАР=РЕ
SТР4:CJP А=SТР4,МАР=РЕ
;
;
АИСП5:ENTRY
;===== ПИШЕМ 00 ИЛИ FF В АИСП.; ЧТЕНИЕ В МПС; СРАВНЕНИЕ
;   РГ.А - ЧТО ПИШЕМ; Q - ЧТО ЧИТАЕМ; У - РЕЗУЛЬТАТ СРАВНЕНИЯ. ТЕСТ БЕЗ ПЗУ!
;
CJP А=PSADR5,МАР=РЕ
PSADR5:CONT А=Н5,%TN%
CJS А=INITST,МАР=РЕ
;0 - В РГ.А
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=А
;ЦИКЛ: ПИШЕМ В АИСП. 0 ИЛИ FFFFF ПОПЕРЕМЕННО
CADR5:CONT ALUS=ZА,RА=А,ALU,YDST=ADRREG
;ЧИТАЕМ АИСП. - В РГ.Q, СРАВНИВАЕМ
CONT YDEV=RADRR,DSRC=SHIFT,MPS,PSHF=SН0,SHF=LOG,ALUS=DZ,ALUD=Q
CONT ALUS=AQ,RА=А,FUNC=EXOR,ALUD=В,RВ=У
;СДВИГАЕМ В СДВИГАТЕЛЕ В СТ.РАЗРЯДЫ (УБИРАЕМ МУСОР БЕЗ ПЗУ), ПОВЕРЯЕМ НА 0
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0-44,SHF=LOG,CEN
CONT SТОРС=/NZ
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;ИНВЕРТИРУЕМ РГ.А
CJP А=CADR5,МАР=РЕ,ALUS=DА,RА=А,FUNC=EXNOR,Н,ALUD=В,RВ=А
;
;
АИСП6:ENTRY
;===== ПИШЕМ ПЕРЕМЕННОЕ ЧИСЛО В АИСП; ЧТЕНИЕ В МПС; СРАВНЕНИЕ
;   А - ЧТО ПИШЕМ; Q - ЧИТАЕМ; У - РЕЗУЛЬТАТ СРАВНЕНИЯ. ТЕСТ БЕЗ ПЗУ!
;
CJP А=PSADR6,МАР=РЕ
PSADR6:CONT А=Н6,%TN%
CJS А=INITST,МАР=РЕ
;0 - В А
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=А
;ЦИКЛ: ПИШЕМ В АИСП. ПЕРЕМННОЕ ЧИСЛО
CADR6:CONT ALUS=ZА,RА=А,ALU,YDST=ADRREG
;ЧИТАЕМ АИСП., СРАВНИВАЕМ
CONT YDEV=RADRR,DSRC=SHIFT,MPS,PSHF=SН0,SHF=LOG,ALUS=DZ,ALUD=Q
CONT ALUS=AQ,RА=А,FUNC=EXOR,ALUD=В,RВ=У
;СДВИГАЕМ В СДВИГАТЕЛЕ В СТ.РАЗРЯДЫ (УБИРАЕМ МУСОР БЕЗ ПЗУ), ПРОВЕРЯЕМ НА 0
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0-44,SHF=LOG,CEN
CONT SТОРС=/NZ
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;УВЕЛИЧИВАЕМ ЗАПИСЫВАЕМОЕ ЧИСЛО
CJP А=CADR6,МАР=РЕ,ALUS=ZВ,RВ=А,CI,ALUD=В
;
;
;     =====
;     Р Ф С
;     =====
;
РФС7:ENTRY
;===== ЧИТАЕМ БОПП, ПИШЕМ В РФС; ЧИТАЕМ РФС, ПИШЕМ В БОПП
;   ЧИТАЕМ 8-11 РГ.БОПП (32 РАЗРЯДА АДРЕСА), ПИШЕМ 11-20 РАЗРЯДЫ В РФС;
;   ЧИТАЕМ РФС В 11-20 РАЗРЯДЫ, ОБНУЛЯЕМ ОСТАЛЬНЫЕ РАЗР.,ПИШЕМ В 12-15 РГ.БОПП
;
CJP А=PSADR7,МАР=РЕ
PSADR7:CONT А=Н7,%TN%
CJS А=INITST,МАР=РЕ
;ЧИТАЕМ 8-11 РГ.БОПП, ПИШЕМ В РФС
CJS А=RD8/В,МАР=РЕ
CONT ALUS=ZА,RА=WR6,ALU,YDST=PHYSPG
;ЧИТАЕМ РФС
CONT DSRC=PHYSPG,ALUS=DZ,ALUD=В,RВ=У
;СДВИГАЕМ В СДВИГАТЕЛЕ (УБИРАЕМ МУСОР БЕЗ ПЗУ): СНАЧАЛА В СТ.РАЗРЯДЫ
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0-44,SHF=LOG
;ПОТОМ - В МЛАДШИЕ
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0+54,SHF=LOG
;И НА МЕСТО - В 11-20 РАЗРЯДЫ
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=WR6,ALU,DSRC=SHIFT,MPS,PSHF=SН0-10,SHF=LOG
;ПИШЕМ В 12-15 РГ.БОПП
CJS А=OUTC/F,МАР=РЕ
SТР7:CJP А=SТР7,МАР=РЕ
;
;
РФС8:ENTRY
;===== ПИШЕМ 00 ИЛИ FF В РФС; ЧТЕНИЕ В МПС; СРАВНЕНИЕ
;   В РФС ПИШЕМ С 11-20 РАЗР.ШИНЫ У; ЧИТАЕМ 11-20 РАЗР.ШИНЫ D.
;   РГ.А - ЧТО ПИШЕМ; Q - ЧТО ЧИТАЕМ; У - РЕЗУЛЬТАТ СРАВНЕНИЯ; ТЕСТ БЕЗ ПЗУ!
;
CJP А=PSADR8,МАР=РЕ
PSADR8:CONT А=Н8,%TN%
CJS А=INITST,МАР=РЕ
;0 - В РГ.А
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=А
;ЦИКЛ: ПИШЕМ В РФС 0 ИЛИ FF ПОПЕРЕМЕННО
CADR8:CONT ALUS=ZА,RА=А,ALU,YDST=PHYSPG
;ЧИТАЕМ РФС, СРАВНИВАЕМ
CONT DSRC=PHYSPG,ALUS=DZ,ALUD=Q
CONT ALUS=AQ,RА=А,FUNC=EXOR,ALUD=В,RВ=У
;СДВИГАЕМ В СДВИГАТЕЛЕ В СТ.РАЗРЯДЫ, ПОТОМ В МЛАДШИЕ (УБИРАЕМ МУСОР БЕЗ ПЗУ)
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0-44,SHF=LOG
;И ПРОВЕРЯЕМ НА 0
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0+54,SHF=LOG,CEN
CONT SТОРС=/NZ
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;ИНВЕРТИРУЕМ РГ.А
CJP А=CADR8,МАР=РЕ,ALUS=DА,RА=А,FUNC=EXNOR,Н,ALUD=В,RВ=А
;
;
РФС9:ENTRY
;===== ПИШЕМ ПЕРЕМЕННОЕ ЧИСЛО В РФС; ЧТЕНИЕ В МПС; СРАВНЕНИЕ
;   В РГ.А - ЗАПИСЫВАЕМОЕ ЧИСЛО; Q - ПРОЧИТАННОЕ; У - РЕЗУЛЬТАТ СРАВНЕНИЯ;
;   DADR = CONST С "1" В 11 РАЗРЯДЕ; ТЕСТ БЕЗ ПЗУ!
;
CJP А=PSADR9,МАР=РЕ
PSADR9:CONT А=Н9,%TN%
CJS А=INITST,МАР=РЕ
;0 - В А; ДЕЛАЕМ CONST С ЕДИНИЦЕЙ В 11 РАЗРЯДЕ БЕЗ ПЗУ - В DADR
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=А
CONT ALUS=ZА,RА=А,Н,CI,ALUD=В,RВ=DADR
CONT ALUS=DZ,Н,ALUD=ВА,RА=DADR,RВ=DADR,ALU,DSRC=SHIFT,MPS,PSHF=SН0-10,SHF=LOG
;ЦИКЛ: ПИШЕМ В РФС ПЕРЕМННОЕ ЧИСЛО
CADR9:CONT ALUS=ZА,RА=А,ALU,YDST=PHYSPG
;ЧИТАЕМ РФС, СРАВНИВАЕМ
CONT DSRC=PHYSPG,ALUS=DZ,ALUD=Q
CONT ALUS=AQ,RА=А,FUNC=EXOR,ALUD=В,RВ=У
;СДВИГАЕМ В СДВИГАТЕЛЕ В СТ.РАЗРЯДЫ, ПОТОМ В МЛАДШИЕ (УБИРАЕМ МУСОР БЕЗ ПЗУ)
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0-44,SHF=LOG
;И ПРОВЕРЯЕМ НА 0
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0+54,SHF=LOG
>,CEN
CONT SТОРС=/NZ
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;УВЕЛИЧИВАЕМ ЗАПИСЫВАЕМОЕ ЧИСЛО НА 1 В 11-ОМ РАЗРЯДЕ
CJP А=CADR9,МАР=РЕ,ALUS=АВ,RА=HALF,RВ=А,FUNC=ADD,ALUD=В
;
;
;     =================
;     РЕГИСТРЫ ПРИПИСКИ
;     =================
;
ПРИПА:ENTRY
;===== ПИШЕМ ИЗ БОПП В РЕГИСТРЫ ПРИПИСКИ ПО ЗАДАННОМУ АДРЕСУ; ЧИТАЕМ В БОПП
;   4-7 РГ.БОПП - АДРЕС РП (В 11-20 РАЗР.); 8-11 РГ.- ДАННЫЕ ДЛЯ ЗАПИСИ (20 Р.)
;   12-15 РГ.БОПП - ЧТО ПРОЧИТАЛИ (20 МЛ.РАЗРЯДОВ)
;
CJP А=PSADRA,МАР=РЕ
PSADRA:CONT А=НА,%TN%
CJS А=INITST,МАР=РЕ
;ЧИТАЕМ 4-7 РГ.БОПП (АДРЕС) И 8-11 РГ.БОПП (ДАННЫЕ)
CJS А=RD4/7,МАР=РЕ
CJS А=RD8/В,МАР=РЕ,ALUS=ZА,RА=WR6,ALUD=В,RВ=РС,ALU,YDST=ADRREG
;ПИШЕМ В РЕГИСТРЫ ПРИПИСКИ
CONT ALUS=ZА,RА=WR6,ALU,YDEV=PSMEM,WRY
;ЧИТАЕМ, УБИРАЕМ МУСОР (СДВИГАТЕЛЕМ), ПИШЕМ В БОПП
CONT YDEV=PSMEM,DSRC=SHIFT,MPS,PSHF=SН0-44,SHF=LOG,ALUS=DZ,Н,ALUD=В,RВ=У
CJS А=OUTC/F,МАР=РЕ,ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=WR6,ALU,DSRC=SHIFT,MPS
>,PSHF=SН0+44,SHF=LOG
SТРА:CJP А=SТРА,МАР=РЕ
;
;
ПРИПВ:ENTRY
;===== ПИШЕМ 0/F(!) В РЕГИСТРЫ ПРИПИСКИ ПО 1 АДРЕСУ, ЧИТАЕМ, СРАВНИВАЕМ
;   РГ.А - ЧТО ПИШЕМ; Q - ЧИТАЕМ; У - РЕЗ-Т СРАВНЕНИЯ
;   АДРЕС В АИСП. - КАКОЙ ЕСТЬ! ТЕСТ БЕЗ ПЗУ!
;
CJP А=PSADRB,МАР=РЕ
PSADRB:CONT А=НВ,%TN%
CJS А=INITST,МАР=РЕ
;0 - В РГ.А
CONT ALUS=DZ,FUNC=AND,ALUD=В,RВ=А
;ЦИКЛ: ПИШЕМ РГ.А В РЕГИСТРЫ ПРИПИСКИ
CADRB:CONT ALUS=ZА,RА=А,ALU,YDEV=PSMEM,WRY
;ЧИТАЕМ, СРАВНИВАЕМ
CONT YDEV=PSMEM,DSRC=SHIFT,MPS,PSHF=SН0,SHF=LOG,ALUS=DZ,ALUD=Q
CONT ALUS=AQ,RА=А,FUNC=EXOR,ALUD=В,RВ=У
;СДВИГАЕМ В СТ.РАЗРЯДЫ, ПРОВЕРЯЕМ НА 0
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0-44,SHF=LOG,CEN
CONT SТОРС=/NZ
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;ИНВЕРТИРУЕМ РГ.А
CJP А=CADRB,МАР=РЕ,ALUS=ZВ,RВ=А,FUNC=EXNOR,ALUD=В
;
;
ПРИПС:ENTRY
;===== ЗАПИСЬ CONST1,CONST2 В РП ПО 2 АДРЕСАМ, ЧТЕНИЕ, СРАВНЕНИЕ
;   1 АДР. - В РС; 2 АДР. - РССОРУ; CONST1 - DADR; CONST2 - HALF;
;   А - ЧТЕНИЕ ПО 1 АДРЕСУ; У - ПО 2-ОМУ. WR1 - МАСКА НА 20Р.; ТЕСТ С ПЗУ!
;   ОШИБКИ: 01 - ПРОЧИТАЛИ НЕ ТО ПО 1-ОМУ АДРЕСУ; 02 - ПО 2-ОМУ
;
CJP А=PSADRC,МАР=РЕ
PSADRC:CONT А=НС,%TN%
CJS А=INITST,МАР=РЕ
;МАСКУ НА 20 РАЗР. - В WR1
CONT А=MADR,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=WR1
;ПИШЕМ: 1-Й АДРЕС ИЗ ПЗУ - В РГ.РС МПС, В АИСП.
CONT А=С15,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РС,ALU,YDST=ADRREG
;CONST1 - В DADR, В РП
CONT А=ZER,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=DADR,ALU,YDEV=PSMEM,WRY
;2-Й АДРЕС - В РССОРУ, В АИСП.
CONT А=В13,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РССОРУ,ALU,YDST=ADRREG
;CONST2 - В HALF, В РП
CONT А=CFFF,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=HALF,ALU,YDEV=PSMEM,WRY
;ЧИТАЕМ: 1-Й АДРЕС - В АИСП.
CADRC:CONT ALUS=ZА,RА=РС,ALU,YDST=ADRREG
;ЧИТАЕМ ИЗ РП - ЧЕРЕЗ СДВИГАТЕЛЬ - В РГ.А МПС, СРАВНИВАЕМ
CONT YDEV=PSMEM,DSRC=SHIFT,MPS,PSHF=SН0,SHF=LOG,ALUS=DZ,ALUD=В,RВ=А
CONT ALUS=АВ,RА=DADR,RВ=А,FUNC=EXOR,ALUD=Q
;МАСКА НА 20 МЛ.РАЗРЯДОВ
CONT ALUS=AQ,RА=WR1,FUNC=AND,ALUD=Q,CEN
CONT SТОРС=/NZ,%CLRTYP%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%ТУРЕ%
;АНАЛОГИЧНО СО 2 АДРЕСОМ
CONT ALUS=ZА,RА=РССОРУ,ALU,YDST=ADRREG
CONT YDEV=PSMEM,DSRC=SHIFT,MPS,PSHF=SН0,SHF=LOG,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=HALF,RВ=У,FUNC=EXOR,ALUD=Q
CONT ALUS=AQ,RА=WR1,FUNC=AND,ALUD=Q,CEN
CONT SТОРС=/NZ,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
CJP А=CADRC,МАР=РЕ
;
;
ПPИПD:ENTRY
;===== ЗАПИСЬ 0/F В РП ПО ВСЕМ АДРЕСАМ, ЧТЕНИЕ, СРАВНЕНИЕ
;   А - ПИШЕМ; Q - ЧИТАЕМ; У - РЕЗУЛЬТАТ СРАВНЕНИЯ; РС - АДРЕС РП;
;   DADR = "1" В 11 РАЗРЯДЕ; ТЕСТ БЕЗ ПЗУ!
;
CJP А=PSADRD,МАР=РЕ
PSADRD:CONT А=HD,%TN%
CJS А=INITST,МАР=РЕ
;"0" - В РГ.А; "1" В 11 РАЗРЯДЕ БЕЗ ПЗУ - В РГ.DADR
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=А
CONT ALUS=ZА,RА=А,Н,CI,ALUD=В,RВ=DADR
CONT ALUS=DZ,Н,ALUD=ВА,RА=DADR,RВ=DADR,ALU,DSRC=SHIFT,MPS,PSHF=SН0-10,SHF=LOG
;"0" - В РГ.РС, В АИСП.
PUSH А=1023,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=РС,ALU,YDST=ADRREG
;ПИШЕМ "0" ИЗ РГ.А - В РП
CONT ALUS=ZА,RА=А,ALU,YDEV=PSMEM,WRY
;УВЕЛИЧИВАЕМ АДРЕС
RFCT ALUS=АВ,RА=DADR,RВ=РС,FUNC=ADD,ALUD=В,ALU,YDST=ADRREG
;ЦИКЛ НА ЧТЕНИЕ И НОВУЮ ЗАПИСЬ ИНВЕРТИРОВАННОЙ CONST: НАЧ.АДРЕС - В РС, АИСП
CADRD:PUSH А=1023,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=РС,ALU,YDST=ADRREG
;ЧИТАЕМ РП, СРАВНИВАЕМ
CONT YDEV=PSMEM,DSRC=SHIFT,MPS,PSHF=SН0,SHF=LOG,ALUS=DZ,ALUD=Q
CONT ALUS=AQ,RА=А,FUNC=EXOR,ALUD=В,RВ=У
;СДВИГАЕМ В СТ.РАЗРЯДЫ (УБИРАЕМ МУСОР БЕЗ ПЗУ), ПРОВЕРЯЕМ НА 0
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0-44,SHF=LOG,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINQ,МАР=РЕ,COND=СТ,SТОРС=/NZ
;ПИШЕМ ПО ТОМУ ЖЕ АДРЕСУ ИНВЕРТИРОВАННУЮ CONST, УВЕЛИЧИВАЕМ АДРЕС
CONT ALUS=ZА,RА=А,FUNC=EXNOR,ALU,YDEV=PSMEM,WRY
RFCT ALUS=АВ,RА=DADR,RВ=РС,FUNC=ADD,ALUD=В,ALU,YDST=ADRREG
CONT %TIK%
;ИНВЕРТИРУЕМ CONST, ИДЕМ НА НОВУЮ ПРОВЕРКУ
CJP А=CADRD,МАР=РЕ,ALUS=ZВ,RВ=А,FUNC=EXNOR,Н,ALUD=В
;
;
ПРИПЕ:ENTRY
;===== ЗАПИСЬ ДАННЫХ=АДРЕСУ В РП ПО ВСЕМ АДРЕСАМ, ЧТЕНИЕ, СРАВНЕНИЕ
;   А - АДРЕС РП = ЧТО ПИШЕМ; Q - ЧИТАЕМ; У - РЕЗУЛЬТАТ СРАВНЕНИЯ;
;   DADR = "1" В 11 РАЗРЯДЕ; ТЕСТ БЕЗ ПЗУ!
;
CJP А=PSADRE,МАР=РЕ
PSADRE:CONT А=НЕ,%TN%
CJS А=INITST,МАР=РЕ
;"0" - В РГ.А, В АИСП.; "1" В 11 РАЗРЯДЕ БЕЗ ПЗУ - В РГ.DADR
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=А,ALU,YDST=ADRREG
CONT ALUS=ZА,RА=А,Н,CI,ALUD=В,RВ=DADR
PUSH А=1023,МАР=РЕ,ALUS=DZ,Н,ALUD=ВА,RА=DADR,RВ=DADR,ALU,DSRC=SHIFT,MPS
>,PSHF=SН0-10,SHF=LOG
;ДАННЫЕ = АДРЕСУ - В РП
CONT ALUS=ZА,RА=А,ALU,YDEV=PSMEM,WRY
;УВЕЛИЧИВАЕМ АДРЕС
RFCT ALUS=АВ,RА=DADR,RВ=А,FUNC=ADD,ALUD=В,ALU,YDST=ADRREG
;ЧИТАЕМ
CADRE:CONT %CLRTYP%
;0 - А
PUSH А=1023,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=А,ALU,YDST=ADRREG
;ЧИТАЕМ РП, СРАВНИВАЕМ
CONT YDEV=PSMEM,DSRC=SHIFT,MPS,PSHF=SН0,SHF=LOG,ALUS=DZ,ALUD=Q
CONT ALUS=AQ,RА=А,FUNC=EXOR,ALUD=В,RВ=У
;СДВИГАЕМ В СТ.РАЗРЯДЫ (УБИРАЕМ МУСОР БЕЗ ПЗУ), ПРОВЕРЯЕМ НА 0
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0-44,SHF=LOG,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ
RFCT ALUS=АВ,RА=DADR,RВ=А,FUNC=ADD,ALUD=В,ALU,YDST=ADRREG
CJP А=CADRE,МАР=РЕ,%TIK%
;
;
ПPИПF:ENTRY
;===== ЗАПИСЬ ДАННЫХ=ИНВЕРТИР.АДРЕСУ В РП ПО ВСЕМ АДРЕСАМ В ОБРАТНОМ НАПРАВЛЕНИИ
;   А - ЧТО ПИСАЛИ (=/РС); Q - ЧИТАЕМ; У - РЕЗУЛЬТАТ СРАВНЕНИЯ; РС - АДРЕС РП;
;   DADR = "1" В 11 РАЗРЯДЕ; ТЕСТ БЕЗ ПЗУ!
;
CJP А=PSADRF,МАР=РЕ
PSADRF:CONT А=HF,%TN%
CJS А=INITST,МАР=РЕ
;"FF..FF" - В РГ.РС, В АИСП (НАЧАЛЬНЫЙ АДРЕС ДЛЯ ЗАПИСИ В ОБРАТНОМ НАПРАВЛЕНИИ)
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=РС
CONT ALUS=ZА,RА=РС,Н,CI,ALUD=В,RВ=DADR
CONT ALUS=ZВ,RВ=РС,FUNC=EXNOR,ALUD=В,ALU,YDST=ADRREG
;"1" В 11 РАЗРЯДЕ - В DADR
PUSH А=1023,МАР=РЕ,ALUS=DZ,Н,ALUD=ВА,RА=DADR,RВ=DADR,ALU,DSRC=SHIFT,MPS
>,PSHF=SН0-10,SHF=LOG
;ДАННЫЕ = ИНВЕРТИРОВАННОМУ АДРЕСУ - В РП
CONT ALUS=ZА,RА=РС,FUNC=EXNOR,ALU,YDEV=PSMEM,WRY
;УМЕНЬШАЕМ АДРЕС
RFCT ALUS=АВ,RА=DADR,RВ=РС,FUNC=SUBR,CI,ALUD=В,ALU,YDST=ADRREG
;ЧИТАЕМ
CADRF:CONT %CLRTYP%
;"FF..FF" - В РС
CONT ALUS=DZ,FUNC=AND,ALUD=В,RВ=РС
PUSH А=1023,МАР=РЕ,ALUS=ZВ,RВ=РС,FUNC=EXNOR,ALUD=В,ALU,YDST=ADRREG
;ВЫЧИСЛЯЕМ ИНВЕРТИР.АДРЕС
CONT ALUS=ZА,RА=РС,FUNC=EXNOR,ALUD=В,RВ=А
;ЧИТАЕМ РП, СРАВНИВАЕМ
CONT YDEV=PSMEM,DSRC=SHIFT,MPS,PSHF=SН0,SHF=LOG,ALUS=DZ,ALUD=Q
CONT ALUS=AQ,RА=А,FUNC=EXOR,ALUD=В,RВ=У
;СДВИГАЕМ В СТ.РАЗРЯДЫ (УБИРАЕМ МУСОР БЕЗ ПЗУ), ПРОВЕРЯЕМ НА 0
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0-44,SHF=LOG,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
RFCT ALUS=АВ,RА=DADR,RВ=РС,FUNC=SUBR,CI,ALUD=В,ALU,YDST=ADRREG
CJP А=CADRF,МАР=РЕ
;
;
;     =================
;     Б О Б Р,  Б И З М
;     =================
;
БОБИ10:ENTRY
;===== ПИШЕМ ИЗ БОПП В БОБР,БИЗМ ПО АДРЕСУ, ЗАДАННОМУ В БОПП; ЧИТАЕМ В БОПП
;   4-7 РГ.БОПП - АДРЕС (В 11-20 РАЗР.); 11 РГ.- ДАННЫЕ ДЛЯ ЗАПИСИ:2,3 РАЗР.
;   15 РГ.БОПП - ЧТО ПРОЧИТАЛИ (2,3 РАЗРЯДЫ)
;
CJP А=PSAD10,МАР=РЕ
PSAD10:CONT А=Н10,%TN%
CJS А=INITST,МАР=РЕ
;ЧИТАЕМ 4-7 РГ.БОПП (АДРЕС) И 11 РГ.БОПП (ДАННЫЕ)
CJS А=RD4/7,МАР=РЕ
CONT ALUS=ZА,RА=WR6,ALUD=В,RВ=РС,ALU,YDST=PHYSPG
;ПИШЕМ В БОБР,БИЗМ
CONT YDEV=МРМЕМ,IОМР,MPADR=11,DSRC=SHIFT,MPS,PSHF=SН0,SHF=LOG,DDEV=ВВ,WRD
;ЧИТАЕМ, УБИРАЕМ МУСОР (СДВИГАТЕЛЕМ), ПИШЕМ В БОПП
CONT DDEV=ВВ,ALUS=DZ,Н,ALUD=В,RВ=У
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0-61,SHF=LOG
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0+62,SHF=LOG
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0-1,SHF=LOG
CONT ALUS=ZА,RА=У,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=15
SТР10:CJP А=SТР10,МАР=РЕ
;
;
БОБИ11:ENTRY
;===== ПИШЕМ 0/F В БОБР,БИЗМ ПО 1 АДРЕСУ, ЧИТАЕМ, СРАВНИВАЕМ
;   РГ.А - ЧТО ПИШЕМ; Q - ЧИТАЕМ; У - РЕЗ-Т СРАВНЕНИЯ
;   АДРЕС В РФС - КАКОЙ ЕСТЬ! ТЕСТ БЕЗ ПЗУ!
;
CJP А=PSAD11,МАР=РЕ
PSAD11:CONT А=Н11,%TN%
CJS А=INITST,МАР=РЕ
;0 - В РГ.А
CONT ALUS=DZ,FUNC=AND,ALUD=В,RВ=А
;ЦИКЛ: ПИШЕМ РГ.А В БОБР,БИЗМ
CADR11:CONT ALUS=ZА,RА=А,ALU,DSRC=SHIFT,MPS,PSHF=SН0,SHF=LOG,DDEV=ВВ,WRD
;ЧИТАЕМ, СРАВНИВАЕМ
CONT DDEV=ВВ,ALUS=DZ,ALUD=Q
CONT ALUS=AQ,RА=А,FUNC=EXOR,ALUD=В,RВ=У
;СДВИГАЕМ В СТ.РАЗРЯДЫ, ПОТОМ В МЛАДШИЕ; ПРОВЕРЯЕМ НА 0
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0-61,SHF=LOG
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0+62,SHF=LOG,CEN
CONT SТОРС=/NZ
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;ИНВЕРТИРУЕМ РГ.А
CJP А=CADR11,МАР=РЕ,ALUS=ZВ,RВ=А,FUNC=EXNOR,ALUD=В
;
;
БОБИ12:ENTRY
;===== ЗАПИСЬ CONST1,CONST2 В БОБР,БИЗМ ПО 2 АДРЕСАМ, ЧТЕНИЕ, СРАВНЕНИЕ
;   1 АДР. - В РС; 2 АДР. - РССОРУ; CONST1 - DADR; CONST2 - HALF;
;   А - ЧТЕНИЕ ПО 1 АДРЕСУ; У - ПО 2-ОМУ. WR1 - МАСКА НА 20Р.; ТЕСТ С ПЗУ!
;   ОШИБКИ: 01 - ПРОЧИТАЛИ НЕ ТО ПО 1-ОМУ АДРЕСУ; 02 - ПО 2-ОМУ
;
CJP А=PSAD12,МАР=РЕ
PSAD12:CONT А=Н12,%TN%
CJS А=INITST,МАР=РЕ
;МАСКУ НА 2,3 РАЗР. - В WR1
CONT А=С6,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=WR1
;ПИШЕМ: 1-Й АДРЕС ИЗ ПЗУ - В РГ.РС МПС, В РФС
CONT А=С15,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РС,ALU,YDST=PHYSPG
;CONST1 - В DADR, В БОБР,БИЗМ
CONT А=ZER,DSRC=PROM,DDEV=ВВ,WRD,ALUS=DZ,Н,ALUD=В,RВ=DADR
;2-Й АДРЕС - В РССОРУ, В РФС
CONT А=В13,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РССОРУ,ALU,YDST=PHYSPG
;CONST2 - В HALF, В БОБР,БИЗМ
CONT А=CFFF,DSRC=PROM,DDEV=ВВ,WRD,ALUS=DZ,Н,ALUD=В,RВ=HALF
;ЧИТАЕМ: 1-Й АДРЕС - В РФС
CADR12:CONT ALUS=ZА,RА=РС,ALU,YDST=PHYSPG
;ЧИТАЕМ БОБР,БИЗМ В РГ.А МПС, СРАВНИВАЕМ
CONT DDEV=ВВ,ALUS=DZ,ALUD=В,RВ=А
CONT ALUS=АВ,RА=DADR,RВ=А,FUNC=EXOR,ALUD=Q
;МАСКА НА 2,3 РАЗРЯДЫ
CONT ALUS=AQ,RА=WR1,FUNC=AND,ALUD=Q,CEN
CONT SТОРС=/NZ,%CLRTYP%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%ТУРЕ%
;АНАЛОГИЧНО СО 2 АДРЕСОМ
CONT ALUS=ZА,RА=РССОРУ,ALU,YDST=PHYSPG
CONT DDEV=ВВ,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=HALF,RВ=У,FUNC=EXOR,ALUD=Q
CONT ALUS=AQ,RА=WR1,FUNC=AND,ALUD=Q,CEN
CONT SТОРС=/NZ,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
CJP А=CADR12,МАР=РЕ
;
;
БОБИ13:ENTRY
;===== ЗАПИСЬ 0/F В БОБР,БИЗМ ПО ВСЕМ АДРЕСАМ, ЧТЕНИЕ, СРАВНЕНИЕ
;   А - ПИШЕМ; Q - ЧИТАЕМ; У - РЕЗУЛЬТАТ СРАВНЕНИЯ; РС - АДРЕС БОБР,БИЗМ;
;   DADR = "1" В 11 РАЗРЯДЕ; ТЕСТ БЕЗ ПЗУ!
;
CJP А=PSAD13,МАР=РЕ
PSAD13:CONT А=Н13,%TN%
CJS А=INITST,МАР=РЕ
;"0" - В РГ.А; "1" В 11 РАЗРЯДЕ БЕЗ ПЗУ - В РГ.DADR
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=А
CONT ALUS=ZА,RА=А,Н,CI,ALUD=В,RВ=DADR
CONT ALUS=DZ,Н,ALUD=ВА,RА=DADR,RВ=DADR,ALU,DSRC=SHIFT,MPS,PSHF=SН0-10,SHF=LOG
;"0" - В РГ.РС, В РФС
PUSH А=1023,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=РС,ALU,YDST=PHYSPG
;ПИШЕМ "0" ИЗ РГ.А - В БОБР,БИЗМ
CONT ALUS=ZА,RА=А,ALU,DSRC=SHIFT,MPS,PSHF=SН0,SHF=LOG,DDEV=ВВ,WRD
;УВЕЛИЧИВАЕМ АДРЕС
RFCT ALUS=АВ,RА=DADR,RВ=РС,FUNC=ADD,ALUD=В,ALU,YDST=PHYSPG
;ЦИКЛ НА ЧТЕНИЕ И НОВУЮ ЗАПИСЬ ИНВЕРТИРОВАННОЙ CONST
CADR13:CONT %CLRTYP%
;НАЧАЛЬНЫЙ АДРЕС - В РС, В РФС
PUSH А=1023,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=РС,ALU,YDST=PHYSPG
;ЧИТАЕМ БОБР,БИЗМ, СРАВНИВАЕМ
CONT DDEV=ВВ,ALUS=DZ,ALUD=Q
CONT ALUS=AQ,RА=А,FUNC=EXOR,ALUD=В,RВ=У
;СДВИГАЕМ В СТ.РАЗРЯДЫ, ПОТОМ В МЛАДШИЕ (УБИРАЕМ МУСОР БЕЗ ПЗУ), ПРОВЕРЯЕМ НА 0
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0-61,SHF=LOG
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0+62,SHF=LOG,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;ПИШЕМ ПО ТОМУ ЖЕ АДРЕСУ ИНВЕРТИРОВАННУЮ CONST, УВЕЛИЧИВАЕМ АДРЕС
CONT ALUS=ZА,RА=А,FUNC=EXNOR,ALU,DSRC=SHIFT,MPS,PSHF=SН0,SHF=LOG,DDEV=ВВ,WRD
RFCT ALUS=АВ,RА=DADR,RВ=РС,FUNC=ADD,ALUD=В,ALU,YDST=PHYSPG
;ИНВЕРТИРУЕМ CONST, ИДЕМ НА НОВУЮ ПРОВЕРКУ
CJP А=CADR13,МАР=РЕ,ALUS=ZВ,RВ=А,FUNC=EXNOR,Н,ALUD=В
;
;
БОБИ14:ENTRY
;===== ЗАПИСЬ ДАННЫХ=СДВИНУТОМУ АДРЕСУ В БОБР,БИЗМ ПО ВСЕМ АДРЕСАМ, ПРОВЕРКА
;   РС - АДРЕС БОБР,БИЗМ; А = ЧТО ПИШЕМ = РС, СДВИНУТОМУ В МЛ.РАЗР.; Q - ЧИТАЕМ;
;   У - РЕЗУЛЬТАТ СРАВНЕНИЯ; DADR = "1" В 11 РАЗРЯДЕ; ТЕСТ БЕЗ ПЗУ!
;
CJP А=PSAD14,МАР=РЕ
PSAD14:CONT А=Н14,%TN%
CJS А=INITST,МАР=РЕ
;"0" - В РГ.РС, В РФС; "1" В 11 РАЗРЯДЕ БЕЗ ПЗУ - В РГ.DADR
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=РС,ALU,YDST=PHYSPG
CONT ALUS=ZА,RА=РС,Н,CI,ALUD=В,RВ=DADR
PUSH А=1023,МАР=РЕ,ALUS=DZ,Н,ALUD=ВА,RА=DADR,RВ=DADR,ALU,DSRC=SHIFT,MPS
>,PSHF=SН0-10,SHF=LOG
;ДАННЫЕ = СДВИНУТОМУ АДРЕСУ - В БОБР,БИЗМ
CONT ALUS=ZА,RА=РС,ALU,DSRC=SHIFT,MPS,PSHF=SН0+10,SHF=LOG,DDEV=ВВ,WRD
;УВЕЛИЧИВАЕМ АДРЕС
RFCT ALUS=АВ,RА=DADR,RВ=РС,FUNC=ADD,ALUD=В,ALU,YDST=PHYSPG
;ЧИТАЕМ
CADR14:CONT %CLRTYP%
;0 - РС
PUSH А=1023,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=РС,ALU,YDST=PHYSPG
;ВЫЧИСЛЯЕМ СДВИНУТЫЙ АДРЕС - В РГ.А
CONT ALUS=DZ,Н,ALUD=ВА,RА=РС,RВ=А,ALU,DSRC=SHIFT,MPS,PSHF=SН0+10,SHF=LOG
;ЧИТАЕМ БОБР,БИЗМ, СРАВНИВАЕМ
CONT DDEV=ВВ,ALUS=DZ,ALUD=Q
CONT ALUS=AQ,RА=А,FUNC=EXOR,ALUD=В,RВ=У
;СДВИГАЕМ В СТ.РАЗРЯДЫ, ПОТОМ В МЛАДШИЕ (УБИРАЕМ МУСОР БЕЗ ПЗУ), ПРОВЕРЯЕМ НА 0
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0-61,SHF=LOG
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0+62,SHF=LOG,CEN
CONT SТОРС=/NZ,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;УВЕЛИЧИВАЕМ АДРЕС
RFCT ALUS=АВ,RА=DADR,RВ=РС,FUNC=ADD,ALUD=В,ALU,YDST=PHYSPG
CJP А=CADR14,МАР=РЕ
;
;
БОБИ15:ENTRY
;===== ЗАПИСЬ ДАННЫХ=ИНВЕРТИР.АДРЕСУ В БОБР,БИЗМ В ОБРАТНОМ НАПРАВЛЕНИИ
;   А - ЧТО ПИСАЛИ (=/РС, СДВИНУТОМУ В МЛ.РАЗРЯДЫ); У - РЕЗУЛЬТАТ СРАВНЕНИЯ;
;   Q - ЧИТАЕМ; РС - АДРЕС БОБР,БИЗМ; DADR = "1" В 11 РАЗРЯДЕ; ТЕСТ БЕЗ ПЗУ!
;
CJP А=PSAD15,МАР=РЕ
PSAD15:CONT А=Н15,%TN%
CJS А=INITST,МАР=РЕ
;"FF..FF" - В РГ.РС, В РФС (НАЧАЛЬНЫЙ АДРЕС ДЛЯ ЗАПИСИ В ОБРАТНОМ НАПРАВЛЕНИИ)
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=РС
CONT ALUS=ZА,RА=РС,Н,CI,ALUD=В,RВ=DADR
CONT ALUS=ZВ,RВ=РС,FUNC=EXNOR,ALUD=В,ALU,YDST=PHYSPG
;"1" В 11 РАЗРЯДЕ - В DADR
PUSH А=1023,МАР=РЕ,ALUS=DZ,Н,ALUD=ВА,RА=DADR,RВ=DADR,ALU,DSRC=SHIFT,MPS
>,PSHF=SН0-10,SHF=LOG
;ДАННЫЕ = ИНВЕРТИРОВАННОМУ АДРЕСУ, СДВИНУТОМУ В МЛ.РАЗРЯДЫ - В БОБР,БИЗМ
CONT ALUS=ZА,RА=РС,FUNC=EXNOR,ALU,DSRC=SHIFT,MPS,PSHF=SН0+10,SHF=LOG,DDEV=ВВ,WRD
;УМЕНЬШАЕМ АДРЕС
RFCT ALUS=АВ,RА=DADR,RВ=РС,FUNC=SUBR,CI,ALUD=В,ALU,YDST=PHYSPG
;ЧИТАЕМ
CADR15:CONT %CLRTYP%
;"FF..FF" - В РС
CONT ALUS=DZ,FUNC=AND,ALUD=В,RВ=РС
PUSH А=1023,МАР=РЕ,ALUS=ZВ,RВ=РС,FUNC=EXNOR,ALUD=В,ALU,YDST=PHYSPG
;ВЫЧИСЛЯЕМ ИНВЕРТИР.АДРЕС, СДВИГАЕМ В МЛАДШИЕ РАЗРЯДЫ
CONT ALUS=ZА,RА=РС,FUNC=EXNOR,ALUD=В,RВ=А
CONT ALUS=DZ,Н,ALUD=ВА,RА=А,RВ=А,ALU,DSRC=SHIFT,MPS,PSHF=SН0+10,SHF=LOG
;ЧИТАЕМ БОБР,БИЗМ, СРАВНИВАЕМ
CONT DDEV=ВВ,ALUS=DZ,ALUD=Q
CONT ALUS=AQ,RА=А,FUNC=EXOR,ALUD=В,RВ=У
;СДВИГАЕМ В СТ.РАЗРЯДЫ, ПОТОМ В МЛАДШИЕ (УБИРАЕМ МУСОР БЕЗ ПЗУ), ПРОВЕРЯЕМ НА 0
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0-61,SHF=LOG
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0+62,SHF=LOG,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
RFCT ALUS=АВ,RА=DADR,RВ=РС,FUNC=SUBR,CI,ALUD=В,ALU,YDST=PHYSPG
CJP А=CADR15,МАР=РЕ
;
;
;     =======
;     Б М С П
;     =======
;
БМСП16:ENTRY
;===== ПИШЕМ ИЗ БОПП В БМСП ПО АДРЕСУ, ЗАДАННОМУ В БОПП; ЧИТАЕМ В БОПП
;   4-7 РГ.БОПП - АДРЕС (В 11-20 РАЗР.); 11 РГ.- ДАННЫЕ ДЛЯ ЗАПИСИ: 1-Й РАЗР.
;   15 РГ.БОПП - ЧТО ПРОЧИТАЛИ (1-Й РАЗРЯД)
;
CJP А=PSAD16,МАР=РЕ
PSAD16:CONT А=Н16,%TN%
CJS А=INITST,МАР=РЕ
;ЧИТАЕМ 4-7 РГ.БОПП (АДРЕС) И 11 РГ.БОПП (ДАННЫЕ)
CJS А=RD4/7,МАР=РЕ
CONT ALUS=ZА,RА=WR6,ALUD=В,RВ=РС,ALU,YDST=PHYSPG
;ПИШЕМ В БМСП
CONT YDEV=МРМЕМ,IОМР,MPADR=11,DSRC=SHIFT,MPS,PSHF=SН0,SHF=LOG,DDEV=MODB,WRD
;ЧИТАЕМ, УБИРАЕМ МУСОР (СДВИГАТЕЛЕМ), ПИШЕМ В БОПП
CONT DDEV=MODB,ALUS=DZ,Н,ALUD=В,RВ=У
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0-63,SHF=LOG
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0+63,SHF=LOG
CONT ALUS=ZА,RА=У,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=15
SТР16:CJP А=SТР16,МАР=РЕ
;
;
БМСП17:ENTRY
;===== ПИШЕМ 0/1 В БМСП ПО 1 АДРЕСУ, ЧИТАЕМ, СРАВНИВАЕМ
;   РГ.А - ЧТО ПИШЕМ; Q - ЧИТАЕМ; У - РЕЗ-Т СРАВНЕНИЯ
;   АДРЕС В РФС - КАКОЙ ЕСТЬ! ТЕСТ БЕЗ ПЗУ!
;
CJP А=PSAD17,МАР=РЕ
PSAD17:CONT А=Н17,%TN%
CJS А=INITST,МАР=РЕ
;0 - В РГ.А
CONT ALUS=DZ,FUNC=AND,ALUD=В,RВ=А
;ЦИКЛ: ПИШЕМ РГ.А В БМСП
CADR17:CONT ALUS=ZА,RА=А,ALU,DSRC=SHIFT,MPS,PSHF=SН0,SHF=LOG,DDEV=MODB,WRD
;ЧИТАЕМ, СРАВНИВАЕМ
CONT DDEV=MODB,ALUS=DZ,ALUD=Q
CONT ALUS=AQ,RА=А,FUNC=EXOR,ALUD=В,RВ=У
;СДВИГАЕМ В СТ.РАЗРЯДЫ, ПРОВЕРЯЕМ НА 0
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0-63,SHF=LOG,CEN
CONT SТОРС=/NZ
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;ИНВЕРТИРУЕМ РГ.А
CJP А=CADR17,МАР=РЕ,ALUS=ZВ,RВ=А,FUNC=EXNOR,ALUD=В
;
;
БМСП18:ENTRY
;===== ЗАПИСЬ CONST1,CONST2 В БМСП ПО 2 АДРЕСАМ, ЧТЕНИЕ, СРАВНЕНИЕ
;   1 АДР. - В РС; 2 АДР. - РССОРУ; CONST1 - DADR; CONST2 - HALF;
;   А - ЧТЕНИЕ ПО 1 АДРЕСУ; У - ПО 2-ОМУ. WR1 - МАСКА НА 20Р.; ТЕСТ С ПЗУ!
;   ОШИБКИ: 01 - ПРОЧИТАЛИ НЕ ТО ПО 1-ОМУ АДРЕСУ; 02 - ПО 2-ОМУ
;
CJP А=PSAD18,МАР=РЕ
PSAD18:CONT А=Н18,%TN%
CJS А=INITST,МАР=РЕ
;МАСКУ НА 1 РАЗР. - В WR1
CONT А=С1,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=WR1
;ПИШЕМ: 1-Й АДРЕС ИЗ ПЗУ - В РГ.РС МПС, В РФС
CONT А=С15,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РС,ALU,YDST=PHYSPG
;CONST1 - В DADR, В БМСП
CONT А=ZER,DSRC=PROM,DDEV=MODB,WRD,ALUS=DZ,Н,ALUD=В,RВ=DADR
;2-Й АДРЕС - В РССОРУ, В РФС
CONT А=В13,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РССОРУ,ALU,YDST=PHYSPG
;CONST2 - В HALF, В БМСП
CONT А=CFFF,DSRC=PROM,DDEV=MODB,WRD,ALUS=DZ,Н,ALUD=В,RВ=HALF
;ЧИТАЕМ: 1-Й АДРЕС - В РФС
CADR18:CONT ALUS=ZА,RА=РС,ALU,YDST=PHYSPG
;ЧИТАЕМ БМСП В РГ.А МПС, СРАВНИВАЕМ
CONT DDEV=MODB,ALUS=DZ,ALUD=В,RВ=А
CONT ALUS=АВ,RА=DADR,RВ=А,FUNC=EXOR,ALUD=Q
;МАСКА НА 1 РАЗРЯД
CONT ALUS=AQ,RА=WR1,FUNC=AND,ALUD=Q,CEN
CONT SТОРС=/NZ,%CLRTYP%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%ТУРЕ%
;АНАЛОГИЧНО СО 2 АДРЕСОМ
CONT ALUS=ZА,RА=РССОРУ,ALU,YDST=PHYSPG
CONT DDEV=MODB,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=HALF,RВ=У,FUNC=EXOR,ALUD=Q
CONT ALUS=AQ,RА=WR1,FUNC=AND,ALUD=Q,CEN
CONT SТОРС=/NZ,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
CJP А=CADR18,МАР=РЕ
;
;
БМСП19:ENTRY
;===== ЗАПИСЬ 0/F В БМСП ПО ВСЕМ АДРЕСАМ, ЧТЕНИЕ, СРАВНЕНИЕ
;   А - ПИШЕМ; Q - ЧИТАЕМ; У - РЕЗУЛЬТАТ СРАВНЕНИЯ; РС - АДРЕС БМСП;
;   DADR = "1" В 11 РАЗРЯДЕ; ТЕСТ БЕЗ ПЗУ!
;
CJP А=PSAD19,МАР=РЕ
PSAD19:CONT А=Н19,%TN%
CJS А=INITST,МАР=РЕ
;"0" - В РГ.А; "1" В 11 РАЗРЯДЕ БЕЗ ПЗУ - В РГ.DADR
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=А
CONT ALUS=ZА,RА=А,Н,CI,ALUD=В,RВ=DADR
CONT ALUS=DZ,Н,ALUD=ВА,RА=DADR,RВ=DADR,ALU,DSRC=SHIFT,MPS,PSHF=SН0-10,SHF=LOG
;"0" - В РГ.РС, В РФС
PUSH А=1023,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=РС,ALU,YDST=PHYSPG
;ПИШЕМ "0" ИЗ РГ.А - В БМСП
CONT ALUS=ZА,RА=А,ALU,DSRC=SHIFT,MPS,PSHF=SН0,SHF=LOG,DDEV=MODB,WRD
;УВЕЛИЧИВАЕМ АДРЕС
RFCT ALUS=АВ,RА=DADR,RВ=РС,FUNC=ADD,ALUD=В,ALU,YDST=PHYSPG
;ЦИКЛ НА ЧТЕНИЕ И НОВУЮ ЗАПИСЬ ИНВЕРТИРОВАННОЙ CONST
CADR19:CONT %CLRTYP%
;НАЧАЛЬНЫЙ АДРЕС - В РС, В РФС
PUSH А=1023,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=РС,ALU,YDST=PHYSPG
;ЧИТАЕМ БМСП, СРАВНИВАЕМ
CONT DDEV=MODB,ALUS=DZ,ALUD=Q
CONT ALUS=AQ,RА=А,FUNC=EXOR,ALUD=В,RВ=У
;СДВИГАЕМ В СТ.РАЗРЯДЫ (УБИРАЕМ МУСОР БЕЗ ПЗУ), ПРОВЕРЯЕМ НА 0
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0-63,SHF=LOG,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;ПИШЕМ ПО ТОМУ ЖЕ АДРЕСУ ИНВЕРТИРОВАННУЮ CONST
CONT ALUS=ZА,RА=А,FUNC=EXNOR,ALU,DSRC=SHIFT,MPS,PSHF=SН0,SHF=LOG,DDEV=MODB,WRD
RFCT ALUS=АВ,RА=DADR,RВ=РС,FUNC=ADD,ALUD=В,ALU,YDST=PHYSPG
;ИНВЕРТИРУЕМ CONST, ИДЕМ НА НОВУЮ ПРОВЕРКУ
CJP А=CADR19,МАР=РЕ,ALUS=ZВ,RВ=А,FUNC=EXNOR,Н,ALUD=В
;
;
БМСП1А:ENTRY
;===== ЗАПИСЬ ДАННЫХ=СДВИНУТОМУ АДРЕСУ В БМСП ПО ВСЕМ АДРЕСАМ, ПРОВЕРКА
;   РС - АДРЕС БМСП; А = ЧТО ПИШЕМ = РС, СДВИНУТОМУ В МЛ.РАЗР.; Q - ЧИТАЕМ;
;   У - РЕЗУЛЬТАТ СРАВНЕНИЯ; DADR = "1" В 11 РАЗРЯДЕ; ТЕСТ БЕЗ ПЗУ!
;
CJP А=PSAD1A,МАР=РЕ
PSAD1A:CONT А=Н1А,%TN%
CJS А=INITST,МАР=РЕ
;"0" - В РГ.РС, В РФС; "1" В 11 РАЗРЯДЕ БЕЗ ПЗУ - В РГ.DADR
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=РС,ALU,YDST=PHYSPG
CONT ALUS=ZА,RА=РС,Н,CI,ALUD=В,RВ=DADR
PUSH А=1023,МАР=РЕ,ALUS=DZ,Н,ALUD=ВА,RА=DADR,RВ=DADR,ALU,DSRC=SHIFT,MPS
>,PSHF=SН0-10,SHF=LOG
;ДАННЫЕ = СДВИНУТОМУ АДРЕСУ - В БМСП
CONT ALUS=ZА,RА=РС,ALU,DSRC=SHIFT,MPS,PSHF=SН0+10,SHF=LOG,DDEV=MODB,WRD
;УВЕЛИЧИВАЕМ АДРЕС
RFCT ALUS=АВ,RА=DADR,RВ=РС,FUNC=ADD,ALUD=В,ALU,YDST=PHYSPG
;ЧИТАЕМ
CADR1A:CONT %CLRTYP%
;0 - РС
PUSH А=1023,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=РС,ALU,YDST=PHYSPG
;ВЫЧИСЛЯЕМ СДВИНУТЫЙ АДРЕС - В РГ.А
CONT ALUS=DZ,Н,ALUD=ВА,RА=РС,RВ=А,ALU,DSRC=SHIFT,MPS,PSHF=SН0+10,SHF=LOG
;ЧИТАЕМ БМСП, СРАВНИВАЕМ
CONT DDEV=MODB,ALUS=DZ,ALUD=Q
CONT ALUS=AQ,RА=А,FUNC=EXOR,ALUD=В,RВ=У
;СДВИГАЕМ В СТ.РАЗРЯДЫ (УБИРАЕМ МУСОР БЕЗ ПЗУ), ПРОВЕРЯЕМ НА 0
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0-63,SHF=LOG,CEN
CONT SТОРС=/NZ,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;УВЕЛИЧИВАЕМ АДРЕС
RFCT ALUS=АВ,RА=DADR,RВ=РС,FUNC=ADD,ALUD=В,ALU,YDST=PHYSPG
CJP А=CADR1A,МАР=РЕ
;
;
БМСП1В:ENTRY
;===== ЗАПИСЬ ДАННЫХ=ИНВЕРТИР.АДРЕСУ В БМСП В ОБРАТНОМ НАПРАВЛЕНИИ
;   А - ЧТО ПИСАЛИ (=/РС, СДВИНУТОМУ В МЛ.РАЗРЯДЫ); У - РЕЗУЛЬТАТ СРАВНЕНИЯ;
;   Q - ЧИТАЕМ; РС - АДРЕС БМСП; DADR = "1" В 11 РАЗРЯДЕ; ТЕСТ БЕЗ ПЗУ!
;
CJP А=PSAD1B,МАР=РЕ
PSAD1B:CONT А=Н1В,%TN%
CJS А=INITST,МАР=РЕ
;"FF..FF" - В РГ.РС, В РФС (НАЧАЛЬНЫЙ АДРЕС ДЛЯ ЗАПИСИ В ОБРАТНОМ НАПРАВЛЕНИИ)
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=РС
CONT ALUS=ZА,RА=РС,Н,CI,ALUD=В,RВ=DADR
CONT ALUS=ZВ,RВ=РС,FUNC=EXNOR,ALUD=В,ALU,YDST=PHYSPG
;"1" В 11 РАЗРЯДЕ - В DADR
PUSH А=1023,МАР=РЕ,ALUS=DZ,Н,ALUD=ВА,RА=DADR,RВ=DADR,ALU,DSRC=SHIFT,MPS
>,PSHF=SН0-10,SHF=LOG
;ДАННЫЕ = ИНВЕРТИРОВАННОМУ АДРЕСУ, СДВИНУТОМУ В МЛ.РАЗРЯДЫ - В БМСП
CONT ALUS=ZА,RА=РС,FUNC=EXNOR,ALU,DSRC=SHIFT,MPS,PSHF=SН0+10,SHF=LOG,DDEV=MODB
>,WRD
;УМЕНЬШАЕМ АДРЕС
RFCT ALUS=АВ,RА=DADR,RВ=РС,FUNC=SUBR,CI,ALUD=В,ALU,YDST=PHYSPG
;ЧИТАЕМ
CADR1B:CONT %CLRTYP%
;"FF..FF" - В РС
CONT ALUS=DZ,FUNC=AND,ALUD=В,RВ=РС
PUSH А=1023,МАР=РЕ,ALUS=ZВ,RВ=РС,FUNC=EXNOR,ALUD=В,ALU,YDST=PHYSPG
;ВЫЧИСЛЯЕМ ИНВЕРТИР.АДРЕС, СДВИГАЕМ В МЛАДШИЕ РАЗРЯДЫ
CONT ALUS=ZА,RА=РС,FUNC=EXNOR,ALUD=В,RВ=А
CONT ALUS=DZ,Н,ALUD=ВА,RА=А,RВ=А,ALU,DSRC=SHIFT,MPS,PSHF=SН0+10,SHF=LOG
;ЧИТАЕМ БМСП, СРАВНИВАЕМ
CONT DDEV=MODB,ALUS=DZ,ALUD=Q
CONT ALUS=AQ,RА=А,FUNC=EXOR,ALUD=В,RВ=У
;СДВИГАЕМ В СТ.РАЗРЯДЫ (УБИРАЕМ МУСОР БЕЗ ПЗУ), ПРОВЕРЯЕМ НА 0
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0-63,SHF=LOG,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
RFCT ALUS=АВ,RА=DADR,RВ=РС,FUNC=SUBR,CI,ALUD=В,ALU,YDST=PHYSPG
CJP А=CADR1B,МАР=РЕ
;
;
;     ============================
;     О З У  ПРИОРИТЕТОВ СТРАНИЦ 0
;     ============================
;
ПС01С:ENTRY
;===== ПИШЕМ ИЗ БОПП В ОЗУ ПРИОРИТЕТОВ СТРАНИЦ 0 ПО ЗАДАННОМУ АДР.;ЧИТАЕМ В БОПП
;   4-7 РГ.БОПП - АДРЕС ОЗУ (В 11-20 РАЗР.); 8-11 РГ.- ЧТО ПИШЕМ (11-20 РАЗР.)
;   12-15 РГ.БОПП - ЧТО ПРОЧИТАЛИ (11-20 РАЗРЯДЫ)
;
CJP А=PSAD1C,МАР=РЕ
PSAD1C:CONT А=Н1С,%TN%
CJS А=INITST,МАР=РЕ
;ЧИТАЕМ 4-7 РГ.БОПП (АДРЕС) И 8-11 РГ.БОПП (ДАННЫЕ)
CJS А=RD4/7,МАР=РЕ
CJS А=RD8/В,МАР=РЕ,ALUS=ZА,RА=WR6,ALUD=В,RВ=РС,ALU,YDST=PHYSPG
;ПИШЕМ В ОЗУ ПРИОРИТЕТОВ СТРАНИЦ
CONT ALUS=ZА,RА=WR6,ALU,DDEV=РРМЕМ0,WRD
;ЧИТАЕМ, УБИРАЕМ МУСОР (СДВИГАТЕЛЕМ), ПИШЕМ В БОПП
CONT DDEV=РРМЕМ0,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0-44,SHF=LOG
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0+54,SHF=LOG
CJS А=OUTC/F,МАР=РЕ,ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=WR6,ALU,DSRC=SHIFT,MPS
>,PSHF=SН0-10,SHF=LOG
SТР1С:CJP А=SТР1С,МАР=РЕ
;
;
ПC01D:ENTRY
;===== ПИШЕМ 0/F В ОЗУ ПРИОРИТЕТОВ СТРАНИЦ 0 ПО 1 АДРЕСУ, ЧИТАЕМ, СРАВНИВАЕМ
;   РГ.А - ЧТО ПИШЕМ; Q - ЧИТАЕМ; У - РЕЗ-Т СРАВНЕНИЯ
;   АДРЕС В РФС - КАКОЙ ЕСТЬ! ТЕСТ БЕЗ ПЗУ! СРАВНИВАЕМ 10 РАЗРЯДОВ.
;
CJP А=PSAD1D,МАР=РЕ
PSAD1D:CONT А=H1D,%TN%
CJS А=INITST,МАР=РЕ
;0 - В РГ.А
CONT ALUS=DZ,FUNC=AND,ALUD=В,RВ=А
;ЦИКЛ: ПИШЕМ РГ.А В ОЗУ ПС0
CADR1D:CONT ALUS=ZА,RА=А,ALU,DDEV=РРМЕМ0,WRD
;ЧИТАЕМ, СРАВНИВАЕМ
CONT DDEV=РРМЕМ0,ALUS=DZ,ALUD=Q
CONT ALUS=AQ,RА=А,FUNC=EXOR,ALUD=В,RВ=У
;СДВИГАЕМ В СТАРШИЕ,МЛАДШИЕ РАЗРЯДЫ, ПРОВЕРЯЕМ НА 0
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0-44,SHF=LOG
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0+54,SHF=LOG,CEN
CONT SТОРС=/NZ
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;ИНВЕРТИРУЕМ РГ.А
CJP А=CADR1D,МАР=РЕ,ALUS=ZВ,RВ=А,FUNC=EXNOR,ALUD=В
;
;
ПС01Е:ENTRY
;===== ЗАПИСЬ CONST1,CONST2 В ОЗУ ПС0 ПО 2 АДРЕСАМ, ЧТЕНИЕ, СРАВНЕНИЕ
;   1 АДР. - В РС; 2 АДР. - РССОРУ; CONST1 - DADR; CONST2 - HALF;
;   А - ЧТЕНИЕ ПО 1 АДРЕСУ; У - ПО 2-ОМУ. WR1 - МАСКА НА N СТРАНИЦЫ. ТЕСТ С ПЗУ!
;   ОШИБКИ: 01 - ПРОЧИТАЛИ НЕ ТО ПО 1-ОМУ АДРЕСУ; 02 - ПО 2-ОМУ
;
CJP А=PSAD1E,МАР=РЕ
PSAD1E:CONT А=Н1Е,%TN%
CJS А=INITST,МАР=РЕ
;МАСКУ НА 10 РАЗР. - В WR1
CONT А=MPG,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=WR1
;ПИШЕМ: 1-Й АДРЕС ИЗ ПЗУ - В РГ.РС МПС, В РФС
CONT А=С15,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РС,ALU,YDST=PHYSPG
;CONST1 - В DADR, В ОЗУ ПС0
CONT А=ZER,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=DADR,ALU,DDEV=РРМЕМ0,WRD
;2-Й АДРЕС - В РССОРУ, В РФС
CONT А=В13,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РССОРУ,ALU,YDST=PHYSPG
;CONST2 - В HALF, В ОЗУ ПС0
CONT А=CFFF,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=HALF,ALU,DDEV=РРМЕМ0,WRD
;ЧИТАЕМ: 1-Й АДРЕС - В РФС
CADR1E:CONT ALUS=ZА,RА=РС,ALU,YDST=PHYSPG
;ЧИТАЕМ ИЗ ОЗУ ПС0 - В РГ.А МПС, СРАВНИВАЕМ
CONT DDEV=РРМЕМ0,ALUS=DZ,ALUD=В,RВ=А
CONT ALUS=АВ,RА=DADR,RВ=А,FUNC=EXOR,ALUD=Q
;МАСКА НА 11-20 РАЗРЯДЫ
CONT ALUS=AQ,RА=WR1,FUNC=AND,ALUD=Q,CEN
CONT SТОРС=/NZ,%CLRTYP%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%ТУРЕ%
;АНАЛОГИЧНО СО 2 АДРЕСОМ
CONT ALUS=ZА,RА=РССОРУ,ALU,YDST=PHYSPG
CONT DDEV=РРМЕМ0,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=HALF,RВ=У,FUNC=EXOR,ALUD=Q
CONT ALUS=AQ,RА=WR1,FUNC=AND,ALUD=Q,CEN
CONT SТОРС=/NZ,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
CJP А=CADR1E,МАР=РЕ
;
;
ПC01F:ENTRY
;===== ЗАПИСЬ 0/F В ОЗУ ПС0 ПО ВСЕМ АДРЕСАМ, ЧТЕНИЕ, СРАВНЕНИЕ
;   А - ПИШЕМ; Q - ЧИТАЕМ; У - РЕЗУЛЬТАТ СРАВНЕНИЯ; РС - АДРЕС ОЗУ ПС0;
;   DADR = "1" В 11 РАЗРЯДЕ; ТЕСТ БЕЗ ПЗУ!
;
CJP А=PSAD1F,МАР=РЕ
PSAD1F:CONT А=H1F,%TN%
CJS А=INITST,МАР=РЕ
;"0" - В РГ.А; "1" В 11 РАЗРЯДЕ БЕЗ ПЗУ - В РГ.DADR
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=А
CONT ALUS=ZА,RА=А,Н,CI,ALUD=В,RВ=DADR
CONT ALUS=DZ,Н,ALUD=ВА,RА=DADR,RВ=DADR,ALU,DSRC=SHIFT,MPS,PSHF=SН0-10,SHF=LOG
;"0" - В РГ.РС, В РФС
PUSH А=1023,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=РС,ALU,YDST=PHYSPG
;ПИШЕМ "0" ИЗ РГ.А - В ОЗУ ПС0
CONT ALUS=ZА,RА=А,ALU,DDEV=РРМЕМ0,WRD
;УВЕЛИЧИВАЕМ АДРЕС
RFCT ALUS=АВ,RА=DADR,RВ=РС,FUNC=ADD,ALUD=В,ALU,YDST=PHYSPG
;ЦИКЛ НА ЧТЕНИЕ И НОВУЮ ЗАПИСЬ ИНВЕРТИРОВАННОЙ CONST
CADR1F:CONT %CLRTYP%
;НАЧАЛЬНЫЙ АДРЕС - В РС, В РФС
PUSH А=1023,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=РС,ALU,YDST=PHYSPG
;ЧИТАЕМ ОЗУ ПС0, СРАВНИВАЕМ
CONT DDEV=РРМЕМ0,ALUS=DZ,ALUD=Q
CONT ALUS=AQ,RА=А,FUNC=EXOR,ALUD=В,RВ=У
;СДВИГАЕМ В СДВИГАТЕЛЕ (УБИРАЕМ МУСОР БЕЗ ПЗУ), ПРОВЕРЯЕМ НА 0
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0-44,SHF=LOG
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0+54,SHF=LOG,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;ПИШЕМ ПО ТОМУ ЖЕ АДРЕСУ ИНВЕРТИРОВАННУЮ CONST, УВЕЛИЧИВАЕМ АДРЕС
CONT ALUS=ZА,RА=А,FUNC=EXNOR,ALU,DDEV=РРМЕМ0,WRD
RFCT ALUS=АВ,RА=DADR,RВ=РС,FUNC=ADD,ALUD=В,ALU,YDST=PHYSPG
;ИНВЕРТИРУЕМ CONST, ИДЕМ НА НОВУЮ ПРОВЕРКУ
CJP А=CADR1F,МАР=РЕ,ALUS=ZВ,RВ=А,FUNC=EXNOR,Н,ALUD=В
;
;
ПС020:ENTRY
;===== ЗАПИСЬ ДАННЫХ=АДРЕСУ В ОЗУ ПС0 ПО ВСЕМ АДРЕСАМ, ЧТЕНИЕ, СРАВНЕНИЕ
;   А - АДРЕС ОЗУ ПС0 = ЧТО ПИШЕМ; Q - ЧИТАЕМ; У - РЕЗУЛЬТАТ СРАВНЕНИЯ;
;   DADR = "1" В 11 РАЗРЯДЕ; ТЕСТ БЕЗ ПЗУ!
;
CJP А=PSAD20,МАР=РЕ
PSAD20:CONT А=Н20,%TN%
CJS А=INITST,МАР=РЕ
;"0" - В РГ.А, В АИСП.; "1" В 11 РАЗРЯДЕ БЕЗ ПЗУ - В РГ.DADR
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=А,ALU,YDST=PHYSPG
CONT ALUS=ZА,RА=А,Н,CI,ALUD=В,RВ=DADR
PUSH А=1023,МАР=РЕ,ALUS=DZ,Н,ALUD=ВА,RА=DADR,RВ=DADR,ALU,DSRC=SHIFT,MPS
>,PSHF=SН0-10,SHF=LOG
;ПИШЕМ ДАННЫЕ = АДРЕСУ
CONT ALUS=ZА,RА=А,ALU,DDEV=РРМЕМ0,WRD
;УВЕЛИЧИВАЕМ АДРЕС
RFCT ALUS=АВ,RА=DADR,RВ=А,FUNC=ADD,ALUD=В,ALU,YDST=PHYSPG
;ЧИТАЕМ
CADR20:CONT %CLRTYP%
;0 - В РГ.А
PUSH А=1023,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=А,ALU,YDST=PHYSPG
;ЧИТАЕМ ОЗУ ПС0, СРАВНИВАЕМ
CONT DDEV=РРМЕМ0,ALUS=DZ,ALUD=Q
CONT ALUS=AQ,RА=А,FUNC=EXOR,ALUD=В,RВ=У
;СДВИГАЕМ В СДВИГАТЕЛЕ (УБИРАЕМ МУСОР БЕЗ ПЗУ), ПРОВЕРЯЕМ НА 0
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0-44,SHF=LOG
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0+54,SHF=LOG,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
RFCT ALUS=АВ,RА=DADR,RВ=А,FUNC=ADD,ALUD=В,ALU,YDST=PHYSPG
CJP А=CADR20,МАР=РЕ
;
;
ПС021:ENTRY
;===== ЗАПИСЬ ДАННЫХ=ИНВЕРТ.АДРЕСУ В ОЗУ ПС0 ПО ВСЕМ АДРЕСАМ В ОБРАТНОМ НАПРАВЛ.
;   А - ЧТО ПИСАЛИ (=/РС); Q - ЧИТАЕМ; У - РЕЗУЛЬТАТ СРАВНЕНИЯ; РС - АДРЕС ОЗУ;
;   DADR = "1" В 11 РАЗРЯДЕ; ТЕСТ БЕЗ ПЗУ!
;
CJP А=PSAD21,МАР=РЕ
PSAD21:CONT А=Н21,%TN%
CJS А=INITST,МАР=РЕ
;"FF..FF" - В РГ.РС, В РФС (НАЧАЛЬНЫЙ АДРЕС ДЛЯ ЗАПИСИ В ОБРАТНОМ НАПРАВЛЕНИИ)
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=РС
CONT ALUS=ZА,RА=РС,Н,CI,ALUD=В,RВ=DADR
CONT ALUS=ZВ,RВ=РС,FUNC=EXNOR,ALUD=В,ALU,YDST=PHYSPG
;"1" В 11 РАЗРЯДЕ - В DADR
PUSH А=1023,МАР=РЕ,ALUS=DZ,Н,ALUD=ВА,RА=DADR,RВ=DADR,ALU,DSRC=SHIFT,MPS
>,PSHF=SН0-10,SHF=LOG
;ДАННЫЕ = ИНВЕРТИРОВАННОМУ АДРЕСУ - В ОЗУ ПС0
CONT ALUS=ZА,RА=РС,FUNC=EXNOR,ALU,DDEV=РРМЕМ0,WRD
;УМЕНЬШАЕМ АДРЕС
RFCT ALUS=АВ,RА=DADR,RВ=РС,FUNC=SUBR,CI,ALUD=В,ALU,YDST=PHYSPG
;ЧИТАЕМ
CADR21:CONT %CLRTYP%
;"FF..FF" - В РС
CONT ALUS=DZ,FUNC=AND,ALUD=В,RВ=РС
PUSH А=1023,МАР=РЕ,ALUS=ZВ,RВ=РС,FUNC=EXNOR,ALUD=В,ALU,YDST=PHYSPG
;ВЫЧИСЛЯЕМ ИНВЕРТИР.АДРЕС
CONT ALUS=ZА,RА=РС,FUNC=EXNOR,ALUD=В,RВ=А
;ЧИТАЕМ ОЗУ ПС0, СРАВНИВАЕМ
CONT DDEV=РРМЕМ0,ALUS=DZ,ALUD=Q
CONT ALUS=AQ,RА=А,FUNC=EXOR,ALUD=В,RВ=У
;СДВИГАЕМ В СДВИГАТЕЛЕ (УБИРАЕМ МУСОР БЕЗ ПЗУ), ПРОВЕРЯЕМ НА 0
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0-44,SHF=LOG
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0+54,SHF=LOG,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
RFCT ALUS=АВ,RА=DADR,RВ=РС,FUNC=SUBR,CI,ALUD=В,ALU,YDST=PHYSPG
CJP А=CADR21,МАР=РЕ
;
;
;     ============================
;     О З У  ПРИОРИТЕТОВ СТРАНИЦ 1
;     ============================
;
ПС122:ENTRY
;===== ПИШЕМ ИЗ БОПП В ОЗУ ПРИОРИТЕТОВ СТРАНИЦ 1 ПО ЗАДАННОМУ АДР.;ЧИТАЕМ В БОПП
;   4-7 РГ.БОПП - АДРЕС ОЗУ (В 11-20 РАЗР.); 8-11 РГ.- ЧТО ПИШЕМ (11-20 РАЗРЯДЫ)
;   12-15 РГ.БОПП - ЧТО ПРОЧИТАЛИ (11-20 РАЗРЯДЫ)
;
CJP А=PSAD22,МАР=РЕ
PSAD22:CONT А=Н22,%TN%
CJS А=INITST,МАР=РЕ
;ЧИТАЕМ 4-7 РГ.БОПП (АДРЕС) И 8-11 РГ.БОПП (ДАННЫЕ)
CJS А=RD4/7,МАР=РЕ
CJS А=RD8/В,МАР=РЕ,ALUS=ZА,RА=WR6,ALUD=В,RВ=РС,ALU,YDST=PHYSPG
;ПИШЕМ В ОЗУ ПРИОРИТЕТОВ СТРАНИЦ
CONT ALUS=ZА,RА=WR6,ALU,DDEV=РРМЕМ1,WRD
;ЧИТАЕМ, УБИРАЕМ МУСОР (СДВИГАТЕЛЕМ), ПИШЕМ В БОПП
CONT DDEV=РРМЕМ1,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0-44,SHF=LOG
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0+54,SHF=LOG
CJS А=OUTC/F,МАР=РЕ,ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=WR6,ALU,DSRC=SHIFT,MPS
>,PSHF=SН0-10,SHF=LOG
SТР22:CJP А=SТР22,МАР=РЕ
;
;
ПС123:ENTRY
;===== ПИШЕМ 0/F В ОЗУ ПРИОРИТЕТОВ СТРАНИЦ 1 ПО 1 АДРЕСУ, ЧИТАЕМ, СРАВНИВАЕМ
;   РГ.А - ЧТО ПИШЕМ; Q - ЧИТАЕМ; У - РЕЗ-Т СРАВНЕНИЯ
;   АДРЕС В РФС - КАКОЙ ЕСТЬ! ТЕСТ БЕЗ ПЗУ!
;
CJP А=PSAD23,МАР=РЕ
PSAD23:CONT А=Н23,%TN%
CJS А=INITST,МАР=РЕ
;0 - В РГ.А
CONT ALUS=DZ,FUNC=AND,ALUD=В,RВ=А
;ЦИКЛ: ПИШЕМ РГ.А В ОЗУ ПС1
CADR23:CONT ALUS=ZА,RА=А,ALU,DDEV=РРМЕМ1,WRD
;ЧИТАЕМ, СРАВНИВАЕМ
CONT DDEV=РРМЕМ1,ALUS=DZ,ALUD=Q
CONT ALUS=AQ,RА=А,FUNC=EXOR,ALUD=В,RВ=У
;СДВИГАЕМ, ПРОВЕРЯЕМ НА 0
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0-44,SHF=LOG
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0+54,SHF=LOG,CEN
CONT SТОРС=/NZ
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;ИНВЕРТИРУЕМ РГ.А
CJP А=CADR23,МАР=РЕ,ALUS=ZВ,RВ=А,FUNC=EXNOR,ALUD=В
;
;
ПС124:ENTRY
;===== ЗАПИСЬ CONST1,CONST2 В ОЗУ ПС1 ПО 2 АДРЕСАМ, ЧТЕНИЕ, СРАВНЕНИЕ
;   1 АДР. - В РС; 2 АДР. - РССОРУ; CONST1 - DADR; CONST2 - HALF;
;   А - ЧТЕНИЕ ПО 1 АДРЕСУ; У - ПО 2-ОМУ. WR1 - МАСКА НА N СТРАНИЦЫ; ТЕСТ С ПЗУ!
;   ОШИБКИ: 01 - ПРОЧИТАЛИ НЕ ТО ПО 1-ОМУ АДРЕСУ; 02 - ПО 2-ОМУ
;
CJP А=PSAD24,МАР=РЕ
PSAD24:CONT А=Н24,%TN%
CJS А=INITST,МАР=РЕ
;МАСКУ НА 11-20 РАЗР. - В WR1
CONT А=MPG,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=WR1
;ПИШЕМ: 1-Й АДРЕС ИЗ ПЗУ - В РГ.РС МПС, В РФС
CONT А=С15,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РС,ALU,YDST=PHYSPG
;CONST1 - В DADR, В ОЗУ ПС1
CONT А=ZER,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=DADR,ALU,DDEV=РРМЕМ1,WRD
;2-Й АДРЕС - В РССОРУ, В РФС
CONT А=В13,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РССОРУ,ALU,YDST=PHYSPG
;CONST2 - В HALF, В ОЗУ ПС1
CONT А=CFFF,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=HALF,ALU,DDEV=РРМЕМ1,WRD
;ЧИТАЕМ: 1-Й АДРЕС - В РФС
CADR24:CONT ALUS=ZА,RА=РС,ALU,YDST=PHYSPG
;ЧИТАЕМ ИЗ ОЗУ ПС1 - В РГ.А МПС, СРАВНИВАЕМ
CONT DDEV=РРМЕМ1,ALUS=DZ,ALUD=В,RВ=А
CONT ALUS=АВ,RА=DADR,RВ=А,FUNC=EXOR,ALUD=Q
;МАСКА НА 11-20 РАЗРЯДЫ
CONT ALUS=AQ,RА=WR1,FUNC=AND,ALUD=Q,CEN
CONT SТОРС=/NZ,%CLRTYP%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%ТУРЕ%
;АНАЛОГИЧНО СО 2 АДРЕСОМ
CONT ALUS=ZА,RА=РССОРУ,ALU,YDST=PHYSPG
CONT DDEV=РРМЕМ1,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=HALF,RВ=У,FUNC=EXOR,ALUD=Q
CONT ALUS=AQ,RА=WR1,FUNC=AND,ALUD=Q,CEN
CONT SТОРС=/NZ,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
CJP А=CADR24,МАР=РЕ
;
;
ПС125:ENTRY
;===== ЗАПИСЬ 0/F В ОЗУ ПС1 ПО ВСЕМ АДРЕСАМ, ЧТЕНИЕ, СРАВНЕНИЕ
;   А - ПИШЕМ; Q - ЧИТАЕМ; У - РЕЗУЛЬТАТ СРАВНЕНИЯ; РС - АДРЕС ОЗУ ПС1;
;   DADR = "1" В 11 РАЗРЯДЕ; ТЕСТ БЕЗ ПЗУ!
;
CJP А=PSAD25,МАР=РЕ
PSAD25:CONT А=Н25,%TN%
CJS А=INITST,МАР=РЕ
;"0" - В РГ.А; "1" В 11 РАЗРЯДЕ БЕЗ ПЗУ - В РГ.DADR
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=А
CONT ALUS=ZА,RА=А,Н,CI,ALUD=В,RВ=DADR
CONT ALUS=DZ,Н,ALUD=ВА,RА=DADR,RВ=DADR,ALU,DSRC=SHIFT,MPS,PSHF=SН0-10,SHF=LOG
;"0" - В РГ.РС, В РФС
PUSH А=1023,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=РС,ALU,YDST=PHYSPG
;ПИШЕМ "0" ИЗ РГ.А - В ОЗУ ПС1
CONT ALUS=ZА,RА=А,ALU,DDEV=РРМЕМ1,WRD
;УВЕЛИЧИВАЕМ АДРЕС
RFCT ALUS=АВ,RА=DADR,RВ=РС,FUNC=ADD,ALUD=В,ALU,YDST=PHYSPG
;ЦИКЛ НА ЧТЕНИЕ И НОВУЮ ЗАПИСЬ ИНВЕРТИРОВАННОЙ CONST
CADR25:CONT %CLRTYP%
;НАЧАЛЬНЫЙ АДРЕС - В РС, В РФС
PUSH А=1023,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=РС,ALU,YDST=PHYSPG
;ЧИТАЕМ ОЗУ ПС1, СРАВНИВАЕМ
CONT DDEV=РРМЕМ1,ALUS=DZ,ALUD=Q
CONT ALUS=AQ,RА=А,FUNC=EXOR,ALUD=В,RВ=У
;СДВИГАЕМ В СДВИГАТЕЛЕ (УБИРАЕМ МУСОР БЕЗ ПЗУ), ПРОВЕРЯЕМ НА 0
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0-44,SHF=LOG
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0+54,SHF=LOG,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;ПИШЕМ ПО ТОМУ ЖЕ АДРЕСУ ИНВЕРТИРОВАННУЮ CONST, УВЕЛИЧИВАЕМ АДРЕС
CONT ALUS=ZА,RА=А,FUNC=EXNOR,ALU,DDEV=РРМЕМ1,WRD
RFCT ALUS=АВ,RА=DADR,RВ=РС,FUNC=ADD,ALUD=В,ALU,YDST=PHYSPG
;ИНВЕРТИРУЕМ CONST, ИДЕМ НА НОВУЮ ПРОВЕРКУ
CJP А=CADR25,МАР=РЕ,ALUS=ZВ,RВ=А,FUNC=EXNOR,Н,ALUD=В
;
;
ПС126:ENTRY
;===== ЗАПИСЬ ДАННЫХ=АДРЕСУ В ОЗУ ПС1 ПО ВСЕМ АДРЕСАМ, ЧТЕНИЕ, СРАВНЕНИЕ
;   А - АДРЕС ОЗУ ПС1 = ЧТО ПИШЕМ; Q - ЧТО ЧИТАЕМ;
;   У - РЕЗУЛЬТАТ СРАВНЕНИЯ; DADR = "1" В 11 РАЗРЯДЕ; ТЕСТ БЕЗ ПЗУ!
;
CJP А=PSAD26,МАР=РЕ
PSAD26:CONT А=Н26,%TN%
CJS А=INITST,МАР=РЕ
;"0" - В РГ.А, В АИСП.; "1" В 11 РАЗРЯДЕ БЕЗ ПЗУ - В РГ.DADR
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=А,ALU,YDST=PHYSPG
CONT ALUS=ZА,RА=А,Н,CI,ALUD=В,RВ=DADR
PUSH А=1023,МАР=РЕ,ALUS=DZ,Н,ALUD=ВА,RА=DADR,RВ=DADR,ALU,DSRC=SHIFT,MPS
>,PSHF=SН0-10,SHF=LOG
;ДАННЫЕ = АДРЕСУ - В ОЗУ ПС1
CONT ALUS=ZА,RА=А,ALU,DDEV=РРМЕМ1,WRD
;УВЕЛИЧИВАЕМ АДРЕС
RFCT ALUS=АВ,RА=DADR,RВ=А,FUNC=ADD,ALUD=В,ALU,YDST=PHYSPG
;ЧИТАЕМ
CADR26:CONT %CLRTYP%
;0 - В РГ.А
PUSH А=1023,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=А,ALU,YDST=PHYSPG
;ЧИТАЕМ ОЗУ ПС1, СРАВНИВАЕМ
CONT DDEV=РРМЕМ1,ALUS=DZ,ALUD=Q
CONT ALUS=AQ,RА=А,FUNC=EXOR,ALUD=В,RВ=У
;СДВИГАЕМ В СДВИГАТЕЛЕ (УБИРАЕМ МУСОР БЕЗ ПЗУ), ПРОВЕРЯЕМ НА 0
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0-44,SHF=LOG
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0+54,SHF=LOG,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
RFCT ALUS=АВ,RА=DADR,RВ=А,FUNC=ADD,ALUD=В,ALU,YDST=PHYSPG
CJP А=CADR26,МАР=РЕ
;
;
ПС127:ENTRY
;===== ЗАПИСЬ ДАННЫХ=ИНВЕРТ.АДРЕСУ В ОЗУ ПС1 ПО ВСЕМ АДРЕСАМ В ОБРАТНОМ НАПРАВЛ.
;   А - ЧТО ПИСАЛИ (=/РС); Q - ЧИТАЕМ; У - РЕЗУЛЬТАТ СРАВНЕНИЯ; РС - АДРЕС ОЗУ;
;   DADR = "1" В 11 РАЗРЯДЕ; ТЕСТ БЕЗ ПЗУ!
;
CJP А=PSAD27,МАР=РЕ
PSAD27:CONT А=Н27,%TN%
CJS А=INITST,МАР=РЕ
;"FF..FF" - В РГ.РС, В РФС (НАЧАЛЬНЫЙ АДРЕС ДЛЯ ЗАПИСИ В ОБРАТНОМ НАПРАВЛЕНИИ)
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=РС
CONT ALUS=ZА,RА=РС,Н,CI,ALUD=В,RВ=DADR
CONT ALUS=ZВ,RВ=РС,FUNC=EXNOR,ALUD=В,ALU,YDST=PHYSPG
;"1" В 11 РАЗРЯДЕ - В DADR
PUSH А=1023,МАР=РЕ,ALUS=DZ,Н,ALUD=ВА,RА=DADR,RВ=DADR,ALU,DSRC=SHIFT,MPS
>,PSHF=SН0-10,SHF=LOG
;ДАННЫЕ = ИНВЕРТИРОВАННОМУ АДРЕСУ - В ОЗУ ПС1
CONT ALUS=ZА,RА=РС,FUNC=EXNOR,ALU,DDEV=РРМЕМ1,WRD
;УМЕНЬШАЕМ АДРЕС
RFCT ALUS=АВ,RА=DADR,RВ=РС,FUNC=SUBR,CI,ALUD=В,ALU,YDST=PHYSPG
;ЧИТАЕМ
CADR27:CONT %CLRTYP%
;"FF..FF" - В РС
CONT ALUS=DZ,FUNC=AND,ALUD=В,RВ=РС
PUSH А=1023,МАР=РЕ,ALUS=ZВ,RВ=РС,FUNC=EXNOR,ALUD=В,ALU,YDST=PHYSPG
;ВЫЧИСЛЯЕМ ИНВЕРТИР.АДРЕС
CONT ALUS=ZА,RА=РС,FUNC=EXNOR,ALUD=В,RВ=А
;ЧИТАЕМ ОЗУ ПС1, СРАВНИВАЕМ
CONT DDEV=РРМЕМ1,ALUS=DZ,ALUD=Q
CONT ALUS=AQ,RА=А,FUNC=EXOR,ALUD=В,RВ=У
;СДВИГАЕМ В СДВИГАТЕЛЕ (УБИРАЕМ МУСОР БЕЗ ПЗУ), ПРОВЕРЯЕМ НА 0
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0-44,SHF=LOG
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0+54,SHF=LOG,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
RFCT ALUS=АВ,RА=DADR,RВ=РС,FUNC=SUBR,CI,ALUD=В,ALU,YDST=PHYSPG
CJP А=CADR27,МАР=РЕ
;
;
;     =========================================================
;     ФИЗ.АДРЕС + ЗАПИСЬ N СТРАНИЦЫ В РФС + ИЗМЕНЕНИЕ БОБР,БИЗМ
;     =========================================================
;
ФИЗА28:ENTRY
;===== Ф.А.+ N СТРАНИЦЫ В РФС + ИЗМЕНЕНИЕ БОБР,БИЗМ ПО 1 АДРЕСУ С БП=0,1
;   DADR - МАТ.АДРЕС; РС - ПРИПИСКА; HALF - ВЫЧИСЛЕННЫЙ ФИЗ.АДРЕС С БП=0;
;   А - ПРОЧИТАННЫЙ ФИЗ.АДРЕС; У - НОМЕР СТРАНИЦЫ ИЗ РФС; РССОРУ = БОБР,БИЗМ;
;   ВУТЕ = РР С БП=1; ТЕСТ С ПЗУ!
;   ЧТОБ ИЗМЕНИЛИСЬ БОБР,БИЗМ, МАТ.АДРЕС НЕ ДОЛЖЕН ВЫЗЫВАТЬ ПРЕРЫВАНИЙ!
;   ОШИБКИ:
;   01 - НЕ ТОТ ФИЗ.АДРЕС С БП=1;              04 - ТО ЖЕ С БП=0;
;   02 - НЕ ТОТ НОМЕР СТРАНИЦЫ В РФС С БП=1;   05 - ТО ЖЕ С БП=0;
;   03 - НЕ ТЕ ЗНАЧЕНИЯ В БОБР,БИЗМ С БП=1;    06 - ТО ЖЕ С БП=0.
;
CJP А=PSAD28,МАР=РЕ
PSAD28:CONT А=Н28,%TN%
CJS А=INITST,МАР=РЕ
;МАТ.АДРЕС ИЗ ПЗУ - В РГ.DADR, АИСП.
CONT А=В3,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=DADR,ALU,YDST=ADRREG
;ПРИПИСКУ - В РС, В РП
CONT А=С555,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РС,ALU,YDEV=PSMEM,WRY
;ВЫЧИСЛЯЕМ ФИЗ.АДРЕС (КОТОРЫЙ Д.БЫТЬ С ПРИПИСКОЙ): N СТРАНИЦЫ (11-20 РАЗРЯДЫ)
CONT А=MPG,DSRC=PROM,ALUS=DА,RА=РС,FUNC=AND,Н,ALUD=В,RВ=HALF
;+ N СЛОВА В СТРАНИЦЕ (МЛАДШИЕ 10 РАЗРЯДОВ) - В РГ.HALF
CONT А=MWN,DSRC=PROM,ALUS=DА,RА=DADR,FUNC=AND,Н,ALUD=Q
CONT ALUS=AQ,RА=HALF,FUNC=OR,Н,ALUD=В,RВ=HALF
;БП = 1
CADR28:CONT А=CTEST,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=ВУТЕ,ALU,YDST=CNT
;ОБНУЛЯЕМ БОБР,БИЗМ ПО ОБОИМ ФИЗ.АДРЕСАМ:
CONT ALUS=ZА,RА=DADR,ALU,YDST=PHYSPG
CONT А=ZER,DSRC=PROM,DDEV=ВВ,WRD
CONT ALUS=ZА,RА=HALF,ALU,YDST=PHYSPG
CONT А=ZER,DSRC=PROM,DDEV=ВВ,WRD,%CLRTYP%
;01: ЧИТАЕМ ФИЗ.АДРЕС, СРАВНИВАЕМ С МАТ.АДРЕСОМ
CONT YDEV=PHYSAD,ARBI=DRD,ЕСВ,WRB,BRA=RG1,ЕСА,ARA=RG1,ALUS=DZ,ALUD=В,RВ=А
CONT ALUS=АВ,RА=DADR,RВ=А,FUNC=EXOR,ALUD=Q
CONT А=MADR,DSRC=PROM,ALUS=DQ,FUNC=AND,ALUD=Q,CEN
CONT SТОРС=/NZ,DSRC=PHYSPG,ALUS=DZ,ALUD=В,RВ=У
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%ТУРЕ%
;02: СРАВНИВАЕМ РФС
CONT ALUS=АВ,RА=DADR,RВ=У,FUNC=EXOR,ALUD=Q
CONT А=MPG,DSRC=PROM,ALUS=DQ,FUNC=AND,ALUD=Q,CEN
CONT SТОРС=/NZ,DDEV=ВВ,ALUS=DZ,ALUD=В,RВ=РССОРУ
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%ТУРЕ%
;03: ПРОВЕРЯЕМ БОБР(2 РАЗРЯД = 1), БИЗМ (3 РАЗРЯД = 0)
CONT А=С6,DSRC=PROM,ALUS=DА,RА=РССОРУ,FUNC=AND,ALUD=В,RВ=РССОРУ
CONT А=В2,DSRC=PROM,ALUS=DА,RА=РССОРУ,FUNC=EXOR,ALUD=Q,CEN
CONT А=В27,DSRC=PROM,ALUS=DА,RА=ВУТЕ,FUNC=EXOR,ALU,YDST=CNT,SТОРС=/NZ
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%ТУРЕ%
;
;ТО ЖЕ САМОЕ С БП = 0
CONT YDEV=PHYSAD,ARBI=DWR,ЕСВ,WRB,BRA=RG1,ЕСА,ARA=RG1,ALUS=DZ,ALUD=В,RВ=А
;04: ФИЗ.АДРЕС С ЗАМЕНОЙ N СТРАНИЦЫ
CONT ALUS=АВ,RА=HALF,RВ=А,FUNC=EXOR,ALUD=Q
CONT А=MADR,DSRC=PROM,ALUS=DQ,FUNC=AND,Н,ALUD=Q,CEN
CONT DSRC=PHYSPG,ALUS=DZ,ALUD=В,RВ=У,SТОРС=/NZ
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%ТУРЕ%
;05: СРАВНИВАЕМ РФС
CONT ALUS=АВ,RА=HALF,RВ=У,FUNC=EXOR,ALUD=Q
CONT А=MPG,DSRC=PROM,ALUS=DQ,FUNC=AND,ALUD=Q,CEN
CONT DDEV=ВВ,ALUS=DZ,ALUD=В,RВ=РССОРУ,SТОРС=/NZ
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%ТУРЕ%
;06: ПРОВЕРЯЕМ БОБР(2 РАЗРЯД = 1), БИЗМ (3 РАЗРЯД = 1)
CONT А=С6,DSRC=PROM,ALUS=DА,RА=РССОРУ,FUNC=AND,ALUD=В,RВ=РССОРУ
CONT А=С6,DSRC=PROM,ALUS=DА,RА=РССОРУ,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
CJP А=CADR28,МАР=РЕ
;
;
ФИЗА29:ENTRY
;===== ФИЗ.АДРЕС С БП=1 ( = МАТ.АДРЕСУ); ЦИКЛ ПО ВСЕМ АДРЕСАМ СТРАНИЦ
;   РС - МАТ.АДРЕС; А - ПРОЧИТАННЫЙ ФИЗ.АДРЕС; У - НОМЕР СТРАНИЦЫ В РФС;
;   РССОРУ - БОБР,БИЗМ: ПРОВЕРЯЕМ УСТАНОВКУ БИЗМ=1.
;   ОШИБКИ: 01 - НЕ ТОТ ФИЗ.АДРЕС; 02 - N СТРАНИЦЫ В РФС; 03 - НЕ ТЕ БОБР,БИЗМ;
;
CJP А=PSAD29,МАР=РЕ
PSAD29:CONT А=Н29,%TN%
CJS А=INITST,МАР=РЕ
;АДР."-1"-ОЙ СТРАНИЦЫ С РАЗМНОЖЕННИЕМ 20Р.В 21-32 - В РС, В WR1; БП=1
CONT А=В20,DSRC=PROM,ALUS=DZ,FUNC=SUBR,Н,CI,ALUD=В,RВ=РС,ALU,YDST=PHYSPG
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
PUSH А=1023,МАР=РЕ,ALUS=ZА,RА=РС,Н,ALUD=В,RВ=WR1
;УСТАНАВЛИВАЕМ БОБР=1
CONT А=В2,DSRC=PROM,DDEV=ВВ,WRD,ALUS=ZА,RА=РС,ALU,YDST=ADRREG
;CONST - В РП (НЕ ВОСТРЕБУЕМАЯ ПРИПИСКА)
CONT А=С555,DSRC=PROM,ALUS=DZ,ALU,YDEV=PSMEM,WRY
;АДРЕС РП - В РФС (Т.К.С БП=1) ДЛЯ НОВОГО ЦИКЛА
RFCT А=В11,DSRC=PROM,ALUS=DА,RА=РС,ALUD=В,RВ=РС,ALU,YDST=PHYSPG
;
CADR29:PUSH А=1023,МАР=РЕ,ALUS=ZА,RА=WR1,ALUD=В,RВ=РС,ALU,YDST=ADRREG,CEN
;ОБХОД, ЕСЛИ М.А.= 0
CONT SТОРС=NZ
CJP А=INCR29,МАР=РЕ,COND=СТ,SТОРС=NZ
;01: ЧИТАЕМ ФИЗ.АДРЕС, СРАВНИВАЕМ С МАТ.АДРЕСОМ (БП = 1)
CONT YDEV=PHYSAD,ARBI=DWR,ЕСВ,WRB,BRA=RG1,ЕСА,ARA=RG1,ALUS=DZ,ALUD=В,RВ=А
CONT %CLRTYP%
CONT ALUS=АВ,RА=РС,RВ=А,FUNC=EXOR,ALUD=Q
CONT А=MADR,DSRC=PROM,ALUS=DQ,FUNC=AND,ALUD=Q,CEN
CONT SТОРС=/NZ,DSRC=PHYSPG,ALUS=DZ,ALUD=В,RВ=У
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%ТУРЕ%
;02: СРАВНИВАЕМ РФС
CONT ALUS=АВ,RА=РС,RВ=У,FUNC=EXOR,ALUD=Q
CONT А=MPG,DSRC=PROM,ALUS=DQ,FUNC=AND,ALUD=Q,CEN
CONT SТОРС=/NZ,DDEV=ВВ,ALUS=DZ,ALUD=В,RВ=РССОРУ
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%ТУРЕ%
;03: ПРОВЕРЯЕМ БОБР (2 РАЗРЯД = 1), БИЗМ (3 РАЗРЯД = 1)
CONT А=С6,DSRC=PROM,ALUS=DА,RА=РССОРУ,FUNC=AND,ALUD=В,RВ=РССОРУ
CONT А=С6,DSRC=PROM,ALUS=DА,RА=РССОРУ,FUNC=EXOR,ALUD=Q,CEN
;СНОВА УСТАНАВЛИВАЕМ ТОЛЬКО БОБР В 1 (ДЛЯ ОЧЕРЕДНОГО ЦИКЛА)
CONT А=В2,DSRC=PROM,DDEV=ВВ,WRD,SТОРС=/NZ,%TIK%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%ТУРЕ%
INCR29:RFCT А=В11,DSRC=PROM,ALUS=DА,RА=РС,ALUD=В,RВ=РС,ALU,YDST=ADRREG,CEN
CJP А=CADR29,МАР=РЕ
;
;
ФИЗА2А:ENTRY
;===== ЧТЕНИЕ ФИЗ.АДРЕСА С ПРИПИСКОЙ (БП = 0); ЦИКЛ ПО ВСЕМ АДРЕСАМ СТРАНИЦ
;   РС - МАТ.АДРЕС; DADR - ЗАПИСАННОЕ В РП, 11-20Р.= Ф.А, Т.К.1-10Р.М.А.= 0;
;   А - ПРОЧИТАННЫЙ ФИЗ.АДРЕС; У - НОМЕР СТРАНИЦЫ В РФС; РССОРУ - БОБР,БИЗМ.
;   ОШИБКИ: 01 - НЕ ТОТ ФИЗ.АДРЕС; 02 - N СТРАНИЦЫ В РФС; 03 - НЕ ТЕ БОБР,БИЗМ;
;
CJP А=PSAD2A,МАР=РЕ
PSAD2A:CONT А=Н2А,%TN%
CJS А=INITST,МАР=РЕ
;АДР.НАЧАЛА БЕЗ 1 СТР.- ПИШЕМ В РС,WR1; БП = 0
CONT А=В20,DSRC=PROM,ALUS=DZ,FUNC=SUBR,Н,CI,ALUD=В,RВ=РС
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALUD=В,RВ=ВУТЕ
CONT А=В27,DSRC=PROM,ALUS=DА,RА=ВУТЕ,FUNC=EXOR,ALU,YDST=CNT
PUSH А=1023,МАР=РЕ,ALUS=ZА,RА=РС,Н,ALUD=В,RВ=WR1,ALU,YDST=ADRREG
;CONST - В РП (ПРИПИСКА)
CONT А=С555,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=DADR,ALU,YDEV=PSMEM,WRY,YDST=PHYSPG
RFCT А=В11,DSRC=PROM,ALUS=DА,RА=РС,ALUD=В,RВ=РС,ALU,YDST=ADRREG
;РП = CONST, ФИЗ.АДРЕС БУДЕТ ОДИН И ТОТ ЖЕ, ПИШЕМ ПО ЭТОМУ АДРЕСУ БОБР=БИЗМ=0
CONT А=ZER,DSRC=PROM,DDEV=ВВ,WRD
;ВЫЧИСЛЯЕМ ФИЗ.АДРЕС
CONT А=MPG,DSRC=PROM,ALUS=DА,RА=DADR,FUNC=AND,Н,ALUD=В,RВ=DADR
CADR2A:PUSH А=1023,МАР=РЕ,ALUS=ZА,RА=WR1,Н,ALUD=В,RВ=РС,ALU,YDST=ADRREG,CEN
;ОБХОДИМ МАТ.АДРЕС = 0
CONT SТОРС=NZ
CJP А=INCR2A,МАР=РЕ,COND=СТ,SТОРС=NZ
;01: ЧИТАЕМ ФИЗ.АДРЕС, СРАВНИВАЕМ
CONT YDEV=PHYSAD,ARBI=FЕТСН,ЕСВ,WRB,BRA=RG1,ЕСА,ARA=RG1,ALUS=DZ,ALUD=В,RВ=А
CONT %CLRTYP%
CONT ALUS=АВ,RА=DADR,RВ=А,FUNC=EXOR,ALUD=Q
CONT А=MADR,DSRC=PROM,ALUS=DQ,FUNC=AND,ALUD=Q,CEN
CONT SТОРС=/NZ,DSRC=PHYSPG,ALUS=DZ,ALUD=В,RВ=У
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%ТУРЕ%
;02: СРАВНИВАЕМ РФС
CONT ALUS=АВ,RА=DADR,RВ=У,FUNC=EXOR,ALUD=Q
CONT А=MPG,DSRC=PROM,ALUS=DQ,FUNC=AND,ALUD=Q,CEN
CONT SТОРС=/NZ,DDEV=ВВ,ALUS=DZ,ALUD=В,RВ=РССОРУ
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%ТУРЕ%
;03: ПРОВЕРЯЕМ БОБР (2 РАЗРЯД = 1), БИЗМ (3 РАЗРЯД = 0)
CONT А=С6,DSRC=PROM,ALUS=DА,RА=РССОРУ,FUNC=AND,ALUD=В,RВ=РССОРУ
CONT А=В2,DSRC=PROM,ALUS=DА,RА=РССОРУ,FUNC=EXOR,ALUD=Q,CEN
;СНОВА УСТАНАВЛИВАЕМ БОБР,БИЗМ В 0 (ДЛЯ ОЧЕРЕДНОГО ЦИКЛА)
CONT А=ZER,DSRC=PROM,DDEV=ВВ,WRD,SТОРС=/NZ,%TIK%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%ТУРЕ%
INCR2A:RFCT А=В11,DSRC=PROM,ALUS=DА,RА=РС,ALUD=В,RВ=РС,ALU,YDST=ADRREG,CEN
CJP А=CADR2A,МАР=РЕ
;
;
ФИЗА2В:ENTRY
;===== ФИЗ.АДРЕС С БП=0; ЦИКЛ ПО ВСЕМ МАТ.АДРЕСАМ И ФИЗ.АДРЕСАМ СТРАНИЦЫ И СЛОВА
;   РС - МАТ.АДРЕС; РП - ИНВЕРТИРОВАННЫЙ МАТ.АДРЕС; А - ФИЗ.АДРЕС; У - РФС;
;   РССОРУ - ПРОЧИТАННЫЕ БОБР,БИЗМ.
;
CJP А=PSAD2B,МАР=РЕ
PSAD2B:CONT А=Н2В,%TN%
CJS А=INITST,МАР=РЕ
CONT А=В20,DSRC=PROM,ALUS=DZ,FUNC=SUBR,Н,CI,ALUD=В,RВ=РС,ALU,YDST=ADRREG
PUSH А=1023,МАР=РЕ,ALUS=ZА,RА=РС,Н,ALUD=В,RВ=WR1
;ПИШЕМ ИНВЕРТИРОВАННЫЙ АДРЕС - В РП; 0 - В БОБР,БИЗМ
CONT ALUS=ZА,RА=РС,FUNC=EXNOR,ALU,YDEV=PSMEM,WRY,YDST=PHYSPG
CONT А=ZER,DSRC=PROM,DDEV=ВВ,WRD
RFCT А=В11,DSRC=PROM,ALUS=DА,RА=РС,ALUD=В,RВ=РС,ALU,YDST=ADRREG
;БП = 0
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALUD=В,RВ=ВУТЕ
CONT А=В27,DSRC=PROM,ALUS=DА,RА=ВУТЕ,FUNC=EXOR,ALU,YDST=CNT
;МАТ. АДРЕС - В АИСП., НАЧИНАЯ С "-1"-ОЙ СТР., 0 СЛОВА (ЗДЕСЬ М.А.=0 НЕТ!)
CADR2B:PUSH А=1023,МАР=РЕ,ALUS=ZА,RА=WR1,Н,ALUD=В,RВ=РС,ALU,YDST=ADRREG
;ВЫЧИСЛЯЕМ ФИЗ.АДРЕС:ИНВЕРТИРУЕМ НОМЕР СТРАНИЦЫ У МАТ.АДРЕСА (ТАК ЗАПИСАНО В РП)
CONT А=MPG,DSRC=PROM,ALUS=DА,RА=РС,FUNC=EXOR,ALUD=В,RВ=DADR
;01: ЧИТАЕМ  ФИЗ.АДРЕС, СРАВНИВАЕМ
CONT YDEV=PHYSAD,ARBI=DWR,ЕСВ,WRB,BRA=RG2,ЕСА,ARA=RG2,ALUS=DZ,ALUD=В,RВ=А
CONT ALUS=АВ,RА=DADR,RВ=А,FUNC=EXOR,ALUD=Q
CONT А=MADR,DSRC=PROM,ALUS=DQ,FUNC=AND,ALUD=Q,CEN
CONT SТОРС=21,%CLRTYP%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=21,%ТУРЕ%
;02: СРАВНИВАЕМ РФС
CONT DSRC=PHYSPG,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=DADR,RВ=У,FUNC=EXOR,ALUD=Q
CONT А=MPG,DSRC=PROM,ALUS=DQ,FUNC=AND,ALUD=Q,CEN
CONT SТОРС=/NZ,DDEV=ВВ,ALUS=DZ,ALUD=В,RВ=РССОРУ
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%ТУРЕ%
;03: ПРОВЕРЯЕМ БОБР(2 РАЗРЯД = 1), БИЗМ (3 РАЗРЯД = 1)
CONT А=С6,DSRC=PROM,ALUS=DА,RА=РССОРУ,FUNC=AND,ALUD=В,RВ=РССОРУ
CONT А=С6,DSRC=PROM,ALUS=DА,RА=РССОРУ,FUNC=EXOR,ALUD=Q,CEN
;СНОВА УСТАНАВЛИВАЕМ БОБР,БИЗМ В 0 (ДЛЯ ОЧЕРЕДНОГО ЦИКЛА)
CONT А=ZER,DSRC=PROM,DDEV=ВВ,WRD,SТОРС=/NZ,%TIK%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%ТУРЕ%
RFCT А=PG1W1,DSRC=PROM,ALUS=DА,RА=РС,FUNC=ADD,ALUD=В,RВ=РС,ALU,YDST=ADRREG
CJP А=CADR2B,МАР=РЕ
;
;
LD2C:ENTRY
;===== ПРОВЕРКА АВТОМАТИЧЕСКОЙ ЗАГРУЗКИ ОЗУ БМСП "1", НАЧИНАЯ С 0-ОГО АДРЕСА
;   А - АДРЕС; У - ПРОЧИТАННОЕ ИЗ БМСП; ПРОВЕРЯЕМ АДРЕСА, РАВНЫЕ ОБ'ЕМУ ПАМЯТИ;
;
CJP А=PSAD2C,МАР=РЕ
PSAD2C:CONT А=Н2С,%TN%
CJS А=INITST,МАР=РЕ
;ЗАПИСЫВАЕМ В ОЗУ БМСП 0:
CAD2C:PUSH А=1023,МАР=РЕ,ALUS=ZА,FUNC=AND,ALUD=В,RВ=А,ALU,YDST=PHYSPG
CONT А=ZER,DSRC=PROM,DDEV=MODB,WRD
RFCT А=В11,DSRC=PROM,ALUS=DА,RА=А,FUNC=ADD,ALUD=В,RВ=А,ALU,YDST=PHYSPG
;ЗАПИСЫВАЕМ В РФС "0"
CONT А=ZER,DSRC=PROM,ALUS=DZ,ALU,YDST=PHYSPG
;ЗАПУСКАЕМ ЗАГРУЗКУ
CONT FFCNT=STRTLD
;ЖДЕМ КОНЦА ЗАГРУЗКИ
WЕ2С:CJP А=WЕ2С,МАР=РЕ,COND=FULMEM,IСС
;ПРОВЕРЯЕМ
PUSH А=127,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=А,ALU,YDST=PHYSPG
CONT DDEV=MODB,ALUS=DZ,ALUD=В,RВ=У
CONT А=С1,DSRC=PROM,ALUS=DА,RА=У,FUNC=AND,ALUD=В,RВ=У
CONT А=С1,DSRC=PROM,ALUS=DА,RА=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
RFCT А=В11,DSRC=PROM,ALUS=DА,RА=А,FUNC=ADD,ALUD=В,RВ=А,ALU,YDST=PHYSPG
CJP А=CAD2C,МАР=РЕ
;
;
LD2D:ENTRY
;===== ПРОВЕРКА АВТОМАТИЧЕСКОЙ ЗАГРУЗКИ ОЗУ БМСП "1",НАЧИНАЯ С НЕНУЛЕВОГО АДРЕСА
;   А - АДРЕС; У - ПРОЧИТАННОЕ ИЗ БМСП; ПРОВЕРЯЕМ АДРЕСА, РАВНЫЕ ОБ'ЕМУ ПАМЯТИ;
;   ОШИБКИ: 01 - ЕСТЬ "1" В 1-Й ПОЛОВИНЕ ПАМЯТИ; 02 - ЕСТЬ "0" ВО 2-Й ПОЛОВИНЕ.
;
CJP А=PSAD2D,МАР=РЕ
PSAD2D:CONT А=H2D,%TN%
CJS А=INITST,МАР=РЕ
;ЗАПИСЫВАЕМ В ОЗУ БМСП 0:
CAD2D:PUSH А=1023,МАР=РЕ,ALUS=ZА,FUNC=AND,ALUD=В,RВ=А,ALU,YDST=PHYSPG
CONT А=ZER,DSRC=PROM,DDEV=MODB,WRD,%CLRTYP%
RFCT А=В11,DSRC=PROM,ALUS=DА,RА=А,FUNC=ADD,ALUD=В,RВ=А,ALU,YDST=PHYSPG
;ЗАПИСЫВАЕМ В РФС НЕ РАВНЫЙ 0 АДРЕС:
CONT А=В17,DSRC=PROM,ALUS=DZ,ALU,YDST=PHYSPG
;ЗАПУСКАЕМ ЗАГРУЗКУ
CONT FFCNT=STRTLD
CONT %ТУРЕ%
;ЖДЕМ КОНЦА ЗАГРУЗКИ
WE2D:CJP А=WE2D,МАР=РЕ,COND=FULMEM,IСС
;ПРОВЕРЯЕМ 1-Ю ПОЛОВИНУ ПАМЯТИ НА 0
PUSH А=63,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=А,ALU,YDST=PHYSPG
CONT DDEV=MODB,ALUS=DZ,ALUD=В,RВ=У
CONT А=С1,DSRC=PROM,ALUS=DА,RА=У,FUNC=AND,ALUD=В,RВ=У,CEN
CONT SТОРС=/NZ
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
RFCT А=В11,DSRC=PROM,ALUS=DА,RА=А,FUNC=ADD,ALUD=В,RВ=А,ALU,YDST=PHYSPG
;ПРОВЕРЯЕМ 2-Ю ПОЛОВИНУ ПАМЯТИ НА 1 (В РФС - ТО, ЧТО НАДО!)
PUSH А=63,МАР=РЕ,%ТУРЕ%
CONT DDEV=MODB,ALUS=DZ,ALUD=В,RВ=У
CONT А=С1,DSRC=PROM,ALUS=DА,RА=У,FUNC=AND,ALUD=В,RВ=У
CONT А=С1,DSRC=PROM,ALUS=DА,RА=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
RFCT А=В11,DSRC=PROM,ALUS=DА,RА=А,FUNC=ADD,ALUD=В,RВ=А,ALU,YDST=PHYSPG
CJP А=CAD2D,МАР=РЕ
END
*END
*NО LIST
*CALL MPSEND:PHYS=800
*END FILE
*END FILE
