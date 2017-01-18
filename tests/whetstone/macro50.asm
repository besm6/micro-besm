 macro50:       ,name,

c   Составлена А.И.Салтыковым (ОИЯИ)
c   с участием Л.Г.Каминского (ИФВЭ)
c   Версия 15.01.1975
c   Коэффициенты полиномов взяты
c   из книги 'Computer Approximations'
c   (авторы J.F.Hart и дp., издательство
c   John Wiley and Sons, New York, 1968)

 emulat:        ,subp,  .
 errext:        ,subp,
 *errmac:       ,equ,   errext
 nrescall:      ,subp,
 nr/code:       ,subp,
 *27:           ,block, infsqrt, infasin, infalog, infexp, inferr
 *ycы:      lc  ,block, г y c
 smasav:    lc  ,block, savac,savsr,savar
                ,cont,  savi15,savi14,savi13
                ,cont,  savmir,savs16
 bit48:         ,equ,   700b
 real1:         ,equ,   exp0
 x:             ,equ,   savac
 arcsin:        ,equ,   savac
 ntr:           ,equ,   savsr
 *cb:       lc  ,block, (13), int0
 bit5:          ,equ,   753b
 k coceдy:      ,subp,
c
c---
c
                ,atx,   savac
                ,ita,   14
                ,asn,   64+3
                ,u1a,   *error
                ,xta,   savac
            14  ,uj,    *begin
 macro51:       ,entry,
            14  ,vzm,   sin*
                ,uj,    cos*
 *begin:        ,bss,
            14  ,vtm,   *sqrt
                ,uj,    *sav
 sin*:          ,bss,
            14  ,vtm,   *sin
                ,uj,    *sav
 macro52:       ,entry,
 cos*:          ,bss,
            14  ,vtm,   *cos
                ,uj,    *sav
 macro53:       ,entry,
            14  ,vtm,   *atan
                ,uj,    *sav
 macro54:       ,entry,
            14  ,vtm,   *asin
                ,uj,    *sav
 macro55:       ,entry,
            14  ,vtm,   *alog
                ,uj,    *sav
 macro56:       ,entry,
            14  ,vtm,   *exp
                ,uj,    *sav
 macro57:       ,entry,
            14  ,vtm,   *entier
                ,uj,    *sav
 *sav:          ,bss,
                ,atx,   x
                ,rte,   77b
                ,atx,   ntr
                ,ntr,
                ,ita,   13
                ,atx,   savi13
                ,ita,   15
                ,atx,   savi15
                ,xta,   x
            14  ,uj,

c   Вычисление sqrt(x)
c   Среднее время счёта = 60 мксек.
c   Макс. отн. погр. =1.5e-12
c   Корень извлекается точно из всех
c   x = n**2, гдe 1 <= n < 2**20

 *sqrt:         ,bss,
            14  ,vtm,   *end
                ,e+n,   64
 *sqr:          ,bss,
                ,atx,   x
                ,ntr,   4
            14  ,uza,
                ,ntr,   16
                ,u1a,   *errsqrt
                ,xta,   x
                ,e-x,   x
                ,atx,   y
                ,a*x,   sq2
                ,a+x,   sq1
                ,a*x,   y
                ,a+x,   sq0
                ,e+n,   64+32
                ,atx,   r
                ,xta,   x
                ,asn,   64+1
                ,atx,   z
                ,xta,   r
                ,e+x,   z
                ,atx,   y
                ,xta,   z
                ,ntr,   18
                ,uza,   *sq1
                ,xta,   y
                ,a*x,   sqrt2
                ,atx,   y
 *sq1:          ,xta,   x
                ,a/x,   y
                ,a+x,   y
                ,e+n,   64-1
                ,atx,   y
                ,xta,   x
                ,a/x,   y
                ,a+x,   y
                ,e+n,   64-1
            14  ,uj,
 *errsqrt:      ,bss,
            14  ,vtm,   infsqrt
                ,uj,    *errmac

c   Вычисление sin(x)
c   Среднее время счёта = 55 мксек.
c   Макс. отн. погр. = 4.e-12
c   Всегда abs(sin(x)) <= 1
c   Всегда sin(x)**2 + cos(x)**2 <= 1

 *sin:          ,bss,
                ,avx,   x
                ,a*x,   *1/pi
                ,ntr,   10
                ,u1a,   *s3
 *s1:           ,bss,
                ,ntr,   3
                ,a+x,   int0
                ,ntr,   18
                ,atx,   y
                ,yta,   64-40
                ,atx,   z
                ,xta,   y
                ,asn,   64+8
                ,yta,
                ,atx,   y
                ,xta,   z
                ,ntr,   10
            14  ,v1m,   *s4
                ,x-a,   =r.5
                ,uj,    *s2
 *s4:           ,bss,
                ,u1a,   *s2
                ,x-a,   real1
 *s2:           ,bss,
                ,avx,   y
 *s3:           ,bss,
                ,e+n,   64+1
                ,atx,   z
                ,a*x,   z
                ,atx,   z**2
            14  ,vtm,   -5
                ,xta,   sin6
 *sinl:         ,a*x,   z**2
            14  ,a+x,   sin0
            14  ,vlm,   *sinl
                ,a*x,   z
                ,avx,   x
                ,uj,    *end

