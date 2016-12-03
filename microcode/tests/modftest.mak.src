*NАМЕ 4:MODFTEST
*       ОЗУ МОДИФИКАТОРОВ
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
MODF:PROG;
;     ===========================
;     Р Н Г  +  ОЗУ МОДИФИКАТОРОВ
;     ===========================
;
EXTERNAL INITST,ERRINH,RD8/В,OUTC/F
;
РНГ1:ENTRY
;===== РНГ: ПИШЕМ ИЗ 11 РГ.БОПП - В РНГ, ЧИТАЕМ РНГ, ПИШЕМ В 15 РГ.БОПП
;   В РНГ ПИШЕМ С 6-10 РАЗР.ШИНЫ У; ЧИТАЕМ 6-11 РАЗР.ШИНЫ D,
;   ПОЭТОМУ 11-Й РГ.БОПП СДВИГАЕМ НА 5 РАЗР.ВЛЕВО ПЕРЕД ЗАПИСЬЮ,
;   А ПОСЛЕ ЧТЕНИЯ ПЕРЕД ЗАПИСЬЮ В БОПП - СДВИГАЕМ В МЛ.РАЗРЯДЫ.
;
CJP А=PSMOD1,МАР=РЕ
PSMOD1:CONT А=Н1,%TN%
CJS А=INITST,МАР=РЕ
;11-Й РЕГИСТР БОПП, СДВИГАЕМ ВЛЕВО НА 5, ПИШЕМ В РНГ
CONT YDEV=МРМЕМ,IОМР,MPADR=11,DSRC=SHIFT,MPS,PSHF=SН0-5,SHF=LOG
>,ALUS=DZ,ALUD=В,RВ=А
CONT ALUS=ZА,RА=А,ALU,YDST=MODGN
;ЧИТАЕМ РНГ
CONT DSRC=MODGN,ALUS=DZ,ALUD=В,RВ=У
;СДВИГАЕМ В СДВИГАТЕЛЕ В СТ.РАЗРЯДЫ, ПОТОМ В МЛАДШИЕ (УБИРАЕМ МУСОР БЕЗ ПЗУ)
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0-53,SHF=LOG
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0+58,SHF=LOG
;ПИШЕМ В 15 РГ.БОПП. 6 РАЗРЯД РНГ (ИЛИ 11-Й ПРИ ЧТЕНИИ РНГ) Д.Б. = 1
CONT ALUS=ZА,RА=У,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=15
SТР1:CJP А=SТР1,МАР=РЕ
;
;
РНГ2:ENTRY
;===== РНГ: ПИШЕМ 00 ИЛИ FF В РНГ; ЧТЕНИЕ В МПС; СРАВНЕНИЕ
;   В РНГ ПИШЕМ С 6-10 РАЗР.ШИНЫ У; ЧИТАЕМ 6-11 РАЗР.ШИНЫ D.
;   РГ.А - ЧТО ПИШЕМ; У - ЧТО ЧИТАЕМ; DADR - "1" В 11 РАЗРЯДЕ; Q,WR1 - РАБОЧИЕ
;   ТЕСТ БЕЗ ПЗУ!
;
CJP А=PSMOD2,МАР=РЕ
PSMOD2:CONT А=Н2,%TN%
CJS А=INITST,МАР=РЕ
;0 - В РГ.А; ДЕЛАЕМ CONST В РГ.DADR С ЕДИНИЦЕЙ В 11 РАЗРЯДЕ (БЕЗ ПЗУ)
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=А
CONT ALUS=ZА,RА=А,Н,CI,ALUD=В,RВ=DADR
CONT ALUS=DZ,Н,ALUD=ВА,RА=DADR,RВ=DADR,ALU,DSRC=SHIFT,MPS,PSHF=SН0-10,SHF=LOG
;ЦИКЛ: ПИШЕМ В РНГ 0 ИЛИ FF ПОПЕРЕМЕННО
CMOD2:CONT ALUS=ZА,RА=А,ALU,YDST=MODGN
;ЧИТАЕМ РНГ
CONT DSRC=MODGN,ALUS=DZ,ALUD=В,RВ=У
;ДОБАВЛЯЕМ В РГ.А ДЛЯ СРАВНЕНИЯ "1" В 11 РАЗРЯДЕ; СРАВНИВАЕМ
CONT ALUS=АВ,RА=DADR,RВ=А,FUNC=OR,Н,ALUD=Q
CONT ALUS=AQ,RА=У,FUNC=EXOR,ALUD=В,RВ=WR1
;СДВИГАЕМ В СДВИГАТЕЛЕ В СТ.РАЗРЯДЫ, ПОТОМ В МЛАДШИЕ (УБИРАЕМ МУСОР БЕЗ ПЗУ)
CONT ALUS=DZ,Н,ALUD=ВА,RА=WR1,RВ=WR1,ALU,DSRC=SHIFT,MPS,PSHF=SН0-53,SHF=LOG
;И ПРОВЕРЯЕМ НА 0
CONT ALUS=DZ,Н,ALUD=ВА,RА=WR1,RВ=WR1,ALU,DSRC=SHIFT,MPS,PSHF=SН0+58,SHF=LOG
>,CEN
CONT SТОРС=/NZ
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;ИНВЕРТИРУЕМ РГ.А
CJP А=CMOD2,МАР=РЕ,ALUS=DА,RА=А,FUNC=EXNOR,Н,ALUD=В,RВ=А
;
;
РНГ3:ENTRY
;===== РНГ: ПИШЕМ ПЕРЕМЕННОЕ ЧИСЛО В РНГ; ЧТЕНИЕ В МПС; СРАВНЕНИЕ
;   В РГ.А - ЗАПИСЫВАЕМОЕ ЧИСЛО; У - ПРОЧИТАННОЕ;
;   DADR,HALF - CONST С "1" 6 И 11 РАЗРЯДАХ; Q,WR1 - РАБОЧИЕ
;   ТЕСТ БЕЗ ПЗУ!
;
CJP А=PSMOD3,МАР=РЕ
PSMOD3:CONT А=Н3,%TN%
CJS А=INITST,МАР=РЕ
;0 - В А; ДЕЛАЕМ CONST С ЕДИНИЦЕЙ В 6(HALF) И 11(DADR) РАЗРЯДАХ (БЕЗ ПЗУ)
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=А
CONT ALUS=ZА,RА=А,Н,CI,ALUD=В,RВ=DADR
CONT ALUS=DZ,Н,ALUD=ВА,RА=DADR,RВ=HALF,ALU,DSRC=SHIFT,MPS,PSHF=SН0-5,SHF=LOG
CONT ALUS=DZ,Н,ALUD=ВА,RА=DADR,RВ=DADR,ALU,DSRC=SHIFT,MPS,PSHF=SН0-10,SHF=LOG
;ЦИКЛ: ПИШЕМ В РНГ ПЕРЕМННОЕ ЧИСЛО
CMOD3:CONT ALUS=ZА,RА=А,ALU,YDST=MODGN
;ЧИТАЕМ РНГ
CONT DSRC=MODGN,ALUS=DZ,ALUD=В,RВ=У
;ДОБАВЛЯЕМ В РГ.А ДЛЯ СРАВНЕНИЯ "1" В 11 РАЗРЯДЕ; СРАВНИВАЕМ
CONT ALUS=АВ,RА=DADR,RВ=А,FUNC=OR,Н,ALUD=Q
CONT ALUS=AQ,RА=У,FUNC=EXOR,ALUD=В,RВ=WR1
;СДВИГАЕМ В СДВИГАТЕЛЕ В СТ.РАЗРЯДЫ, ПОТОМ В МЛАДШИЕ (УБИРАЕМ МУСОР БЕЗ ПЗУ)
CONT ALUS=DZ,Н,ALUD=ВА,RА=WR1,RВ=WR1,ALU,DSRC=SHIFT,MPS,PSHF=SН0-53,SHF=LOG
;И ПРОВЕРЯЕМ НА 0
CONT ALUS=DZ,Н,ALUD=ВА,RА=WR1,RВ=WR1,ALU,DSRC=SHIFT,MPS,PSHF=SН0+58,SHF=LOG
>,CEN
CONT SТОРС=/NZ
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;УВЕЛИЧИВАЕМ ЗАПИСЫВАЕМОЕ ЧИСЛО НА 1 В 6-ОМ РАЗРЯДЕ
CJP А=CMOD3,МАР=РЕ,ALUS=АВ,RА=HALF,RВ=А,FUNC=ADD,ALUD=В
;
;
МОД4:ENTRY
;===== ПРВЕРЯЕМ МОДИФИКАТОРЫ КАК РЕГИСТР: ПИШЕМ, ЧИТАЕМ ПО ФИКСИР.АДРЕСУ РГ.:
;===== ПИШЕМ ИЗ БОПП - В 0-Й МОДИФИКАТОР(!); АДРЕС МОДИФИКАТОРА - В МП; ЧИТАЕМ
;   ЧИТАЕМ 8-11 РГ.БОПП; ПИШЕМ РЕЗУЛЬТАТ - В 12-15 РГ.БОПП
;   РНГ - КАКОЙ ЕСТЬ!
;
CJP А=PSMOD4,МАР=РЕ
PSMOD4:CONT А=Н4,%TN%
CJS А=INITST,МАР=РЕ
;ЧИТАЕМ ИЗ 8-11 РГ.БОПП
CJS А=RD8/В,МАР=РЕ
;ПИШЕМ В 0-Й МОДИФИКТОР
CONT ALUS=ZА,RА=WR6,ALU,CSM,WЕМ,MNSA=МР,MODNM=М0
;ЧИТАЕМ, ПИШЕМ В БОПП
CJS А=OUTC/F,МАР=РЕ,CSM,MNSA=МР,MODNM=М0,ALUS=DZ,ALUD=В,RВ=WR6
SТР4:CJP А=SТР4,МАР=РЕ
;
;
МОД5:ENTRY
;===== ПИШЕМ ИЗ БОПП - В 7-Й(!) МОДИФИКАТОР; АДРЕС МОДИФИКАТОРА - В МП; ЧИТАЕМ
;   ЧИТАЕМ 8-11 РГ.БОПП; ПИШЕМ РЕЗУЛЬТАТ - В 12-15 РГ.БОПП
;   РНГ - КАКОЙ ЕСТЬ!
;
CJP А=PSMOD5,МАР=РЕ
PSMOD5:CONT А=Н5,%TN%
CJS А=INITST,МАР=РЕ
;ЧИТАЕМ ИЗ 8-11 РГ.БОПП
CJS А=RD8/В,МАР=РЕ
;ПИШЕМ В 7-Й МОДИФИКТОР
CONT ALUS=ZА,RА=WR6,ALU,CSM,WЕМ,MNSA=МР,MODNM=М7
;ЧИТАЕМ, ПИШЕМ В БОПП
CJS А=OUTC/F,МАР=РЕ,CSM,MNSA=МР,MODNM=М7,ALUS=DZ,ALUD=В,RВ=WR6
SТР5:CJP А=SТР5,МАР=РЕ
;
;
МОД6:ENTRY
;===== ПИШЕМ ИЗ БОПП - В RR(!) (НОМЕР > 16); АДРЕС МОДИФИКАТОРА - В МП; ЧИТАЕМ
;   ЧИТАЕМ 8-11 РГ.БОПП; ПИШЕМ РЕЗУЛЬТАТ - В 12-15 РГ.БОПП
;   РНГ - КАКОЙ ЕСТЬ!
;
CJP А=PSMOD6,МАР=РЕ
PSMOD6:CONT А=Н6,%TN%
CJS А=INITST,МАР=РЕ
;ЧИТАЕМ ИЗ 8-11 РГ.БОПП
CJS А=RD8/В,МАР=РЕ
;ПИШЕМ В РР
CONT ALUS=ZА,RА=WR6,ALU,CSM,WЕМ,MNSA=МР,MODNM=RR
;ЧИТАЕМ, ПИШЕМ В БОПП
CJS А=OUTC/F,МАР=РЕ,CSM,MNSA=МР,MODNM=RR,ALUS=DZ,ALUD=В,RВ=WR6
SТР6:CJP А=SТР6,МАР=РЕ
;
;
МОД7:ENTRY
;===== ПИШЕМ ИЗ БОПП - В 1-Й МОДИФИКАТОР; АДРЕС МОД. - В АИСП.(!); ЧИТАЕМ
;   ЧИТАЕМ 8-11 РГ.БОПП; ПИШЕМ РЕЗУЛЬТАТ - В 12-15 РГ.БОПП
;   РНГ - КАКОЙ ЕСТЬ! ТЕСТ БЕЗ ПЗУ
;
CJP А=PSMOD7,МАР=РЕ
PSMOD7:CONT А=Н7,%TN%
CJS А=INITST,МАР=РЕ
;ЧИТАЕМ ИЗ 8-11 РГ.БОПП; 1 - В АИСП.
CJS А=RD8/В,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=А
CONT ALUS=ZА,RА=А,CI,ALU,YDST=ADRREG
;ПИШЕМ В 1-Й МОДИФИКТОР
CONT ALUS=ZА,RА=WR6,ALU,CSM,WЕМ,MNSA=U
;ЧИТАЕМ, ПИШЕМ В БОПП
CJS А=OUTC/F,МАР=РЕ,CSM,MNSA=U,ALUS=DZ,ALUD=В,RВ=WR6
SТР7:CJP А=SТР7,МАР=РЕ
;
;
МОД8:ENTRY
;===== ПИШЕМ ИЗ БОПП - В 17-Й МОДИФ.С ПР.MOD(!); АДРЕС МОД. - В АИСП.;ЧИТАЕМ
;   ЧИТАЕМ 8-11 РГ.БОПП; ПИШЕМ РЕЗУЛЬТАТ - В 12-15 РГ.БОПП
;   РНГ - КАКОЙ ЕСТЬ! ТЕСТ БЕЗ ПЗУ
;
CJP А=PSMOD8,МАР=РЕ
PSMOD8:CONT А=Н8,%TN%
CJS А=INITST,МАР=РЕ
;ЧИТАЕМ ИЗ 8-11 РГ.БОПП; 17 - В АИСП.
CJS А=RD8/В,МАР=РЕ,ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=А
CONT ALUS=ZВ,RВ=А,CI,ALUD=В
CONT ALUS=DZ,Н,CI,ALUD=ВА,RА=А,RВ=А,ALU,DSRC=SHIFT,MPS,PSHF=SН0-4,SHF=LOG
CONT ALUS=ZА,RА=А,ALU,YDST=ADRREG
;ПИШЕМ В 17-Й МОДИФИКТОР
CONT ALUS=ZА,RА=WR6,ALU,CSM,WЕМ,MNSA=U,MOD
;ЧИТАЕМ, ПИШЕМ В БОПП
CJS А=OUTC/F,МАР=РЕ,CSM,MNSA=U,MOD,ALUS=DZ,ALUD=В,RВ=WR6
SТР8:CJP А=SТР8,МАР=РЕ
;
;
МОД9:ENTRY
;===== ПИШЕМ ИЗ БОПП - В 7-Й МОДИФИКАТОР; АДРЕС МОД.= IRA, В RG1(!); ЧИТАЕМ
;   ЧИТАЕМ 8-11 РГ.БОПП; ПИШЕМ РЕЗУЛЬТАТ - В 12-15 РГ.БОПП
;   РНГ - КАКОЙ ЕСТЬ! Т.К. ЕСТЬ БОИ,МОЖЕМ ИСПОЛЬЗОВАТЬ ПЗУ!
;
CJP А=PSMOD9,МАР=РЕ
PSMOD9:CONT А=Н9,%TN%
CJS А=INITST,МАР=РЕ
;ЧИТАЕМ ИЗ 8-11 РГ.БОПП
CJS А=RD8/В,МАР=РЕ
;КОМАНДНОЕ СЛОВО ИЗ ПЗУ - В RG1; IRA У ЛК = 8; ТКК = ЛК
CONT А=В64,DSRC=PROM,ЕСА,WRA,ARA=RG1,FFCNT=CLRTKK
;ПИШЕМ В 8-Й МОДИФИКТОР
CONT ALUS=ZА,RА=WR6,ALU,CSM,WЕМ,MNSA=IRA
;ЧИТАЕМ, ПИШЕМ В БОПП
CJS А=OUTC/F,МАР=РЕ,CSM,MNSA=IRA,ALUS=DZ,ALUD=В,RВ=WR6
SТР9:CJP А=SТР9,МАР=РЕ
;
;
МОДА:ENTRY
;===== ПИШЕМ 0/F(!) - В 0-Й МОДИФИКАТОР; АДРЕС МОДИФИКАТОРА - В МП; ЧИТАЕМ
;   РГ.А - ЧТО ПИШЕМ; У - ЧИТАЕМ; Q - РЕЗ-Т СРАВНЕНИЯ
;   РНГ - КАКОЙ ЕСТЬ! ТЕСТ БЕЗ ПЗУ!
;
CJP А=PSMODA,МАР=РЕ
PSMODA:CONT А=НА,%TN%
CJS А=INITST,МАР=РЕ
;0 - В РГ.А
CONT ALUS=DZ,FUNC=AND,ALUD=В,RВ=А
;ЦИКЛ: ПИШЕМ В 0-Й МОДИФИКТОР
CMODA:CONT ALUS=ZА,RА=А,ALU,CSM,WЕМ,MNSA=МР,MODNM=М0
;ЧИТАЕМ, СРАВНИВАЕМ
CONT CSM,MNSA=МР,MODNM=М0,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;ИНВЕРТИРУЕМ РГ.А
CJP А=CMODA,МАР=РЕ,ALUS=ZВ,RВ=А,FUNC=EXNOR,ALUD=В
;
;
МОДВ:ENTRY
;===== ПИШЕМ 0/F - В 5-Й(!) МОДИФИКАТОР; АДРЕС МОДИФИКАТОРА - В МП; ЧИТАЕМ
;   РГ.А - ЧТО ПИШЕМ; У - ЧТО ЧИТАЕМ; Q - РЕЗ-Т СРАВНЕНИЯ;
;   РНГ - КАКОЙ ЕСТЬ! ТЕСТ БЕЗ ПЗУ!
;
CJP А=PSMODB,МАР=РЕ
PSMODB:CONT А=НВ,%TN%
CJS А=INITST,МАР=РЕ
;0 - В РГ.А
CONT ALUS=DZ,FUNC=AND,ALUD=В,RВ=А
;ЦИКЛ: ПИШЕМ В 5-Й МОДИФИКТОР
CMODB:CONT ALUS=ZА,RА=А,ALU,CSM,WЕМ,MNSA=МР,MODNM=М5
;ЧИТАЕМ, СРАВНИВАЕМ
CONT CSM,MNSA=МР,MODNM=М5,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
CJP А=CMODB,МАР=РЕ,ALUS=ZВ,RВ=А,FUNC=EXNOR,ALUD=В
;
;
МОДС:ENTRY
;===== ПИШЕМ 0/F - В RRR(!) (НОМЕР > 16); АДРЕС МОДИФИКАТОРА - В МП; ЧИТАЕМ
;   А - ЧТО ПИШЕМ; У - ЧТО ЧИТАЕМ; Q - РЕЗ-Т СРАВНЕНИЯ;
;   РНГ - КАКОЙ ЕСТЬ! ТЕСТ - БЕЗ ПЗУ!
;
CJP А=PSMODC,МАР=РЕ
PSMODC:CONT А=НС,%TN%
CJS А=INITST,МАР=РЕ
;0 - В РГ.А
CONT ALUS=DZ,FUNC=AND,ALUD=В,RВ=А
;ЦИКЛ: ПИШЕМ В РРР (СПЕЦ.РЕГИСТР!)
CMODC:CONT ALUS=ZА,RА=А,ALU,CSM,WЕМ,MNSA=МР,MODNM=RRR
;ЧИТАЕМ, СРАВНИВАЕМ
CONT CSM,MNSA=МР,MODNM=RRR,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
CJP А=CMODC,МАР=РЕ,ALUS=ZВ,RВ=А,FUNC=EXNOR,ALUD=В
;
;
MOДD:ENTRY
;===== ПИШЕМ 0/F - В 1-Й МОДИФИКАТОР; АДРЕС МОДИФИКАТОРА - В АИСП.(!); ЧИТАЕМ
;   РГ.А - ЧТО ПИШЕМ; У - ЧТО ЧИТАЕМ; Q - РЕЗ-Т СРАВНЕНИЯ;
;   РНГ - КАКОЙ ЕСТЬ! ТЕСТ БЕЗ ПЗУ!
;
CJP А=PSMODD,МАР=РЕ
PSMODD:CONT А=HD,%TN%
CJS А=INITST,МАР=РЕ
;0 - В РГ.А
CONT ALUS=DZ,FUNC=AND,ALUD=В,RВ=А
;1 - В АИСП. (НОМЕР РЕГИСТРА)
CONT ALUS=ZА,RА=А,CI,ALU,YDST=ADRREG
;ЦИКЛ: ПИШЕМ В 1-Й МОДИФИКТОР (ПО АИСП.)
CMODD:CONT ALUS=ZА,RА=А,ALU,CSM,WЕМ,MNSA=U
;ЧИТАЕМ, СРАВНИВАЕМ
CONT CSM,MNSA=U,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
CJP А=CMODD,МАР=РЕ,ALUS=ZВ,RВ=А,FUNC=EXNOR,ALUD=В
;
;
МОДЕ:ENTRY
;===== ПИШЕМ 0/F - В 18-Й(!) МОДИФ.С ПРИЗНАКОМ MOD; АДРЕС МОДИФ.- В АИСП.;ЧИТАЕМ
;   РГ.А - ЧТО ПИШЕМ; У - ЧТО ЧИТАЕМ; Q - РЕЗ-Т СРАВНЕНИЯ; DADR - N РЕГИСТРА
;   РНГ - КАКОЙ ЕСТЬ! ТЕСТ БЕЗ ПЗУ!
;
CJP А=PSMODE,МАР=РЕ
PSMODE:CONT А=НЕ,%TN%
CJS А=INITST,МАР=РЕ
;0 - В РГ.А
CONT ALUS=DZ,FUNC=AND,ALUD=В,RВ=А
;18 - В АИСП. (НОМЕР РЕГИСТРА)
CONT ALUS=ZА,RА=А,CI,ALUD=В,RВ=DADR
CONT ALUS=DZ,Н,CI,ALUD=ВА,RА=DADR,RВ=DADR,ALU,DSRC=SHIFT,MPS,PSHF=SН0-4,SHF=LOG
CONT ALUS=ZВ,RВ=DADR,CI,ALUD=В,ALU,YDST=ADRREG
;ЦИКЛ: ПИШЕМ В МОДИФИКТОР ПО U
CMODE:CONT ALUS=ZА,RА=А,ALU,CSM,WЕМ,MNSA=U,MOD
;ЧИТАЕМ, СРАВНИВАЕМ
CONT CSM,MNSA=U,MOD,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
CJP А=CMODE,МАР=РЕ,ALUS=ZВ,RВ=А,FUNC=EXNOR,ALUD=В
;
;
MOДF:ENTRY
;===== ПИШЕМ 0/F - В 4-Й МОДИФИКАТОР; АДРЕС МОДИФ.- ПО IRA, В RG1(!); ЧИТАЕМ
;   РГ.А - ЧТО ПИШЕМ; У - ЧТО ЧИТАЕМ; Q - РЕЗ-Т СРАВНЕНИЯ;
;   РНГ - КАКОЙ ЕСТЬ! Т.К. ЕСТЬ БОИ, МОЖЕМ ИСПОЛЬЗОВАТЬ ПЗУ.
;
CJP А=PSMODF,МАР=РЕ
PSMODF:CONT А=HF,%TN%
CJS А=INITST,МАР=РЕ
;0 - В РГ.А
CONT ALUS=DZ,FUNC=AND,ALUD=В,RВ=А
;КОМАНДУ С НОМЕРОМ ИР = 4 В ПК - В РЕГИСТР КОМАНД, ТКК = ПК
CONT А=В31,DSRC=PROM,ЕСА,WRA,ARA=RG1,FFCNT=SЕТТКК
;ЦИКЛ: ПИШЕМ В 4-Й МОДИФИКТОР
CMODF:CONT ALUS=ZА,RА=А,ALU,CSM,WЕМ,MNSA=IRA
;ЧИТАЕМ, СРАВНИВАЕМ
CONT CSM,MNSA=IRA,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
CJP А=CMODF,МАР=РЕ,ALUS=ZВ,RВ=А,FUNC=EXNOR,ALUD=В
;
;
МОД10:ENTRY
;===== ПИШЕМ ПЕРЕМЕННУЮ (!) - В 0-Й МОДИФИКАТОР; АДРЕС МОДИФ.- В МП; ЧИТАЕМ
;   РГ.А - ЧТО ПИШЕМ; У - ЧИТАЕМ; Q - РЕЗ-Т СРАВНЕНИЯ
;   РНГ - КАКОЙ ЕСТЬ! ТЕСТ БЕЗ ПЗУ!
;
CJP А=PSMD10,МАР=РЕ
PSMD10:CONT А=Н10,%TN%
CJS А=INITST,МАР=РЕ
;0 - В РГ.А
CONT ALUS=DZ,FUNC=AND,ALUD=В,RВ=А
;ЦИКЛ: ПИШЕМ В 0-Й МОДИФИКТОР
CMOD10:CONT ALUS=ZА,RА=А,ALU,CSM,WЕМ,MNSA=МР,MODNM=М0
;ЧИТАЕМ, СРАВНИВАЕМ
CONT CSM,MNSA=МР,MODNM=М0,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;УВЕЛИЧИВАЕМ РГ.А НА "1"
CJP А=CMOD10,МАР=РЕ,ALUS=ZВ,RВ=А,FUNC=ADD,CI,ALUD=В
;
;
МОД11:ENTRY
;===== ПИШЕМ ПЕРЕМЕННУЮ - В 3-Й(!) МОДИФИКАТОР; АДРЕС МОДИФ. - В МП; ЧИТАЕМ
;   РГ.А - ЧТО ПИШЕМ; У - ЧТО ЧИТАЕМ; Q - РЕЗ-Т СРАВНЕНИЯ;
;   РНГ - КАКОЙ ЕСТЬ! ТЕСТ БЕЗ ПЗУ!
;
CJP А=PSMD11,МАР=РЕ
PSMD11:CONT А=Н11,%TN%
CJS А=INITST,МАР=РЕ
;0 - В РГ.А
CONT ALUS=DZ,FUNC=AND,ALUD=В,RВ=А
;ЦИКЛ: ПИШЕМ В 3-Й МОДИФИКТОР
CMOD11:CONT ALUS=ZА,RА=А,ALU,CSM,WЕМ,MNSA=МР,MODNM=М3
;ЧИТАЕМ, СРАВНИВАЕМ
CONT CSM,MNSA=МР,MODNM=М3,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
CJP А=CMOD11,МАР=РЕ,ALUS=ZВ,RВ=А,FUNC=ADD,CI,ALUD=В
;
;
МОД12:ENTRY
;===== ПИШЕМ ПЕРЕМЕНУЮ -  В SVFA(!) (НОМЕР > 16); АДРЕС МОД.- В МП; ЧИТАЕМ
;   А - ЧТО ПИШЕМ; У - ЧТО ЧИТАЕМ; Q - РЕЗ-Т СРАВНЕНИЯ;
;   РНГ - КАКОЙ ЕСТЬ! ТЕСТ - БЕЗ ПЗУ!
;
CJP А=PSMD12,МАР=РЕ
PSMD12:CONT А=Н12,%TN%
CJS А=INITST,МАР=РЕ
;0 - В РГ.А
CONT ALUS=DZ,FUNC=AND,ALUD=В,RВ=А
;ЦИКЛ: ПИШЕМ В SVFA (СПЕЦ.РЕГИСТР!)
CMOD12:CONT ALUS=ZА,RА=А,ALU,CSM,WЕМ,MNSA=МР,MODNM=SVFA
;ЧИТАЕМ, СРАВНИВАЕМ
CONT CSM,MNSA=МР,MODNM=SVFA,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
CJP А=CMOD12,МАР=РЕ,ALUS=ZВ,RВ=А,FUNC=ADD,CI,ALUD=В
;
;
МОД13:ENTRY
;===== ПИШЕМ ПЕРЕМЕННУЮ - В 1-Й МОДИФИКАТОР; АДРЕС МОДИФ.- В АИСП.(!); ЧИТАЕМ
;   РГ.А - ЧТО ПИШЕМ; У - ЧТО ЧИТАЕМ; Q - РЕЗ-Т СРАВНЕНИЯ;
;   РНГ - КАКОЙ ЕСТЬ! ТЕСТ БЕЗ ПЗУ!
;
CJP А=PSMD13,МАР=РЕ
PSMD13:CONT А=Н13,%TN%
CJS А=INITST,МАР=РЕ
;0 - В РГ.А
CONT ALUS=DZ,FUNC=AND,ALUD=В,RВ=А
;1 - В АИСП. (НОМЕР РЕГИСТРА)
CONT ALUS=ZА,RА=А,CI,ALU,YDST=ADRREG
;ЦИКЛ: ПИШЕМ В 1-Й МОДИФИКТОР
CMOD13:CONT ALUS=ZА,RА=А,ALU,CSM,WЕМ,MNSA=U
;ЧИТАЕМ, СРАВНИВАЕМ
CONT CSM,MNSA=U,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
CJP А=CMOD13,МАР=РЕ,ALUS=ZВ,RВ=А,FUNC=ADD,CI,ALUD=В
;
;
МОД14:ENTRY
;===== ПИШЕМ ПЕРЕМ.В 18-Й(!) МОД.С ПРИЗНАКОМ MOD; АДРЕС МОД.- В АИСП.;ЧИТАЕМ
;   РГ.А - ЧТО ПИШЕМ; У - ЧТО ЧИТАЕМ; Q - РЕЗ-Т СРАВНЕНИЯ; DADR - N РЕГИСТРА
;   РНГ - КАКОЙ ЕСТЬ! ТЕСТ БЕЗ ПЗУ!
;
CJP А=PSMD14,МАР=РЕ
PSMD14:CONT А=Н14,%TN%
CJS А=INITST,МАР=РЕ
;0 - В РГ.А
CONT ALUS=DZ,FUNC=AND,ALUD=В,RВ=А
;18 - В АИСП. (НОМЕР РЕГИСТРА)
CONT ALUS=ZА,RА=А,CI,ALUD=В,RВ=DADR
CONT ALUS=DZ,Н,CI,ALUD=ВА,RА=DADR,RВ=DADR,ALU,DSRC=SHIFT,MPS,PSHF=SН0-4,SHF=LOG
CONT ALUS=ZВ,RВ=DADR,CI,ALUD=В,ALU,YDST=ADRREG
;ЦИКЛ: ПИШЕМ В МОДИФИКТОР ПО U
CMOD14:CONT ALUS=ZА,RА=А,ALU,CSM,WЕМ,MNSA=U,MOD
;ЧИТАЕМ, СРАВНИВАЕМ
CONT CSM,MNSA=U,MOD,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
CJP А=CMOD14,МАР=РЕ,ALUS=ZВ,RВ=А,FUNC=ADD,CI,ALUD=В
;
;
МОД15:ENTRY
;===== ПИШЕМ ПЕРЕМЕННУЮ - ВО 2-Й МОД.; АДРЕС МОДИФ.- В RG1(!); ЧИТАЕМ
;   РГ.А - ЧТО ПИШЕМ; У - ЧТО ЧИТАЕМ; Q - РЕЗ-Т СРАВНЕНИЯ;
;   РНГ - КАКОЙ ЕСТЬ! Т.К. ЕСТЬ БОИ, МОЖЕМ ИСПОЛЬЗОВАТЬ ПЗУ.
;
CJP А=PSMD15,МАР=РЕ
PSMD15:CONT А=Н15,%TN%
CJS А=INITST,МАР=РЕ
;0 - В РГ.А
CONT ALUS=DZ,FUNC=AND,ALUD=В,RВ=А
;КОМАНДУ С НОМЕРОМ ИР = 2 В ПК - В РЕГИСТР КОМАНД, ТКК = ПК
CONT А=В30,DSRC=PROM,ЕСА,WRA,ARA=RG1,FFCNT=SЕТТКК
;ЦИКЛ: ПИШЕМ ВО 2-Й МОДИФИКТОР
CMOD15:CONT ALUS=ZА,RА=А,ALU,CSM,WЕМ,MNSA=IRA
;ЧИТАЕМ, СРАВНИВАЕМ
CONT CSM,MNSA=IRA,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
CJP А=CMOD15,МАР=РЕ,ALUS=ZВ,RВ=А,FUNC=ADD,CI,ALUD=В
;
;
МОД16:ENTRY
;===== ПРВЕРЯЕМ МОДИФИКАТОРЫ КАК ПАМЯТЬ: ПИШЕМ, ЧИТАЕМ ПО ВСЕМ АДРЕСАМ ОЗУ:
;===== ПИШЕМ ПЕРЕМЕННУЮ ПО ВСЕМ АДРЕСАМ ПАМЯТИ(!); АДРЕС МОДИФИАТОРА - В МП
;   РГ.А - ЧТО ПИШЕМ; У - ЧИТАЕМ; Q - РЕЗ-Т СРАВНЕНИЯ
;   DADR - НОМЕР ГРУППЫ; HALF = "1" В 6 РАЗРЯДЕ. ТЕСТ БЕЗ ПЗУ!
;
CJP А=PSMD16,МАР=РЕ
PSMD16:CONT А=Н16,%TN%
CJS А=INITST,МАР=РЕ
;0 - В РГ.А
CONT ALUS=DZ,FUNC=AND,ALUD=В,RВ=А
;"1" В 6 РАЗРЯДЕ БЕЗ ПЗУ - В РГ.HALF (ДЛЯ УВЕЛИЧЕНИЯ НОМЕРА ГРУППЫ)
CONT ALUS=ZА,RА=А,CI,ALUD=В,RВ=HALF
CONT ALUS=DZ,Н,ALUD=ВА,RА=HALF,RВ=HALF,ALU,DSRC=SHIFT,MPS,PSHF=SН0-5,SHF=LOG
;0 - В РГ.DADR (НОМЕР ГРУППЫ); ЦИКЛ ПО ГРУППАМ:
PUSH А=15,МАР=РЕ,ALUS=DZ,FUNC=AND,ALUD=В,RВ=DADR
;НОМЕР ГРУППЫ - В РНГ
CONT ALUS=ZА,RА=DADR,ALU,YDST=MODGN
;ПИШЕМ ПЕРЕМЕННУЮ В РЕГИСТРЫ; АДРЕС - В МП; РЕГИСТРЫ НЕ ПО ПОРЯДКУ (ЧЕРЕЗ 1)
CONT ALUS=ZВ,RВ=А,CI,ALUD=В,ALU,CSM,WЕМ,MNSA=МР,MODNM=MREZ
CONT ALUS=ZВ,RВ=А,CI,ALUD=В,ALU,CSM,WЕМ,MNSA=МР,MODNM=SVFA
CONT ALUS=ZВ,RВ=А,CI,ALUD=В,ALU,CSM,WЕМ,MNSA=МР,MODNM=CTL
CONT ALUS=ZВ,RВ=А,CI,ALUD=В,ALU,CSM,WЕМ,MNSA=МР,MODNM=РСС
CONT ALUS=ZВ,RВ=А,CI,ALUD=В,ALU,CSM,WЕМ,MNSA=МР,MODNM=YCL
CONT ALUS=ZВ,RВ=А,CI,ALUD=В,ALU,CSM,WЕМ,MNSA=МР,MODNM=ACL
CONT ALUS=ZВ,RВ=А,CI,ALUD=В,ALU,CSM,WЕМ,MNSA=МР,MODNM=SPRADR
CONT ALUS=ZВ,RВ=А,CI,ALUD=В,ALU,CSM,WЕМ,MNSA=МР,MODNM=RR
CONT ALUS=ZВ,RВ=А,CI,ALUD=В,ALU,CSM,WЕМ,MNSA=МР,MODNM=SР
CONT ALUS=ZВ,RВ=А,CI,ALUD=В,ALU,CSM,WЕМ,MNSA=МР,MODNM=М13
CONT ALUS=ZВ,RВ=А,CI,ALUD=В,ALU,CSM,WЕМ,MNSA=МР,MODNM=М11
CONT ALUS=ZВ,RВ=А,CI,ALUD=В,ALU,CSM,WЕМ,MNSA=МР,MODNM=М9
CONT ALUS=ZВ,RВ=А,CI,ALUD=В,ALU,CSM,WЕМ,MNSA=МР,MODNM=М7
CONT ALUS=ZВ,RВ=А,CI,ALUD=В,ALU,CSM,WЕМ,MNSA=МР,MODNM=М5
CONT ALUS=ZВ,RВ=А,CI,ALUD=В,ALU,CSM,WЕМ,MNSA=МР,MODNM=М3
CONT ALUS=ZВ,RВ=А,CI,ALUD=В,ALU,CSM,WЕМ,MNSA=МР,MODNM=М1
CONT ALUS=ZВ,RВ=А,CI,ALUD=В,ALU,CSM,WЕМ,MNSA=МР,MODNM=PROCNC
CONT ALUS=ZВ,RВ=А,CI,ALUD=В,ALU,CSM,WЕМ,MNSA=МР,MODNM=CTR
CONT ALUS=ZВ,RВ=А,CI,ALUD=В,ALU,CSM,WЕМ,MNSA=МР,MODNM=РССС
CONT ALUS=ZВ,RВ=А,CI,ALUD=В,ALU,CSM,WЕМ,MNSA=МР,MODNM=YCR
CONT ALUS=ZВ,RВ=А,CI,ALUD=В,ALU,CSM,WЕМ,MNSA=МР,MODNM=ACR
CONT ALUS=ZВ,RВ=А,CI,ALUD=В,ALU,CSM,WЕМ,MNSA=МР,MODNM=СТТ
CONT ALUS=ZВ,RВ=А,CI,ALUD=В,ALU,CSM,WЕМ,MNSA=МР,MODNM=RRR
CONT ALUS=ZВ,RВ=А,CI,ALUD=В,ALU,CSM,WЕМ,MNSA=МР,MODNM=С
CONT ALUS=ZВ,RВ=А,CI,ALUD=В,ALU,CSM,WЕМ,MNSA=МР,MODNM=М14
CONT ALUS=ZВ,RВ=А,CI,ALUD=В,ALU,CSM,WЕМ,MNSA=МР,MODNM=М12
CONT ALUS=ZВ,RВ=А,CI,ALUD=В,ALU,CSM,WЕМ,MNSA=МР,MODNM=М10
CONT ALUS=ZВ,RВ=А,CI,ALUD=В,ALU,CSM,WЕМ,MNSA=МР,MODNM=М8
CONT ALUS=ZВ,RВ=А,CI,ALUD=В,ALU,CSM,WЕМ,MNSA=МР,MODNM=М6
CONT ALUS=ZВ,RВ=А,CI,ALUD=В,ALU,CSM,WЕМ,MNSA=МР,MODNM=М4
CONT ALUS=ZВ,RВ=А,CI,ALUD=В,ALU,CSM,WЕМ,MNSA=МР,MODNM=М2
CONT ALUS=ZВ,RВ=А,CI,ALUD=В,ALU,CSM,WЕМ,MNSA=МР,MODNM=М0
;УВЕЛИЧИВАЕМ НОМЕР ГРУППЫ
RFCT ALUS=АВ,RА=HALF,RВ=DADR,FUNC=ADD,ALUD=В
;ЧТЕНИЕ: 0 - В РГ.DADR (НОМЕР ГРУППЫ), В РГ.А; ЦИКЛ ПО ГРУППАМ:
CMOD16:CONT ALUS=DZ,FUNC=AND,ALUD=В,RВ=А
PUSH А=15,МАР=РЕ,ALUS=DZ,FUNC=AND,ALUD=В,RВ=DADR
;НОМЕР ГРУППЫ - В РНГ
CONT ALUS=ZА,RА=DADR,ALU,YDST=MODGN
;ЧИТАЕМ ПЕРЕМЕННУЮ ИЗ ОЗУ МОД.,СРАВНИВАЕМ; ПОРЯДОК РЕГИСТРОВ - ТОТ ЖЕ
;ОШИБКА - 00
CONT ALUS=ZВ,RВ=А,CI,ALUD=В
CONT CSM,MNSA=МР,MODNM=MREZ,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ,%CLRTYP%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;01
CONT ALUS=ZВ,RВ=А,CI,ALUD=В
CONT CSM,MNSA=МР,MODNM=SVFA,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;02
CONT ALUS=ZВ,RВ=А,CI,ALUD=В
CONT CSM,MNSA=МР,MODNM=CTL,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;03
CONT ALUS=ZВ,RВ=А,CI,ALUD=В
CONT CSM,MNSA=МР,MODNM=РСС,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;04
CONT ALUS=ZВ,RВ=А,CI,ALUD=В
CONT CSM,MNSA=МР,MODNM=YCL,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;05
CONT ALUS=ZВ,RВ=А,CI,ALUD=В
CONT CSM,MNSA=МР,MODNM=ACL,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;06
CONT ALUS=ZВ,RВ=А,CI,ALUD=В
CONT CSM,MNSA=МР,MODNM=SPRADR,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;07
CONT ALUS=ZВ,RВ=А,CI,ALUD=В
CONT CSM,MNSA=МР,MODNM=RR,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;08
CONT ALUS=ZВ,RВ=А,CI,ALUD=В
CONT CSM,MNSA=МР,MODNM=SР,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;09
CONT ALUS=ZВ,RВ=А,CI,ALUD=В
CONT CSM,MNSA=МР,MODNM=М13,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;0А
CONT ALUS=ZВ,RВ=А,CI,ALUD=В
CONT CSM,MNSA=МР,MODNM=М11,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;0В
CONT ALUS=ZВ,RВ=А,CI,ALUD=В
CONT CSM,MNSA=МР,MODNM=М9,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;0С
CONT ALUS=ZВ,RВ=А,CI,ALUD=В
CONT CSM,MNSA=МР,MODNM=М7,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;0D
CONT ALUS=ZВ,RВ=А,CI,ALUD=В
CONT CSM,MNSA=МР,MODNM=М5,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;0Е
CONT ALUS=ZВ,RВ=А,CI,ALUD=В
CONT CSM,MNSA=МР,MODNM=М3,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;0F
CONT ALUS=ZВ,RВ=А,CI,ALUD=В
CONT CSM,MNSA=МР,MODNM=М1,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;10
CONT ALUS=ZВ,RВ=А,CI,ALUD=В
CONT CSM,MNSA=МР,MODNM=PROCNC,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;11
CONT ALUS=ZВ,RВ=А,CI,ALUD=В
CONT CSM,MNSA=МР,MODNM=CTR,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;12
CONT ALUS=ZВ,RВ=А,CI,ALUD=В
CONT CSM,MNSA=МР,MODNM=РССС,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;13
CONT ALUS=ZВ,RВ=А,CI,ALUD=В
CONT CSM,MNSA=МР,MODNM=YCR,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;14
CONT ALUS=ZВ,RВ=А,CI,ALUD=В
CONT CSM,MNSA=МР,MODNM=ACR,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;15
CONT ALUS=ZВ,RВ=А,CI,ALUD=В
CONT CSM,MNSA=МР,MODNM=СТТ,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;16
CONT ALUS=ZВ,RВ=А,CI,ALUD=В
CONT CSM,MNSA=МР,MODNM=RRR,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;17
CONT ALUS=ZВ,RВ=А,CI,ALUD=В
CONT CSM,MNSA=МР,MODNM=С,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;18
CONT ALUS=ZВ,RВ=А,CI,ALUD=В
CONT CSM,MNSA=МР,MODNM=М14,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;19
CONT ALUS=ZВ,RВ=А,CI,ALUD=В
CONT CSM,MNSA=МР,MODNM=М12,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;1А
CONT ALUS=ZВ,RВ=А,CI,ALUD=В
CONT CSM,MNSA=МР,MODNM=М10,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;1В
CONT ALUS=ZВ,RВ=А,CI,ALUD=В
CONT CSM,MNSA=МР,MODNM=М8,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;1С
CONT ALUS=ZВ,RВ=А,CI,ALUD=В
CONT CSM,MNSA=МР,MODNM=М6,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;1D
CONT ALUS=ZВ,RВ=А,CI,ALUD=В
CONT CSM,MNSA=МР,MODNM=М4,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;1Е
CONT ALUS=ZВ,RВ=А,CI,ALUD=В
CONT CSM,MNSA=МР,MODNM=М2,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;1F
CONT ALUS=ZВ,RВ=А,CI,ALUD=В
CONT CSM,MNSA=МР,MODNM=М0,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;УВЕЛИЧИВАЕМ НОМЕР ГРУППЫ
RFCT ALUS=АВ,RА=HALF,RВ=DADR,FUNC=ADD,ALUD=В
CJP А=CMOD16,МАР=РЕ
;
;
МОД17:ENTRY
;===== ПИШЕМ 00/FF(!) ПО ВСЕМ АДРЕСАМ ПАМЯТИ; АДРЕС МОДИФИАТОРА - В АИСП.(!)
;   РГ.А - ЧТО ПИШЕМ; У - ЧИТАЕМ; Q - РЕЗ-Т СРАВНЕНИЯ; РС - N РЕГИСТРА (АИСП)
;   DADR - НОМЕР ГРУППЫ; HALF = "1" В 6 РАЗРЯДЕ. ТЕСТ БЕЗ ПЗУ!
;   0-Й МОДИФИКАТОР НЕ ПРОВЕРЯЕМ.
;
CJP А=PSMD17,МАР=РЕ
PSMD17:CONT А=Н17,%TN%
CJS А=INITST,МАР=РЕ
;0 - В РГ.А
CONT ALUS=DZ,FUNC=AND,ALUD=В,RВ=А
;"1" В 6 РАЗРЯДЕ - В РГ.HALF (ДЛЯ УВЕЛИЧЕНИЯ НОМЕРА ГРУППЫ И СРАВНЕНИЯ N РГ.)
CONT ALUS=ZА,RА=А,CI,ALUD=В,RВ=HALF
CONT ALUS=DZ,Н,ALUD=ВА,RА=HALF,RВ=HALF,ALU,DSRC=SHIFT,MPS,PSHF=SН0-5,SHF=LOG
;0 - В РГ.DADR (НОМЕР ГРУППЫ); ЦИКЛ ПО ГРУППАМ:
PUSH А=15,МАР=РЕ,ALUS=DZ,FUNC=AND,ALUD=В,RВ=DADR,ALU,YDST=MODGN
;1 - В РС: НОМЕР РЕГИСТРА В ГРУППЕ
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=РС
CONT ALUS=ZВ,RВ=РС,CI,ALUD=В,ALU,YDST=ADRREG
;ПИШЕМ CONST В РЕГИСТРЫ; АДРЕС - ИЗ АИСП.
LС17:CONT ALUS=ZВ,RВ=А,ALU,CSM,WЕМ,MNSA=U,MOD
;УВЕЛИЧИВАЕМ N РЕГ., СРАВНИВАЕМ С 32 ("1" В 6 РАЗРЯДЕ)
CONT ALUS=ZВ,RВ=РС,CI,ALUD=В,ALU,YDST=ADRREG
CONT ALUS=АВ,RА=HALF,RВ=РС,FUNC=EXOR,CEN
CONT SТОРС=/NZ
CJP А=LС17,МАР=РЕ,COND=СТ,SТОРС=/NZ
;УВЕЛИЧИВАЕМ НОМЕР ГРУППЫ
RFCT ALUS=АВ,RА=HALF,RВ=DADR,FUNC=ADD,ALUD=В,ALU,YDST=MODGN
;
;ЧТЕНИЕ
МС17:CONT %CLRTYP%
;0 - В РГ.DADR (НОМЕР ГРУППЫ); ЦИКЛ ПО ГРУППАМ:
PUSH А=15,МАР=РЕ,ALUS=DZ,FUNC=AND,ALUD=В,RВ=DADR,ALU,YDST=MODGN
;АИСП.
CONT ALUS=DZ,FUNC=AND,ALUD=В,RВ=РС
CONT ALUS=ZВ,RВ=РС,CI,ALUD=В,ALU,YDST=ADRREG
;ЧИТАЕМ ПЕРЕМЕННУЮ ИЗ ОЗУ МОД.,СРАВНИВАЕМ
NNC17:CONT CSM,MNSA=U,MOD,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;ПИШЕМ В ТОТ ЖЕ РЕГИСТР ИНВЕРТРОВАННУЮ CONST (0 ИЛИ F)
CONT ALUS=ZА,RА=А,FUNC=EXNOR,ALU,CSM,WЕМ,MNSA=U,MOD
;УВЕЛИЧИВАЕМ НОМЕР РЕГИСТРА
CONT ALUS=ZВ,RВ=РС,CI,ALUD=В,ALU,YDST=ADRREG
CONT ALUS=АВ,RА=РС,RВ=HALF,FUNC=EXOR,CEN
CONT SТОРС=/NZ
CJP А=NNC17,МАР=РЕ,COND=СТ,SТОРС=/NZ
;УВЕЛИЧИВАЕМ НОМЕР ГРУППЫ
RFCT ALUS=АВ,RА=HALF,RВ=DADR,FUNC=ADD,ALUD=В,ALU,YDST=MODGN
;ИНВЕРТИРУЕМ CONST В РГ.А, СНОВА ИДЕМ НА ПРОВЕРКУ
CJP А=МС17,МАР=РЕ,ALUS=ZВ,RВ=А,FUNC=EXNOR,ALUD=В
;
;
МОД18:ENTRY
;===== ПИШЕМ ДАННЫЕ=АДРЕСУ(!) ПО ВСЕМ АДРЕСАМ ПАМЯТИ; АДРЕС МОДИФ.- В АИСП.
;   РГ.А - ЧТО ПИШЕМ; У - ЧИТАЕМ; Q - РЕЗ-Т СРАВНЕНИЯ; ТЕСТ БЕЗ ПЗУ!
;
CJP А=PSMD18,МАР=РЕ
PSMD18:CONT А=Н18,%TN%
CJS А=INITST,МАР=РЕ
;0 - В РГ.А (ДАННЫЕ=АДРЕСУ), В РНГ
PUSH А=1023,МАР=РЕ,ALUS=DZ,FUNC=AND,ALUD=В,RВ=А,ALU,YDST=MODGN
;НОМЕР РЕГИСТРА - В АИСП.
CONT ALUS=ZА,RВ=А,ALU,YDST=ADRREG
;ПИШЕМ АДРЕС В РЕГИСТРЫ
CONT ALUS=ZВ,RВ=А,ALU,CSM,WЕМ,MNSA=U,MOD
;ЕСЛИ МЛ.5 РАЗРЯДОВ АДРЕСА РЕГИСТРА = 0, ПИШЕМ ПО MNSA=МР(0-Й РГ.!)
CONT ALUS=DZ,Н,ALUD=ВА,RА=А,RВ=WR1,ALU,DSRC=SHIFT,MPS,PSHF=SН0-59,SHF=LOG
>,CEN
CONT SТОРС=/NZ
CJP А=ECW18,МАР=РЕ,COND=СТ,SТОРС=/NZ
CONT ALUS=ZА,RА=А,ALU,CSM,WЕМ,MNSA=МР,MODNM=М0
;УВЕЛИЧИВАЕМ ПОЛНЫЙ АДРЕС, ПИШЕМ В РНГ
ECW18:RFCT ALUS=ZВ,RВ=А,CI,ALUD=В,ALU,YDST=MODGN
;ЧТЕНИЕ
МС18:CONT %CLRTYP%
;0 - В РГ.А (ПОЛНЫЙ АДРЕС РЕГИСТРА), ПИШЕМ В РНГ
PUSH А=1023,МАР=РЕ,ALUS=DZ,FUNC=AND,ALUD=В,RВ=А,ALU,YDST=MODGN
;НОМЕР РГ.- В АИСП.
CONT ALUS=ZА,RА=А,ALU,YDST=ADRREG
;ЧИТАЕМ ДАННЫЕ=АДРЕСУ ИЗ ОЗУ МОД.,СРАВНИВАЕМ
CONT CSM,MNSA=U,MOD,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;УВЕЛИЧИВАЕМ ПОЛНЫЙ АДРЕС, ПИШЕМ В РНГ
RFCT ALUS=ZВ,RВ=А,CI,ALUD=В,ALU,YDST=MODGN
CJP А=МС18,МАР=РЕ
;
;
МОД19:ENTRY
;===== ПИШЕМ ИНВЕРТ.АДРЕС РГ.(!) В МЛ.15 РГ.КАЖДОЙ ГРУППЫ;АДРЕС МОД.- В RG1(!)
;   РС = N РЕГИСТРА ПК В КОМ.СЛОВЕ; А = ИНВЕРТИРОВАННЫЙ РС - ЧТО ЗАПИСАЛИ;
;   У - ЧТО ЧИТАЕМ; DADR - НОМЕР ГРУППЫ; ТЕСТ С ПЗУ И БОИ!
;
CJP А=PSMD19,МАР=РЕ
PSMD19:CONT А=Н19,%TN%
CJS А=INITST,МАР=РЕ
;0 - В РГ.DADR (НОМЕР ГРУППЫ); ЦИКЛ ПО ГРУППАМ:
PUSH А=15,МАР=РЕ,ALUS=DZ,FUNC=AND,ALUD=В,RВ=DADR,ALU,YDST=MODGN,FFCNT=SЕТТКК
;IRA = 1 - В РС: НОМЕР РЕГИСТРА В ГРУППЕ
CONT А=В29,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РС,ALU,ЕСВ,WRB,BRA=RG1
;ПИШЕМ ИНВЕРТИР.КОМ.СЛОВО В РЕГИСТРЫ; АДРЕС - ИЗ РГ.КОМАНД
LС19:CONT ALUS=ZА,RА=РС,FUNC=EXNOR,ALU,CSM,WЕМ,MNSA=IRA
;УВЕЛИЧИВАЕМ N РЕГ., СРАВНИВАЕМ С IRA=17 ("1" В 33 РАЗРЯДЕ)
CONT А=В29,DSRC=PROM,ALUS=DА,RА=РС,Н,ALUD=В,RВ=РС,ALU,ЕСВ,WRB,BRA=RG1
CONT А=В33,DSRC=PROM,ALUS=DА,RА=РС,FUNC=EXOR,Н,CEN
CONT SТОРС=/NZ
CJP А=LС19,МАР=РЕ,COND=СТ,SТОРС=/NZ
;УВЕЛИЧИВАЕМ НОМЕР ГРУППЫ
RFCT А=В6,DSRC=PROM,ALUS=DА,RА=DADR,FUNC=ADD,ALUD=В,RВ=DADR,ALU,YDST=MODGN
;ЧТЕНИЕ
МС19:CONT %CLRTYP%
;0 - В РГ.DADR (НОМЕР ГРУППЫ); ЦИКЛ ПО ГРУППАМ:
PUSH А=15,МАР=РЕ,ALUS=DZ,FUNC=AND,ALUD=В,RВ=DADR,ALU,YDST=MODGN
;IRA = 1 РГ.
CONT А=В29,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РС,ALU,ЕСВ,WRB,BRA=RG1
;ВЫЧИСЛЯЕМ ИНВЕРТИРОВАННЫЙ НОМЕР РЕГИСТРА
NNC19:CONT ALUS=ZА,RА=РС,FUNC=EXNOR,Н,ALUD=В,RВ=А
;ЧИТАЕМ ПЕРЕМЕННУЮ ИЗ ОЗУ МОД.,СРАВНИВАЕМ
CONT CSM,MNSA=IRA,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;УВЕЛИЧИВАЕМ НОМЕР РЕГИСТРА
CONT А=В29,DSRC=PROM,ALUS=DА,RА=РС,FUNC=ADD,Н,ALUD=В,RВ=РС,ALU
>,ЕСВ,WRB,BRA=RG1
CONT А=В33,DSRC=PROM,ALUS=DА,RА=РС,FUNC=EXOR,Н,CEN
CONT SТОРС=/NZ
CJP А=NNC19,МАР=РЕ,COND=СТ,SТОРС=/NZ
;УВЕЛИЧИВАЕМ НОМЕР ГРУППЫ
RFCT А=В6,DSRC=PROM,ALUS=DА,RА=DADR,FUNC=ADD,ALUD=В,RВ=DADR,ALU,YDST=MODGN
CJP А=МС19,МАР=РЕ
;
;
МОД1А:ENTRY
;===== ПРОВЕРЯЕМ 0-Й МОДИФИКАТОР
;===== ПИШЕМ 0/F - В 0-Й МОДИФИКАТОР (АДР.- В МП); ЧИТАЕМ (АДР.- В АИСП.!!)
;   РГ.А - ЧТО ПИШЕМ; У - ЧИТАЕМ; Q - РЕЗ-Т СРАВНЕНИЯ
;   РНГ - КАКОЙ ЕСТЬ! ТЕСТ БЕЗ ПЗУ!
;
CJP А=PSMD1A,МАР=РЕ
PSMD1A:CONT А=Н1А,%TN%
CJS А=INITST,МАР=РЕ
;0 - В РГ.А, В АИСП.!
CONT ALUS=DZ,FUNC=AND,ALUD=В,RВ=А,ALU,YDST=ADRREG
;ЦИКЛ: ПИШЕМ В 0-Й МОДИФИКТОР
CMOD1A:CONT ALUS=ZА,RА=А,ALU,CSM,WЕМ,MNSA=МР,MODNM=М0
;ЧИТАЕМ, СРАВНИВАЕМ, АДРЕС МОДИФИКАТОРА - В АИСП.!
CONT CSM,MNSA=U,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;ИНВЕРТИРУЕМ РГ.А
CJP А=CMOD1A,МАР=РЕ,ALUS=ZВ,RВ=А,FUNC=EXNOR,ALUD=В
;
;
МОД1В:ENTRY
;===== ПИШЕМ АА/55 - В 0-Й МОДИФИКАТОР (АДР.- В МП); ЧИТАЕМ (АДР.- В RG1!!)
;   РГ.А - ЧТО ПИШЕМ; У - ЧИТАЕМ; Q - РЕЗ-Т СРАВНЕНИЯ
;
CJP А=PSMD1B,МАР=РЕ
PSMD1B:CONT А=Н1В,%TN%
CJS А=INITST,МАР=РЕ
;CONST - В РГ.А
CONT А=СААА,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А
;0 - В РЕГИСТР КОМАНД (RG1); ТКК - ЛЮБОЕ!
CONT ALUS=DZ,FUNC=AND,Н,ALU,ЕСВ,WRB,BRA=RG1
;ЦИКЛ: ПИШЕМ В 0-Й МОДИФИКТОР
CMOD1B:CONT ALUS=ZА,RА=А,ALU,CSM,WЕМ,MNSA=МР,MODNM=М0
;ЧИТАЕМ, СРАВНИВАЕМ, АДРЕС МОДИФИКАТОРА - В РГ.КОМАНД!
CONT CSM,MNSA=IRA,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;ИНВЕРТИРУЕМ РГ.А
CJP А=CMOD1B,МАР=РЕ,ALUS=ZВ,RВ=А,FUNC=EXNOR,ALUD=В
;
;
МОД1С:ENTRY
;===== ПРОВЕРЯЕМ ЗАПРЕТ ЗАПИСИ В 0-Й МОДИФИКАТОР ИЗ АИСП.
;   РГ.А - ЧТО ПИШЕМ; У - ЧИТАЕМ; Q - РЕЗ-Т СРАВНЕНИЯ
;   ОШИБКИ: 01 - НЕТ ЗАПИСИ В 0 МОД.ИЗ МП;
;   02 - ЕСТЬ ЗАПИСЬ В 0-Й МОДИФИКАТОР ПО АДРЕСУ ИЗ АИСП., ЧИТАЕМ ИЗ МП.
;   03 -    -   "   -   , ЧИТАЕМ ИЗ АИСП.
;
CJP А=PSMD1C,МАР=РЕ
PSMD1C:CONT А=Н1С,%TN%
CJS А=INITST,МАР=РЕ
;0 - В РГ.А, В АИСП.!
CONT ALUS=DZ,FUNC=AND,ALUD=В,RВ=А,ALU,YDST=ADRREG
;ЦИКЛ: ПИШЕМ В 0-Й МОДИФИКТОР
CMOD1C:CONT ALUS=ZА,RА=А,ALU,CSM,WЕМ,MNSA=МР,MODNM=М0
;ЧИТАЕМ, СРАВНИВАЕМ, АДРЕС МОДИФИКАТОРА - В АИСП.!
CONT CSM,MNSA=U,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ,%CLRTYP%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%ТУРЕ%
;ИНВЕРТИРУЕМ РГ.А, ПИШЕМ ПО АИСП.! НЕ Д.БЫТЬ ЗАПИСИ!
CONT ALUS=ZВ,RВ=А,FUNC=EXNOR,ALUD=В,ALU,CSM,WЕМ,MNSA=U
;ЧИТАЕМ, СРАВНИВАЕМ, АДРЕС МОДИФИКАТОРА - В МП.!
CONT CSM,MNSA=МР,MODNM=М0,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
;ОШИБКА, ЕСЛИ СОВПАДЕНИЕ!
CONT SТОРС=NZ,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=NZ,%TIK%
;ЧИТАЕМ ЕЩЕ РАЗ; АДРЕС МОДИФИКАТОРА - В АИСП.!
CONT CSM,MNSA=U,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
;ОШИБКА, ЕСЛИ СОВПАДЕНИЕ!
CONT SТОРС=NZ,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=NZ,%TIK%
CJP А=CMOD1C,МАР=РЕ
;
;
MOД1D:ENTRY
;===== ПРОВЕРЯЕМ ЗАПРЕТ ЗАПИСИ В 0-Й МОДИФИКАТОР ПО АДРЕСУ ИЗ РГ.КОМАНД(!)
;   РГ.А - ЧТО ПИШЕМ; У - ЧИТАЕМ; Q - РЕЗ-Т СРАВНЕНИЯ
;   ОШИБКИ: 01 - НЕТ ЗАПИСИ В 0 МОД.ИЗ МП;
;   02 - ЕСТЬ ЗАПИСЬ В 0-Й МОДИФИКАТОР ПО АДРЕСУ ИЗ АИСП., ЧИТАЕМ ИЗ МП.
;   03 -    -   "   -   , ЧИТАЕМ ИЗ АИСП.
;
CJP А=PSMD1D,МАР=РЕ
PSMD1D:CONT А=H1D,%TN%
CJS А=INITST,МАР=РЕ
;CONST - В РГ.А
CONT А=СААА,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А
;0 - В РЕГИСТР КОМАНД (RG1); ТКК - ЛЮБОЕ!
CONT ALUS=DZ,FUNC=AND,Н,ALU,ЕСВ,WRB,BRA=RG1
;ЦИКЛ: ПИШЕМ В 0-Й МОДИФИКТОР
CMOD1D:CONT ALUS=ZА,RА=А,ALU,CSM,WЕМ,MNSA=МР,MODNM=М0
;ЧИТАЕМ, СРАВНИВАЕМ, АДРЕС МОДИФИКАТОРА - В РГ.КОМАНД!
CONT CSM,MNSA=IRA,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ,%CLRTYP%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%ТУРЕ%
;ПИШЕМ ИНВЕРТИР.CONST В 0-Й МОДИФИКТОР ПО IRA! ЗАПИСИ НЕ Д.БЫТЬ!
CONT ALUS=ZВ,RВ=А,FUNC=EXNOR,Н,ALUD=В,ALU,CSM,WЕМ,MNSA=IRA
;ЧИТАЕМ, АДРЕС МОДИФИКАТОРА - В МП
CONT CSM,MNSA=МР,MODNM=М0,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
;ОШИБКА, ЕСЛИ СОВПАЛО!
CONT SТОРС=NZ,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=NZ,%TIK%
;ЧИТАЕМ, АДРЕС МОДИФИКАТОРА - В РГ.КОМАНД!
CONT CSM,MNSA=IRA,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
;ОШИБКА, ЕСЛИ СОВПАЛО!
CONT SТОРС=NZ,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=NZ,%TIK%
CJP А=CMOD1D,МАР=РЕ
;
;
МОД1Е:ENTRY
;===== ПРОВЕРЯЕМ ЗАПРЕТ ЧТЕНИЯ/ЗАПИСИ В МОДИФИКАТОР С N>16 ИЗ АИСП.БЕЗ ПР.MOD
;   РГ.А - ЧТО ПИШЕМ; У - ЧИТАЕМ; Q - РЕЗ-Т СРАВНЕНИЯ
;   ОШИБКИ:
;   01 - НЕТ ЗАПИСИ В 17 МОД.ИЗ МП ИЛИ НЕТ ЧТЕНИЯ ПО АИСП.С ПРИЗНАКОМ MOD;
;   02 - ЕСТЬ ЗАПИСЬ В 17 МОДИФ.ПО АДРЕСУ ИЗ АИСП.БЕЗ MOD, ЧИТАЕМ ИЗ МП;
;   03 - НЕТ ЗАПИСИ В 17 МОДИФ.ПО АДР.ИЗ АИСП.С MOD, ЧИТАЕМ ИЗ МП;
;   04 - ЕСТЬ ЧТЕНИЕ ИЗ 17 МОДИФ.ПО АДР.ИЗ АИСП.БЕЗ ПРИЗНАКА MOD;
;   05 - НЕТ ЧТЕНИЯ ИЗ 17 МОДИФ.ПО АДР.ИЗ АИСП.С ПРИЗНАКОМ MOD.
;
CJP А=PSMD1E,МАР=РЕ
PSMD1E:CONT А=Н1Е,%TN%
CJS А=INITST,МАР=РЕ
;1 - В РГ.А; 17 - В РГ.DADR, АИСП.
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=А
CONT ALUS=ZА,RА=А,CI,ALUD=В,RВ=А
CONT ALUS=DZ,Н,CI,ALUD=ВА,RА=А,RВ=DADR,ALU,DSRC=SHIFT,MPS,PSHF=SН0-4
>,SHF=LOG
CONT ALUS=ZА,RА=DADR,ALU,YDST=ADRREG
;
;ЦИКЛ: ПИШЕМ В 17-Й МОДИФИКТОР (RR)
CMOD1E:CONT ALUS=ZА,RА=А,ALU,CSM,WЕМ,MNSA=МР,MODNM=RR
;ЧИТАЕМ, СРАВНИВАЕМ, АДРЕС МОДИФИКАТОРА - В АИСП.С ПРИЗНАКОМ MOD!
CONT CSM,MNSA=U,MOD,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=/NZ,%CLRTYP%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%ТУРЕ%
;
;ИНВЕРТИРУЕМ РГ.А, ПИШЕМ ПО АИСП.БЕЗ ПРИЗНАКА MOD! НЕ Д.БЫТЬ ЗАПИСИ!
CONT ALUS=ZВ,RВ=А,FUNC=EXNOR,ALUD=В,ALU,CSM,WЕМ,MNSA=U
;ЧИТАЕМ, СРАВНИВАЕМ, АДРЕС МОДИФИКАТОРА - В МП.!
CONT CSM,MNSA=МР,MODNM=RR,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
;ОШИБКА, ЕСЛИ СОВПАДЕНИЕ!
CONT SТОРС=NZ,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=NZ,%TIK%
;
;ПИШЕМ ЕЩЕ РАЗ ПО АИСП.С ПРИЗНАКОМ MOD! ЗАПИСЬ ДОЛЖНА ПРОЙТИ!
CONT ALUS=ZА,RА=А,ALU,CSM,WЕМ,MNSA=U,MOD
;ЧИТАЕМ, СРАВНИВАЕМ, АДРЕС МОДИФИКАТОРА - В МП.!
CONT CSM,MNSA=МР,MODNM=RR,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
;ОШИБКА, ЕСЛИ НЕ ЗАПИСАЛОСЬ!
CONT SТОРС=/NZ,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
;
;ИНВЕРТИРУЕМ  РГ.А, ПИШЕМ ИЗ МП
CONT ALUS=ZВ,RВ=А,FUNC=EXNOR,ALUD=В,ALU,CSM,WЕМ,MNSA=МР,MODNM=RR
;ЧИТАЕМ, АДРЕС МОДИФИКАТОРА - В АИСП.БЕЗ MOD! НЕ Д.СОВПАСТЬ!
CONT CSM,MNSA=U,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
;ОШИБКА, ЕСЛИ СОВПАЛО!
CONT SТОРС=NZ,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=NZ,%TIK%
;
;ЧИТАЕМ ЕЩЕ РАЗ; АДРЕС МОДИФИКАТОРА - В АИСП.С ПР.MOD
CONT CSM,MNSA=U,MOD,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
;ОШИБКА, ЕСЛИ НЕ ТО!
CONT SТОРС=/NZ,%ТУРЕ%
CJS А=ERRINH,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
CJP А=CMOD1E,МАР=РЕ
END
*END
*NО LIST
*CALL MPSEND:MODF=800
*END FILE
*END FILE
