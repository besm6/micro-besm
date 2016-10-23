*NАМЕ 2:STNDTEST
*       ПЗУ+БОИ+СТАНДАРТИЗАТОР
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
STND:PROG;
;
;     ================
;     П З У   КОНСТАНТ
;     ================
;
EXTERNAL INITST,ERRTST,ERRINF,ERRINQ,OUT8/F,RD8/F
;
ПЗУ1:ENTRY
;===== ЧТЕНИЕ ИЗ ПЗУ, ЗАПИСЬ В БОПП, В 8-15 РЕГИСТРЫ
;
CJP А=PSROM1,МАР=РЕ
PSROM1:CONT А=Н1,%TN%
CJS А=INITST,МАР=РЕ
;ЧИТАЕМ ИЗ ПЗУ В РГ.WR6, ИДЕМ НА ВЫДАЧУ В БОПП
CROM1:CONT А=1,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=WR6
CJS А=OUT8/F,МАР=РЕ
CJP А=CROM1,МАР=РЕ,%TIK%
;
;
ПЗУ2:ENTRY
;===== ЧТЕНИЕ ИЗ ПЗУ В РЕГИСТРЫ МПС, ПРОВЕРКА
;  АДРЕС ПЗУ   НОМЕР РЕГИСТРА МПС     ОШИБКА
;        0          WR1                 01
;        1          WR2                 02
;        2          WR3                 03
;        3          WR4                 04
;        4          WR5                 05
;        5          WR6                 06
;        6           А                  07
;        7           У                  08
;
CJP А=PSROM2,МАР=РЕ
PSROM2:CONT А=Н2,%TN%
CJS А=INITST,МАР=РЕ
CONT А=0,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=WR1
CONT А=1,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=WR2
CONT А=2,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=WR3
CONT А=3,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=WR4
CONT А=4,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=WR5
CONT А=5,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=WR6
CONT А=6,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А
CONT А=7,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=У
;INTR=1; ПРОВЕРЯЕМ CONST ПО АДРЕСУ ПЗУ 0:
CROM2:CONT А=0,DSRC=PROM,ALUS=DА,RА=WR1,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=21,%CLRTYP%
CJS А=ERRINQ,МАР=РЕ,COND=СТ,SТОРС=21,%ТУРЕ%
;INTR=2, АДРЕС ПЗУ 1:
CONT А=1,DSRC=PROM,ALUS=DА,RА=WR2,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINQ,МАР=РЕ,COND=СТ,SТОРС=21
;INTR=3; АДРЕС 2:
CONT А=2,DSRC=PROM,ALUS=DА,RА=WR3,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINQ,МАР=РЕ,COND=СТ,SТОРС=21
;INTR=4, АДРЕС 3:
CONT А=3,DSRC=PROM,ALUS=DА,RА=WR4,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINQ,МАР=РЕ,COND=СТ,SТОРС=21
;INTR=5, АДРЕС 4:
CONT А=4,DSRC=PROM,ALUS=DА,RА=WR5,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINQ,МАР=РЕ,COND=СТ,SТОРС=21
;INTR=6, АДРЕС 5:
CONT А=5,DSRC=PROM,ALUS=DА,RА=WR6,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINQ,МАР=РЕ,COND=СТ,SТОРС=21
;INTR=7, АДРЕС 6:
CONT А=6,DSRC=PROM,ALUS=DА,RА=А,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINQ,МАР=РЕ,COND=СТ,SТОРС=21
;INTR=8, АДРЕС 7:
CONT А=7,DSRC=PROM,ALUS=DА,RА=У,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINQ,МАР=РЕ,COND=СТ,SТОРС=21
CJP А=CROM2,МАР=РЕ,%TIK%
;
;
ПЗУ3:ENTRY
;===== ПРОВЕРКА ОТДЕЛЬНЫХ АДРЕСОВ ПЗУ
;   ЧИТАЕМ CONST ИЗ ПЗУ, ДЕЛАЕМ ЛОГИЧЕСКИЕ ОПЕРАЦИИ С CONST ИЗ ПЗУ, СРАВНИВАЕМ
;
CJP А=PSROM3,МАР=РЕ
PSROM3:CONT А=Н3,%TN%
CJS А=INITST,МАР=РЕ
CROM3:CONT %CLRTYP%
;INTR = 01: ЧИТАЕМ FF..FF, ИНВЕРТИРУЕМ, СРАВНИВАЕМ С 0
CONT А=CFFF,DSRC=PROM,ALUS=DZ,FUNC=EXNOR,Н,ALUD=Q,CEN
CONT SТОРС=/NZ,%ТУРЕ%
CJS А=ERRINQ,МАР=РЕ,COND=СТ,SТОРС=/NZ
;INTR = 02: ЧИТАЕМ 00...FF, ИНВЕРТИРУЕМ МЛ.32 РАЗРЯДА, СРАВНИВАЕМ ВСЕ С 0
CONT А=МН,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=У
CONT ALUS=ZА,RА=У,FUNC=EXNOR,ALUD=В,RВ=У
CONT ALUS=ZА,RА=У,Н,ALUD=Q,CEN
CONT SТОРС=/NZ,%ТУРЕ%
CJS А=ERRINQ,МАР=РЕ,COND=СТ,SТОРС=/NZ
;INTR = 03:
CONT А=СААА,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=У
;FF...FF
CONT А=С555,DSRC=PROM,ALUS=ZА,RА=У,FUNC=OR,Н,ALUD=В,RВ=У
;FF...FF
CONT А=ZER,DSRC=PROM,ALUS=ZА,RА=У,FUNC=OR,Н,ALUD=В,RВ=У
;FFFF...00
CONT А=MNQ,DSRC=PROM,ALUS=DА,RА=У,FUNC=EXOR,Н,ALUD=В,RВ=У
;00...00
CONT А=MQ,DSRC=PROM,ALUS=DА,RА=У,FUNC=EXOR,Н,ALUD=В,RВ=У
;00...00FF
CONT А=МВ,DSRC=PROM,ALUS=DА,RА=У,FUNC=EXOR,Н,ALUD=В,RВ=У
;FF...FF
CONT А=MNB,DSRC=PROM,ALUS=DА,RА=У,FUNC=EXOR,Н,ALUD=В,RВ=У
;00...00
CONT А=С1,DSRC=PROM,ALUS=DА,RА=У,FUNC=ADD,Н,ALUD=В,RВ=У
;00...0.FFF
CONT А=MADR,DSRC=PROM,ALUS=DА,RА=У,FUNC=OR,Н,ALUD=В,RВ=У
;FF...FF
CONT А=MNADR,DSRC=PROM,ALUS=DА,RА=У,FUNC=OR,Н,ALUD=В,RВ=У
;4
CONT А=С5,DSRC=PROM,ALUS=DА,RА=У,FUNC=ADD,Н,ALUD=В,RВ=У
;0...0
CONT А=В3,DSRC=PROM,ALUS=DА,RА=У,FUNC=EXOR,Н,ALUD=В,RВ=У,CEN
CONT SТОРС=/NZ,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=/NZ
CJP А=CROM3,МАР=РЕ,%TIK%
;
;
;     ====================
;     Б О И  ДАННЫХ И ТЕГА
;     ====================
;
ТЕГ4:ENTRY
;===== ЗАПИСЬ 0 В RG1 БОИ ТЕГА, ЧТЕНИЕ, СРАВНЕНИЕ, ЗАПИСЬ В 15 РГ.БОПП
;
CJP А=PSTAG4,МАР=РЕ
PSTAG4:CONT А=Н4,%TN%
CJS А=INITST,МАР=РЕ
;0 - В RG1 ТЕГА
CONT ALUS=ZА,FUNC=AND,ALU,YDEVT=ECBTAG,WRB,BRA=RG1
;ЧИТАЕМ ЧЕРЕЗ СДВИГАТЕЛЬ В РГ.У МПС
CTAG4:CONT YDEVT=ECBTAG,BRA=RG1,DSRC=SHIFT,MPS,PSHF=SН0,SHF=LOG,ALUS=DZ
>,ALUD=В,RВ=У
;ИЗ РГ.У - В 15 РГ.БОПП, СДВИГАЕМ В СТ.РАЗРЯДЫ (УБИРАЕМ МУСОР), СРАВНИВАЕМ
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=А,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=15,DSRC=SHIFT
>,MPS,PSHF=SН0-56,SHF=LOG,CEN
CONT SТОРС=/NZ
CONT SТОРС=/NZ,%TIK%
CJS А=ERRTST,МАР=РЕ,COND=СТ,SТОРС=/NZ
CJP А=CTAG4,МАР=РЕ
;
;
ТЕГ5:ENTRY
;===== ЗАПИСЬ FF В RG2 БОИ ТЕГА, ЧТЕНИЕ, ПРОВЕРКА (ИНВЕРТ.), ЗАПИСЬ В 15 РГ.БОПП
;
CJP А=PSTAG5,МАР=РЕ
PSTAG5:CONT А=Н5,%TN%
CJS А=INITST,МАР=РЕ
;FF - В RG1 ТЕГА
CONT ALUS=ZА,FUNC=AND,ALUD=В,RВ=А
CONT ALUS=ZА,RА=А,FUNC=EXNOR,ALU,YDEVT=ECBTAG,WRB,BRA=RG2
;ЧИТАЕМ ЧЕРЕЗ СДВИГАТЕЛЬ В РГ.У МПС
CTAG5:CONT YDEVT=ECBTAG,BRA=RG2,DSRC=SHIFT,MPS,PSHF=SН0,SHF=LOG,ALUS=DZ
>,ALUD=В,RВ=У
;ИЗ РГ.У - В 15 РГ.БОПП, ИНВЕРТИРУЕМ ДЛЯ ПРОВЕРКИ НА 0
CONT ALUS=ZА,RА=У,FUNC=EXNOR,ALUD=ВА,RВ=А,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=15
;СДВИГАЕМ В СТ.РАЗРЯДЫ (УБИРАЕМ МУСОР), СРАВНИВАЕМ
CONT ALUS=DZ,Н,ALUD=ВА,RА=А,RВ=А,ALU,DSRC=SHIFT,MPS,PSHF=SН0-56,SHF=LOG,CEN
CONT SТОРС=/NZ
CONT SТОРС=/NZ,%TIK%
CJS А=ERRTST,МАР=РЕ,COND=СТ,SТОРС=/NZ
CJP А=CTAG5,МАР=РЕ
;
;
БОИ6:ENTRY
;===== ЗАПИСЬ 0 В RG0 БОИ ДАННЫХ, ЧТЕНИЕ, СРАВНЕНИЕ, ЗАПИСЬ В 8-15 РГ.БОПП
;
CJP А=PSBOI6,МАР=РЕ
PSBOI6:CONT А=Н6,%TN%
CJS А=INITST,МАР=РЕ
;0 - В RG0 БОИ ДАННЫХ
CONT ALUS=ZА,FUNC=AND,Н,ALU,ЕСВ,WRB,BRA=RG0
;ЧИТАЕМ В РГ.У,WR6 МПС, ПИШЕМ В П/П В 8-15 РГ.БОПП
CBOI6:CONT ЕСА,ARA=RG0,ALUS=DZ,Н,ALUD=В,RВ=У,CEN
CJS А=OUT8/F,МАР=РЕ,ALUS=ZА,RА=У,Н,ALUD=В,RВ=WR6
CONT SТОРС=/NZ
CONT SТОРС=/NZ,%TIK%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=/NZ
CJP А=CBOI6,МАР=РЕ
;
;
БОИ7:ENTRY
;===== ЗАПИСЬ FF..FF В RG3 БОИ ДАННЫХ, ЧТЕНИЕ, СРАВНЕНИЕ, ЗАПИСЬ В 8-15 РГ.БОПП
;
CJP А=PSBOI7,МАР=РЕ
PSBOI7:CONT А=Н7,%TN%
CJS А=INITST,МАР=РЕ
;FF..FF - В РГ.А И RG3 БОИ ДАННЫХ
CONT ALUS=ZА,FUNC=AND,Н,ALUD=В,RВ=А
CONT ALUS=ZА,RА=А,FUNC=EXNOR,Н,ALUD=В,RВ=А,ALU,ЕСВ,WRB,BRA=RG3
;ЧИТАЕМ В РГ.У,WR6 МПС, ПИШЕМ В П/П В 8-15 РГ.БОПП, СРАВНИВАЕМ С РГ.А
CBOI7:CONT ЕСА,ARA=RG3,ALUS=DZ,Н,ALUD=В,RВ=У
CJS А=OUT8/F,МАР=РЕ,ALUS=ZА,RА=У,Н,ALUD=В,RВ=WR6
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=/NZ
CONT SТОРС=/NZ,%TIK%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=/NZ
CJP А=CBOI7,МАР=РЕ
;
;
БОИ8:ENTRY
;===== ЗАПИСЬ CONST В RG0 БОИ ДАННЫХ (ПО А) И RG3 БОИ ТЕГА (ЧЕРЕЗ МПС)
;   А - ПИШЕМ; У - ЧИТАЕМ; Q - РЕЗУЛЬТАТ СРАВНЕНИЯ;
;   ОШИБКА: 01 - БОИ ДАННЫХ; 02 - БОИ ТЕГА
;
CJP А=PSBOI8,МАР=РЕ
PSBOI8:CONT А=Н8,%TN%
CJS А=INITST,МАР=РЕ
;ЧИТАЕМ CONST ИЗ ПЗУ, ПИШЕМ В РГ.А, RG0 ДАННЫХ (ПО А) И RG3 ТЕГА (ЧЕРЕЗ МПС)
CONT А=СААА,DSRC=PROM,ЕСА,WRA,ARA=RG0,ALUS=DZ,Н,ALUD=В,RВ=А,ALU
>,YDEVT=ECBTAG,WRB,BRA=RG3
;ЧИТАЕМ БОИ ДАННЫХ, СРАВНИВАЕМ
CBOI8:CONT ЕСА,ARA=RG0,ALUS=DZ,Н,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=21,%CLRTYP%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,%ТУРЕ%
;ЧИТАЕМ БОИ ТЕГА ЧЕРЕЗ СДВИГАТЕЛЬ, СРАВНИВАЕМ
CONT YDEVT=ECBTAG,BRA=RG3,DSRC=SHIFT,MPS,PSHF=SН0,SHF=LOG
>,ALUS=DZ,Н,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,Н,ALUD=Q
;УБИРАЕМ МУСОР
CONT А=МВ,DSRC=PROM,ALUS=DQ,FUNC=AND,Н,ALUD=Q,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
CJP А=CBOI8,МАР=РЕ,%TIK%
;
;
БОИ9:ENTRY
;===== ЗАПИСЬ CONST В RG3 БОИ ДАННЫХ И ТЕГА (В ОБА - ПО КАНАЛУ В ЧЕРЕЗ МПС)
;      А - ПИШЕМ; У - ЧИТАЕМ; Q - РЕЗУЛЬТАТ СРАВНЕНИЯ;
;      ОШИБКИ: 01- БОИ ДАННЫХ; 02 - БОИ ТЕГА
;
CJP А=PSBOI9,МАР=РЕ
PSBOI9:CONT А=Н9,%TN%
CJS А=INITST,МАР=РЕ
;ЧИТАЕМ CONST ИЗ ПЗУ, ПИШЕМ В РГ.А, RG3 ДАННЫХ И ТЕГА (ЧЕРЕЗ МПС)
CONT А=С555,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А,ALU,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
CBOI9:CONT %CLRTYP%
;ЧИТАЕМ БОИ ДАННЫХ, СРАВНИВАЕМ
CONT ЕСА,ARA=RG3,ALUS=DZ,Н,ALUD=В,RВ=У
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
;ЧИТАЕМ БОИ ТЕГА ЧЕРЕЗ СДВИГАТЕЛЬ, СРАВНИВАЕМ
CONT YDEVT=ECBTAG,BRA=RG3,DSRC=SHIFT,MPS,PSHF=SН0,SHF=LOG
>,ALUS=DА,RА=А,FUNC=EXOR,ALUD=В,RВ=У
;СДВИГАЕМ К СТ.РАЗРЯДАМ, ЧТОБ УБРАТЬ МУСОР (ПОПРОБУЕМ К ПОЛОВИНЕ)
CONT ALUS=DZ,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0-24,SHF=LOG,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
CJP А=CBOI9,МАР=РЕ,%TIK%
;
;
БОИА:ENTRY
;===== ЗАПИСЬ РАЗНЫХ CONST ВО ВСЕ РЕГИСТРЫ БОИ ДАННЫХ И ТЕГА
;   А - ПРОЧИТАННОЕ; ОШИБКА = N РЕГИСТРА
;   WR1 - ЗАПИСАННОЕ В RG0 ДАННЫХ, RG3 ТЕГА
;   WR2 - RG1 ДАННЫХ, RG2 ТЕГА
;   WR3 - RG2 ДАННЫХ, RG1 ТЕГА
;   WR4 - RG3 ДАННЫХ  (В RG0 ТЕГА НЕ ПИШЕМ!)
;
CJP А=PSBOIA,МАР=РЕ
PSBOIA:CONT А=НА,%TN%
CJS А=INITST,МАР=РЕ
;ПИШЕМ ИЗ ПЗУ В БОИ ДАННЫХ ПО А, В РГ. МПС, ЧЕРЕЗ МПС - В БОИ ТЕГА
;В RG0 ДАННЫХ, RG3 ТЕГА
CONT А=СААА,DSRC=PROM,ЕСА,WRA,ARA=RG0,ALUS=DZ,Н,ALUD=В,RВ=WR1,ALU
>,YDEVT=ECBTAG,WRB,BRA=RG3
;В RG1 ДАННЫХ, RG2 ТЕГА
CONT А=С555,DSRC=PROM,ЕСА,WRA,ARA=RG1,ALUS=DZ,Н,ALUD=В,RВ=WR2,ALU
>,YDEVT=ECBTAG,WRB,BRA=RG2
;В RG2 ДАННЫХ, RG1 ТЕГА
CONT А=МН,DSRC=PROM,ЕСА,WRA,ARA=RG2,ALUS=DZ,Н,ALUD=В,RВ=WR3,ALU
>,YDEVT=ECBTAG,WRB,BRA=RG1
;В RG3 ДАННЫХ
CONT А=MNH,DSRC=PROM,ЕСА,WRA,ARA=RG3,ALUS=DZ,Н,ALUD=В,RВ=WR4
;INTR=1; ПРОВЕРЯЕМ: ЧИТАЕМ RG0 БОИ ДАННЫХ, СРАВНИВАЕМ
CBOIA:CONT ЕСА,ARA=RG0,ALUS=DZ,Н,ALUD=В,RВ=У
CONT ALUS=АВ,RА=У,RВ=WR1,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=21,%CLRTYP%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,%ТУРЕ%
;INTR=2; RG1
CONT ЕСА,ARA=RG1,ALUS=DZ,Н,ALUD=В,RВ=У
CONT ALUS=АВ,RА=У,RВ=WR2,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
;INTR=3; RG2
CONT ЕСА,ARA=RG2,ALUS=DZ,Н,ALUD=В,RВ=У
CONT ALUS=АВ,RА=У,RВ=WR3,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
;INTR=4; RG3
CONT ЕСА,ARA=RG3,ALUS=DZ,Н,ALUD=В,RВ=У
CONT ALUS=АВ,RА=У,RВ=WR4,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
;INTR=5; ПРОВЕРЯЕМ БОИ ТЕГА, ЧИТАЕМ ЧЕРЕЗ СДВИГАТЕЛЬ. RG1
CONT YDEVT=ECBTAG,BRA=RG1,DSRC=SHIFT,MPS,PSHF=SН0,SHF=LOG
>,ALUS=DZ,Н,ALUD=В,RВ=У
CONT ALUS=АВ,RА=WR3,RВ=У,FUNC=EXOR,Н,ALUD=В
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0-56,SHF=LOG,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
;INTR=6; RG2
CONT YDEVT=ECBTAG,BRA=RG2,DSRC=SHIFT,MPS,PSHF=SН0,SHF=LOG
>,ALUS=DZ,Н,ALUD=В,RВ=У
CONT ALUS=АВ,RА=WR2,RВ=У,FUNC=EXOR,Н,ALUD=В
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0-56,SHF=LOG,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
;INTR=7; RG3
CONT YDEVT=ECBTAG,BRA=RG3,DSRC=SHIFT,MPS,PSHF=SН0,SHF=LOG
>,ALUS=DZ,Н,ALUD=В,RВ=У
CONT ALUS=АВ,RА=WR1,RВ=У,FUNC=EXOR,Н,ALUD=В
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0-56,SHF=LOG,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
CJP А=CBOIA,МАР=РЕ,%TIK%
;
;
БОИВ:ENTRY
;===== ПИШЕМ ПЕРЕМЕННУЮ В RG0 ДАННЫХ
;      А - ПИШЕМ; У - ЧИТАЕМ; Q - РЕЗУЛЬТАТ СРАВНЕНИЯ
;
CJP А=PSBOIB,МАР=РЕ
PSBOIB:CONT А=НВ,%TN%
CJS А=INITST,МАР=РЕ
;0 - В А
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=А
;ПИШЕМ
CBOIB:CONT ALUS=ZВ,RВ=А,Н,CI,ALUD=В,ALU,ЕСВ,WRB,BRA=RG0
;ЧИТАЕМ, СРАВНИВАЕМ
CONT ЕСА,ARA=RG0,ALUS=DZ,Н,ALUD=В,RВ=У
CONT ALUS=АВ,RА=У,RВ=А,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=21,%TIK%
CJS А=ERRINQ,МАР=РЕ,COND=СТ,SТОРС=21
CJP А=CBOIB,МАР=РЕ
;
;
БОИС:ENTRY
;===== ПИШЕМ ПЕРЕМЕННУЮ В RG1
;      А - ПИШЕМ; У - ЧИТАЕМ; Q - РЕЗУЛЬТАТ СРАВНЕНИЯ
;
CJP А=PSBOIC,МАР=РЕ
PSBOIC:CONT А=НС,%TN%
CJS А=INITST,МАР=РЕ
;0 - В А
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=А
;ПИШЕМ
CBOIC:CONT ALUS=ZВ,RВ=А,Н,CI,ALUD=В,ALU,ЕСВ,WRB,BRA=RG1
;ЧИТАЕМ, СРАВНИВАЕМ
CONT ЕСА,ARA=RG1,ALUS=DZ,Н,ALUD=В,RВ=У
CONT ALUS=АВ,RА=У,RВ=А,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=21,%TIK%
CJS А=ERRINQ,МАР=РЕ,COND=СТ,SТОРС=21
CJP А=CBOIC,МАР=РЕ
;
;
БOИD:ENTRY
;===== ПИШЕМ ПЕРЕМЕННУЮ В RG2 ТЕГА
;      А - ПИШЕМ; У - ЧИТАЕМ; Q - РЕЗУЛЬТАТ СРАВНЕНИЯ
;
CJP А=PSBOID,МАР=РЕ
PSBOID:CONT А=HD,%TN%
CJS А=INITST,МАР=РЕ
;0 - В А
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=А
;ПИШЕМ
CBOID:CONT ALUS=ZВ,RВ=А,Н,CI,ALUD=В,ALU,YDEVT=ECBTAG,WRB,BRA=RG2
;ЧИТАЕМ, СРАВНИВАЕМ
CONT YDEVT=ECBTAG,BRA=RG2,DSRC=SHIFT,MPS,PSHF=SН0,SHF=LOG,ALUS=DА,RА=А
>,FUNC=EXOR,ALUD=В,RВ=У
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0-56,SHF=LOG,CEN
CONT SТОРС=21,%TIK%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
CJP А=CBOID,МАР=РЕ
;
;
БОИЕ:ENTRY
;===== ПИШЕМ ПЕРЕМЕННУЮ В RG3 ТЕГА
;      А - ПИШЕМ; У - ЧИТАЕМ; Q - РЕЗУЛЬТАТ СРАВНЕНИЯ
;
CJP А=PSBOIE,МАР=РЕ
PSBOIE:CONT А=НЕ,%TN%
CJS А=INITST,МАР=РЕ
;0 - В А
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=А
;ПИШЕМ
CBOIE:CONT ALUS=ZВ,RВ=А,Н,CI,ALUD=В,ALU,YDEVT=ECBTAG,WRB,BRA=RG3
;ЧИТАЕМ, СРАВНИВАЕМ
CONT YDEVT=ECBTAG,BRA=RG3,DSRC=SHIFT,MPS,PSHF=SН0,SHF=LOG,ALUS=DА,RА=А
>,FUNC=EXOR,ALUD=В,RВ=У
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0-56,SHF=LOG,CEN
CONT SТОРС=21,%TIK%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
CJP А=CBOIE,МАР=РЕ
;
;
БOИF:ENTRY
;===== ПИШЕМ В РЕГИСТРЫ БОИ РАЗНЫЕ ЧИСЛА, ЧИТАЕМ
;   ПИШЕМ: WR4 - В RG0 ДАННЫХ, ОШИБКИ: 01
;          WR3 - В RG1 ДАННЫХ, ТЕГА:   02    05
;          WR2 - В RG2 ДАННЫХ, ТЕГА:   03    06
;          WR1 - В RG3 ДАННЫХ, ТЕГА:   04    07
;
CJP А=PSBOIF,МАР=РЕ
PSBOIF:CONT А=HF,%TN%
CJS А=INITST,МАР=РЕ
;УСТАНАВЛИВАЕМ НАЧАЛЬНЫЕ ЗНАЧЕНИЯ ПЕРЕМЕННЫХ (ЧИТАЕМ ИЗ ПЗУ)
CONT А=СААА,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=WR4
CONT А=С555,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=WR3
CONT А=МН,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=WR2
CONT А=MNH,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=WR1
;ПИШЕМ ИЗ МПС В БОИ ДАННЫХ, В БОИ ТЕГА: RG0
CBOIF:CONT ALUS=ZВ,Н,CI,ALUD=В,RВ=WR4,ALU,ЕСВ,WRB,BRA=RG0
;В RG1
CONT ALUS=ZВ,Н,CI,ALUD=В,RВ=WR3,ALU
>,YDEVT=ECBTAG,BRA=RG1,ЕСВ,WRB
;В RG2
CONT ALUS=ZВ,Н,CI,ALUD=В,RВ=WR2,ALU
>,YDEVT=ECBTAG,BRA=RG2,ЕСВ,WRB
;В RG3
CONT ALUS=ZВ,Н,CI,ALUD=В,RВ=WR1,ALU
>,YDEVT=ECBTAG,BRA=RG3,ЕСВ,WRB
;ПРОВЕРЯЕМ
;ЧИТАЕМ RG0 БОИ ДАННЫХ, СРАВНИВАЕМ
CONT ЕСА,ARA=RG0,ALUS=DZ,Н,ALUD=В,RВ=У
CONT ALUS=АВ,RА=WR4,RВ=У,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=21,%CLRTYP%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,%ТУРЕ%
;RG1
CONT ЕСА,ARA=RG1,ALUS=DZ,Н,ALUD=В,RВ=У
CONT ALUS=АВ,RА=WR3,RВ=У,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
;RG2
CONT ЕСА,ARA=RG2,ALUS=DZ,Н,ALUD=В,RВ=У
CONT ALUS=АВ,RА=WR2,RВ=У,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
;RG3
CONT ЕСА,ARA=RG3,ALUS=DZ,Н,ALUD=В,RВ=У
CONT ALUS=АВ,RА=WR1,RВ=У,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
;ПРОВЕРЯЕМ БОИ ТЕГА, ЧИТАЕМ ЧЕРЕЗ СДВИГАТЕЛЬ: RG1
CONT YDEVT=ECBTAG,BRA=RG1,DSRC=SHIFT,MPS,PSHF=SН0,SHF=LOG
>,ALUS=DА,RА=WR3,FUNC=EXOR,ALUD=В,RВ=У
CONT ALUS=DZ,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0-24,SHF=LOG,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
;RG2
CONT YDEVT=ECBTAG,BRA=RG2,DSRC=SHIFT,MPS,PSHF=SН0,SHF=LOG
>,ALUS=DА,RА=WR2,FUNC=EXOR,ALUD=В,RВ=У
CONT ALUS=DZ,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0-24,SHF=LOG,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
;RG3
CONT YDEVT=ECBTAG,BRA=RG3,DSRC=SHIFT,MPS,PSHF=SН0,SHF=LOG
>,ALUS=DА,RА=WR1,FUNC=EXOR,ALUD=В,RВ=У
CONT ALUS=DZ,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0-24,SHF=LOG,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
CJP А=CBOIF,МАР=РЕ,%TIK%
;
;
;     =====================
;     СТАНДАРТИЗАТОР КОМАНД
;     =====================
;
СТНД10:ENTRY
;===== КОМАНДНОЕ СЛОВО ЗАДАЕМ В БОПП;  АК,КОП,МОД.ПО АДР.IRA - ПИШЕМ В БОПП
;   ВХОДНАЯ ИНФОРМАЦИЯ В РГ.БОПП ПРИ ЗАПУСКЕ ТЕСТА:
;   8-15 - КОМАНДНОЕ СЛОВО;
;   7 = 0 - НОВЫЙ РЕЖИМ; НЕ РАВЕН 0 - РЕЖИМ ЭМУЛЯЦИИ;
;   ВЫХОДНАЯ ИНФОРМАЦИЯ В РГ.БОПП:             ИСПОЛЬЗУЕМЫЕ РЕГИСТРЫ:
;   4     - МОДИФИКАТОР ПО АДРЕСУ IRA ЛК       А   - КОМАНДНОЕ СЛОВО
;   5     - КОП ЛК                             У   - АК ЛК;   WR3 - АК ПК
;   6-9   - АИСП.ЛК                            WR5 - КОП ЛК;  WR2 - КОП ПК
;   10    - МОДИФИКАТОР ПО АДРЕСУ IRA ПК       WR4 - ИР ЛК;   WR1 - ИР ПК
;   11    - КОП ПК                             В 0-Й МОДИФИКАТОР ЗАПИСАНО FFFF!
;   12-15 - АИСП.ПК
;
CJP А=PSST10,МАР=РЕ
PSST10:CONT А=Н10,%TN%
CJS А=INITST,МАР=РЕ
;0 - РГ/ТГ, 5 - В РНГ, FFFFFFFF - В М0
CONT ALUS=DZ,FUNC=AND,Н,ALU,YDST=CNT,FFCNT=CLRTKK
CONT А=С5,DSRC=PROM,ALUS=DZ,ALU,YDST=MODGN
CONT А=CFFF,DSRC=PROM,ALUS=DZ,ALU,CSM,WЕМ,MNSA=МР,MODNM=М0
;ЧИТАЕМ 7 РГ.БОПП (ПРИЗНАК РЕЖИМА); ИДЕМ НА ЧТЕНИЕ КОМАНДНОГО СЛОВА ИЗ БОПП
CJS А=RD8/F,МАР=РЕ,YDEV=МРМЕМ,IОМР,MPADR=7,DSRC=SHIFT,MPS,PSHF=SН0-56,SHF=LOG
>,ALUS=DZ,Н,ALUD=В,RВ=WR2,CEN
CONT SТОРС=20
CJP А=СС10,МАР=РЕ,COND=СТ,SТОРС=20
;
;ФОРМИРУЕМ РЕЖИМ ЭМУЛЯЦИИ В ЦП (НАДО ПРОЧИТАТЬ КОМ.СЛОВО С ПРИЗНАКОМ РЭ!)
;БП,БПТЗ = 1  (19,27 РАЗРЯДЫ РР)
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT,FFCNT=CLRTKK
;3 - В АИСП, RG3 TEGA (ПРИЗНАК КОМАНДЫ + РЭ)
CONT А=С3,DSRC=PROM,ALUS=DZ,ALU,YDST=ADRREG,YDEVT=ECBTAG,ЕСВ,WRB,BRA=RG3
;ФИЗ.АДРЕС - В RG0
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
WAW10:CJP А=WAW10,%WА%
;ЧИТАЕМ ПО ТОМУ ЖЕ АДРЕСУ
CONT YDEV=PHYSAD,ARBI=FЕТСН
WAR10:CJP А=WAR10,%WА%
;
;ПИШЕМ КОМАНДНОЕ СЛОВО В БОИ В РЕГИСТР КОМАНД
СС10:CONT ALUS=ZА,RА=WR6,Н,ALUD=В,RВ=А,ALU,ЕСВ,WRB,BRA=RG1,FFCNT=CLRTKK
;
;ЧИТАЕМ АК ЛК, ПИШЕМ В 6-9 РГ.БОПП; МЛ.БАЙТЫ - В СТАРШИХ ПО НОМЕРУ РЕГИСТРАХ!
CONT DSRC=СОМА,ALUS=DZ,ALUD=В,RВ=У
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=WR6,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=9
>,DSRC=SHIFT,MPS,PSHF=SН0+8,SHF=LOG
CONT ALUS=DZ,Н,ALUD=ВА,RА=WR6,RВ=WR6,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=8
>,DSRC=SHIFT,MPS,PSHF=SН0+8,SHF=LOG
CONT ALUS=DZ,Н,ALUD=ВА,RА=WR6,RВ=WR6,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=7
>,DSRC=SHIFT,MPS,PSHF=SН0+8,SHF=LOG
CONT ALUS=ZА,RА=WR6,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=6
;
;ЧИТАЕМ КОП, ПИШЕМ В 5 РГ.БОПП
CONT DSRC=ОРС,ALUS=DZ,ALUD=В,RВ=WR5,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=5,SТОРС=20
;
;ВЫДЕЛЯЕМ ИР ЛК, ПИШЕМ В АИСП, ПИШЕМ В ОЗУ МОД.ПО U, ЧИТАЕМ ПО IRA
CJP А=NR10,МАР=РЕ,COND=СТ,SТОРС=20,ALUS=ZА,RА=А,Н,ALUD=В,RВ=WR1
;ДЛЯ РЭ СДВИГАЕМ КОМ.СЛОВО ВЛЕВО НА 4 РАЗРЯДА АРИФМЕТИЧЕСКИ
CONT ALUS=DZ,Н,ALUD=ВА,RА=WR1,RВ=WR1,ALU,DSRC=SHIFT,MPS,PSHF=SН0-4,SHF=ARIPH
;СДВИГАЕМ IRA ЛК В МЛ.РАЗРЯДЫ
NR10:CONT ALUS=DZ,Н,ALUD=ВА,RА=WR1,RВ=WR2,ALU,DSRC=SHIFT,MPS,PSHF=SН0+60
>,SHF=LOG
;ПИШЕМ В АИСП
CONT ALUS=ZА,RА=WR2,ALU,YDST=ADRREG
;ПИШЕМ ТО ЖЕ В ОЗУ МОД. ПО U
;ЕСЛИ IRA=0, ЗАПИСИ НЕ Д.БЫТЬ! А ЧИТАЕТСЯ - FFFFFFFF, ТО ЧТО ЗАПИСАНО В М0!!!
CONT ALUS=ZА,RА=WR2,ALU,CSM,WЕМ,MNSA=U
;ЧИТАЕМ ПО IRA НОМЕР ИНДЕКС-РЕГИСТРА, ПИШЕМ В БОПП
CONT CSM,MNSA=IRA,ALUS=DZ,ALUD=В,RВ=WR4,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=4
CONT FFCNT=SЕТТКК
;
;ЧИТАЕМ АК ПК, ПИШЕМ В 12-15 РГ.БОПП
CONT DSRC=СОМА,ALUS=DZ,ALUD=В,RВ=WR3
CONT ALUS=DZ,ALUD=ВА,RА=WR3,RВ=WR6,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=15
>,DSRC=SHIFT,MPS,PSHF=SН0+8,SHF=LOG
CONT ALUS=DZ,ALUD=ВА,RА=WR6,RВ=WR6,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=14
>,DSRC=SHIFT,MPS,PSHF=SН0+8,SHF=LOG
CONT ALUS=DZ,ALUD=ВА,RА=WR6,RВ=WR6,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=13
>,DSRC=SHIFT,MPS,PSHF=SН0+8,SHF=LOG
CONT ALUS=ZА,RА=WR6,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=12
;
;ЧИТАЕМ КОП, ПИШЕМ В 11 РГ.БОПП
CJP А=NRM10,МАР=РЕ,COND=СТ,SТОРС=20
>,DSRC=ОРС,ALUS=DZ,ALUD=В,RВ=WR2,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=11
;
;ВЫДЕЛЯЕМ ИР ПК, ПИШЕМ В АИСП, ПИШЕМ В ОЗУ МОД.ПО U, ЧИТАЕМ ПО IRA
;ДЛЯ РЭ СДВИГАЕМ КОМ.СЛОВО ВПРАВО НА 8 (Т.К.НА 4 ВЛЕВО В РЭ УЖЕ СДВИНУТО!)
CONT ALUS=DZ,Н,ALUD=ВА,RА=WR1,RВ=WR1,ALU,DSRC=SHIFT,MPS,PSHF=SН0+8,SHF=LOG
;СДВИГАЕМ IRA ПК В МЛ.РАЗРЯДЫ
NRM10:CONT ALUS=DZ,Н,ALUD=ВА,RА=WR1,RВ=WR1,ALU,DSRC=SHIFT,MPS,PSHF=SН0+28
>,SHF=LOG
CONT А=С15,DSRC=PROM,ALUS=DА,RА=WR1,FUNC=AND,ALUD=В,RВ=WR1,ALU,YDST=ADRREG
;ПИШЕМ ТО ЖЕ В ОЗУ МОД. ПО U
CONT ALUS=ZА,RА=WR1,ALU,CSM,WЕМ,MNSA=U
;ЧИТАЕМ ПО IRA
CONT CSM,MNSA=IRA,ALUS=DZ,ALUD=Q,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=10
ENDT10:CJP А=ENDT10,МАР=РЕ,%TIK%
;
;
СТНД11:ENTRY
;===== КОМАНДНОЕ СЛОВО = "0", НОВЫЙ РЕЖИМ
;   РГ.У - ПРОЧИТАННАЯ ИНФОРМАЦИЯ
;   ОШИБКИ: 01 (05): ЧИТАЕМ АК ЛК (ПК)
;           02 (06): - " -  КОП ЛК (ПК)
;           03 (07): ЕСТЬ ПРИЗНАК ИР15
;           04 (08): - " -  МОДИФИКАТОР ПО АДРЕСУ IRA ЛК (ПК);
;   DADR - ЗАПИСАННОЕ В М0; ВУТЕ - МАСКА НА БАЙТ
;
CJP А=PSST11,МАР=РЕ
PSST11:CONT А=Н11,%TN%
CJS А=INITST,МАР=РЕ
;0 - В RG1 БОИ ДАННЫХ, В РГ/ТГ
CONT ALUS=DZ,FUNC=AND,Н,ALU,YDST=CNT,ЕСВ,WRB,BRA=RG1,FFCNT=CLRTKK
;МАСКУ НА БАЙТ - В РГ.МПС ВУТЕ, В РНГ
CONT А=МВ,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=ВУТЕ,ALU,YDST=MODGN
;CONST - В РГ.МПС DADR, В 0 МОДИФ. (КОТОРЫЙ ПО АДРЕСУ IRA)
CONT А=СААА,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=DADR,ALU,CSM,WЕМ,MNSA=МР,MODNM=М0
;
;ЧИАЕМ ЛК: АДРЕС КОМАНДЫ (32 РАЗРЯДА)
CST11:CONT DSRC=СОМА,ALUS=DZ,ALUD=В,RВ=У,CEN
CONT SТОРС=21,%CLRTYP%
;П/У НА ВЫДАЧУ РЕГИСТРОВ В БОПП, ЕСЛИ ОШИБКА
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,%ТУРЕ%
;К О П
CONT DSRC=ОРС,ALUS=DА,RА=ВУТЕ,FUNC=AND,Н,ALUD=В,RВ=У,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
;ПРОВЕРЯЕМ ОТСУТСТВИЕ ПРИЗНАКА ИР15
CJS А=ERRINF,МАР=РЕ,COND=IR15,%ТУРЕ%
;ЧИТАЕМ ПО АДРЕСУ IRA
CONT CSM,MNSA=IRA,ALUS=DА,RА=DADR,FUNC=EXOR,ALUD=В,RВ=У,CEN
CONT SТОРС=21,%ТУРЕ%
;ТКК = ПК
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,FFCNT=SЕТТКК
;
;ЧИТАЕМ ПК: АДРЕС КОМАНДЫ (32 РАЗРЯДА)
CONT DSRC=СОМА,ALUS=DZ,ALUD=В,RВ=У,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
;К О П
CONT DSRC=ОРС,ALUS=DА,RА=ВУТЕ,FUNC=AND,Н,ALUD=В,RВ=У,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
;ПРОВЕРЯЕМ ОТСУТСТВИЕ ИР15
CJS А=ERRINF,МАР=РЕ,COND=IR15,%ТУРЕ%
;ЧИТАЕМ ПО АДРЕСУ IRA
CONT CSM,MNSA=IRA,ALUS=DА,RА=DADR,FUNC=EXOR,ALUD=В,RВ=У,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,%TIK%
CJP А=CST11,МАР=РЕ,FFCNT=CLRTKK
;
;
СТНД12:ENTRY
;===== КОМАНДНОЕ СЛОВО = FF...FF, НОВЫЙ РЕЖИМ
;   ОШИБКИ: 01 (05): ЧИТАЕМ АК ЛК (ПК)
;           02 (06): - " -  КОП ЛК (ПК)
;           03 (07): НЕТ ПРИЗНАКА ИР15 НА УСЛОВИЯХ
;           04 (08): ЧИТАЕМ МОДИФИКАТОР ПО АДРЕСУ IRA ЛК (ПК)
;   ВУТЕ - МАСКА НА БАЙТ; HALF - МАСКА НА 32 РАЗРЯДА; DADR - ЗАПИСАННОЕ В ИР15
;
CJP А=PSST12,МАР=РЕ
PSST12:CONT А=Н12,%TN%
CJS А=INITST,МАР=РЕ
;0 - В РГ/ТГ
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=HALF,ALU,YDST=CNT,FFCNT=CLRTKK
;МАСКУ НА БАЙТ - В РГ.МПС ВУТЕ, В РНГ
CONT А=МВ,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=ВУТЕ,ALU,YDST=MODGN
;CONST - В РГ.МПС DADR, В 15 МОДИФ. (КОТОРЫЙ ПО АДРЕСУ IRA)
CONT А=С555,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=DADR,ALU,CSM,WЕМ,MNSA=МР,MODNM=SР
;FF...FF - В RG1 БОИ, В РГ.МПС HALF (32 РАЗРЯДА)
CONT А=CFFF,DSRC=PROM,ЕСА,WRA,ARA=RG1,ALUS=DZ,ALUD=В,RВ=HALF
;
;ЧИТАЕМ ЛК: АДРЕС КОМАНДЫ (32 РАЗРЯДА)
CST12:CONT DSRC=СОМА,ALUS=DА,RА=HALF,FUNC=EXOR,ALUD=В,RВ=У,CEN
CONT SТОРС=21,%CLRTYP%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,%ТУРЕ%
;К О П (МАСКА И СРАВНЕНИЕ)
CONT DSRC=ОРС,ALUS=DА,RА=ВУТЕ,FUNC=AND,Н,ALUD=В,RВ=У
CONT ALUS=АВ,RА=ВУТЕ,RВ=У,FUNC=EXOR,ALUD=В,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
;ИР15 НА УСЛОВИЯХ
CJS А=ERRINF,МАР=РЕ,COND=IR15,IСС,%ТУРЕ%
;ЧИТАЕМ ПО АДРЕСУ IRA
CONT CSM,MNSA=IRA,ALUS=DА,RА=DADR,FUNC=EXOR,ALUD=В,RВ=У,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,FFCNT=SЕТТКК
;
;ЧИТАЕМ ПК: АДРЕС КОМАНДЫ (32 РАЗРЯДА)
CONT DSRC=СОМА,ALUS=DА,RА=HALF,FUNC=EXOR,ALUD=В,RВ=У,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
;К О П
CONT DSRC=ОРС,ALUS=DА,RА=ВУТЕ,FUNC=AND,Н,ALUD=В,RВ=У
CONT ALUS=АВ,RА=ВУТЕ,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
;ИР15 НА УСЛОВИЯХ
CJS А=ERRINF,МАР=РЕ,COND=IR15,IСС,%ТУРЕ%
;ЧИТАЕМ ПО АДРЕСУ IRA
CONT CSM,MNSA=IRA,ALUS=DА,RА=DADR,FUNC=EXOR,ALUD=В,RВ=У,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,FFCNT=CLRTKK
CJP А=CST12,МАР=РЕ,%TIK%
;
;
СТНД13:ENTRY
;===== КОМАНДНОЕ СЛОВО = 0...0F...F (ИЛИ F...F0...0), НОВЫЙ РЕЖИМ
;   РГ.У - ПРОЧИТАННАЯ ИНФОРМАЦИЯ ИЛИ РЕЗ-Т СРАВНЕНИЯ
;   ОШИБКИ: 01 (05): ЧИТАЕМ АК = 0 (АК = F..F)
;           02 (06): - " -  КОП = 0 (КОП = FF)
;           03 (07): ЕСТЬ ИР15 НА УСЛОВИЯХ У КОМАНДЫ = 0 (НЕТ ИР15 У F...F)
;           04 (08): ЧИТАЕМ МОДИФИКАТОР ПО АДРЕСУ IRA = 0 (IRA = F);
;  ВУТЕ - МАСКА НА 8 Р.; HALF - МАСКА НА 32 Р.; DADR - М0; РС - ЗАПИСАННОЕ В SР
;
CJP А=PSST13,МАР=РЕ
PSST13:CONT А=Н13,%TN%
CJS А=INITST,МАР=РЕ
;0 - В РГ/ТГ И ТКК (НАЧИНАЕМ С ЛЕВОЙ КОМАНДЫ)
CONT ALUS=DZ,FUNC=AND,Н,ALU,YDST=CNT,FFCNT=CLRTKK
;МАСКУ НА БАЙТ - В РГ.МПС ВУТЕ, В РНГ
CONT А=МВ,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=ВУТЕ,ALU,YDST=MODGN
;CONST - В РГ.МПС DADR, В 0 МОДИФ. (КОТОРЫЙ ПО АДРЕСУ IRA = 0)
CONT А=СААА,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=DADR,ALU,CSM,WЕМ,MNSA=МР,MODNM=М0
;ДРУГУЮ CONST - В РГ.МПС РС И ПО АДРЕСУ IRA = F
CONT А=С555,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РС,ALU,CSM,WЕМ,MNSA=МР,MODNM=SР
;ЧИТАЕМ CONST 00...FF - В РГ.HALF
CONT А=МН,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=HALF
;ПИШЕМ КОМАНДНОЕ СЛОВО (0...0F...F) - В RG1, В РГ.А
CONT А=МН,DSRC=PROM,ЕСА,WRA,ARA=RG1,ALUS=DZ,Н,ALUD=В,RВ=А
;
;ПРОВЕРЯЕМ КОМАНДУ (0...0): ЧИТАЕМ АДРЕС КОМАНДЫ (32 РАЗРЯДА)
CST13:CONT DSRC=СОМА,ALUS=DZ,ALUD=В,RВ=У,CEN
CONT SТОРС=21,%CLRTYP%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,%ТУРЕ%
;К О П
CONT DSRC=ОРС,ALUS=DА,RА=ВУТЕ,FUNC=AND,Н,ALUD=В,RВ=У,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
;ПРОВЕРЯЕМ ОТСУТСТВИЕ ПРИЗНАКА ИР15
CJS А=ERRINF,МАР=РЕ,COND=IR15,%ТУРЕ%
;ЧИТАЕМ МОДИФИКАТОР ПО АДРЕСУ IRA = 0
CONT CSM,MNSA=IRA,ALUS=DА,RА=DADR,FUNC=EXOR,ALUD=В,RВ=У,CEN
CONT SТОРС=21,%ТУРЕ%
;ПЕРЕХОДИМ К ДРУГОЙ КОМАНДЕ!
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,FFCNT=СНТКК
;
;ЧИТАЕМ КОМАНДУ (F...F): АДРЕС КОМАНДЫ (32 РАЗРЯДА)
CONT DSRC=СОМА,ALUS=DА,RА=HALF,FUNC=EXOR,ALUD=В,RВ=У,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
;К О П
CONT DSRC=ОРС,ALUS=DА,RА=ВУТЕ,FUNC=AND,Н,ALUD=В,RВ=У
CONT ALUS=АВ,RА=ВУТЕ,RВ=У,FUNC=EXOR,ALUD=В,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
;ПРОВЕРЯЕМ ПРИЗНАК ИР15 НА УСЛОВИЯХ
CJS А=ERRINF,МАР=РЕ,COND=IR15,IСС,%ТУРЕ%
;ЧИТАЕМ ПО АДРЕСУ IRA = F
CONT CSM,MNSA=IRA,ALUS=DА,RА=РС,FUNC=EXOR,ALUD=В,RВ=У,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,%TIK%
;ИНВЕРТИРУЕМ КОМАНДНОЕ СЛОВО, НЕ МЕНЯЯ ТКК (НАЧИНАЕМ С ДРУГОЙ ПОЛОВИНЫ)
CJP А=CST13,МАР=РЕ,ALUS=ZА,RА=А,FUNC=EXNOR,Н,ALUD=В,RВ=А,ALU,ЕСВ,WRB,BRA=RG1
;
;
СТНД14:ENTRY
;===== КОМАНДНОЕ СЛОВО = 0...0Х...Х (КОП,АК,ИР ПК - ПЕРЕМЕННЫЕ), НОВЫЙ РЕЖИМ
;   РГ.У - ПРОЧИТАННАЯ ИНФОРМАЦИЯ ИЛИ РЕЗ-Т СРАВНЕНИЯ
;   ОШИБКИ: 01 (04): ЧИТАЕМ АК ЛК (ПК)
;           02 (05): - " -  КОП ЛК (ПК)
;           03 (06): - " -  МОДИФИКАТОР ПО АДРЕСУ IRA ЛК (ПК);
;   ВУТЕ - МАСКА НА БАЙТ; HALF - НА 32Р.;DADR - НА 4Р.;РССОРУ - М0; РС - ПО IRA
;   WR6  - АК; WR5 - КОП; WR4 - ИР; WR3 - "СБОРНАЯ" КОМАНДА; WR2 - РАБОЧИЙ
;
CJP А=PSST14,МАР=РЕ
PSST14:CONT А=Н14,%TN%
CJS А=INITST,МАР=РЕ
;0 - В РГ/ТГ И ТКК: НОВЫЙ РЕЖИМ, ЛЕВАЯ КОМАНДА
CONT ALUS=DZ,FUNC=AND,Н,ALU,YDST=CNT,FFCNT=CLRTKK
;МАСКУ НА БАЙТ - В РГ.МПС ВУТЕ, В РНГ
CONT А=МВ,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=ВУТЕ,ALU,YDST=MODGN
;МАСКУ НА 4 РАЗРЯДА (ДЛЯ IRA) - В DADR
CONT А=С15,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=DADR
;МАСКУ НА 32 РАЗРЯДА - В РГ. HALF
CONT А=МН,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=HALF
;
;НАЧАЛЬНЫЕ ЗНАЧЕНИЯ ПЕРЕМЕННЫМ ДЛЯ ЗАПИСИ В 0 МОДИФ. И ПО АДРЕСУ IRA
CONT А=MWN,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РССОРУ
CONT А=В11,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РС
;ЗАДАЕМ НАЧАЛЬНЫЕ ЗНАЧЕНИЯ ПЕРЕМЕННЫМ ДЛЯ АК,КОП,ИР (В СТАРШИХ РАЗРЯДАХ)
;АДРЕС КОМАНДЫ - WR6 (В 44-64 РАЗРЯДАХ)
CONT А=СААА,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=WR6
CONT ALUS=DZ,Н,ALUD=ВА,RА=WR6,RВ=WR6,ALU,DSRC=SHIFT,MPS,PSHF=SН0-44,SHF=LOG
;КОП - В WR5 (В 57-64 РАЗРЯДАХ)
CONT ALUS=DZ,Н,ALUD=ВА,RА=DADR,RВ=WR5,ALU,DSRC=SHIFT,MPS,PSHF=SН0-56,SHF=LOG
;ИР - В WR4 (В 61-64 РАЗРЯДАХ)
CONT А=В62,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=WR4,СЕМ
;
;"СОБИРАЕМ" ПРАВУЮ КОМАНДУ
;АК - СДВИГ ВПРАВО НА 8 - В WR3
CST14:CONT ALUS=DZ,Н,ALUD=ВА,RА=WR6,RВ=WR3,ALU,DSRC=SHIFT,MPS,PSHF=SН0+8,SHF=LOG
;+ КОП
CONT ALUS=АВ,RА=WR5,RВ=WR3,FUNC=OR,Н,ALUD=В
CONT ALUS=DZ,Н,ALUD=ВА,RА=WR3,RВ=WR3,ALU,DSRC=SHIFT,MPS,PSHF=SН0+4,SHF=LOG
;+ ИР, СДВИГАЕМ НА МЕСТО ПК, ПИШЕМ В RG1 ПО КАНАЛУ А
CONT ALUS=АВ,RА=WR4,RВ=WR3,FUNC=OR,Н,ALUD=В,ALU,DSRC=SHIFT,MPS,PSHF=SН0+32
>,SHF=LOG,ЕСА,WRA,ARA=RG1
;ПИШЕМ В 0 МОДИФ. (КОТОРЫЙ ПО АДРЕСУ IRA ЛК)
CONT ALUS=ZВ,RВ=РССОРУ,Н,CI,ALUD=В,ALU,CSM,WЕМ,MNSA=МР,MODNM=М0
;ПИШЕМ В МОДИФИКАТОР ПО IRA ПК (IRA СДВИГАЕМ В МЛ.РАЗРЯДЫ, ПИШЕМ В АИСП.)
CONT ALUS=DZ,Н,ALUD=ВА,RА=WR4,RВ=WR2,ALU,DSRC=SHIFT,MPS,PSHF=SН0+60,SHF=LOG
CONT ALUS=ZА,RА=WR2,ALU,YDST=ADRREG
;ЕСЛИ N МОДИФ.=0, ЗАПИСИ НЕ ПРОИСХОДИТ
CONT ALUS=ZВ,RВ=РС,Н,CI,ALUD=В,ALU,CSM,WЕМ,MNSA=U
;
;ЧИТАЕМ ЛЕВУЮ КОМАНДУ (0...0)
;АДРЕС КОМАНДЫ (32 РАЗРЯДА)
CONT DSRC=СОМА,ALUS=DZ,ALUD=В,RВ=У,CEN
CONT SТОРС=21,%CLRTYP%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,%ТУРЕ%
;К О П
CONT DSRC=ОРС,ALUS=DА,RА=ВУТЕ,FUNC=AND,Н,ALUD=В,RВ=У,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
;ЧИТАЕМ МОДИФИКАТОР ПО АДРЕСУ IRA ЛК (М0)
CONT CSM,MNSA=IRA,ALUS=DА,RА=РССОРУ,FUNC=EXOR,ALUD=В,RВ=У,CEN
CONT SТОРС=21,%ТУРЕ%
;ТКК = ПК
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,FFCNT=SЕТТКК
;
;ЧИТАЕМ ПРАВУЮ КОМАНДУ (Х...Х)
;ЗАПИСАННЫЙ АК СДВИГАЕМ АРИФМЕТИЧЕСКИ В МЛ. РАЗРЯДЫ
CONT ALUS=DZ,Н,ALUD=ВА,RА=WR6,RВ=WR2,ALU,DSRC=SHIFT,MPS,PSHF=SН0+44,SHF=ARIPH
;АДРЕС КОМАНДЫ (32 РАЗРЯДА)
CONT DSRC=СОМА,ALUS=DА,RА=WR2,FUNC=EXOR,ALUD=В,RВ=У,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
;К О П
CONT ALUS=DZ,Н,ALUD=ВА,RА=WR5,RВ=WR2,ALU,DSRC=SHIFT,MPS,PSHF=SН0+56,SHF=LOG
CONT DSRC=ОРС,ALUS=DА,RА=ВУТЕ,FUNC=AND,Н,ALUD=В,RВ=У
CONT ALUS=АВ,RА=WR2,RВ=У,FUNC=EXOR,ALUD=В,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
;ЧИТАЕМ ПО АДРЕСУ IRA
;ЕСЛИ IRA=0, ЗАПИСИ НЕТ, НАДО СРАВНИВАТЬ С РССОРУ
CONT SТОРС=37
;П/У, ЕСЛИ N МОДИФИКАТОРА (IRA) НЕ РАВЕН 0; СРАВНИВАЕМ С ЗАПИСАННЫМ ПО U
CJP А=IRA0,МАР=РЕ,COND=СТ,SТОРС=37
>,CSM,MNSA=IRA,ALUS=DА,RА=РС,FUNC=EXOR,ALUD=В,RВ=А,CEN
;СРАВНИВАЕМ С ЗАПИСАННЫМ В М0
CONT CSM,MNSA=IRA,ALUS=DА,RА=РССОРУ,FUNC=EXOR,ALUD=В,RВ=А,CEN
IRA0:CONT SТОРС=21,%ТУРЕ%
;ТКК = ЛК
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,FFCNT=CLRTKK
;
;ИЗМЕНЯЕМ АК,КОП,ИР
CONT А=В45,DSRC=PROM,ALUS=DА,RА=WR6,Н,ALUD=В,RВ=WR6
CONT А=В57,DSRC=PROM,ALUS=DА,RА=WR5,Н,ALUD=В,RВ=WR5
CONT А=В61,DSRC=PROM,ALUS=DА,RА=WR4,Н,ALUD=В,RВ=WR4,СЕМ
CJP А=CST14,МАР=РЕ,%TIK%
;
;
СТНД15:ENTRY
;===== ПЕРЕМЕННОЕ КОМАНДНОЕ СЛОВО В НОВОМ РЕЖИМЕ
;   ВУТЕ   - МАСКА НА 8 РАЗРЯДОВ
;   DADR   - МАСКА НА 4 РАЗРЯДА, ЧИСЛО ДЛЯ ЗАПИСИ В М0
;   РС     - МАСКА НА 20 РАЗРЯДОВ
;   А      - КОМАНДНОЕ СЛОВО
;   РССОРУ - ЧИСЛО ДЛЯ ЗАПИСИ ПО АДРЕСУ IRA
;   WR1    - ДОБАВКА К КОМ.СЛОВУ
;   WR2    - РАБОЧИЙ РЕГИСТР
;
;    64  61 60   53 52       33 32  29 28    21 20        1
;   I-----I--------I-----------I------I--------I-----------I
;   IИР ЛKI КОП ЛК I   АК ЛК   IИР ЛК I КОП ЛК I   АК ЛК   I
;   I-----I--------I-----------I------I--------I-----------I
;
CJP А=PSST15,МАР=РЕ
PSST15:CONT А=Н15,%TN%
CJS А=INITST,МАР=РЕ
;0 - В РГ/ТГ
CONT ALUS=DZ,FUNC=AND,Н,ALU,YDST=CNT
;МАСКУ НА БАЙТ - В РГ.МПС ВУТЕ, В РНГ
CONT А=МВ,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=ВУТЕ,ALU,YDST=MODGN
;МАСКУ НА 4 РАЗРЯДА - В РГ. DADR, В 0-Й МОДИФИКАТОР
CONT А=С15,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=DADR,ALU,CSM,WЕМ,MNSA=МР,MODNM=М0
;МАСКУ НА 20 РАЗРЯДОВ - В РГ. РС
CONT А=В21,DSRC=PROM,ALUS=DZ,FUNC=SUBS,Н,ALUD=В,RВ=РС
;НАЧАЛЬНЫЕ ЗНАЧЕНИЯ ДЛЯ КОМАНДНОГО СЛОВА - В А, В RG1
CONT А=NTS,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А,ALU,ЕСВ,WRB,BRA=RG1
;ДЛЯ ЗАПИСИ В МОДИФИКАТОР
CONT А=CTS,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РССОРУ
;ФОРМИРУЕМ CONST: ИР ЛК = КОП ЛК = АК ЛК = 2; ИР ПК = КОП ПК = АК ПК = 1
;(ЧТОБ ШАГ ИЗМЕНЕНИЯ ЛК И ПК БЫЛ РАЗНЫЙ)
CONT А=В29,DSRC=PROM,ALUS=DZ,Н,CI,ALUD=В,RВ=WR1
CONT А=В21,DSRC=PROM,ALUS=DА,RА=WR1,Н,ALUD=В,RВ=WR2
CONT ALUS=DА,FUNC=OR,Н,ALUD=ВА,RА=WR2,RВ=WR1,ALU,DSRC=SHIFT,MPS,PSHF=SН0-33
>,SHF=LOG,FFCNT=SЕТТКК
;
;ЧИТАЕМ ПРАВУЮ КОМАНДУ
;ВЫЧИСЛЯЕМ АДРЕС КОМАНДЫ, РАЗМНОЖАЕМ 20 РАЗРЯД, СРАВНИВАЕМ
;СДВИГАЕМ ЛОГ. ВЛЕВО, ЗАТЕМ АРИФМ.ВПРАВО НА 44, EOR 32 РАЗРЯДА
CST15:CONT ALUS=DZ,Н,ALUD=ВА,RА=А,RВ=WR2,ALU,DSRC=SHIFT,MPS,PSHF=SН0-44,SHF=LOG
CONT ALUS=DZ,Н,ALUD=ВА,RА=WR2,RВ=WR2,ALU,DSRC=SHIFT,MPS,PSHF=SН0+44,SHF=ARIPH
CONT DSRC=СОМА,ALUS=DА,RА=WR2,FUNC=EXOR,ALUD=В,RВ=У,CEN
CONT SТОРС=21,%CLRTYP%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,%ТУРЕ%
;К О П
;КОП ПК - В МЛ.РАЗРЯДЫ
CONT ALUS=DZ,Н,ALUD=ВА,RА=А,RВ=WR2,ALU,DSRC=SHIFT,MPS,PSHF=SН0+20,SHF=LOG
;ЧИТАЕМ, СРАВНИВАЕМ
CONT DSRC=ОРС,ALUS=DА,RА=WR2,FUNC=EXOR,ALUD=В,RВ=У
CONT ALUS=АВ,RА=ВУТЕ,RВ=У,FUNC=AND,Н,ALUD=В,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
;ЧИТАЕМ ПО АДРЕСУ IRA
;СДВИГАЕМ ИР В МЛ.РАЗРЯДЫ, ПИШЕМ В АИСП, ПИШЕМ ПО U В ОЗУ МОДИФ., ЧИТАЕМ ПО IRA
CONT ALUS=DZ,Н,ALUD=ВА,RА=А,RВ=WR2,ALU,DSRC=SHIFT,MPS,PSHF=SН0+28,SHF=LOG
CONT ALUS=АВ,RА=DADR,RВ=WR2,FUNC=AND,ALU,YDST=ADRREG,СЕМ
CONT ALUS=ZВ,RВ=РССОРУ,CI,ALUD=В,ALU,CSM,WЕМ,MNSA=U,SТОРС=37
;ЕСЛИ N МОД. = 0, ЗАПИСИ НЕ Д.БЫТЬ, СРАВНИВАЕМ С ЗАПИСАННЫМ В М0
CJP А=MZ15,МАР=РЕ,COND=СТ,SТОРС=37,CSM,MNSA=IRA,ALUS=DА,RА=РССОРУ,FUNC=EXOR
>,ALUD=В,RВ=У,CEN
CONT CSM,MNSA=IRA,ALUS=DА,RА=DADR,FUNC=EXOR,ALUD=В,RВ=У,CEN
MZ15:CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,FFCNT=CLRTKK
;
;ЧИТАЕМ ЛЕВУЮ КОМАНДУ
;ВЫЧИСЛЯЕМ АДРЕС КОМАНДЫ, РАЗМНОЖАЕМ 20 РАЗРЯД, СРАВНИВАЕМ
;СДВИГАЕМ ЛОГ. ВЛЕВО, ЗАТЕМ АРИФМ.ВПРАВО НА 44, EOR БЕЗ Н
CONT ALUS=DZ,Н,ALUD=ВА,RА=А,RВ=WR2,ALU,DSRC=SHIFT,MPS,PSHF=SН0-12,SHF=LOG
CONT ALUS=DZ,Н,ALUD=ВА,RА=WR2,RВ=WR2,ALU,DSRC=SHIFT,MPS,PSHF=SН0+44,SHF=ARIPH
CONT DSRC=СОМА,ALUS=DА,RА=WR2,FUNC=EXOR,ALUD=В,RВ=У,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
;К О П
;КОП ЛК - В МЛ.РАЗРЯДЫ
CONT ALUS=DZ,Н,ALUD=ВА,RА=А,RВ=WR2,ALU,DSRC=SHIFT,MPS,PSHF=SН0+52,SHF=LOG
;ЧИТАЕМ, СРАВНИВАЕМ
CONT DSRC=ОРС,ALUS=DА,RА=WR2,FUNC=EXOR,ALUD=В,RВ=У
CONT ALUS=АВ,RА=ВУТЕ,RВ=У,FUNC=AND,Н,ALUD=В,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
;ЧИТАЕМ ПО АДРЕСУ IRA
;СДВИГАЕМ ИР В МЛ.РАЗРЯДЫ, ПИШЕМ В АИСП, ПИШЕМ ПО U В ОЗУ МОДИФ., ЧИТАЕМ ПО IRA
CONT ALUS=DZ,Н,ALUD=ВА,RА=А,RВ=WR2,ALU,DSRC=SHIFT,MPS,PSHF=SН0+60,SHF=LOG
CONT ALUS=АВ,RА=DADR,RВ=WR2,FUNC=AND,ALU,YDST=ADRREG,СЕМ
CONT ALUS=ZВ,RВ=РССОРУ,CI,ALUD=В,ALU,CSM,WЕМ,MNSA=U,SТОРС=37
;ЕСЛИ N МОД. = 0, СРАВНИВАЕМ С ЗАПИСАННЫМ В М0
CJP А=MDZ15,МАР=РЕ,COND=СТ,SТОРС=37,CSM,MNSA=IRA,ALUS=DА,RА=РССОРУ,FUNC=EXOR
>,ALUD=В,RВ=У,CEN
CONT CSM,MNSA=IRA,ALUS=DА,RА=DADR,FUNC=EXOR,ALUD=В,RВ=У,CEN
MDZ15:CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,%TIK%
;МЕНЯЕМ КОМАНДНОЕ СЛОВО
CJP А=CST15,МАР=РЕ,ALUS=АВ,RА=WR1,RВ=А,Н,ALUD=В
>,ALU,ЕСВ,WRB,BRA=RG1,FFCNT=SЕТТКК
;
;
СТНД16:ENTRY
;===== РАЗНЫЕ ФОРМАТЫ КОМАНДНОГО СЛОВА В РЕЖИМЕ ЭМУЛЯЦИИ
;   РГ.У - ПРОЧИТАННАЯ ИНФОРМАЦИЯ ИЛИ РЕЗ-Т СРАВНЕНИЯ
;   ВУТЕ - МАСКА НА БАЙТ
;   WR1  - 7000 - ДОПОЛНЕНИЕ К КОРОТКОМУ АДРЕСУ
;   HALF - МАСКА НА 15 Р.
;   РС   - М0
;   DADR - С0 (ДЛЯ СРАВНЕНИЯ КОП)
;
;ДЛИННОАДРЕСНЫЙ КОП:
;   64 63 60 59 57 56(1) 52 51       37 36 33 32(1) 28 27       13 12  1
;   I--I-----I-----I--------I-----------I-----I--------I-----------I-----I
;   IИPI/////IИР ЛKI КОП ЛК I   АК ЛК   IИР ПKI КОП ПК I   АК ПК   I/////I
;   I--I-----I-----I--------I-----------I-----I--------I-----------I-----I
;   64 63 60 59 57 56(0) 49 48       37 36 33 32(0) 25 24       13 12  1
;КОРОТКОАДРЕСНЫЙ КОП:
;
CJP А=PSST16,МАР=РЕ
PSST16:CONT А=Н16,%TN%
CJS А=INITST,МАР=РЕ
;МАСКУ НА БАЙТ - В РГ.МПС ВУТЕ, В РНГ
CONT А=МВ,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=ВУТЕ,ALU,YDST=MODGN
;CONST - В РГ.МПС РС, В 0 МОДИФ.
CONT А=СААА,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РС,ALU,CSM,WЕМ,MNSA=МР,MODNM=М0
;
;ФОРМИРУЕМ РЕЖИМ ЭМУЛЯЦИИ В ЦП + БЛОКИРОВКИ - В РР + ЛК
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT,FFCNT=CLRTKK
;3 - В АИСП, RG3 TEGA
CONT А=С3,DSRC=PROM,ALUS=DZ,ALU,YDST=ADRREG,YDEVT=ECBTAG,WRB,BRA=RG3
>,ЕСА,WRA,ARA=RG3
;ФИЗ.АДРЕС - В RG0; МАСКУ НА 15 РАЗР. - В HALF
CONT А=М15,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=HALF
>,YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
WAW16:CJP А=WAW16,МАР=РЕ,COND=ARBRDY,IСС
;ЧИТАЕМ ПО ТОМУ ЖЕ АДРЕСУ; МАСКУ НА КОРОТКИЙ АДРЕС С ДОБАВЛ."1" (7000) - В WR1
CONT А=САК,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=WR1,YDEV=PHYSAD,ARBI=FЕТСН
WAR16:CJP А=WAR16,МАР=РЕ,COND=ARBRDY,IСС
;
;===== ДЛИННОАДРЕСНЫЙ КОП
;КОМ.СЛОВО: "1" В 56 И В 32 РАЗРЯДЕ
CST16:CONT А=В56,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=WR6
CONT А=В32,DSRC=PROM,ALUS=DА,RА=WR6,Н,ALUD=В,RВ=WR6,ALU,ЕСВ,WRB,BRA=RG1
;
;INTR=1; ЧИТАЕМ ЛК: АДРЕС КОМАНДЫ (ЕСЛИ 32 Р.=0, 16-32 РАЗРЯДЫ ЗАПОЛНЯЮТСЯ 0)
CONT DSRC=СОМА,ALUS=DZ,ALUD=В,RВ=У,CEN
CONT SТОРС=21,%CLRTYP%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,%ТУРЕ%
;К О П
CONT DSRC=ОРС,ALUS=DА,RА=ВУТЕ,FUNC=AND,Н,ALUD=В,RВ=У
;INTR=2; СРАВНИВАЕМ С 1 В 8 РАЗРЯДЕ
CONT А=В8,DSRC=PROM,ALUS=DА,RА=У,FUNC=EXOR,Н,ALUD=В,RВ=У,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
;INTR=3; ЧИТАЕМ ПО АДРЕСУ IRA
CONT CSM,MNSA=IRA,ALUS=DА,RА=РС,FUNC=EXOR,ALUD=В,RВ=У,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,FFCNT=SЕТТКК
;
;INTR=4; ПК: АДРЕС КОМАНДЫ (32 РАЗРЯДА = 0)
CONT DSRC=СОМА,ALUS=DZ,ALUD=В,RВ=У,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
;INTR=5; К О П
CONT DSRC=ОРС,ALUS=DА,RА=ВУТЕ,FUNC=AND,Н,ALUD=В,RВ=У
CONT А=В8,DSRC=PROM,ALUS=DА,RА=У,FUNC=EXOR,Н,ALUD=В,RВ=У,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
;INTR=6; ЧИТАЕМ ПО АДРЕСУ IRA
CONT CSM,MNSA=IRA,ALUS=DА,RА=РС,FUNC=EXOR,ALUD=В,RВ=У,CEN
CONT МАР=РЕ,SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,FFCNT=CLRTKK
;
;ФОРМИРУЕМ КОМ.СЛОВО С 1 В 56,55; 32,31; 1-15 РАЗРЯДАХ
CONT ALUS=DА,FUNC=OR,Н,ALUD=ВА,RА=WR6,RВ=WR6,ALU,DSRC=SHIFT,MPS,PSHF=SН0+1
>,SHF=LOG
CONT ALUS=АВ,RА=HALF,RВ=WR6,Н,ALUD=В,ALU,ЕСВ,WRB,BRA=RG1
;ЧИТАЕМ "1" В 7-8 РАЗРЯДАХ ДЛЯ СРАВНЕНИЯ КОП'А (С0)
CONT А=НС0,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=DADR
;
;INTR=7; ЧИТАЕМ ЛК: АДРЕС КОМАНДЫ (32 РАЗРЯДА)
CONT DSRC=СОМА,ALUS=DZ,ALUD=В,RВ=У,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
;К О П
CONT DSRC=ОРС,ALUS=DА,RА=ВУТЕ,FUNC=AND,Н,ALUD=В,RВ=У
;INR=8; СРАВНИВАЕМ С 1 В 8,7 РАЗРЯДАХ
CONT ALUS=АВ,RА=DADR,RВ=У,FUNC=EXOR,Н,ALUD=В,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
;INTR=9; ЧИТАЕМ ПО АДРЕСУ IRA
CONT CSM,MNSA=IRA,ALUS=DА,RА=РС,FUNC=EXOR,ALUD=В,RВ=У,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,FFCNT=SЕТТКК
;
;INTR=А; ПК: АДРЕС КОМАНДЫ (32 РАЗРЯДА, 1-3 Р. = 1, ОСТАЛЬНЫЕ "1" - МИМО)
CONT DSRC=СОМА,ALUS=DZ,ALUD=В,RВ=У
CONT А=С7,DSRC=PROM,ALUS=DА,RА=У,FUNC=EXOR,ALUD=В,RВ=У,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
;INTR=В; К О П
CONT DSRC=ОРС,ALUS=DА,RА=ВУТЕ,FUNC=AND,Н,ALUD=В,RВ=У
CONT ALUS=АВ,RА=DADR,RВ=У,FUNC=EXOR,Н,ALUD=В,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
;INTR=С; ЧИТАЕМ ПО АДРЕСУ IRA
CONT CSM,MNSA=IRA,ALUS=DА,RА=РС,FUNC=EXOR,ALUD=В,RВ=У,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,FFCNT=CLRTKK
;
;===== КОРОТКОАДРЕСНЫЙ КОП
;КОМ.СЛОВО: "1" В 55 И В 31 РАЗРЯДЕ
CONT А=В55,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=WR6
CONT А=В31,DSRC=PROM,ALUS=DА,RА=WR6,Н,ALUD=В,RВ=WR6,ALU,ЕСВ,WRB,BRA=RG1
;
;INTR=D; ЛК: АДРЕС КОМАНДЫ = 70000, 13-15 РАЗРЯДЫ = 1
CONT DSRC=СОМА,ALUS=DА,RА=WR1,FUNC=EXOR,ALUD=В,RВ=У,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
;К О П
CONT DSRC=ОРС,ALUS=DА,RА=ВУТЕ,FUNC=AND,Н,ALUD=В,RВ=У
;INTR=Е; СРАВНИВАЕМ С 1 В 7 РАЗРЯДЕ
CONT А=В7,DSRC=PROM,ALUS=DА,RА=У,FUNC=EXOR,Н,ALUD=В,RВ=У,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
;INTR=F; ЧИТАЕМ ПО АДРЕСУ IRA
CONT CSM,MNSA=IRA,ALUS=DА,RА=РС,FUNC=EXOR,ALUD=В,RВ=У,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,FFCNT=SЕТТКК
;
;INR=10; ПК: АДРЕС КОМАНДЫ, 13-15 РАЗРЯДЫ = 1
CONT DSRC=СОМА,ALUS=DА,RА=WR1,FUNC=EXOR,ALUD=В,RВ=У,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
;INTR=11; К О П
CONT DSRC=ОРС,ALUS=DА,RА=ВУТЕ,FUNC=AND,Н,ALUD=В,RВ=У
CONT А=В7,DSRC=PROM,ALUS=DА,RА=У,FUNC=EXOR,Н,ALUD=В,RВ=У,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
;INTR=12; ЧИТАЕМ ПО АДРЕСУ IRA
CONT CSM,MNSA=IRA,ALUS=DА,RА=РС,FUNC=EXOR,ALUD=В,RВ=У,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,%TIK%
CJP А=CST16,МАР=РЕ,FFCNT=CLRTKK
;
СТНД17:ENTRY
;===== КОМАНДНОЕ СЛОВО = "0",  РЕЖИМ ЭМУЛЯЦИИ
;   РГ.У - ПРОЧИТАННАЯ ИНФОРМАЦИЯ
;   ОШИБКИ: 01 (05): ЧИТАЕМ АК ЛК (ПК)
;           02 (06): - " -  КОП ЛК (ПК)
;           03 (07): ЕСТЬ ПРИЗНАК ИР15 В ЛК (ПК)
;           04 (08): СИТАЕМ МОДИФИКАТОР ПО АДРЕСУ IRA ЛК (ПК);
;   ВУТЕ - МАСКА НА БАЙТ, РС - ЗАПИСАННОЕ В М0
;
CJP А=PSST17,МАР=РЕ
PSST17:CONT А=Н17,%TN%
CJS А=INITST,МАР=РЕ
;УСТАНАВЛИВАЕМ РЭ: БП,БПТЗ = 1
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT,FFCNT=CLRTKK
;МАТ.АДРЕС - В АИСП, РЭ (1,2Р.=1) - В ТЕГ
CONT А=С3,DSRC=PROM,ALUS=DZ,ALU,YDST=ADRREG,YDEVT=ECBTAG,WRB,BRA=RG3
;ФИЗ.АДРЕС
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
WА17:CJP А=WА17,МАР=РЕ,COND=ARBRDY,IСС
;ФИЗ.АДРЕС НА ЧТЕНИЕ
CONT YDEV=PHYSAD,ARBI=FЕТСН
WAR17:CJP А=WAR17,МАР=РЕ,COND=ARBRDY,IСС
;МАСКУ НА БАЙТ - В РГ.МПС ВУТЕ, В РНГ
CONT А=МВ,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=ВУТЕ,ALU,YDST=MODGN
;CONST - В РГ.МПС РС, В 0 МОДИФ. (КОТОРЫЙ ПО АДРЕСУ IRA)
CONT А=СААА,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РС,ALU,CSM,WЕМ,MNSA=МР,MODNM=М0
;0 - В RG1 (КОМАНДНОЕ СЛОВО)
CONT ALUS=ZА,FUNC=AND,Н,ALU,ЕСВ,WRB,BRA=RG1
;
;ЧИТАЕМ ЛК: АДРЕС КОМАНДЫ (32 РАЗРЯДА)
CST17:CONT DSRC=СОМА,ALUS=DZ,ALUD=В,RВ=У,CEN
CONT SТОРС=21,%CLRTYP%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,%ТУРЕ%
;К О П
CONT DSRC=ОРС,ALUS=DА,RА=ВУТЕ,FUNC=AND,Н,ALUD=В,RВ=У,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
;ПРОВЕРЯЕМ ОТСУТСТВИЕ ИР15
CJS А=ERRINF,МАР=РЕ,COND=IR15,%ТУРЕ%
;ЧИТАЕМ ПО АДРЕСУ IRA
CONT CSM,MNSA=IRA,ALUS=DА,RА=РС,FUNC=EXOR,ALUD=В,RВ=У,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,FFCNT=SЕТТКК
;
;ПРОВЕРЯЕМ ПК: ЧИТАЕМ АДРЕС КОМАНДЫ (32 РАЗРЯДА)
CONT DSRC=СОМА,ALUS=DZ,ALUD=В,RВ=У,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
;К О П
CONT DSRC=ОРС,ALUS=DА,RА=ВУТЕ,FUNC=AND,Н,ALUD=В,RВ=У,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
;ПРИЗНАК ИР15
CJS А=ERRINF,МАР=РЕ,COND=IR15,%ТУРЕ%
;ЧИТАЕМ ПО АДРЕСУ IRA
CONT CSM,MNSA=IRA,ALUS=DА,RА=РС,FUNC=EXOR,ALUD=В,RВ=У,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,FFCNT=CLRTKK
CJP А=CST17,МАР=РЕ,%TIK%
;
;
СТНД18:ENTRY
;===== КОМАНДНОЕ СЛОВО = FF...FF, РЕЖИМ ЭМУЛЯЦИИ
;   РГ.У - РЕЗ-Т СРАВНЕНИЯ (EOR)
;   ОШИБКИ: 01 (05): ЧИТАЕМ АК ЛК (ПК)
;           02 (06): - " -  КОП ЛК (ПК)
;           03 (07): НЕТ ПРИЗНАКА ИР15 В ЛК (ПК)
;           04 (08): ЧИТАЕМ МОДИФИКАТОР ПО АДРЕСУ IRA ЛК (ПК)
;  ВУТЕ - МАСКА НА БАЙТ; HALF - НА 15Р.; DADR = F8 - НА КОРОТКИЙ КОП; РС - SР
;
CJS А=PSST18,МАР=РЕ
PSST18:CONT А=Н18,%TN%
CJS А=INITST,МАР=РЕ
;УСТАНАВЛИВАЕМ РЕЖИМ ЭМУЛЯЦИИ
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT,FFCNT=CLRTKK
CONT А=С3,DSRC=PROM,ALUS=DZ,ALU,YDST=ADRREG,YDEVT=ECBTAG,WRB,BRA=RG3
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
WAW18:CJP А=WAW18,МАР=РЕ,COND=ARBRDY,IСС
;МАСКУ НА 15 РАЗР.- В РГ.HALF
CONT А=М15,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=HALF,YDEV=PHYSAD,ARBI=FЕТСН
WAR18:CJP А=WAR18,МАР=РЕ,COND=ARBRDY,IСС
;МАСКУ НА БАЙТ - В РГ.МПС ВУТЕ, В РНГ
CONT А=МВ,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=ВУТЕ,ALU,YDST=MODGN
;МАСКУ НА КОРОТКИЙ КОП (F8) - EXPN
CONT А=С7,DSRC=PROM,ALUS=DА,RА=ВУТЕ,FUNC=EXOR,Н,ALUD=В,RВ=DADR
;CONST - В РГ.МПС РС, В 15 МОДИФ. (КОТОРЫЙ ПО АДРЕСУ IRA)
CONT А=С555,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РС,ALU,CSM,WЕМ,MNSA=МР,MODNM=SР
;FF...FF - В RG1 БОИ
CONT А=CFFF,DSRC=PROM,ЕСА,WRA,ARA=RG1
;
;ПРОВЕРЯЕМ ЛК: ЧИТАЕМ АДРЕС КОМАНДЫ (32 РАЗРЯДА)
CST18:CONT DSRC=СОМА,ALUS=DА,RА=HALF,FUNC=EXOR,ALUD=В,RВ=У
;МАСКА НА 15 РАЗРЯДОВ
CONT ALUS=АВ,RА=HALF,RВ=У,FUNC=AND,ALUD=В,CEN
CONT SТОРС=21,%CLRTYP%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,%ТУРЕ%
;К О П (МАСКА И СРАВНЕНИЕ С F8)
CONT DSRC=ОРС,ALUS=DА,RА=ВУТЕ,FUNC=AND,Н,ALUD=В,RВ=У
CONT ALUS=АВ,RА=DADR,RВ=У,FUNC=EXOR,ALUD=В,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
;ИР15
CJS А=ERRINF,МАР=РЕ,COND=IR15,IСС,%ТУРЕ%
;ЧИТАЕМ ПО АДРЕСУ IRA
CONT CSM,MNSA=IRA,ALUS=DА,RА=РС,FUNC=EXOR,ALUD=В,RВ=У,CEN
CONT SТОРС=21,%ТУРЕ%
;ТКК = ПК
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,FFCNT=SЕТТКК
;
;ПРОВЕРЯЕМ ПК: ЧИТАЕМ АДРЕС КОМАНДЫ (32 РАЗРЯДА)
CONT DSRC=СОМА,ALUS=DА,RА=HALF,FUNC=EXOR,ALUD=В,RВ=У
;МАСКА НА 15 РАЗР.
CONT ALUS=АВ,RА=HALF,RВ=У,FUNC=AND,ALUD=В,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
;К О П
CONT DSRC=ОРС,ALUS=DА,RА=ВУТЕ,FUNC=AND,Н,ALUD=В,RВ=У
CONT ALUS=АВ,RА=DADR,RВ=У,FUNC=EXOR,ALUD=В,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
;ИР15
CJS А=ERRINF,МАР=РЕ,COND=IR15,IСС,%ТУРЕ%
;ЧИТАЕМ ПО АДРЕСУ IRA
CONT CSM,MNSA=IRA,ALUS=DА,RА=РС,FUNC=EXOR,ALUD=В,RВ=У,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,%TIK%
CJP А=CST18,МАР=РЕ,FFCNT=CLRTKK
;
;
СТНД19:ENTRY
;===== КОМАНДНОЕ СЛОВО = 0...0(ЛК) F...F(ПК) ИЛИ НАОБОРОТ; РЕЖИМ ЭМУЛЯЦИИ
;   РГ.У - ПРОЧИТАННАЯ ИНФОРМАЦИЯ ИЛИ РЕЗ-Т СРАВНЕНИЯ
;   ОШИБКИ: 01 (05): ЧИТАЕМ АК КОМАНДЫ 0 (F...F)
;           02 (06): - " -  КОП КОМАНДЫ 0 ((F...F)
;           03 (07): НЕ ТОТ ПРИЗНАК ИР15 В КОМАНДЕ 0 (F...F)
;           04 (08): ЧИТАЕМ МОДИФИКАТОР ПО АДРЕСУ IRA КОМАНДЫ 0 (F...F)
;   ВУТЕ - МАСКА НА БАЙТ; WR1 = F8 - НА КОРОТКИЙ КОП; HALF - НА 15Р.;
;   РС - ЗАПИСАННОЕ В М0; РССОРУ - В ИР15; А - ТЕКУЩЕЕ КОМАНДНОЕ СЛОВО
;
CJP А=PSST19,МАР=РЕ
PSST19:CONT А=Н19,%TN%
CJS А=INITST,МАР=РЕ
;УСТАНАВЛИВАЕМ РЭ:
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT,FFCNT=CLRTKK
CONT А=С3,DSRC=PROM,ALUS=DZ,ALU,YDST=ADRREG,YDEVT=ECBTAG,WRB,BRA=RG3
CONT YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
WAW19:CJP А=WAW19,МАР=РЕ,COND=ARBRDY,IСС
;МАСКУ НА 15 РАЗР. - В HALF
CONT А=М15,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=HALF,YDEV=PHYSAD,ARBI=FЕТСН
WAR19:CJP А=WAR19,МАР=РЕ,COND=ARBRDY,IСС
;
;МАСКУ НА БАЙТ - В РГ.МПС ВУТЕ, В РНГ
CONT А=МВ,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=ВУТЕ,ALU,YDST=MODGN
;МАСКУ НА КОРОТКИЙ КОП В РЭ (F8) - В РГ. WR1
CONT А=С7,DSRC=PROM,ALUS=DА,RА=ВУТЕ,FUNC=EXOR,Н,ALUD=В,RВ=WR1
;CONST - В РГ.МПС РС, В 0 МОДИФ. (КОТОРЫЙ ПО АДРЕСУ IRA ЛК)
CONT А=СААА,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РС,ALU,CSM,WЕМ,MNSA=МР,MODNM=М0
;ДРУГУЮ CONST - В РГ.МПС РССОРУ И ПО АДРЕСУ IRA ПК
CONT А=С555,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РССОРУ,ALU,CSM,WЕМ,MNSA=МР,MODNM=SР
;ПИШЕМ КОМАНДНОЕ СЛОВО (0...0F...F) - В RG1, ВОДОРАЗДЕЛ - МЕЖДУ 37,36 РАЗРЯДАМИ
CONT А=В37,DSRC=PROM,ALUS=DZ,FUNC=SUBS,Н,ALUD=В,RВ=А,ALU,ЕСВ,WRB,BRA=RG1
;
;ЧИТАЕМ КОМАНДУ 0...0: АДРЕС КОМАНДЫ (32 РАЗРЯДА = 0)
CST19:CONT DSRC=СОМА,ALUS=DZ,ALUD=В,RВ=У,CEN
CONT SТОРС=21,%CLRTYP%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,%ТУРЕ%
;К О П
CONT DSRC=ОРС,ALUS=DА,RА=ВУТЕ,FUNC=AND,Н,ALUD=В,RВ=У,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
;ИР15
CJS А=ERRINF,МАР=РЕ,COND=IR15,%ТУРЕ%
;ЧИТАЕМ МОДИФИКАТОР ПО АДРЕСУ IRA (М0)
CONT CSM,MNSA=IRA,ALUS=DА,RА=РС,FUNC=EXOR,ALUD=В,RВ=У,CEN
CONT SТОРС=21,%ТУРЕ%
;МЕНЯЕМ ТКК
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,FFCNT=СНТКК
;
;ПК, F...F: АДРЕС КОМАНДЫ (32 РАЗРЯДА, ИЗ КОТОРЫХ 1-15 = F...F)
CONT DSRC=СОМА,ALUS=DА,RА=HALF,FUNC=EXOR,ALUD=В,RВ=У,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
;К О П
CONT DSRC=ОРС,ALUS=DА,RА=ВУТЕ,FUNC=AND,Н,ALUD=В,RВ=У
;СРАВНИВАЕМ С F8:
CONT ALUS=АВ,RА=WR1,RВ=У,FUNC=EXOR,ALUD=В,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
;ИР15
CJS А=ERRINF,МАР=РЕ,COND=IR15,IСС,%ТУРЕ%
;ЧИТАЕМ МОДИФИКАТОР ПО АДРЕСУ IRA (SР)
CONT CSM,MNSA=IRA,ALUS=DА,RА=РССОРУ,FUNC=EXOR,ALUD=В,RВ=У,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,%TIK%
;ИНВЕРТИРУЕМ КОМАНДНОЕ СЛОВО, НЕ МЕНЯЯ ТКК; ИДЕМ НА ЦИКЛ
CJP А=CST19,МАР=РЕ,ALUS=ZА,RА=А,FUNC=EXNOR,Н,ALUD=В,RВ=А,ALU,ЕСВ,WRB,BRA=RG1
;
;
СТНД1А:ENTRY
;===== ПЕРЕМЕННОЕ КОМАНДНОЕ СЛОВО В РЕЖИМЕ ЭМУЛЯЦИИ
;   РГ.У - ПРОЧИТАННАЯ ИНФОРМАЦИЯ ИЛИ РЕЗ-Т СРАВНЕНИЯ
;   ОШИБКИ: 01 (04): ЧИТАЕМ АК ЛК (ПК)
;           02 (05): - " -  КОП ЛК (ПК)
;           03 (06): - " -  МОДИФИКАТОР ПО АДРЕСУ IRA ЛК (ПК);
;   ВУТЕ - МАСКА НА БАЙТ; HALF - НА 13-15Р.; DADR - НА 4Р. И М0; РС - НА 15Р.
;   А - КОМАНДНОЕ СЛОВО; РССОРУ - IRA; WR1 - ДОБАВКА К КОМ.СЛОВУ; WR2 - РАБОЧИЙ
;
CJP А=PSST1A,МАР=РЕ
PSST1A:CONT А=Н1А,%TN%
CJS А=INITST,МАР=РЕ
;УСТАНАВЛИВАЕМ РЭ
CONT А=CTEST,DSRC=PROM,ALUS=DZ,ALU,YDST=CNT
CONT А=С3,DSRC=PROM,ALUS=DZ,ALU,YDST=ADRREG,YDEVT=ECBTAG,WRB,BRA=RG3
;МАСКУ НА 13-15 РАЗР.ДЛЯ АК - В HALF
CONT А=САК,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=HALF
>,YDEV=PHYSAD,ЕСВ,WRB,BRA=RG0,ARBI=DWR
WAW:CJP А=WAW,МАР=РЕ,COND=ARBRDY,IСС
;МАСКУ НА 15 РАЗР.- В РС
CONT А=М15,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РС,YDEV=PHYSAD,ARBI=FЕТСН
WAR:CJP А=WAR,МАР=РЕ,COND=ARBRDY,IСС
;
;МАСКУ НА БАЙТ - В РГ.МПС ВУТЕ, В РНГ
CONT А=МВ,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=ВУТЕ,ALU,YDST=MODGN
;МАСКУ НА 13-15 РАЗРЯДЫ ДЛЯ АК - В HALF
;МАСКУ НА 4 РАЗРЯДА - В РГ. DADR, В М0
CONT А=С15,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=DADR,ALU,CSM,WЕМ,MNSA=МР,MODNM=М0
;НАЧАЛЬНЫЕ ЗНАЧЕНИЯ ДЛЯ КОМАНДНОГО СЛОВА - В А, В КОМ.СЛОВО
CONT А=СААА,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А,ЕСА,WRA,ARA=RG1
;ДЛЯ ЗАПИСИ В МОДИФИКАТОР
CONT А=CTS,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=РССОРУ
;ЧИТАЕМ CONST С "1" В РАЗНЫХ РАЗРЯДАХ (ДОБАВКА К КОМ.СЛОВУ)
CONT А=СОРС,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=WR1,FFCNT=SЕТТКК
;
;ЧИТАЕМ ПРАВУЮ КОМАНДУ
;ПРОВЕРЯЕМ СТ.РАЗРЯД КОП
CST1A:CONT А=В32,DSRC=PROM,ALUS=DА,RА=А,FUNC=AND,Н,СЕМ
;И СЛЕДУЮЩИЙ
CONT А=В31,DSRC=PROM,ALUS=DА,RА=А,FUNC=AND,Н,CEN,SТОРС=37
;АДРЕС КОМАНДЫ - В МЛ.РАЗРЯДЫ, П/У, ЕСЛИ СТ.РАЗРЯДЫ КОП = 1
CJP А=LONG,МАР=РЕ,COND=СТ,SТОРС=37
>,ALUS=DZ,Н,ALUD=ВА,RА=А,RВ=WR2,ALU,DSRC=SHIFT,MPS,PSHF=SН0+12,SHF=LOG
;НАДО ВПРАВЛЯТЬ 13-15 РАЗРЯДЫ, АДРЕС - КОРОТКИЙ, СТ.РАЗРЯДЫ КОП=0
CONT SТОРС=21
;ПОДСТАВЛЯЕМ 1
CJP А=LONG,МАР=РЕ,COND=СТ,SТОРС=21,ALUS=АВ,RА=HALF,RВ=WR2,FUNC=OR,ALUD=В
;ПОДСТАВЛЯЕМ 0
CONT ALUS=АВ,RА=HALF,RВ=WR2,FUNC=EXOR,ALUD=В
;СРАВНИВАЕМ 15 РАЗРЯДОВ
LONG:CONT DSRC=СОМА,ALUS=DА,RА=WR2,FUNC=EXOR,ALUD=В,RВ=У
CONT ALUS=АВ,RА=РС,RВ=У,FUNC=AND,Н,ALUD=В,CEN
CONT SТОРС=21,%CLRTYP%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,%ТУРЕ%
;К О П
;КОП ПК - В МЛ.РАЗРЯДЫ
;ПРОВЕРЯЕМ, ДЛИННЫЙ ЛИ КОП
CONT SТОРС=36
CJP А=LОРС,МАР=РЕ,COND=СТ,SТОРС=36
>,ALUS=DZ,Н,ALUD=ВА,RА=А,RВ=WR2,ALU,DSRC=SHIFT,MPS,PSHF=SН0+24,SHF=LOG
;ОБНУЛЯЕМ МЛ.3 РАЗРЯДА КОП (ТАМ ДЛИННЫЙ АДРЕС)
CONT А=С7,DSRC=PROM,ALUS=DА,RА=WR2,FUNC=NOTRS,ALUD=В,RВ=WR2
;ЧИТАЕМ, СРАВНИВАЕМ
LОРС:CONT DSRC=ОРС,ALUS=DА,RА=WR2,FUNC=EXOR,ALUD=В,RВ=У
CONT ALUS=АВ,RА=ВУТЕ,RВ=У,FUNC=AND,Н,ALUD=В,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
;ЧИТАЕМ ПО АДРЕСУ IRA
;СДВИГАЕМ ИР В МЛ.РАЗРЯДЫ, ПИШЕМ В АИСП, ПИШЕМ ПО U В ОЗУ МОДИФ., ЧИТАЕМ ПО IRA
CONT ALUS=DZ,Н,ALUD=ВА,RА=А,RВ=WR2,ALU,DSRC=SHIFT,MPS,PSHF=SН0+32,SHF=LOG
CONT ALUS=АВ,RА=DADR,RВ=WR2,FUNC=AND,ALU,YDST=ADRREG,СЕМ
CONT ALUS=ZВ,RВ=РССОРУ,CI,ALUD=В,ALU,CSM,WЕМ,MNSA=U,SТОРС=37
;ЕСЛИ N МОД. = 0, СРАВНИВАЕМ С ЗАПИСАННЫМ В М0 РАНЬШЕ
CJP А=MD0,МАР=РЕ,COND=СТ,SТОРС=37,CSM,MNSA=IRA,ALUS=DА,RА=РССОРУ,FUNC=EXOR
>,ALUD=В,RВ=У,CEN
CONT CSM,MNSA=IRA,ALUS=DА,RА=DADR,FUNC=EXOR,ALUD=В,RВ=У,CEN
MD0:CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,FFCNT=CLRTKK
;
;ЛК: ПРОВЕРЯЕМ СТ.РАЗРЯД КОП
CONT А=В56,DSRC=PROM,ALUS=DА,RА=А,FUNC=AND,Н,СЕМ
;И СЛЕДУЮЩИЙ
CONT А=В55,DSRC=PROM,ALUS=DА,RА=А,FUNC=AND,Н,CEN,SТОРС=37
;АДРЕС КОМАНДЫ - В МЛ.РАЗРЯДЫ
CJP А=LONGR,МАР=РЕ,COND=СТ,SТОРС=37
>,ALUS=DZ,Н,ALUD=ВА,RА=А,RВ=WR2,ALU,DSRC=SHIFT,MPS,PSHF=SН0+36,SHF=LOG
;НАДО ВПРАВЛЯТЬ 13-15 РАЗРЯДЫ
CONT SТОРС=21
;ПОДСТАВЛЯЕМ 1
CJP А=LONGR,МАР=РЕ,COND=СТ,SТОРС=21,ALUS=АВ,RА=HALF,RВ=WR2,FUNC=OR,ALUD=В
;ПОДСТАВЛЯЕМ 0
CONT ALUS=АВ,RА=HALF,RВ=WR2,FUNC=EXOR,ALUD=В
;СРАВНИВЕМ 15 РАЗРЯДОВ
LONGR:CONT DSRC=СОМА,ALUS=DА,RА=WR2,FUNC=EXOR,ALUD=В,RВ=У
CONT ALUS=АВ,RА=РС,RВ=У,FUNC=AND,Н,ALUD=В,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
;К О П
;КОП ЛК - В МЛ.РАЗРЯДЫ
;ПРОВЕРЯЕМ, ДЛИННЫЙ ЛИ КОП
CONT SТОРС=36
CJP А=LOPCR,МАР=РЕ,COND=СТ,SТОРС=36
>,ALUS=DZ,Н,ALUD=ВА,RА=А,RВ=WR2,ALU,DSRC=SHIFT,MPS,PSHF=SН0+48,SHF=LOG
;ОБНУЛЯЕМ МЛ.3 РАЗРЯДА КОП, ЕСЛИ ОН КОРОТКИЙ
CONT А=С7,DSRC=PROM,ALUS=DА,RА=WR2,FUNC=NOTRS,ALUD=В,RВ=WR2
;ЧИТАЕМ, СРАВНИВАЕМ
LOPCR:CONT DSRC=ОРС,ALUS=DА,RА=WR2,FUNC=EXOR,ALUD=В,RВ=У
CONT ALUS=АВ,RА=ВУТЕ,RВ=У,FUNC=AND,Н,ALUD=В,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
;ЧИТАЕМ ПО АДРЕСУ IRA
;СДВИГАЕМ ИР В МЛ.РАЗРЯДЫ, ПИШЕМ В АИСП, ПИШЕМ ПО U В ОЗУ МОДИФ., ЧИТАЕМ ПО IRA
;СНАЧАЛА УБИРАЕМ "ДЫРУ" В ПОРЯДКЕ (СДВИГ АРИФМ.ВЛЕВО НА 4)
CONT ALUS=DZ,Н,ALUD=ВА,RА=А,RВ=WR2,ALU,DSRC=SHIFT,MPS,PSHF=SН0-4,SHF=ARIPH
CONT ALUS=DZ,Н,ALUD=ВА,RА=WR2,RВ=WR2,ALU,DSRC=SHIFT,MPS,PSHF=SН0+60,SHF=LOG
CONT ALUS=АВ,RА=DADR,RВ=WR2,FUNC=AND,ALU,YDST=ADRREG,СЕМ
CONT ALUS=ZВ,RВ=РССОРУ,CI,ALUD=В,ALU,CSM,WЕМ,MNSA=U,SТОРС=37
;ЕСЛИ N МОД. = 0, СРАВНИВАЕМ С ЗАПИСАННЫМ В М0
CJP А=MDR0,МАР=РЕ,COND=СТ,SТОРС=37,CSM,MNSA=IRA,ALUS=DА,RА=РССОРУ,FUNC=EXOR
>,ALUD=В,RВ=У,CEN
CONT CSM,MNSA=IRA,ALUS=DА,RА=DADR,FUNC=EXOR,ALUD=В,RВ=У,CEN
MDR0:CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,%TIK%
;
;МЕНЯЕМ КОМАНДНОЕ СЛОВО
CJP А=CST1A,МАР=РЕ,ALUS=АВ,RА=WR1,RВ=А,Н,ALUD=В,ALU
>,ЕСВ,WRB,BRA=RG1,FFCNT=SЕТТКК
END
*END
*NО LIST
*CALL MPSEND:STND=800
*END F
*END FILE