c   Вычисление cos(x)
c   Среднее время счёта = 55 мксек.
c   Макс. отн. погр. = 4.e-12
c   Всегда abs(cos(x)) <= 1

 *cos:          ,bss,
                ,avx,   x
                ,atx,   x
                ,a*x,   *1/pi
            14  ,vtm,
                ,uj,    *s1

c   Вычисление atan(x)
c   Среднее время счёта = 90 мксек.
c   Макс. отн. погр. = 7.e-12

 *atan:         ,bss,
                ,avx,   x
                ,atx,   z
                ,xta,
                ,atx,   y
                ,xta,   z
                ,e+n,   64-1
                ,u1a,   *at1
                ,xta,   real1
                ,a/x,   z
                ,atx,   z
                ,xta,   pi/2
                ,atx,   y
 *at1:          ,xta,   z
                ,a*x,   z
                ,atx,   z**2
            14  ,vtm,   -2
 *qat:          ,bss,
            14  ,a+x,   qatan1
                ,a*x,   z**2
            14  ,vlm,   *qat
                ,a+x,   qatan0
                ,atx,   r
            14  ,vtm,   -3
                ,xta,   patan4
 *pat:          ,bss,
                ,a*x,   z**2
            14  ,a+x,   patan0
            14  ,vlm,   *pat
                ,a/x,   r
                ,a*x,   z
                ,a-x,   y
                ,amx,
                ,avx,   x
                ,uj,    *end

c   Вычисление asin(x)
c   Среднее время счёта = 80 мксек.
c   Макс. отн. погр. = 7.e-12

 *asin:         ,bss,
                ,atx,   arg
                ,avx,   x
                ,atx,   z
            14  ,vtm,   bit48
                ,ntr,   8
                ,u1a,   *as1
                ,x-a,   real1
                ,u1a,   *errasin
                ,e+n,   64-1
            14  ,vjm,   *sqr
                ,atx,   z
            14  ,vtm,   pi/2
 *as1:          ,bss,
            14  ,xta,
                ,atx,   arcsin
                ,xta,   z
                ,a*x,   z
                ,atx,   z**2
            14  ,vtm,   -2
 *qas:          ,bss,
            14  ,a+x,   qasin1
                ,a*x,   z**2
            14  ,vlm,   *qas
                ,a+x,   qasin0
                ,atx,   r
            14  ,vtm,   -2
                ,xta,   pasin3
 *pas:          ,bss,
                ,a*x,   z**2
            14  ,a+x,   pasin0
            14  ,vlm,   *pas
                ,a/x,   r
                ,a*x,   z
                ,e+x,   arcsin
                ,a-x,   arcsin
                ,amx,
                ,avx,   arg
                ,uj,    *end
 *errasin:      ,bss,
            14  ,vtm,   infasin
                ,uj,    *errmac

c   Вычисление alog(x)
c   Среднее время счёта = 60 мксек.
c   Макс. отн. погр. = 3.e-12
c   alog(1.) в точности равен 0.

 *alog:         ,bss,
                ,avx,   sin1
                ,uza,   *errlog
                ,atx,   x
                ,e-x,   x
                ,atx,   y
                ,a-x,   sqrt2/2
                ,atx,   z
                ,a+x,   sqrt2
                ,a/x,   z
                ,atx,   z
                ,a*x,   z
                ,atx,   z**2
            14  ,vtm,   -4
                ,xta,   alog5
                ,ntr,   2
 *alogl:        ,bss,
                ,a*x,   z**2
            14  ,a+x,   alog0
            14  ,vlm,   *alogl
                ,a*x,   z
                ,a-x,   ln2/2
                ,atx,   r
                ,xta,   x
                ,aax,   =7740 0000 0000 0000
                ,asn,   64+7
                ,aex,   =4320 0000 0000 0000
                ,a*x,   ln2
                ,a+x,   r
                ,uj,    *end
 *errlog:       ,bss,
            14  ,vtm,   infalog
                ,uj,    *errmac

c   Вычисление exp(x)
c   Среднее время счёта = 65 мксек.
c   Макс. отн. погр. = 5.e-12

 *exp:          ,bss,
                ,a*x,   *1/ln2
                ,atx,   x
                ,a-x,   =r63.
                ,uza,   *errexp
                ,a+x,   =r127.
                ,u1a,   *czero
                ,xta,   x
                ,ntr,   3
                ,a+x,   int0
                ,atx,   z
                ,ntr,
                ,yta,   64-41
                ,e+n,   64
                ,atx,   y
                ,xta,   z
                ,asn,   64+7
                ,yta,
                ,aex,   bit48
                ,atx,   z
            14  ,vtm,   -6
                ,xta,   exp7
 *expl:         ,a*x,   y
            14  ,a+x,   exp0
            14  ,vlm,   *expl
                ,atx,   r
                ,a*x,   r
                ,e+x,   z
                ,uj,    *end
 *czero:        ,xta,
                ,uj,    *end
 *errexp:       ,bss,
            14  ,vtm,   infexp
                ,uj,    *errmac

c   Вычисление целой части x
c   Среднее время счёта = 25 мксек.

 *entier:       ,bss,
                ,ntr,   3
                ,a+x,   int0
                ,ntr,
                ,e+n,   64
 *end:          ,xtr,   ntr
                ,uj,    end*
