*NАМЕ 3:SHFTTEST
*       СДВИГИ + ПЛЕ
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
SHFT:PROG;
;     ================================
;     СДВИГИ В СДВИГАТЕЛЕ И МПС + СУСС
;     ================================
;
EXTERNAL INITST,ERRINF,RD8/F,OUT8/F
;
СДВИГ1:ENTRY
;===== СДВИГ ЛОГИЧЕСКИЙ CONST ВЛЕВО(!) 64Р. В СДВИГАТЕЛЕ; РЕЗУЛЬТАТ- В БОПП
;   7 РГ.БОПП - ЧИСЛО СДВИГОВ ВЛЕВО В ПРЯМОМ(!) КОДЕ
;   8-15 РГ. - РЕЗУЛЬТАТ. CONST ДЛЯ СДВИГА ЧИТАЕМ ИЗ ПЗУ!
;
CJP А=PSSH1,МАР=РЕ
PSSH1:CONT А=Н1,%TN%
CJS А=INITST,МАР=РЕ
;ЧИТАЕМ ЧИСЛО СДВИГОВ, ВЫЧИТАЕМ ИХ ИЗ S0, ПИШЕМ В РПС
CONT YDEV=МРМЕМ,IОМР,MPADR=7,ЕСВ,WRB,BRA=RG3,ЕСА,ARA=RG3
>,ALUS=DZ,ALUD=В,RВ=DADR
CONT А=МВ,DSRC=PROM,ALUS=DА,RА=DADR,FUNC=AND,Н,ALUD=В,RВ=DADR
CONT А=S0,DSRC=PROM,ALUS=DА,RА=DADR,FUNC=SUBS,CI,ALU,YDST=PSHIFT
CONT А=CF530,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=WR6
CJS А=OUT8/F,МАР=РЕ,ALUS=DZ,Н,ALUD=ВА,RА=WR6,RВ=WR6,ALU,DSRC=SHIFT,SHF=LOG
STSH1:CJP А=STSH1,МАР=РЕ
;
;
СДВИ1М:ENTRY
;===== СДВИГ ЛОГИЧЕСКИЙ CONST ИЗ БОПП ВЛЕВО В СДВИГАТЕЛЕ; РЕЗУЛЬТАТ- В БОПП
;   АНАЛОГИЧНО ПРЕДЫДУЩЕМУ, НО БЕЗ ПЗУ!
;   7 РГ.БОПП - ЧИСЛО СДВИГОВ ВЛЕВО В ПРЯМОМ(!) КОДЕ;
;   8-15 РГ. - ЧИСЛО ДЛЯ СДВИГА; ТУДА ЖЕ ПИШЕМ РЕЗУЛЬТАТ!
;
CJP А=PSSH1M,МАР=РЕ
PSSH1M:CONT А=Н81,%TN%
CJS А=INITST,МАР=РЕ
;"1" В 11 РАЗРЯДЕ - В HALF
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=HALF
CONT ALUS=ZВ,RВ=HALF,Н,CI,ALUD=В
CONT ALUS=DZ,Н,ALUD=ВА,RА=HALF,RВ=HALF,ALU,DSRC=SHIFT,MPS,PSHF=SН0-10,SHF=LOG
;ЧИТАЕМ В БОПП ЧИСЛО СДВИГОВ, ВЫЧИТАЕМ ИХ ИЗ "1" В 11 РАЗРЯДЕ, ПИШЕМ В РПС
CONT YDEV=МРМЕМ,IОМР,MPADR=7,DSRC=SHIFT,MPS,PSHF=SН0-56,SHF=LOG
>,ALUS=DZ,Н,ALUD=В,RВ=DADR
CJS А=RD8/F,МАР=РЕ,ALUS=DZ,Н,ALUD=ВА,RА=DADR,RВ=DADR,ALU,DSRC=SHIFT,MPS
>,PSHF=SН0+56,SHF=LOG
CONT ALUS=АВ,RА=HALF,RВ=DADR,FUNC=SUBS,Н,CI,ALUD=Q,ALU,YDST=PSHIFT
CJS А=OUT8/F,МАР=РЕ,ALUS=DZ,Н,ALUD=ВА,RА=WR6,RВ=WR6,ALU,DSRC=SHIFT,SHF=LOG
STSH1M:CJP А=STSH1M,МАР=РЕ
;
;
CДBИ1N:ENTRY
;===== СДВИГ ЛОГИЧЕСКИЙ CONST ИЗ БОПП ВПРАВО В СДВИГАТЕЛЕ; РЕЗУЛЬТАТ- В БОПП
;   АНАЛОГИЧНО ПРЕДЫДУЩЕМУ, НО ВПРАВО!
;   7 РГ.БОПП - ЧИСЛО СДВИГОВ ВПРАВО В ПРЯМОМ(!) КОДЕ;
;   8-15 РГ. - ЧИСЛО ДЛЯ СДВИГА; ТУДА ЖЕ ПИШЕМ РЕЗУЛЬТАТ!
;
CJP А=PSSH1N,МАР=РЕ
PSSH1N:CONT А=НС1,%TN%
CJS А=INITST,МАР=РЕ
;"1" В 11 РАЗРЯДЕ - В HALF
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=HALF
CONT ALUS=ZВ,RВ=HALF,Н,CI,ALUD=В
CONT ALUS=DZ,Н,ALUD=ВА,RА=HALF,RВ=HALF,ALU,DSRC=SHIFT,MPS,PSHF=SН0-10,SHF=LOG
;ЧИТАЕМ В БОПП ЧИСЛО СДВИГОВ, СКЛАДЫВАЕМ ИХ С "1" В 11 РАЗРЯДЕ, ПИШЕМ В РПС
CONT YDEV=МРМЕМ,IОМР,MPADR=7,DSRC=SHIFT,MPS,PSHF=SН0-56,SHF=LOG
>,ALUS=DZ,Н,ALUD=В,RВ=DADR
CJS А=RD8/F,МАР=РЕ,ALUS=DZ,Н,ALUD=ВА,RА=DADR,RВ=DADR,ALU,DSRC=SHIFT,MPS
>,PSHF=SН0+56,SHF=LOG
CONT ALUS=АВ,RА=HALF,RВ=DADR,FUNC=ADD,Н,ALUD=Q,ALU,YDST=PSHIFT
CJS А=OUT8/F,МАР=РЕ,ALUS=DZ,Н,ALUD=ВА,RА=WR6,RВ=WR6,ALU,DSRC=SHIFT,SHF=LOG
STSH1N:CJP А=STSH1N,МАР=РЕ
;
;
СДВИГ2:ENTRY
;===== СДВИГ ЛОГИЧЕСКИЙ CONST ВПРАВО(!) 64Р. В СДВИГАТЕЛЕ; РЕЗУЛЬТАТ- В БОПП
;   7 РГ.БОПП - ЧИСЛО СДВИГОВ ВПРАВО В ПРЯМОМ КОДЕ
;   8-15 РГ. - РЕЗУЛЬТАТ. CONST ЧИТАЕМ В ПЗУ!
;
CJP А=PSSH2,МАР=РЕ
PSSH2:CONT А=Н2,%TN%
CJS А=INITST,МАР=РЕ
;ЧИТАЕМ ЧИСЛО СДВИГОВ, СКЛАДЫВАЕМ ИХ С S0, ПИШЕМ В РПС
CONT YDEV=МРМЕМ,IОМР,MPADR=7,ЕСВ,WRB,BRA=RG3,ЕСА,ARA=RG3
>,ALUS=DZ,ALUD=В,RВ=DADR
CONT А=МВ,DSRC=PROM,ALUS=DА,RА=DADR,FUNC=AND,Н,ALUD=В,RВ=DADR
CONT А=S0,DSRC=PROM,ALUS=DА,RА=DADR,FUNC=ADD,ALU,YDST=PSHIFT
CONT А=CF530,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=WR6
CJS А=OUT8/F,МАР=РЕ,ALUS=DZ,Н,ALUD=ВА,RА=WR6,RВ=WR6,ALU,DSRC=SHIFT,SHF=LOG
STSH2:CJP А=STSH2,МАР=РЕ
;
;
СДВИГ3:ENTRY
;===== СДВИГ АРИФМЕТИЧЕСКИЙ(!) ВЛЕВО В СДВИГАТЕЛЕ 64Р; CONST(!) И РЕЗ-Т - В БОПП
;   7 РГ.БОПП - ЧИСЛО СДВИГОВ ВЛЕВО В ПРЯМОМ(!) КОДЕ
;   8-15 РГ. - СДВИГАЕМОЕ ЧИСЛО; ТУДА ЖЕ ПИШЕМ РЕЗУЛЬТАТ.
;
CJP А=PSSH3,МАР=РЕ
PSSH3:CONT А=Н3,%TN%
CJS А=INITST,МАР=РЕ
;ЧИТАЕМ ЧИСЛО СДВИГОВ, ВЫЧИТАЕМ ИХ ИЗ S0, ПИШЕМ В РПС
CJS А=RD8/F,МАР=РЕ,YDEV=МРМЕМ,IОМР,MPADR=7,ЕСВ,WRB,BRA=RG3,ЕСА,ARA=RG3
>,ALUS=DZ,ALUD=В,RВ=DADR
CONT А=МВ,DSRC=PROM,ALUS=DА,RА=DADR,FUNC=AND,Н,ALUD=В,RВ=DADR
CONT А=S0,DSRC=PROM,ALUS=DА,RА=DADR,FUNC=SUBS,CI,ALU,YDST=PSHIFT
CJS А=OUT8/F,МАР=РЕ,ALUS=DZ,Н,ALUD=ВА,RА=WR6,RВ=WR6,ALU,DSRC=SHIFT,SHF=ARIPH
STSH3:CJP А=STSH3,МАР=РЕ
;
;
СДВИГ4:ENTRY
;===== СДВИГ АРИФМЕТИЧЕСКИЙ ВПРАВО(!) В СДВИГАТЕЛЕ 64Р; ДАННЫЕ И РЕЗ-Т - В БОПП
;   7 РГ.БОПП - ЧИСЛО СДВИГОВ ВПРАВО В ПРЯМОМ КОДЕ
;   8-15 РГ. - СДВИГАЕМОЕ ЧИСЛО; ТУДА ЖЕ ПИШЕМ РЕЗУЛЬТАТ.
;
CJP А=PSSH4,МАР=РЕ
PSSH4:CONT А=Н4,%TN%
CJS А=INITST,МАР=РЕ
;ЧИТАЕМ ЧИСЛО СДВИГОВ, СКЛАДЫВАЕМ ИХ С S0, ПИШЕМ В РПС
CJS А=RD8/F,МАР=РЕ,YDEV=МРМЕМ,IОМР,MPADR=7,ЕСВ,WRB,BRA=RG3,ЕСА,ARA=RG3
>,ALUS=DZ,ALUD=В,RВ=DADR
CONT А=МВ,DSRC=PROM,ALUS=DА,RА=DADR,FUNC=AND,Н,ALUD=В,RВ=DADR
CONT А=S0,DSRC=PROM,ALUS=DА,RА=DADR,FUNC=ADD,ALU,YDST=PSHIFT
CJS А=OUT8/F,МАР=РЕ,ALUS=DZ,Н,ALUD=ВА,RА=WR6,RВ=WR6,ALU,DSRC=SHIFT,SHF=ARIPH
STSH4:CJP А=STSH4,МАР=РЕ
;
;
СДВИГ5:ENTRY
;===== СДВИГ ЛОГИЧЕСКИЙ ВЛЕВО 64Р. В МПС И СДВИГАТЕЛЕ; ПАРАМЕТР СДВИГА - В МП
;   DADR - CONST ДЛЯ СДВИГА ИЗ ПЗУ; А - СДВИНУТОЕ В МПС; У - В СДВИГАТЕЛЕ
;
CJP А=PSSH5,МАР=РЕ
PSSH5:CONT А=Н5,%TN%
CJS А=INITST,МАР=РЕ
;ЧИТАЕМ CONST ДЛЯ СДВИГА - В РГ.DADR МПС
CONT А=CF530,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=DADR
;DADR - СДВИГ В МПС 3 РАЗА - В А
CSH5:CONT ALUS=ZА,RА=DADR,Н,ALUD=LSB,RВ=А,SHMUX=ASLLS
CONT ALUS=ZА,RА=А,Н,ALUD=LSB,RВ=А,SHMUX=ASLLS
CONT ALUS=ZА,RА=А,Н,ALUD=LSB,RВ=А,SHMUX=ASLLS
;СДВИГАЕМ НА 3 В СДВИГАТЕЛЕ
CONT ALUS=DZ,Н,ALUD=ВА,RА=DADR,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0-3,SHF=LOG
;СРАВНИВАЕМ
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=/NZ,%TIK%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=/NZ
CJP А=CSH5,МАР=РЕ
;
;
СДВИГ6:ENTRY
;===== СДВИГ ЦИКЛИЧЕСКИЙ ВЛЕВО 64Р. В МПС И СДВИГАТЕЛЕ, ПАРАМЕТР СДВИГА - В МП
;   А - ЧИСЛО ИЗ ПЗУ, СДВИГАЕМОЕ В СДВИГАТЕЛЕ; У - ТО ЖЕ, НО СДВИГАЕМОЕ В МПС
;
CJP А=PSSH6,МАР=РЕ
PSSH6:CONT А=Н6,%TN%
CJS А=INITST,МАР=РЕ
;ЧИТАЕМ CONST ДЛЯ СДВИГА - В РГ.А МПС
CSH6:CONT А=CF530,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А
PUSH А=22,МАР=РЕ
;А - СДВИГ В МПС 3 РАЗА - В У
CONT ALUS=ZА,RА=А,Н,ALUD=LSB,RВ=У,SHMUX=RSRS
CONT ALUS=ZА,RА=У,Н,ALUD=LSB,RВ=У,SHMUX=RSRS
CONT ALUS=ZА,RА=У,Н,ALUD=LSB,RВ=У,SHMUX=RSRS
;СДВИГАЕМ НА 3 В СДВИГАТЕЛЕ
CONT ALUS=DZ,Н,ALUD=ВА,RА=А,RВ=А,ALU,DSRC=SHIFT,MPS,PSHF=SН0-3,SHF=CICL
;СРАВНИВАЕМ
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=21,%TIK%
TWB А=CSH6,МАР=РЕ,COND=СТ,SТОРС=21
CJS А=ERRINF,МАР=РЕ
CJP А=CSH6,МАР=РЕ
;
;
СДВИГ7:ENTRY
;===== СДВИГ АРИФМЕТИЧЕСКИЙ ВЛЕВО 64 Р. В МПС И СДВИГАТЕЛЕ; ПАР-Р СДВИГА - В МП
;   У - РЕЗУЛЬТАТ СДВИГА В МПС; А - В СДВИГАТЕЛЕ
;
CJP А=PSSH7,МАР=РЕ
PSSH7:CONT А=Н7,%TN%
CJS А=INITST,МАР=РЕ
;ЧИТАЕМ CONST ДЛЯ СДВИГА - В РГ.А МПС
CSH7:CONT А=MNQ,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А
PUSH А=22,МАР=РЕ
;А - СДВИГ В МПС 4 РАЗА ВЛЕВО + 1 ВПРАВО ДЛЯ ВОССТАНОВЛЕНИЯ ЗНАКА - В У
;ЗАПОМИНАЕМ ЗНАК В МС
CONT ALUS=ZА,RА=А,Н,ALUD=LSB,RВ=У,SHMUX=LSLSL,СЕМ
;ПРОСТО СДВИГАЕМ:
CONT ALUS=ZА,RА=У,Н,ALUD=LSB,RВ=У,SHMUX=ASLLS
CONT ALUS=ZА,RА=У,Н,ALUD=LSB,RВ=У,SHMUX=ASLLS
CONT ALUS=ZА,RА=У,Н,ALUD=LSB,RВ=У,SHMUX=ASLLS
;ВОССТАНАВЛИВАЕМ ЗНАК: СДВИГАЕМ ВПРАВО ВМЕСТЕ С МС
CONT ALUS=ZА,RА=У,Н,ALUD=RSB,RВ=У,SHMUX=RDSRDS
;СДВИГАЕМ НА 3 В СДВИГАТЕЛЕ
CONT ALUS=DZ,Н,ALUD=ВА,RА=А,RВ=А,ALU,DSRC=SHIFT,MPS,PSHF=SН0-3
>,SHF=ARIPH
;СРАВНИВАЕМ
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=21
TWB А=CSH7,МАР=РЕ,COND=СТ,SТОРС=21,%TIK%
CJS А=ERRINF,МАР=РЕ
CJP А=CSH7,МАР=РЕ
;
;
СДВИГ8:ENTRY
;===== СДВИГ ЛОГИЧЕСКИЙ ВПРАВО 64Р. В МПС И СДВИГАТЕЛЕ, ПАР-Р СДВИГА - В МП
;   А - СДВИНУТОЕ В СДВИГАТЕЛЕ; У - В МПС
;
CJP А=PSSH8,МАР=РЕ
PSSH8:CONT А=Н8,%TN%
CJS А=INITST,МАР=РЕ
;ЧИТАЕМ CONST ДЛЯ СДВИГА - В РГ.А МПС
CSH8:CONT А=CF530,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А
PUSH А=22,МАР=РЕ
;А - СДВИГ В МПС 3 РАЗА - В У
CONT ALUS=ZА,RА=А,Н,ALUD=RSB,RВ=У,SHMUX=LSLSL
CONT ALUS=ZА,RА=У,Н,ALUD=RSB,RВ=У,SHMUX=LSLSL
CONT ALUS=ZА,RА=У,Н,ALUD=RSB,RВ=У,SHMUX=LSLSL
;СДВИГАЕМ НА 3 В СДВИГАТЕЛЕ
CONT ALUS=DZ,Н,ALUD=ВА,RА=А,RВ=А,ALU,DSRC=SHIFT,MPS,PSHF=SН0+3,SHF=LOG
;СРАВНИВАЕМ
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=21
TWB А=CSH8,МАР=РЕ,COND=СТ,SТОРС=21,%TIK%
CJS А=ERRINF,МАР=РЕ
CJP А=CSH8,МАР=РЕ
;
;
СДВИГ9:ENTRY
;===== СДВИГ ЦИКЛИЧЕСКИЙ ВПРАВО 64Р. В МПС И СДВИГАТЕЛЕ, ПАРАМЕТР СДВИГА - В МП
;   А - СДВИНУТОЕ В СДВИГАТЕЛЕ; У - В МПС
;
CJP А=PSSH9,МАР=РЕ
PSSH9:CONT А=Н9,%TN%
CJS А=INITST,МАР=РЕ
;ЧИТАЕМ CONST ДЛЯ СДВИГА - В РГ.А МПС
CSH9:CONT А=CF530,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А
PUSH А=22,МАР=РЕ
;А - СДВИГ В МПС 3 РАЗА - В У
CONT ALUS=ZА,RА=А,Н,ALUD=RSB,RВ=У,SHMUX=RSRS
CONT ALUS=ZА,RА=У,Н,ALUD=RSB,RВ=У,SHMUX=RSRS
CONT ALUS=ZА,RА=У,Н,ALUD=RSB,RВ=У,SHMUX=RSRS
;СДВИГАЕМ НА 3 В СДВИГАТЕЛЕ
CONT ALUS=DZ,Н,ALUD=ВА,RА=А,RВ=А,ALU,DSRC=SHIFT,MPS,PSHF=SН0+3,SHF=CICL
;СРАВНИВАЕМ
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=21
TWB А=CSH9,МАР=РЕ,COND=СТ,SТОРС=21,%TIK%
CJS А=ERRINF,МАР=РЕ
CJP А=CSH9,МАР=РЕ
;
;
СДВИГА:ENTRY
;===== СДВИГ АРИФМЕТИЧЕСКИЙ ВПРАВО 64Р.В МПС И СДВИГАТЕЛЕ; ПАР-Р СДВИГА - В МП
;   А - СДВИНУТОЕ В СДВИГАТЕЛЕ; У - В МПС
;
CJP А=PSSHA,МАР=РЕ
PSSHA:CONT А=НА,%TN%
CJS А=INITST,МАР=РЕ
;ЧИТАЕМ CONST ДЛЯ СДВИГА - В РГ.А МПС
CSHA:CONT А=CF530,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А
PUSH А=22,МАР=РЕ
;А - СДВИГ В МПС (В РГ.Q) 3 РАЗА ВПРАВО  - В У
;ПЕРЕСЫЛАЕМ В РГ.Q, ЗАПОМИНАЕМ ЗНАК
CONT ALUS=ZА,RА=А,Н,ALUD=Q,SТОРС=20,СЕМ
;СДВИГАЕМ С ЗАГРУЗКОЙ MN НА ОСВОБОЖД. МЕСТО
CONT ALUS=ZQ,Н,ALUD=RSBQ,RВ=У,SHMUX=ASLLS
CONT ALUS=ZQ,Н,ALUD=RSBQ,RВ=У,SHMUX=ASLLS
CONT ALUS=ZQ,Н,ALUD=RSBQ,RВ=У,SHMUX=ASLLS
;ПЕРЕПИСЫВАЕМ В РГ.RDATA
CONT ALUS=ZQ,Н,ALUD=В,RВ=У
;СДВИГАЕМ НА 3 В СДВИГАТЕЛЕ
CONT ALUS=DZ,Н,ALUD=ВА,RА=А,RВ=А,ALU,DSRC=SHIFT,MPS,PSHF=SН0+3
>,SHF=ARIPH
;СРАВНИВАЕМ
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=21
TWB А=CSHA,МАР=РЕ,COND=СТ,SТОРС=21,%TIK%
CJS А=ERRINF,МАР=РЕ
CJP А=CSHA,МАР=РЕ
;
;
СДВИГВ:ENTRY
;===== СДВИГ ЛОГИЧЕСКИЙ ВЛЕВО 64Р. В МПС И СДВИГАТЕЛЕ; ПАРАМЕТР СДВИГА - В РПС
;   DADR - ПАРАМЕТР СДВИГА; HALF - CONST; А - СДВИГАЕМОЕ В МПС; У - В СДВИГАТЕЛЕ
;   СДВИГАТЕЛЬ НЕ СДВИГАЕТ НА 64 РАЗРЯДА ВЛЕВО!!!
;
CJP А=PSSHB,МАР=РЕ
PSSHB:CONT А=НВ,%TN%
CJS А=INITST,МАР=РЕ
;ПАРАМЕТР СДВИГА НА 0 - В РГ.DADR
CSHB:CONT А=S0,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=DADR
;ЧИТАЕМ CONST ДЛЯ СДВИГА - В А,HALF
CONT А=CF530,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А
PUSH А=72,МАР=РЕ,ALUS=ZА,RА=А,Н,ALUD=В,RВ=HALF
;ПАРАМЕТР СДВИГА - 1 - В РПС
CONT ALUS=ZА,RА=DADR,FUNC=SUBR,Н,ALUD=В,RВ=DADR,ALU,YDST=PSHIFT
;СДВИГАЕМ ИСХОДНОЕ ЗНАЧЕНИЕ CONST ИЗ РГ.HALF В СДВИГАТЕЛЕ - В У
CONT ALUS=DZ,Н,ALUD=ВА,RА=HALF,RВ=У,ALU,DSRC=SHIFT,SHF=LOG
;СДВИГАЕМ В МПС (КАЖДЫЙ ЦИКЛ - ЕЩЕ НА 1 РАЗРЯД)
CONT ALUS=ZВ,RВ=А,Н,ALUD=LSB,SHMUX=ASLLS
;СРАВНИВАЕМ
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=21
TWB А=CSHB,МАР=РЕ,COND=СТ,SТОРС=21,%TIK%
CJS А=ERRINF,МАР=РЕ
CJP А=CSHB,МАР=РЕ
;
;
СДВИГС:ENTRY
;===== СДВИГ ЦИКЛИЧЕСКИЙ ВЛЕВО 64Р. В МПС И СДВИГАТЕЛЕ; ПАРАМЕТР СДВИГА - В РПС
;   DADR - ПАРАМЕТР СДВИГА; HALF - CONST; А - СДВИГАЕМОЕ В МПС; У - В СДВИГАТЕЛЕ
;
CJP А=PSSHC,МАР=РЕ
PSSHC:CONT А=НС,%TN%
CJS А=INITST,МАР=РЕ
;ПАРАМЕТР СДВИГА НА 0 - В РГ.DADR
CSHC:CONT А=S0,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=DADR
;ЧИТАЕМ CONST ДЛЯ СДВИГА - В HALF И А
CONT А=CF530,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=HALF
PUSH А=72,МАР=РЕ,ALUS=ZА,RА=HALF,Н,ALUD=В,RВ=А
;ПАР-Р СДВИГА - 1 - В РПС
CONT ALUS=ZА,RА=DADR,FUNC=SUBR,Н,ALUD=В,RВ=DADR,ALU,YDST=PSHIFT
;СДВИГАЕМ CONST В СДВИГАТЕЛЕ - В У (КАЖДЫЙ ЦИКЛ - НА 1 РАЗРЯД БОЛЬШЕ)
CONT ALUS=DZ,Н,ALUD=ВА,RА=HALF,RВ=У,ALU,DSRC=SHIFT,SHF=CICL
;СДВИГАЕМ В МПС (КАЖДЫЙ ЦИКЛ - ЕЩЕ НА 1 РАЗРЯД)
CONT ALUS=ZВ,RВ=А,Н,ALUD=LSB,SHMUX=RSRS
;СРАВНИВАЕМ
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=21
TWB А=CSHC,МАР=РЕ,COND=СТ,SТОРС=21,%TIK%
CJS А=ERRINF,МАР=РЕ
CJP А=CSHC,МАР=РЕ
;
;
CДBИГD:ENTRY
;===== СДВИГ АРИФМЕТИЧЕСКИЙ ВЛЕВО 64 Р. В СДВИГАТЕЛЕ И МПС, ПАР-Р СДВИГА - В РПС
;   DADR - ПАРАМЕТР СДВИГА; HALF - CONST; А - СДВИГАЕМОЕ В МПС; У - В СДВИГАТЕЛЕ
;   СДВИГАТЕЛЬ НЕ СДВИГАЕТ НА 64 РАЗРЯДА ВЛЕВО!!!
;
CJP А=PSSHD,МАР=РЕ
PSSHD:CONT А=HD,%TN%
CJS А=INITST,МАР=РЕ
;ПАРАМЕТР СДВИГА НА 0 - В РГ.DADR
CSHD:CONT А=S0,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=DADR
;ЧИТАЕМ CONST ДЛЯ СДВИГА - В HALF,А
CONT А=CF530,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А
PUSH А=72,МАР=РЕ,ALUS=ZА,RА=А,Н,ALUD=В,RВ=HALF
;ПАРАМЕТР СДВИГА - 1 -> В РПС
CONT ALUS=ZВ,RВ=DADR,FUNC=SUBR,Н,ALUD=В,ALU,YDST=PSHIFT
;ДВИГАЕМ В СДВИГАТЕЛЕ - В У
CONT ALUS=DZ,Н,ALUD=ВА,RА=HALF,RВ=У,ALU,DSRC=SHIFT,SHF=ARIPH
;СДВИГАЕМ АРИФМЕТИЧЕСКИ В МПС: СНАЧАЛА ЗАПОМИНАЕМ ЗНАК
CONT ALUS=ZВ,RВ=А,Н,ALUD=LSB,SHMUX=LSLSL,SТОРС=20,СЕМ
;ПОТОМ ПРОСТО СДВИГ
CONT ALUS=ZВ,RВ=А,Н,ALUD=LSB,SHMUX=ASLLS
;ВОССТАНАВЛИВАЕМ ЗНАК: СДВИГ ВПРАВО (ОБРАТНО) ВМЕСТЕ С МС
CONT ALUS=ZВ,RВ=А,Н,ALUD=RSB,SHMUX=CDLDL
;СРАВНИВАЕМ
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=21
TWB А=CSHD,МАР=РЕ,COND=СТ,SТОРС=21,%TIK%
CJS А=ERRINF,МАР=РЕ
CJP А=CSHD,МАР=РЕ
;
;
СДВИГЕ:ENTRY
;===== СДВИГ ЛОГИЧЕСКИЙ ВПРАВО 64Р.В МПС И СДВИГАТЕЛЕ; ПАРАМЕТР СДВИГА - В РПС
;   DADR - ПАРАМЕТР СДВИГА; HALF - CONST; А - СДВИГАЕМОЕ В МПС; У - В СДВИГАТЕЛЕ
;
CJP А=PSSHE,МАР=РЕ
PSSHE:CONT А=НЕ,%TN%
CJS А=INITST,МАР=РЕ
;ПАРАМЕТР СДВИГА НА 0 - В РГ.DADR
CSHE:CONT А=S0,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=DADR
;ЧИТАЕМ CONST ДЛЯ СДВИГА - В HALF,А
CONT А=CF530,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=HALF
PUSH А=72,МАР=РЕ,ALUS=ZА,RА=HALF,Н,ALUD=В,RВ=А
;ПАР-Р СДВИГА + 1 - В РПС
CONT ALUS=ZВ,RВ=DADR,Н,CI,ALUD=В,ALU,YDST=PSHIFT
;ДВИГАЕМ В СДВИГАТЕЛЕ - В У
CONT ALUS=DZ,Н,ALUD=ВА,RА=HALF,RВ=У,ALU,DSRC=SHIFT,SHF=LOG
;СДВИГАЕМ В МПС
CONT ALUS=ZВ,RВ=А,Н,ALUD=RSB,SHMUX=LSLSL
;СРАВНИВАЕМ
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=21
TWB А=CSHE,МАР=РЕ,COND=СТ,SТОРС=21,%TIK%
CJS А=ERRINF,МАР=РЕ
CJP А=CSHE,МАР=РЕ
;
;
CДBИГF:ENTRY
;===== СДВИГ ЦИКЛИЧЕСКИЙ ВПРАВО 64Р. В МПС И СДВИГАТЕЛЕ; ПАРАМЕТР СДВИГА - В РПС
;   DADR - ПАРАМЕТР СДВИГА; HALF - CONST; А - СДВИГАЕМОЕ В МПС; У - В СДВИГАТЕЛЕ
;
CJP А=PSSHF,МАР=РЕ
PSSHF:CONT А=HF,%TN%
CJS А=INITST,МАР=РЕ
;ПАРАМЕТР СДВИГА НА 0 - В РГ.DADR
CSHF:CONT А=S0,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=DADR
;ЧИТАЕМ CONST ДЛЯ СДВИГА - В HALF,А
CONT А=CF530,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=HALF
PUSH А=72,МАР=РЕ,ALUS=ZА,RА=HALF,Н,ALUD=В,RВ=А
;ПАР-Р СДВИГА + 1 - В РПС
CONT ALUS=ZВ,RВ=DADR,Н,CI,ALUD=В,ALU,YDST=PSHIFT
;ДВИГАЕМ В СДВИГАТЕЛЕ - В У
CONT ALUS=DZ,Н,ALUD=ВА,RА=HALF,RВ=У,ALU,DSRC=SHIFT,SHF=CICL
;СДВИГАЕМ В МПС
CONT ALUS=ZВ,RВ=А,Н,ALUD=RSB,SHMUX=RSRS
;СРАВНИВАЕМ
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=21
TWB А=CSHF,МАР=РЕ,COND=СТ,SТОРС=21,%TIK%
CJS А=ERRINF,МАР=РЕ
CJP А=CSHF,МАР=РЕ
;
;
СДВИ10:ENTRY
;===== СДВИГ АРИФМЕТИЧЕСКИЙ ВПРАВО 64Р.В МПС И СДВИГАТЕЛЕ; ПАР-Р СДВИГА - В РПС
;   DADR - ПАРАМЕТР СДВИГА; HALF - CONST; А - СДВИГАЕМОЕ В МПС; У - В СДВИГАТЕЛЕ
;
CJP А=PSSH10,МАР=РЕ
PSSH10:CONT А=Н10,%TN%
CJS А=INITST,МАР=РЕ
;ПАРАМЕТР СДВИГА НА 0 - В РГ.DADR
CSH10:CONT А=S0,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=DADR
;ЧИТАЕМ CONST ДЛЯ СДВИГА - В HALF, В А; ЗАПОМИНАЕМ ЗНАК
CONT А=CF530,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=HALF,SТОРС=20,СЕМ
PUSH А=72,МАР=РЕ,ALUS=ZА,RА=HALF,Н,ALUD=В,RВ=А
;ПАР-Р СДВИГА + 1 - В РПС
CONT ALUS=ZВ,RВ=DADR,Н,CI,ALUD=В,ALU,YDST=PSHIFT
;ДВИГАЕМ В СДВИГАТЕЛЕ - В У
CONT ALUS=DZ,Н,ALUD=ВА,RА=HALF,RВ=У,ALU,DSRC=SHIFT,SHF=ARIPH
;СДВИГАЕМ АРИФМЕТИЧЕСКИ В МПС С РАЗМНОЖЕНИЕМ ЗНАКА ИЗ MN
CONT ALUS=ZВ,RВ=А,Н,ALUD=RSB,SHMUX=ADNDL
;СРАВНИВАЕМ
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=21
TWB А=CSH10,МАР=РЕ,COND=СТ,SТОРС=21,%TIK%
CJS А=ERRINF,МАР=РЕ
CJP А=CSH10,МАР=РЕ
;
;
СДВИ11:ENTRY
;===== СДВИГ ЛОГИЧЕСКИЙ ДВОЙНОГО СЛОВА В МПС И СДВИГАТЕЛЕ НА 37 РАЗРЯДОВ
;   А,Q - СДВИГАЕМ В МПС;
;   HALF(А) СДВИГАЕМ В СДВИГАТЕЛЕ, ПИШЕМ В У (ЛЕВАЯ ПОЛОВИНА РЕЗ-ТА);
;   ПРАВУЮ ПОЛОВИНУ РЕЗУЛЬТАТА ПОЛУЧАЕМ ЗА 2 ПРИЕМА В DADR
;   ОШИБКИ: 01 - НЕСОВПАДЕНИЕ ЛЕВОЙ ПОЛОВИНЫ; 02 - ПРАВОЙ.
;
CJP А=PSSH11,МАР=РЕ
PSSH11:CONT А=Н11,%TN%
CJS А=INITST,МАР=РЕ
;ЧИТАЕМ CONST ДЛЯ СДВИГА В HALF И Q
CSH11:CONT А=CF530,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=HALF
CONT А=MNH,DSRC=PROM,ALUS=DZ,Н,ALUD=Q
PUSH А=36,МАР=РЕ,ALUS=ZА,RА=HALF,Н,ALUD=В,RВ=А
;СДВИГАЕМ В МПС ДВОЙНОЕ СЛОВО: А(КОПИЯ HALF) И Q
RFCT ALUS=ZВ,RВ=А,Н,ALUD=RSBQ,SHMUX=LDLD
;СДВИГАЕМ В СДВИГАТЕЛЕ ДВОЙНОЕ СЛОВО (ПО ЧАСТЯМ); СНАЧАЛА HALF ВПРАВО НА 37
CONT ALUS=DZ,Н,ALUD=ВА,RА=HALF,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0+37
>,SHF=LOG
;СРАВНИВАЕМ ЛЕВУЮ ПОЛОВИНУ РЕЗ-ТА
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,Н,CEN
CONT SТОРС=21,%CLRTYP%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,%ТУРЕ%
;СДВИГАЕМ HALF ВЛЕВО НА 64-37=27 (ПОЛУЧАЕМ ТО, ЧТО ВЫДВИНУЛОСЬ ИЗ А В Q)
CONT ALUS=DZ,Н,ALUD=ВА,RА=HALF,RВ=DADR,ALU,DSRC=SHIFT,MPS
>,PSHF=SН0-27,SHF=LOG
;ЧИТАЕМ ПРАВЫЕ 64 РАЗРЯДА CONST,ЧТО БЫЛИ В Q
CONT А=MNH,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=WR1
;СДВИГАЕМ ВПРАВО НА 37
CONT ALUS=DZ,Н,ALUD=ВА,RА=WR1,RВ=WR1,ALU
>,DSRC=SHIFT,MPS,PSHF=SН0+37,SHF=LOG
;ОБ'ЕДИНЯЕМ
CONT ALUS=АВ,RА=WR1,RВ=DADR,FUNC=OR,Н,ALUD=В
;СРАВНИВАЕМ
CONT ALUS=AQ,RА=DADR,FUNC=EXOR,Н,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,%TIK%
CJP А=CSH11,МАР=РЕ
;
;
СДВИ12:ENTRY
;===== СДВИГ ЛОГИЧЕСКИЙ ДВОЙНОГО СЛОВА ВЛЕВО В МПС И СДВИГАТЕЛЕ (НА 12 РАЗРЯДОВ)
;   А (КОПИЯ HALF) + Q - СДВИГАЕМ В МПС;
;   HALF СДВИГАЕМ ВЛЕВО В СДВИГАТЕЛЕ = ЛЕВАЯ ПОЛОВИНА РЕЗУЛЬТАТА - В РГ.У;
;   ПРАВУЮ ПОЛОВИНУ РЕЗУЛЬТАТА ПОЛУЧАЕМ ЗА 2 СДВИГА В СДВИГАТЕЛЕ - В РГ.DADR
;   ОШИБКИ: 01 - НЕСОВПАДЕНИЕ ПРАВОЙ ПОЛОВИНЫ РЕЗУЛЬТАТА; 02 - ЛЕВОЙ.
;
CJP А=PSSH12,МАР=РЕ
PSSH12:CONT А=Н12,%TN%
CJS А=INITST,МАР=РЕ
;ЧИТАЕМ CONST ДЛЯ СДВИГА В А (КОПИЯ А - В WR1); И Q (КОПИЯ Q - В HALF)
CSH12:CONT А=CF530,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А
CONT ALUS=ZА,RА=А,Н,ALUD=В,RВ=WR1
CONT А=MNH,DSRC=PROM,ALUS=DZ,Н,ALUD=Q
PUSH А=11,МАР=РЕ,ALUS=ZQ,Н,ALUD=В,RВ=HALF
;СДВИГАЕМ В МПС ДВОЙНОЕ СЛОВО А,Q
RFCT ALUS=ZВ,RВ=А,Н,ALUD=LSBQ,SHMUX=LDLD
;СДВИГАЕМ В СДВИГАТЕЛЕ (ПО ЧАСТЯМ): ПРАВУЮ ПОЛОВИНУ ДВОЙНОГО СЛОВА ВЛЕВО НА 12
CONT ALUS=DZ,Н,ALUD=ВА,RА=HALF,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0-12
>,SHF=LOG
;СРАВНИВАЕМ ПРАВУЮ ПОЛОВИНУ РЕЗ-ТА
CONT ALUS=AQ,RА=У,FUNC=EXOR,Н,CEN
CONT SТОРС=21,%CLRTYP%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,%ТУРЕ%
;СДВИГАЕМ HALF ВПРАВО НА 64-12=52 (ПОЛУЧАЕМ ТО, ЧТО ПОПАЛО В ЛЕВУЮ ПОЛОВИНУ)
CONT ALUS=DZ,Н,ALUD=ВА,RА=HALF,RВ=DADR,ALU,DSRC=SHIFT,MPS
>,PSHF=SН0+52,SHF=LOG
;СДВИГАЕМ ЛЕВУЮ ПОЛОВИНУ ДВОЙНОЙ CONST ВЛЕВО НА 12
CONT ALUS=DZ,Н,ALUD=ВА,RА=WR1,RВ=WR1,ALU
>,DSRC=SHIFT,MPS,PSHF=SН0-12,SHF=LOG
;ОБ'ЕДИНЯЕМ
CONT ALUS=АВ,RА=WR1,RВ=DADR,FUNC=OR,Н,ALUD=В
;СРАВНИВАЕМ
CONT ALUS=АВ,RА=А,RВ=DADR,FUNC=EXOR,Н,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,%TIK%
CJP А=CSH12,МАР=РЕ
;
;
СДВИ13:ENTRY
;===== ДВОЙНОЙ СДВИГ ВПРАВО ЛОГИЧЕСКИЙ РЗУ+Q  БОЛЬШЕ 64 РАЗРЯДОВ (НА 96=64+32)
;   А,Q - РЕЗУЛЬТАТ СДВИГА CONST (HALF) В МПС; У - В СДВИГАТЕЛЕ;
;   DADR - ПАРАМЕТР СДВИГА (ПИШЕМ В РПС);
;   ОШИБКИ: 01 - НЕСОВПАДЕНИЕ МЛ.64 РАЗРЯДОВ РЕЗУЛЬТАТА; 02 - СТАРШИХ
;
CJP А=PSSH13,МАР=РЕ
PSSH13:CONT А=Н13,%TN%
CJS А=INITST,МАР=РЕ
;ЧИТАЕМ CONST ДЛЯ СДВИГА (МОЖНО 2 ВАРИАНТА: ПОЛОЖИТ. И ОТРИЦАТ. CONST)
CSH13:CONT А=CF530,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=HALF
;КОПИРУЕМ ЕЕ
PUSH А=95,МАР=РЕ,ALUS=ZА,RА=HALF,Н,ALUD=В,RВ=А,СЕМ
;СДВИГ В МПС ЛОГИЧЕСКИЙ ВПРАВО А+Q (96 РАЗ = 64 + 32)
RFCT ALUS=ZВ,Н,ALUD=RSBQ,RВ=А,SHMUX=LDLD
;СДВИГ В СДВИГАТЕЛЕ В 2 ЭТАПА: ПАРАМЕТР СДВИГА НА 32 РАЗРЯДА - В DADR, В РПС
CONT А=SR32,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=DADR,ALU,YDST=PSHIFT
;СДВИГАЕМ, ПОЛУЧАЕМ МЛАДШИЕ 64 РАЗРЯДА
CONT ALUS=DZ,Н,ALUD=ВА,RА=HALF,RВ=У,ALU,DSRC=SHIFT,SHF=LOG
;СРАВНИВАЕМ
CONT ALUS=AQ,RА=У,FUNC=EXOR,Н,CEN
CONT SТОРС=21,%CLRTYP%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,%ТУРЕ%
;ПАР-Р СДВИГА НА 32+64=96 РАЗРЯДОВ - В РПС
CONT А=В7,DSRC=PROM,ALUS=DА,RА=DADR,Н,ALU,YDST=PSHIFT
;СДВИГАЕМ, ПОЛУЧАЕМ СТАРШИЕ 64 РАЗРЯДА
CONT ALUS=DZ,Н,ALUD=ВА,RА=HALF,RВ=У
>,ALU,DSRC=SHIFT,SHF=LOG
;СРАВНИВАЕМ
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,Н,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,%TIK%
CJP А=CSH13,МАР=РЕ
;
;
СДВИ14:ENTRY
;===== ДВОЙНОЙ СДВИГ ВПРАВО АРИФМЕТИЧЕСКИЙ РЗУ+Q  БОЛЬШЕ 64 РАЗРЯДОВ (НА 96)
;   А,Q - РЕЗУЛЬТАТ СДВИГА CONST (HALF) В МПС; У - В СДВИГАТЕЛЕ;
;   DADR - ПАРАМЕТР СДВИГА (ПИШЕМ В РПС);
;   ОШИБКИ: 01 - НЕСОВПАДЕНИЕ МЛ.64 РАЗРЯДОВ РЕЗУЛЬТАТА; 02 - СТАРШИХ
;
CJP А=PSSH14,МАР=РЕ
PSSH14:CONT А=Н14,%TN%
CJS А=INITST,МАР=РЕ
;ЧИТАЕМ CONST ДЛЯ СДВИГА (МОЖНО 2 ВАРИАНТА: ПОЛОЖИТ. И ОТРИЦАТ. CONST)
CSH14:CONT А=CF530,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=HALF
;КОПИРУЕМ ЕЕ, ЗАПОМИНАЕМ ЗНАК (ДЛЯ АРИФМ.СДВИГА)
PUSH А=95,МАР=РЕ,ALUS=ZА,RА=HALF,Н,ALUD=В,RВ=А,СЕМ
;СДВИГ В МПС АРИФМЕТИЧЕСКИЙ ВПРАВО А+Q (96 РАЗ = 64 + 32)
RFCT ALUS=ZВ,Н,ALUD=RSBQ,RВ=А,SHMUX=ADNDL
;СДВИГ В СДВИГАТЕЛЕ В 2 ЭТАПА: ПАРАМЕТР СДВИГА НА 32 РАЗРЯДА - В DADR, В РПС
CONT А=SR32,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=DADR,ALU,YDST=PSHIFT
;СДВИГАЕМ, ПОЛУЧАЕМ МЛАДШИЕ 64 РАЗРЯДА
CONT ALUS=DZ,Н,ALUD=ВА,RА=HALF,RВ=У,ALU,DSRC=SHIFT,SHF=ARIPH
;СРАВНИВАЕМ
CONT ALUS=AQ,RА=У,FUNC=EXOR,Н,CEN
CONT SТОРС=21,%CLRTYP%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,%ТУРЕ%
;ПАР-Р СДВИГА НА 32+64=96 РАЗРЯДОВ - В РПС
CONT А=В7,DSRC=PROM,ALUS=DА,RА=DADR,Н,ALU,YDST=PSHIFT
;СДВИГАЕМ, ПОЛУЧАЕМ СТАРШИЕ 64 РАЗРЯДА
CONT ALUS=DZ,Н,ALUD=ВА,RА=HALF,RВ=У
>,ALU,DSRC=SHIFT,SHF=ARIPH
;СРАВНИВАЕМ
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,Н,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,%TIK%
CJP А=CSH14,МАР=РЕ
;
;
СДВИ15:ENTRY
;===== ЗАГРУЗКА 0/1 ИЗ СУСС ПРИ ДВОЙНОМ СДВИГЕ В МПС ВПРАВО
;   У,Q = 0101...01; ПРИ СДВИГЕ С ЗАГРУЗКОЙ 0/1 ИЗ СУСС  У,Q НЕ МЕНЯЮТСЯ
;
CJP А=PSSH15,МАР=РЕ
PSSH15:CONT А=Н15,%TN%
CJS А=INITST,МАР=РЕ
;ЧИТАЕМ CONST=АА...АА (1010...10) - В У,Q
CONT А=СААА,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=У
CONT ALUS=ZА,RА=У,Н,ALUD=Q
;СДВИГ ДВОЙНОЙ ВПРАВО С ЗАГРУЗКОЙ 0
CSH15:CONT %CLRTYP%
CONT ALUS=ZВ,RВ=У,Н,ALUD=RSBQ,SHMUX=LDLD
;СДВИГ ДВОЙНОЙ ВПРАВО С ЗАГРУЗКОЙ 1
CONT ALUS=ZВ,RВ=У,Н,ALUD=RSBQ,SHMUX=NDNS
;СРАВНИВАЕМ
CONT А=СААА,DSRC=PROM,ALUS=DА,RА=У,FUNC=EXOR,Н,CEN
CONT А=СААА,DSRC=PROM,ALUS=DQ,FUNC=EXOR,Н,СЕМ,SТОРС=21
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,%ТУРЕ%
CONT SТОРС=37,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=37,%TIK%
CJP А=CSH15,МАР=РЕ
;
;
СДВИ16:ENTRY
;===== ЗАГРУЗКА 0/1 ИЗ СУСС ПРИ ДВОЙНОМ СДВИГЕ В МПС ВЛЕВО(!)
;   У,Q = 0101...01; ПРИ СДВИГЕ С ЗАГРУЗКОЙ 0/1 ИЗ СУСС  У,Q НЕ МЕНЯЮТСЯ
;
CJP А=PSSH16,МАР=РЕ
PSSH16:CONT А=Н16,%TN%
CJS А=INITST,МАР=РЕ
;ЧИТАЕМ CONST=55...55 (010...101) - В У,Q
CONT А=С555,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=У
CONT ALUS=ZА,RА=У,Н,ALUD=Q
;СДВИГ ДВОЙНОЙ ВЛЕВО С ЗАГРУЗКОЙ 0
CSH16:CONT %CLRTYP%
CONT ALUS=ZВ,RВ=У,Н,ALUD=LSBQ,SHMUX=LDLD
;СДВИГ ДВОЙНОЙ ВЛЕВО С ЗАГРУЗКОЙ 1
CONT ALUS=ZВ,RВ=У,Н,ALUD=LSBQ,SHMUX=LDLND
;СРАВНИВАЕМ
CONT А=С555,DSRC=PROM,ALUS=DА,RА=У,FUNC=EXOR,Н,CEN
CONT А=С555,DSRC=PROM,ALUS=DQ,FUNC=EXOR,Н,СЕМ,SТОРС=21
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,%ТУРЕ%
CONT SТОРС=37,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=37,%TIK%
CJP А=CSH16,МАР=РЕ
;
;
СДВИ17:ENTRY
;===== СДВИГ ЛОГИЧЕСКИЙ И АРИФМЕТИЧЕСКИЙ ВПРАВО ПОЛОЖИТЕЛЬНЫХ ЧИСЕЛ В СДВИГАТЕЛЕ
;   А - СДВИНУТОЕ ЛОГЧИЕСКИ; У - АРИФМЕТИЧЕСКИ
;   ДЛЯ ПОЛОЖИТЕЛЬНЫХ ЧИСЕЛ РЕЗУЛЬТАТ Д.БЫТЬ ОДИНАКОВЫЙ!
;
CJP А=PSSH17,МАР=РЕ
PSSH17:CONT А=Н17,%TN%
CJS А=INITST,МАР=РЕ
;ЧИТАЕМ CONST ДЛЯ СДВИГА - В РГ.А МПС
CSH17:CONT А=С555,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А
PUSH А=22,МАР=РЕ
;А - СДВИГ В ЛОГИЧЕСКИЙ НА 3 - В У
CONT ALUS=DZ,Н,ALUD=ВА,RА=А,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0+3,SHF=LOG
;СДВИГАЕМ НА 3 АРИФМЕТИЧЕСКИ - В РГ.А
CONT ALUS=DZ,Н,ALUD=ВА,RА=А,RВ=А,ALU,DSRC=SHIFT,MPS,PSHF=SН0+3,SHF=ARIPH
;СРАВНИВАЕМ
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=21,%TIK%
TWB А=CSH17,МАР=РЕ,COND=СТ,SТОРС=21
CJS А=ERRINF,МАР=РЕ
CJP А=CSH17,МАР=РЕ
;
;
СДВИ18:ENTRY
;===== СДВИГ ЛОГИЧЕСКИЙ,АРИФМЕТИЧЕСКИЙ ВЛЕВО(!) ПОЛОЖИТЕЛЬНЫХ ЧИСЕЛ В СДВИГАТЕЛЕ
;   А - СДВИНУТОЕ ЛОГЧИЕСКИ; У - АРИФМЕТИЧЕСКИ
;   ДЛЯ ПОЛОЖИТЕЛЬНЫХ ЧИСЕЛ РЕЗУЛЬТАТ Д.БЫТЬ ОДИНАКОВЫЙ,
;   ПОКА НЕ СДВИНУЛИ ДО ЗНАЧАЩИХ РАЗРЯДОВ!
;
CJP А=PSSH18,МАР=РЕ
PSSH18:CONT А=Н18,%TN%
CJS А=INITST,МАР=РЕ
;ЧИТАЕМ CONST ДЛЯ СДВИГА - В РГ.А МПС
CSH18:CONT А=В4,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А
PUSH А=10,МАР=РЕ
;А - СДВИГ В ЛОГИЧЕСКИЙ НА 3 - В У
CONT ALUS=DZ,Н,ALUD=ВА,RА=А,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0-3,SHF=LOG
;СДВИГАЕМ НА 3 АРИФМЕТИЧЕСКИ - В РГ.А
CONT ALUS=DZ,Н,ALUD=ВА,RА=А,RВ=А,ALU,DSRC=SHIFT,MPS,PSHF=SН0-3,SHF=ARIPH
;СРАВНИВАЕМ
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=21,%TIK%
TWB А=CSH18,МАР=РЕ,COND=СТ,SТОРС=21
CJS А=ERRINF,МАР=РЕ
CJP А=CSH18,МАР=РЕ
;
;
СДВИ19:ENTRY
;===== СДВИГ ЛОГИЧЕСКИЙ,АРИФМЕТИЧЕСКИЙ ВЛЕВО ОТРИЦАТЕЛЬНЫХ(!) ЧИСЕЛ В СДВИГАТЕЛЕ
;   А - СДВИНУТОЕ ЛОГЧИЕСКИ; У - АРИФМЕТИЧЕСКИ
;   К РЕЗУЛЬТАТУ ЛОГИЧЕСКОГО СДВИГА ДОБАВЛЯЕМ ЗНАК ПРИ СРАВНЕНИИ.
;
CJP А=PSSH19,МАР=РЕ
PSSH19:CONT А=Н19,%TN%
CJS А=INITST,МАР=РЕ
;ЧИТАЕМ CONST ДЛЯ СДВИГА - В РГ.А МПС
CSH19:CONT А=CF530,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А
PUSH А=22,МАР=РЕ
;А - СДВИГ В ЛОГИЧЕСКИЙ НА 3 - В У
CONT ALUS=DZ,Н,ALUD=ВА,RА=А,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0-3,SHF=LOG
;ДОБАВЛЯЕМ ЗНАК
CONT А=В64,DSRC=PROM,ALUS=DА,RА=У,FUNC=OR,Н,ALUD=В,RВ=У
;СДВИГАЕМ НА 3 АРИФМЕТИЧЕСКИ - В РГ.А
CONT ALUS=DZ,Н,ALUD=ВА,RА=А,RВ=А,ALU,DSRC=SHIFT,MPS,PSHF=SН0-3,SHF=ARIPH
;СРАВНИВАЕМ
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=21,%TIK%
TWB А=CSH19,МАР=РЕ,COND=СТ,SТОРС=21
CJS А=ERRINF,МАР=РЕ
CJP А=CSH19,МАР=РЕ
;
;
СДВИ1А:ENTRY
;===== ПЕРЕХОД К ФОРМАТУ БЭСМ-6, ПОЛОЖИТЕЛЬНЫЕ ЧИСЛА
;   У - ЧТО ДОЛЖНО БЫТЬ (ВЫЧИСЛЕННОЕ); А - "РАСХЛОПНУТОЕ"
;   ДЛЯ КОНТРОЛЯ "РАСХЛАПЫВАНИЯ" ТО ЖЕ САМОЕ СДВИГАЕМ ЛОГИЧЕСКИ ВПРАВО
;   И ДОБАВЛЯЕМ РЕЗУЛЬТАТ СДВИГА 64-ОГО РАЗРЯДА АРИФМЕТИЧЕСКИ БЕЗ 64-ОГО РАЗРЯДА
;
CJP А=PSSH1A,МАР=РЕ
PSSH1A:CONT А=Н1А,%TN%
CJS А=INITST,МАР=РЕ
;ЧИТАЕМ CONST ДЛЯ СДВИГА - В РГ.А МПС
CSH1A:CONT А=С0001,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А
CONT А=В64,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=DADR
PUSH А=22,МАР=РЕ
;А - СДВИГ В ЛОГИЧЕСКИЙ НА 4 - В У
CONT ALUS=DZ,Н,ALUD=ВА,RА=А,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0+4,SHF=LOG
;СДВИГАЕМ АРИФМЕТИЧЕСКИ НА СТОЛЬКО ЖЕ ЗНАК
CONT ALUS=DZ,Н,ALUD=ВА,RА=DADR,RВ=DADR,ALU,DSRC=SHIFT,MPS,PSHF=SН0+4,SHF=ARIPH
;УБИРАЕМ 64 РАЗРЯД, ДОБАВЛЯЕМ ОСТАВШЕЕСЯ К РЕЗУЛЬТАТУ ЛОГИЧЕСКОГО СДВИГА
CONT А=В64,DSRC=PROM,ALUS=DА,RА=DADR,FUNC=EXOR,Н,ALUD=В,RВ=HALF
CONT ALUS=АВ,RА=HALF,RВ=У,FUNC=OR,Н,ALUD=В
;"РАСХЛАПЫВАЕМ" НА 4 - В РГ.А
CONT ALUS=DZ,Н,ALUD=ВА,RА=А,RВ=А,ALU,DSRC=SHIFT,MPS,PSHF=SН0+4,SHF=EMULF
;СРАВНИВАЕМ
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=21,%TIK%
TWB А=CSH1A,МАР=РЕ,COND=СТ,SТОРС=21
CJS А=ERRINF,МАР=РЕ
CJP А=CSH1A,МАР=РЕ
;
;
СДВИ1В:ENTRY
;===== ПЕРЕХОД К ФОРМАТУ БЭСМ-6, ОТРИЦАТЕЛЬНЫЕ(!) ЧИСЛА
;   У - ЧТО ДОЛЖНО БЫТЬ (ВЫЧИСЛЕННОЕ); А - "РАСХЛОПНУТОЕ"
;   ДЛЯ КОНТРОЛЯ "РАСХЛАПЫВАНИЯ" ТО ЖЕ САМОЕ СДВИГАЕМ АРИФМЕТИЧЕСКИ ВПРАВО
;   И ОБНУЛЯЕМ РАСДВИНУТЫЕ РАЗРЯДЫ ("ДЫРУ")
;
CJP А=PSSH1B,МАР=РЕ
PSSH1B:CONT А=Н1В,%TN%
CJS А=INITST,МАР=РЕ
;ЧИТАЕМ CONST ДЛЯ СДВИГА - В РГ.А МПС
CSH1B:CONT А=CF530,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А
CONT А=В64,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=DADR
PUSH А=22,МАР=РЕ
;А - СДВИГ В АРИФМЕТИЧЕСКИЙ НА 4 - В У
CONT ALUS=DZ,Н,ALUD=ВА,RА=А,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0+4,SHF=ARIPH
;СДВИГАЕМ АРИФМЕТИЧЕСКИ НА СТОЛЬКО ЖЕ ЗНАК
CONT ALUS=DZ,Н,ALUD=ВА,RА=DADR,RВ=DADR,ALU,DSRC=SHIFT,MPS,PSHF=SН0+4,SHF=ARIPH
;УБИРАЕМ 64 РАЗРЯД, ИНВЕРТИРУЕМ, ПОЛУЧАЕМ МАСКУ НА "ДЫРУ"
CONT А=В64,DSRC=PROM,ALUS=DА,RА=DADR,FUNC=EXOR,Н,ALUD=В,RВ=HALF
CONT ALUS=ZВ,RВ=HALF,FUNC=EXNOR,Н,ALUD=В
;ОБНУЛЯЕМ "ДЫРУ"
CONT ALUS=АВ,RА=HALF,RВ=У,FUNC=AND,Н,ALUD=В
;"РАСХЛАПЫВАЕМ" НА 4 - В РГ.А
CONT ALUS=DZ,Н,ALUD=ВА,RА=А,RВ=А,ALU,DSRC=SHIFT,MPS,PSHF=SН0+4,SHF=EMULF
;СРАВНИВАЕМ
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,Н,ALUD=Q,CEN
CONT SТОРС=21,%TIK%
TWB А=CSH1B,МАР=РЕ,COND=СТ,SТОРС=21
CJS А=ERRINF,МАР=РЕ
CJP А=CSH1B,МАР=РЕ
;
;
СДВИ1С:ENTRY
;===== СДВИГ ПОЛОВИНЫ(!) CONST ВПРАВО ЛОГИЧ. В МПС НА 16 РАЗР.+ СИГНАЛ RLD(!)
;   А - CONST; У - РЕЗУЛЬТАТ.
;   ОШИБКИ: 01: НЕ ТО В 33-64 РАЗРЯДАХ; 02: В 1-16 Р.; 03: В 17-32 Р.
;
CJP А=PSSH1C,МАР=РЕ
PSSH1C:CONT А=Н1С,%TN%
CJS А=INITST,МАР=РЕ
;ЧИТАЕМ CONST ИЗ ПЗУ В РГ.А
CSH1C:CONT А=CF530,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А
;А - В У, 15 - В РГ/СЧЕТЧИК СУАМ
CONT А=С15,DSRC=PROM,ЕСА,WRA,ARA=RG3,ЕСВ,BRA=RG3,RLD,ALUS=ZА,RА=А,Н
>,ALUD=В,RВ=У
S1А:RРСТ А=S1А,МАР=РЕ,ALUS=ZВ,RВ=У,ALUD=RSB,SHMUX=LSLSL
;ПРОВЕРЯЕМ СТАРШИЕ 32 РАЗРЯДА
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,Н,ALUD=Q
CONT А=MNH,DSRC=PROM,ALUS=DQ,FUNC=AND,Н,ALUD=Q,CEN
CONT SТОРС=21,%CLRTYP%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,%ТУРЕ%
;ВЫЧИСЛЯЕМ МЛАДШИЕ 16 РАЗРЯДОВ (СДВИГАЕМ В СДВИГАТЕЛЕ), СРАВНИВАЕМ
CONT ALUS=DZ,Н,ALUD=ВА,RА=А,RВ=DADR,ALU,DSRC=SHIFT,MPS,PSHF=SН0+16
>,SHF=LOG
CONT ALUS=АВ,RА=У,RВ=DADR,FUNC=EXOR,Н,ALUD=Q
CONT А=MQ,DSRC=PROM,ALUS=DQ,FUNC=AND,Н,ALUD=Q,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
;ПРОВЕРЯЕМ 17-32 РАЗРЯДЫ; Д.Б.= 0, Т.К.СДВИГ ЛОГИЧЕСКИЙ
CONT А=MQ2,DSRC=PROM,ALUS=DА,RА=У,FUNC=AND,ALUD=Q,CEN
CONT SТОРС=/NZ,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
CJP А=CSH1C,МАР=РЕ
;
;
CДBИ1D:ENTRY
;===== СДВИГ ПОЛОВИНЫ CONST>0 ВПРАВО АРИФМЕТИЧЕСКИЙ(!)  НА 32 РАЗРЯДА + RLD
;   А - CONST; У - РЕЗУЛЬТАТ, МЛАДШИЕ 32 РАЗРЯДА = РАЗМНОЖЕННОМУ ЗНАКУ!
;   ОШИБКИ: 01 - ТЕ ТО В СРТАРШЕЙ ПОЛОВИНЕ; 02 - НЕ ТО В МЛАДШЕЙ
;
CJP А=PSSH1D,МАР=РЕ
PSSH1D:CONT А=H1D,%TN%
CJS А=INITST,МАР=РЕ
;ЧИТАЕМ CONST ИЗ ПЗУ В РГ.А
CSH1D:CONT А=С555,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А
;ЗАПОМИНАЕМ ЗНАК
;А - В У, 31 - В РГ/СЧЕТЧИК СУАМ
CONT А=С31,DSRC=PROM,ЕСА,WRA,ARA=RG3,ЕСВ,BRA=RG3,RLD,ALUS=ZА,RА=А,Н
>,ALUD=В,RВ=У
;СДВИГ
S1D:RРСТ А=S1D,МАР=РЕ,ALUS=ZВ,RВ=У,ALUD=RSB,SHMUX=ADNDL
;ПРОВЕРЯЕМ СТАРШИЕ 32 РАЗРЯДА
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,Н,ALUD=Q
CONT А=MNH,DSRC=PROM,ALUS=DQ,FUNC=AND,Н,ALUD=Q,CEN
CONT SТОРС=21,%CLRTYPE%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,%ТУРЕ%
;ПРОВЕРЯЕМ МЛАДШИЕ 32 РАЗРЯДА, Д.Б.РАВНЫ РАЗМНОЖЕННОМУ ЗНАКУ, Т.Е. 0
CONT ALUS=ZА,RА=У,ALUD=Q,CEN
CONT SТОРС=/NZ,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=/NZ,%TIK%
CJP А=CSH1D,МАР=РЕ
;
;
СДВИ1Е:ENTRY
;===== СДВИГ ПОЛОВИНЫ CONST<0 (!) ВПРАВО АРИФМЕТИЧЕСКИЙ(!)  НА 32 РАЗРЯДА + RLD
;   А - CONST; У - РЕЗУЛЬТАТ, МЛАДШИЕ 32 РАЗРЯДА = ЗНАКУ!
;   ОШИБКИ: 01 - НЕ ТЕ 33-64 РАЗРЯДЫ; 02 - 1-32 РАЗРЯДЫ
;
CJP А=PSSH1E,МАР=РЕ
PSSH1E:CONT А=Н1Е,%TN%
CJS А=INITST,МАР=РЕ
;ЧИТАЕМ CONST ИЗ ПЗУ В РГ.А
CSH1E:CONT А=CF530,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А,СЕМ
;А - В У, 31 - В РГ/СЧЕТЧИК СУАМ
PUSH А=С31,DSRC=PROM,ЕСА,WRA,ARA=RG3,ЕСВ,BRA=RG3,RLD,ALUS=ZА,RА=А,Н
>,ALUD=В,RВ=У
;СДВИГ
RFCT ALUS=ZВ,RВ=У,ALUD=RSB,SHMUX=ADNDL
;ПРОВЕРЯЕМ СТАРШИЕ 32 РАЗРЯДА
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,Н,ALUD=Q
CONT А=MNH,DSRC=PROM,ALUS=DQ,FUNC=AND,Н,ALUD=Q,CEN
CONT SТОРС=21,%CLRTYPE%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,%ТУРЕ%
;ПРОВЕРЯЕМ МЛАДШИЕ 32 РАЗРЯДА, Д.Б.РАВНЫ ЗНАКУ: ЗНАК = 1, СРАВНИВАЕМ С FF..FF
CONT А=МН,DSRC=PROM,ALUS=DА,RА=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,%TIK%
CJP А=CSH1E,МАР=РЕ
;
;
CДBИ1F:ENTRY
;===== СДВИГ ПОЛОВИНЫ CONST ВПРАВО ЦИКЛИЧЕСКИЙ 2 РАЗА НА 15 И 17 РАЗРЯДОВ + RLD
;   А - CONST; У - РЕЗУЛЬТАТ
;   ОШИБКИ: 01,02 - НЕ ТЕ ДАННЫЕ ПРИ 1 И 2 СРАВНЕНИИ
;
CJP А=PSSH1F,МАР=РЕ
PSSH1F:CONT А=H1F,%TN%
CJS А=INITST,МАР=РЕ
;ЧИТАЕМ CONST ИЗ ПЗУ В РГ.А
CSH1F:CONT А=СААА,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А
;А - В У, 14 - В РГ/СЧЕТЧИК СУАМ
CONT А=С14,DSRC=PROM,ЕСА,WRA,ARA=RG3,ЕСВ,BRA=RG3,RLD,ALUS=ZА,RА=А,Н
>,ALUD=В,RВ=У
S1F:RРСТ А=S1F,МАР=РЕ,ALUS=ZВ,RВ=У,ALUD=RSB,SHMUX=RSLRSL
;ПРОВЕРЯЕМ МЛАДШИЕ 32 РАЗРЯДА НА НЕСОВПАДЕНИЕ
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=20,%CLRTYP%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=20,%ТУРЕ%
CONT А=С16,DSRC=PROM,ЕСА,WRA,ARA=RG3,ЕСВ,BRA=RG3,RLD
;СДВИГАЕМ ЕЩЕ НА 17 РАЗРЯДОВ ЦИКЛИЧЕСКИ
SH1F:RРСТ А=SH1F,МАР=РЕ,ALUS=ZВ,RВ=У,ALUD=RSB,SHMUX=RSLRSL
;ПРОВЕРЯЕМ МЛАДШИЕ 32 РАЗРЯДА НА СОВПАДЕНИЕ!
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,%TIK%
CJP А=CSH1F,МАР=РЕ
;
;
СДВИ20:ENTRY
;===== СДВИГ ПОЛОВИНЫ CONST ВЛЕВО ЛОГИЧЕСКИЙ НА 16 РАЗРЯДОВ + RLD
;   А - CONST; У - РЕЗУЛЬТАТ.
;   ОШИБКИ: 01,02 - НЕСОВПАДЕНИЕ В СТАРШИХ, МЛАДШИХ РАЗРЯДАХ
;
CJP А=PSSH20,МАР=РЕ
PSSH20:CONT А=Н20,%TN%
CJS А=INITST,МАР=РЕ
;ЧИТАЕМ CONST ИЗ ПЗУ В РГ.А
CSH20:CONT А=СААА,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А
;А - В У, 15 - В РГ/СЧЕТЧИК СУАМ
CONT А=С15,DSRC=PROM,ЕСА,WRA,ARA=RG3,ЕСВ,BRA=RG3,RLD,ALUS=ZА,RА=А,Н
>,ALUD=В,RВ=У
SН20:RРСТ А=SН20,МАР=РЕ,ALUS=ZВ,RВ=У,ALUD=LSB,SHMUX=LSLSL
;ПРОВЕРЯЕМ СТАРШИЕ 32 РАЗРЯДА
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,Н,ALUD=Q
CONT А=MNH,DSRC=PROM,ALUS=DQ,FUNC=AND,Н,ALUD=Q,CEN
CONT SТОРС=21,%CLRTYP%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,%ТУРЕ%
;ВЫЧИСЛЯЕМ 1-32 РАЗРЯДЫ (СДВИГАЕМ В СДВИГАТЕЛЕ), СРАВНИВАЕМ
CONT ALUS=DZ,Н,ALUD=ВА,RА=А,RВ=DADR,ALU,DSRC=SHIFT,MPS,PSHF=SН0-16
>,SHF=LOG
CONT ALUS=АВ,RА=У,RВ=DADR,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,%TIK%
CJP А=CSH20,МАР=РЕ
;
;
СДВИ21:ENTRY
;===== СДВИГ ПОЛОВИНЫ CONST ВЛЕВО АРИФМЕТИЧЕСКИЙ НА 32 РАЗРЯДА + RLD
;   А - CONST; У - РЕЗУЛЬТАТ, ОСТАЕТСЯ ТОЛЬКО ЗНАКОВЫЙ РАЗРЯД!
;   ВНИМАНИЕ! ПРОВЕРКА АРИФМЕТИЧЕСКОГО СДВИГА ВЛЕВО В МПС
;   НЕ ИМЕЕТ СМЫСЛА, Т.К. ЗНАК ДОБАВЛАЕТСЯ ДОПОЛНИТЕЛЬНЫМ
;   СДВИГОМ ВПРАВО! ДОСТАТОЧНО ПРОВЕРКИ ЛОГИЧЕСКОГО СДВИГА.
;   ОШИБКИ: 01,02 - НЕСОВПАДЕНИЕ В СТАРШЕЙ, МЛАДШЕЙ ПОЛОВИНЕ
;
CJP А=PSSH21,МАР=РЕ
PSSH21:CONT А=Н21,%TN%
CJS А=INITST,МАР=РЕ
;ЧИТАЕМ CONST ИЗ ПЗУ В РГ.А
CSH21:CONT А=CF530,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А
;ЗАПОМИНАЕМ ЗНАК
CONT А=В32,DSRC=PROM,ALUS=DА,RА=А,FUNC=AND,CEN,СЕМ
;А - В У, 31 - В РГ/СЧЕТЧИК СУАМ
CONT А=С32,DSRC=PROM,ЕСА,WRA,ARA=RG3,ЕСВ,BRA=RG3,RLD,ALUS=ZА,RА=А,Н
>,ALUD=В,RВ=У
SН21:RРСТ А=SН21,МАР=РЕ,ALUS=ZВ,RВ=У,ALUD=LSB,SHMUX=LSLSL
;ЗАДВИГАЕМ ОБРАТНО ЗНАК
CONT ALUS=ZВ,RВ=У,ALUD=RSB,SHMUX=ADNDL
;ПРОВЕРЯЕМ СТАРШИЕ 32 РАЗРЯДА
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,Н,ALUD=Q
CONT А=MNH,DSRC=PROM,ALUS=DQ,FUNC=AND,Н,ALUD=Q,СЕМ
CONT SТОРС=37,%CLRTYP%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=37,%ТУРЕ%
;ПРОВЕРЯЕМ МЛАДШИЕ 32 РАЗРЯДА: СТАРШИЙ РАЗРЯД Д.Б.РАВЕН ЗНАКУ, ОСТАЛЬНЫЕ = 0
CONT А=В32,DSRC=PROM,ALUS=DА,RА=А,FUNC=AND,ALUD=В,RВ=DADR
CONT ALUS=АВ,RА=DADR,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,%TIK%
CJP А=CSH21,МАР=РЕ
;
;
СДВИ22:ENTRY
;===== СДВИГ ПОЛОВИНЫ CONST ВЛЕВО ЦИКЛИЧЕСКИЙ 2 РАЗА НА 15 И 17 РАЗРЯДОВ + RLD
;   А - CONST; У - РЕЗУЛЬТАТ
;   ОШИБКИ: 01,02 - НЕ ТОТ РЕЗУЛЬТАТ ПОСЛЕ 1,2 СДВИГОВ
;
CJP А=PSSH22,МАР=РЕ
PSSH22:CONT А=Н22,%TN%
CJS А=INITST,МАР=РЕ
;ЧИТАЕМ CONST ИЗ ПЗУ В РГ.А
CSH22:CONT А=СААА,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А
;А - В У, 14 - В РГ/СЧЕТЧИК СУАМ
CONT А=С14,DSRC=PROM,ЕСА,WRA,ARA=RG3,ЕСВ,BRA=RG3,RLD,ALUS=ZА,RА=А,Н
>,ALUD=В,RВ=У
SН22:RРСТ А=SН22,МАР=РЕ,ALUS=ZВ,RВ=У,ALUD=LSB,SHMUX=RSLRSL
;ПРОВЕРЯЕМ МЛАДШИЕ 32 РАЗРЯДА НА НЕСОВПАДЕНИЕ
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=20,%CLRTYP%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=20,%ТУРЕ%
CONT А=С16,DSRC=PROM,ЕСА,WRA,ARA=RG3,ЕСВ,BRA=RG3,RLD
;СДВИГАЕМ ЕЩЕ НА 17 РАЗРЯДОВ ЦИКЛИЧЕСКИ
S22:RРСТ А=S22,МАР=РЕ,ALUS=ZВ,RВ=У,ALUD=LSB,SHMUX=RSLRSL
;ПРОВЕРЯЕМ МЛАДШИЕ 32 РАЗРЯДА НА СОВПАДЕНИЕ!
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,ALUD=Q,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,%TIK%
CJP А=CSH22,МАР=РЕ
;
;
;     ===================
;     ПОИСК ЛЕВОЙ ЕДИНИЦЫ
;     ===================
;
ПЛЕ23:ENTRY
;===== ПОИСК ЛЕВОЙ ЕДИНИЦЫ; ДАННЫЕ - ИЗ БОПП, РЕЗУЛЬТАТ - В БОПП
;   8-15 РГ.БОПП - ДАННЫЕ, ГДЕ ИЩЕМ ЛЕВУЮ ЕДИНИЦУ;
;   7 РГ.БОПП: МЛАДШИЕ 6 РАЗРЯДОВ = РЕЗУЛЬТАТ ПОИСКА, 7-Й РАЗРЯД = ФЛАГ
;   ИЗ БЛОКА ПЛЕ ФЛАГ ПОСТУПАЕТ НА 7-Й РАЗРЯД!
;
CJP А=PSLO23,МАР=РЕ
PSLO23:CONT А=Н23,%TN%
CJS А=INITST,МАР=РЕ
;ЧИТАЕМ ЧИСЛО ИЗ 8-15 РГ.БОПП
CJS А=RD8/F,МАР=РЕ
;ЧИТАЕМ N ЛЕВОЙ ЕДИНИЦЫ
CONT ALUS=DZ,Н,ALUD=ВА,RА=WR6,RВ=А,ALU,DSRC=LOS
;СДВИГАЕМ РЕЗУЛЬТАТ ПЛЕ В СТАРШИЕ РАЗРЯДЫ, ЧТОБ УБРАТЬ МУСОР
CONT ALUS=DZ,Н,ALUD=ВА,RА=А,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0-57,SHF=LOG
;СДВИГАЕМ ВСЕ В МЛАДШИЕ РАЗРЯДЫ
CONT ALUS=DZ,Н,ALUD=ВА,RА=У,RВ=У,ALU,DSRC=SHIFT,MPS,PSHF=SН0+57,SHF=LOG
;ПИШЕМ РЕЗУЛЬТАТ В 7 РГ.БОПП
CONT ALUS=ZА,RА=У,ALU,YDEV=МРМЕМ,WRY,IОМР,MPADR=7
SТР23:CJP А=SТР23,МАР=РЕ
;
;
ПЛЕ24:ENTRY
;===== ПОИСК ЛЕВОЙ ЕДИНИЦЫ; "1" СДВИГАЕТСЯ ОТ СТАРШЕГО РАЗРЯДА К МЛАДШЕМУ
;   А - ВЫЧИСЛЯЕМЫЙ НОМЕР ЕДИНИЦЫ; У - ПРОЧИТАННЫЙ ИЗ ПЛЕ;
;   Q - МАСКА НА 6 МЛ.РАЗРЯДОВ (N ЕДИНИЦЫ) И ФЛАГ (7-Й РАЗРЯД!!!)
;   DADR - ЧИСЛО, У КОТОРОГО ОПРЕДЕЛЯЕМ НОМЕР ЕДИНИЦЫ
;   01 - НЕВЕРНЫЙ N ЕДИНИЦЫ У ЧИСЛА С ЕДИНИЦАМИ, 02 - У ЧИСЛА = "0"
;
CJP А=PSLO24,МАР=РЕ
PSLO24:CONT А=Н24,%TN%
CJS А=INITST,МАР=РЕ
;МАСКА НА 7 МЛАДШИХ РАЗРЯДОВ (6 ИНФОРМАЦИОННЫХ + ФЛАГ) - В РГ.Q
CONT А=М7В,DSRC=PROM,ALUS=DZ,Н,ALUD=Q
;ЧИТАЕМ ЧИСЛО С "1" В 64 РАЗРЯДЕ
CLO24:CONT А=В64,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=DADR
CONT %CLRTYP%
;"-1" - В А
CONT А=CFFF,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А
PUSH А=63,МАР=РЕ,%ТУРЕ%
;+1 К ВЫЧИСЛЯЕМОМУ НОМЕРУ ЕДИНИЦЫ (ОТ 0 ДО 63)
CONT ALUS=ZВ,RВ=А,Н,CI,ALUD=В
;ЧИТАЕМ N ЛЕВОЙ ЕДИНИЦЫ
CONT ALUS=DQ,FUNC=AND,Н,ALUD=ВА,RА=DADR,RВ=У,ALU,DSRC=LOS
;СРАВНИВАЕМ (7-Й РАЗРЯД - ФЛАГ = 0)
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,Н,CEN
CONT SТОРС=21
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21
;СДВИГАЕМ "1" НА 1 РАЗРЯД ВПРАВО
RFCT ALUS=ZВ,RВ=DADR,Н,ALUD=RSB,SHMUX=LSLSL
;ПРОВЕРЯЕМ ПЛЕ С "0":
CONT ALUS=DQ,FUNC=AND,Н,ALUD=ВА,RА=DADR,RВ=У,ALU,DSRC=LOS
;Д.Б.ВСЕ 7 РАЗРЯДОВ = 1, Т.Е. 6 МЛАДШИХ И 7-Й (ФЛАГ); СРАВНИВАЕМ С МАСКОЙ
CONT ALUS=AQ,RА=У,FUNC=EXOR,Н,CEN
CONT SТОРС=21,%ТУРЕ%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,%TIK%
CJP А=CLO24,МАР=РЕ
;
;
ПЛЕ25:ENTRY
;===== ПОИСК ЛЕВОЙ ЕДИНИЦЫ; "1" СДВИГАЕТСЯ ОТ МЛАДШЕГО РАЗРЯДА К СТАРШЕМУ
;   А - ВЫЧИСЛЯЕМЫЙ НОМЕР ЕДИНИЦЫ; У - ПРОЧИТАННЫЙ ИЗ БЛОКА ПЛЕ;
;   Q - МАСКА НА 6 МЛ.РАЗРЯДОВ (N ЕДИНИЦЫ) И ФЛАГ (7-Й РАЗРЯД!!!)
;   DADR - ЧИСЛО, У КОТОРОГО ОПРЕДЕЛЯЕМ НОМЕР ЕДИНИЦЫ
;   01 - НЕВЕРНЫЙ N ЕДИНИЦЫ У ЧИСЛА = "0", 02 - У ЧИСЛА С ЕДИНИЦАМИ
;
CJP А=PSLO25,МАР=РЕ
PSLO25:CONT А=Н25,%TN%
CJS А=INITST,МАР=РЕ
;МАСКА НА 7 МЛАДШИХ РАЗРЯДОВ - В РГ. Q
CLO25:CONT А=М7В,DSRC=PROM,ALUS=DZ,Н,ALUD=Q
;"0" В DADR
CONT ALUS=DZ,FUNC=AND,Н,ALUD=В,RВ=DADR
;ПРОВЕРЯЕМ НА "0" (НЕТ ЕДИНИЦ)
CONT ALUS=DQ,FUNC=AND,Н,ALUD=ВА,RА=DADR,RВ=У,ALU,DSRC=LOS
;СРАВНИВАЕМ (6 МЛАДШИХ И 7-Й - ФЛАГ)
CONT ALUS=AQ,RА=У,FUNC=EXOR,Н,CEN
CONT SТОРС=21,%CLRTYP%
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,%ТУРЕ%
CONT А=М6В,DSRC=PROM,ALUS=DZ,Н,ALUD=В,RВ=А
CONT %ТУРЕ%
;ПИШЕМ "1" В DADR
PUSH А=63,МАР=РЕ,ALUS=ZВ,RВ=DADR,Н,CI,ALUD=В
;ЧИТАЕМ N ЛЕВОЙ ЕДИНИЦЫ
CONT ALUS=DQ,FUNC=AND,Н,ALUD=ВА,RА=DADR,RВ=У,ALU,DSRC=LOS
;СРАВНИВАЕМ
CONT ALUS=АВ,RА=А,RВ=У,FUNC=EXOR,Н,CEN
CONT SТОРС=21
CJS А=ERRINF,МАР=РЕ,COND=СТ,SТОРС=21,%TIK%
;-1 ОТ ВЫЧИСЛЯЕМОГО N ЕДИНИЦЫ
CONT ALUS=ZВ,RВ=А,FUNC=SUBR,Н,ALUD=В
;СДВИГАЕМ "1" НА 1 РАЗРЯД ВЛЕВО С ЗАГРУЗКОЙ "1"
TWB А=CLO25,МАР=РЕ,IСС,ALUS=ZВ,RВ=DADR,Н,ALUD=LSB,SHMUX=NDNS
END
*END
*NО LIST
*CALL MPSEND:SHFT=800
*END FILE
*END FILE
