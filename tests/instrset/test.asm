main_sw:    name    qf
;
;****************************
;*                          *
;*      ПЕРЕКЛЮЧАТЕЛЬ       *
;* прерываний и экстракодов *
;*                          *
;****************************
;
; Адрес начала переключателя прерываний фиксирован
; в соответствующих микропрограммах.
; Сейчас он равен  fff8 0800  (514-й мат.лист).
; Далее дается распределение в относительных адресах:
;
; 00:3f - прерывания  1:64
;  40   - глобальный семафор памяти
;  50   - экстракоды нового режима
;  51   - экстракоды старого режима (бэсм-6)
;  52   - экстракоды и некоторые команды  свс
;  53   - запрещенные команды (осн.формат)
;  5f   - контрольная сумма программы
;  60   - вход после общего сброса машины
;
beg_с:          equ     @fff8 0800      ; нач. C-обл.
free_с:         pccb    (0)             ; конец C-обл.
vol_с:          equ     free_с - beg_с >> 10 & @3ff
main_pag:       equ     beg_с >> 10 & @3ff
;;pplist:         equ     127             ; для пп
pplist:         equ     @3c0            ; пп-адреса: f0000
;
beg_v:          equ     @fffe 0000      ; нач. V-обл.
jumpadr:        lcb     npass, nexpag, lrw
                        , new_reg, halter, ercnt
                        , ppmask, cmdiv, mircopy
                        , cptim(3), mscale(16)
                        , adr(68), atest(128)
                        , bltest(256)
                        , oldrp, er6
lws:            equ     1030
магазины:       lcb     рав(11)         ; возвраты из п/п
                        , рапу(80)      ; п/упр.(крат.16)
                        , mst(40)       ; для магаз.команд
                        , ws(lws)       ; раб.ячейки
;----- блок связи с пп:
mc:             equ     40              ; каналы
mj:             equ     64              ; заявки
lо:             equ     200             ; выв.буфер
@f0000:         block   refer(6), last_job, ppinf
                        , heads(mc>>3), que(mj>>3)
                        , jов(2*mj), con_in(16)
                        , con_out(lо), last_out
                        , (1), cnt
;
долбежка:       equ     refer + @3ff
долблист:       equ     @3f             ; лист=63
;
limit:          equ     lo/12
free_v:         pcb     (0)             ; конец V-обл.
vol_v:          equ     free_v - beg_v >> 10 & @3ff
main_reg:       equ     @c17f           ; нач.режим
work_reg:       equ     @402c           ; раб.режим
sтер:           equ     15              ; шаг теста страниц
sindrom:        equ     -1              ; синдром Кима
quant:          equ     @20001          ; 2**21 = 1 сек.
clock:          equ     -8              ; часы
;
m15:            equ     @7fff
n:              equ     1               ; ном.прер.
8:              block   ng, p2, p1, tn, ра, ri, iа
;---------------------------------------
                const
ful:            hex     ffff ffff ffff ffff
chess1:         hex     aaaa aaaa aaaa aaaa
chess2:         hex     5555 5555 5555 5555
wellint:        hex     0000 0180 0000 000e
comint:         hex     00a4 9800 0000 0000
;
s_num:          hex     7374 7501 7602 0304
 :              hex     7705 0607 0809 1011
 :              hex     7812 1314 1516 1718
 :              hex     1920 2122 2324 2526
 :              hex     7927 2829 3031 3233
 :              hex     3435 3637 3839 4041
 :              hex     4243 4445 4647 4849
 :              hex     5051 5253 5455 5657
 :              hex     8058 5960 6162 6364
 :              hex     6566 6768 6970 7172
oldcop:         hex     3031 903b 3c3d ebec
 :              hex     1819 3233 2021 361b
 :              hex     0001 0203 e5e6 e7e8
 :              hex     0809 0a0b e90d 0eea
 :              hex     1011 1213 1415 16db
oldcop2:        hex     8381 3233 1c1d 1682
 :              hex     2021 8022 2425 2627
 :              hex     2829 2a2b 2c2d 2e2f
 :              hex     3031 3233 3435 3637
 :              hex     3839 3a3b 3c3d 3e3f
ches2old:       hex     7d55 5555 5555 5000
;
;---------------------------------------
                cmd
;
;
; ПРЕРЫВАНИЯ:
; ***********
;
; Процессор переключается на 0-ю группу регистров.
; Прежнее состояние этих регистров несущественно.
; Устанавливаются: БПНП, БВП, РД, РОА, БЗО, БЗЗ, ПОП.
; Устанавливаются заново следующие регистры:
;
; tn - номер прерванного процесса
; ng - номер активной группы его регистров
; p1 - копия регистра режимов прерв.процесса
; p2 - копия расширения регистра режимов
; ri - мат.адрес команды, вызвавшей прерывание
; ра - физ.адрес команды, вызвавшей прерывание
; iа - мат.адрес операнда, вызвавшего прерывание
; са - код операции арбитра
;
; mozy = 80800
;
begin:      n   vtm     1
                jmp     int
 :          n   vtm     2
                jmp     int
 :          n   vtm     3
                jmp     int
 :          n   vtm     4
                jmp     int
 :          n   vtm     5
                jmp     extint          ; программное
 :          n   vtm     6
                jmp     int
 :          n   vtm     7
                jmp     int
 :          n   vtm     8
                jmp     int
 :          n   vtm     9
                jmp     int
 :          n   vtm     10
                jmp     int
 :          n   vtm     11
                jmp     int
 :          n   vtm     12
                jmp     int
 :          n   vtm     13
                jmp     int
 :          n   vtm     14
                jmp     int
 :          n   vtm     15
                jmp     int
 :          n   vtm     16
                jmp     int
 :          n   vtm     17
                jmp     int
 :          n   vtm     18
                jmp     int
 :          n   vtm     19
                jmp     int
 :          n   vtm     20
                jmp     int
 :          n   vtm     21
                jmp     int
 :          n   vtm     22
                jmp     int
 :          n   vtm     23
                jmp     int
 :          n   vtm     24
                jmp     int
 :          n   vtm     25
                jmp     int
 :          n   vtm     26
                jmp     int
 :          n   vtm     27
                jmp     extint          ; внешние
 :          n   vtm     28
                jmp     int
 :          n   vtm     29
                jmp     ret_int         ; шаговое
 :          n   vtm     30
                jmp     int
 :          n   vtm     31
                jmp     int
 :          n   vtm     32
                jmp     int
 :          n   vtm     33
                jmp     int
 :          n   vtm     34
                jmp     int
 :          n   vtm     35
                jmp     int
 :          n   vtm     36
                jmp     int
 :          n   vtm     37
                jmp     int
 :          n   vtm     38
                jmp     int
 :          n   vtm     39
                jmp     int
 :          n   vtm     40
                jmp     int
 :          n   vtm     41
                jmp     int
 :          n   vtm     42
                jmp     int
 :          n   vtm     43
                jmp     int
 :          n   vtm     44
                jmp     int
 :          n   vtm     45
                jmp     int
 :          n   vtm     46
                jmp     int
 :          n   vtm     47
                jmp     int
 :          n   vtm     48
                jmp     int
 :          n   vtm     49
                jmp     int
 :          n   vtm     50
                jmp     int
 :          n   vtm     51
                jmp     int
 :          n   vtm     52
                jmp     int
 :          n   vtm     53
                jmp     int
 :          n   vtm     54
                jmp     int
 :          n   vtm     55
                jmp     int
 :          n   vtm     56
                jmp     int
 :          n   vtm     57
                jmp     int
 :          n   vtm     58
                jmp     int
 :          n   vtm     59
                jmp     int
 :          n   vtm     60
                jmp     int
 :          n   vtm     61
                jmp     int
 :          n   vtm     62
                jmp     int
 :          n   vtm     63
                jmp     int
 :          n   vtm     64
                jmp     int
;
s_мем:          atx                     ; семафор
                atx                     ; памяти
;
:               atx     0
                atx     @a2
;
:               atx     0               ; 42 - резерв
:               atx     0               ; 43
:               atx     0               ; 44
:               atx     0               ; 45 - дата сборки
:               atx     0               ; 46 - d:\besm6
:               atx     0               ; 47 - \кт<n>.bin
:               atx     0               ; 48
:               atx     0               ; 49
;
; создание резервной копии программы
; со смещением на 16 страниц
;
сору:       14  vtm     1 + begin - free_с
                setr    @3178
:           14  tta     free_с - 1
            14  ttx     free_с + @3fff
            14  vlm     * - 1
                jmp     test
; восстановление основного экземпляра
rесору:     14  vtm     1 + begin - free_с
                setr    @3178
:           14  tta     free_с + @3fff
            14  ttx     free_с - 1
            14  vlm     * - 1
                jmp     test
;
;
; ЭКСТРАКОДЫ:
; ***********
;
:           n   vtm     65
                jmp     int
:           n   vtm     66
                jmp     int
:           n   vtm     67
                jmp     int
:           n   vtm     68
                jmp     int
;
int:        n   wtc     adr - 1
                jmp                     ; на обработку прер.
;
;
cheksumm:       uta
            n   vtm     free_с - begin - 2
:           n   arx     begin
            n   vrm     *
                aex     ful             ; контр.сумма
            13  jaeq                    ; совпала
ercs:           hlt     1
            13  jmp
;
:               atx                     ; 59
:               atx                     ; 5a
:               atx                     ; 5b
:               atx                     ; 5c
:               atx                     ; 5d
:               atx                     ; 5e
csumm:          atx     0               ; для контр.
                atx     0               ;  суммы
;
;
;
; Прерывания при записи в ОЗУ:
; ============================
;
; @15(21)- защита адреса при записи.
;          возникает при "0" бптз, если при записи в
;          память слово по исп.адресу содержит "1" в
;          68 разряде тега. (сигнал pwri шины данных).
;
; Прерывания по тегу:
; ===================
;
; @0а(10) - программная интерпретация тега команды.
;         происходит во время выборки командного слова
;         из озу при "0" бпинт и "1" 72 разряда тега.
;
; @0в(11) - программная интерпретация тега операнда.
;         происходит во время выборки операнда из озу
;         при "0" бпинт и "1" 72 разряда тега операнда
;
; @16(22) - чужой сумматор.  возникает в отсутствие бчс
;         при несовпадении 66 бита тега текущего кома-
;         ндного слова с признаком "рэ" в  рр.
;
; @17(23) - чужой операнд. возникает в отсутствие бчоп
;         при несовпадении 66 бита тега операнда с
;         признаком "рэ" в  рр.
;
; @0с(12) - защита адреса при чтении.
;
; @0d(13) - контроль команды.
;
; @13(19) - защита выборки команды.
;
; @14(20) - защита передачи управления.
;
; Прерывания при обращении к ОЗУ и шине данных
; ============================================
;
;     2 - многократная ошибка. (сигнал deri шины).
;     1 - отсутствующий блок памяти. (сигнал ambi).
;     3 - "time-out" при обращении к озу.
;         вырабатывается при отсутствии ответа озу
;         в течение 100 микросекунд.
;     4 - "time-out" при обращении к шине.
;         вырабатывается арбитром при отсутствии отве-
;         та от шины в течение 100 микросекунд.
;
; Прерывания по приписке:
; =======================
;
; @0е(14) - матем.адрес равен 0.  псевдопрерывание.
; @0f(15) - чужой регистр приписки при чтении/записи.
;         возникает при несовпадении поля номера
;         процесса в регистре приписки с номером
;         текущего процесса. (при пнп=255 страница
;         доступна всем процессам).
; @10(16) - чужой регистр приписки при выборке команд.
;         аналогично предыдущему.
; @11(17) - защита страницы при обращении. возникает
;         в отсутствие бп и бзо, если операнд команды
;         чтения/записи находится в защищенной страни-
;         це ("0" 10-го разряда соотв. рп).    при
;         выборке команды этого прерывания не бывает.
; @12(18) - защита страницы при записи.  возникает в
;         отсутствие бп и бзз и "0" 9-го разряда рп.
;      8 - отрицательный номер страницы у команды.
;         блокируется признаками бп или роа.
;      9 - отрицательный номер страницы у операнда.
;
; Разные прочие прерывания:
; =========================
;
;      7 - отсутствующий адрес памяти. возникает только
;         в новом режиме при несовпадении 21-32  и 20
;         разрядов математического (или физического,
;         если бп) адреса операнда или команды.
; @18(24) - запрос модификации  приоритетов страниц.
;         псевдопрерывание.
; @1а(26) - "time-out" при блокировке внешних прерываний
;         возникает при срабатывании микросекундного
;         таймера, включающегося одновременно с бвп.
; @1е(30) - обращение блока связи пп за чтением/записью
;         регистров.   псевдопрерывание.
; @1d(29) - шаговое прерывание.
;
; @1в(27) - внешние прерывания.
;
;     5 - программно имитированные прерывания.
;         возникают при выдаче команды  wmod @1с13
;         или при установке в "0" таймера счетн.врем.
;         "1" 40 разряда грп - от таймера
;         "1" 41 разряда грп - от программы или пп.
;
; @1с(28) - halt. возникает по команде halt, по запросу
;         от пп, при прерывании с наличием поп,
;         при пультовом останове.
;
; Прерывания, фиксируемые в микропрограммах:
; ==========================================
;
; @1f(31) - младшие 16 р.  часов  счетного времени = 0
; @20(32) - младшие 16 р. таймера счетного времени = 0
; @21(33) - переполнение.  при "0" бпп порядок результа-
;         та арифм.операции с плав.запятой превышает
;         2047, или выход за 64 (32) разряда при рабо-
;         те с целочисленными словами (полусловами).
; @22(34) - переполнение порядка бэсм-6.
;         возможно в режиме эмуляции при наличии ббч.
; @23(35) - деление на 0.
; @24(36) - переполнение поля упрятывания. возникает
;         в отсутствие бппу при экстракодах после
;         упрятывания регистров в память, если
;         поле упрятывания уперлось в конец страницы.
; @25(37) - незаконный операнд.  возникает в режиме
;         эмуляции, если при "1" 64 р. имеется хотя бы
;         одна "1" в 63-59 р. сумматора или операнда
;         при выполнении логических и сдвиговых команд
;         иаоп=<мат.адр.операнда> или 0 для сумматора.
; @26(38) - выборка команды по мат.адресу 0.
;
;   39:64 - не задействованы:
;
; =========================================
;
test:
            14  vtm     main_reg + @80
            14  clrr    @e0000          ; начальный
            14  setr                    ; режим + бвп
                uta     1 << 5
                wmod    @1818           ; группа=1
            14  vtm     main_reg + @80
                uta     8
                wmod    @1819           ; процесс=8
; приписка блока связи с пп
                uta     pplist << 10 + @3ff
                wmod    @7c0            ; f0000
                uta     -1
                wmod    @7ff            ; тут пп-маска
                wmod    @1c15           ; таймер
            12  vjm     setgr
                wmod    @1e             ; =0
                atx     -4              ; гаш. пп-маски
                wmod    @1802           ; и грп
                atx     heads
                atx     que
            15  vtm     refer
                uta     heads - refer   ; занесение
                uts     que - refer     ; постоянных
                uts     jов - refer     ; указателей
                uts     con_in - refer  ; для блока
                uts     con_out - refer ; связи с пп
                uts     lо
                uts
                wmod    @1c14           ; часы
;
            14  vtm     main_reg        ; нач.режим
            14  clrr    @e0000          ; в исп.
            14  setr                    ; часть (без бвп)
;
            14  vtm     -30             ; роспись
:           14  wmod    31              ; 0-й группы
            14  vlm     *
                uta     рапу + 64
                wmod    15              ; магазин
                wmod    @1d             ; рапу
                wmod    @13             ; рав
                uta     -1
                wmod    @14             ; таймер
                wmod    @15             ; и сч-к времени
                wmod    @16             ; обработки прер.
                wmod    @1c19           ; сброс кэша
                jmp     setrp
;
setgr:          rmod    @1818
                ati     2               ; р н г
                ita     14
                asn     1024 - 10
            2   wmod    @11             ; в рр группы
            14  clrr    @e0000
            14  setr
                uta     @3f
                asn     1024 - 16       ; резервная
                aou     1               ; группа = 31
            2   wmod    @12             ; в ррр
                uta     рапу
            2   wmod    @1d
                uta     рав
            2   wmod    @13
                rmod    @1819           ; рнп
            2   wmod    @1e             ; в свою группу
                wmod    @3fe            ; и в резервную
                uta
            12  utc
            2   jmne
;
; если уж так случилось, что попали
; в 0-ю группу, культурно уйдем в 1-ю.
;
            3   vtm     @20             ; группа 1
                ita     3
                asn     1024 - 3        ; ссылку -
                aou     1               ; - в свой
            2   wmod    @12             ; ррр
                uta     main_reg
                asn     1024 - 10
            3   wmod    @11             ; готовим рр,
                uta     setgr
            3   wmod    @1b             ; счас,
                ita     14
            3   wmod    14
                ita     12
            3   wmod    12              ; и12 (выход)
                jmp     ret_int
;
setrp:          uta
            14  vtm     1022            ; очистка почти
:           14  wmod    @400            ; всех рп
            14  vrm     *
                uta     pplist << 10 + @3ff
                wmod    @7c0            ; бл.связи с пп
;
; приписываем себя к физ.листам: 0-с
; и свою копию со смещением на 16 листов
;
            14  vtm     @2ff            ; запр.записи
            13  vtm     1 - vol_с
:               ita     14
            13  wmod    free_с >> 10 & @3ff + @3ff
            13  wmod    vol_с + @401    ; силин
                a+u     @4000           ; 2-й экземпляр
            13  wmod    free_с >> 10 & @3ff + @40f
            14  utm     @400            ; с- приписка
            13  vlm     * - 3
            14  utm     @100            ; разр.записи
            13  vtm     1 - vol_v
:               ita     14
            13  wmod    free_v >> 10 & @3ff + @3ff
            13  wmod    vol_v + @3ff    ; силин
            14  utm     @400            ; v- приписка
            13  vlm     * - 2
            13  vjm     cheksumm
                xta     free_с - 1
                jane    initque
;
; запаковка старорежимной части теста
;
                setr    @1000           ; уст бзз
            1   vtm     tbegin - t21 - 1
pack1:      1   tta     t21
                atx     ws
                ytx     ws + 1
            2   vtm     1
pack2:      2   hta     ws << 1
                asn     @400 + 20
                aau     @ff
                ati     3               ; коп-1
                aeu     @3f
                jane    pack3
            2   hta     ws << 1
                asn     @400 + 12
                aau     @ff
                ati     3               ; коп - 2
            4   vtmb    oldcop2
            5   vtm     -79 + @28
                jmp     pack4
pack3:      4   vtmb    oldcop
            5   vtm     -79
pack4:      4   bta
                aei     3
                jaeq    pack5
            4   utm     1
            5   vlm     pack4
                hlt     7
pack5:      5   utm     79
                ita     5
                a-u     16
                jage    pack7           ; короткий адрес
            5   uta     @10
                asn     @400 - 3
            6   vtm     =h0000 0000 000f 8000
                jmp     pack8           ; длинный адрес
;
pack7:      2   hta     ws << 1
                aau     @7000
                aeu     @7000
:               jane    * + 1
                utc     @40             ; бит 19 коп
:           5   uta     -16
            6   vtm     =h0000 0000 000f f000
;
pack8:          asn     @400 - 12
            2   aeh     ws << 1
            6   aax
            2   aeh     ws << 1
            2   ath     ws << 1
            2   vrm     pack2
                xta     ws + 1
                aou     2
                atx     ws + 1
                xta     ws
                apx     =hf00ffffff00fffff
                aen
                asna    @400 + 4
                aen
                xty     ws + 1
            1   ttx     t21
            1   vrm     pack1
                xta     ches2old
                ttx     chess + 1
;
; заново пересчитаем контр. сумму
;
                uta
                atx     csumm
            n   vtm     free_с - begin - 2
:           n   arx     begin
            n   vrm     *
                aeu     -1
                atx     csumm
                clrr    @fefff          ; снять бзз
;
; роспись всей памяти нулями
; (только при первом запуске)
;
            7   vtm     1023 - 64
            13  vjm     memory
                rmod    @401
                ati     10
            6   vtmf    mscale
                setr    @3178
clem1:          ita     7
                aeu     pplist
                jaeq    clem2
                ita     7
                a-u     vol_с
                jalt    clem2
:               jane    * + 1
                utc     adr - beg_v
:           14  vtm     -1023
            7   utc
            6   fta
                jaeq    clem2
                ita     7
                asn     @400 - 10
                aou     @3ff
                wmod    @401
                uta
                uty     @34
:           14  ttx     1024 + 1023
            14  vlm     *
clem2:      7   vrm     clem1
                ita     10
                wmod    @401
;
                xta     free_с - 1
                jane    initque
            14  vtm     1 + begin - free_с
                xta     ="double-1"
                atx     free_с - 1
:           14  tta     free_с - 1      ; создаем свою
            14  ttx     free_с + @3fff  ; копию
            14  vlm     * - 1
                xta     ="double-2"
                atx     free_с + @3fff
                clrr    main_reg + @50000
;
; нач.состояние очередей:
;
initque:        uta
            14  vtm     6 - 1023
:           14  atx     refer + 1023
            14  vlm     *
            14  vtm     2 - mj
            15  vtm     mst
:               a+u     1
            14  atb     que << 3 + mj - 2
            14  vlm     * - 1
;
            13  vjm     cheksumm
;
; адреса начал подтестов:
; (заранее их установить не удалось,
; т.к. тов.Давыдов похоже неверно
; транслирует длинные списки констант).
;
                uta
            14  vtm     er6 - atest
:           14  atx     atest
            14  vrm     *
            2   vtmh    atest
;
; подтесты режима эмуляции:
;
                uta     t21 & m15
            2   ath     @21
                uta     t22 & m15
            2   ath     @22
                uta     t23 & m15
            2   ath     @23
                uta     t24 & m15
            2   ath     @24
                uta     t25 & m15
            2   ath     @25
                uta     t26 & m15
            2   ath     @26
                uta     t27 & m15
            2   ath     @27
                uta     t2а & m15
            2   ath     @2a
                uta     t2в & m15
            2   ath     @2b
                uta     t2с & m15
            2   ath     @2c
                uta     t30 & m15
            2   ath     @30
                uta     t31 & m15
            2   ath     @31
                uta     t32 & m15
            2   ath     @32
                uta     t33 & m15
            2   ath     @33
                uta     t34 & m15
            2   ath     @34
                uta     t35 & m15
            2   ath     @35
                uta     t36 & m15
            2   ath     @36
                uta     t37 & m15
            2   ath     @37
                uta     t38 & m15
            2   ath     @38
                uta     t3а & m15
            2   ath     @3a
                uta     t40 & m15
            2   ath     @40
                uta     t42 & m15
            2   ath     @42
                uta     t43 & m15
            2   ath     @43
                uta     t44 & m15
            2   ath     @44
                uta     t45 & m15
            2   ath     @45
                uta     t46 & m15
            2   ath     @46
                uta     t47 & m15
            2   ath     @47
                uta     t48 & m15
            2   ath     48
;
; подтесты нового режима:
;
                uta     t51
            2   ath     @51
                uta     t52
            2   ath     @52
                uta     t53
            2   ath     @53
                uta     t54
            2   ath     @54
                uta     t55
            2   ath     @55
                uta     t56
            2   ath     @56
                uta     t57
            2   ath     @57
                uta     t5а
            2   ath     @5a
                uta     t5в
            2   ath     @5b
                uta     t5с
            2   ath     @5c
                uta     t60
            2   ath     @60
                uta     t70
            2   ath     @70
                uta     t71
            2   ath     @71
                uta     t72
            2   ath     @72
                uta     t73
            2   ath     @73
                uta     t74
            2   ath     @74
                uta     t75
            2   ath     @75
                uta     t76
            2   ath     @76
                uta     t77
            2   ath     @77
                uta     t78
            2   ath     @78
                uta     t80
            2   ath     @80
                uta     t81
            2   ath     @81
                uta     t82
            2   ath     @82
                uta     t83
            2   ath     @83
                uta     t8с
            2   ath     @8c
                uta     t41
            2   ath     @41             ; 41-экстракоды
                uta     t41_емр
            2   ath     @42             ; 42-пустой экстракод
                uta     t41_емр+1
            2   ath     @43             ; 43 --"-- без рез.гр.
                uta     tprogi
            2   ath     @05             ; 05-прогр.прерывания
                uta     tinter
            2   ath     @3e             ; 3е-теговские прер-я
                uta     pinter
            2   ath     @3f             ; 3f-страничные прер-я
                uta     loopint
            2   ath     @40             ; 40-цикл.прер.по "кк"
                uta     t4а
            2   ath     @4a             ; 4а - tta,ttx
                uta     tsem
            2   ath     @4b             ; 4в - семафоры
                uta     t90
            2   ath     @90
                uta     t91
            2   ath     @91
                uta     t94
            2   ath     @94
                uta     t95
            2   ath     @95
                uta     t96
            2   ath     @96
                uta     ta0
            2   ath     @a0
                uta     ta1
            2   ath     @a1
                uta     ta2
            2   ath     @a2
                uta     ta3
            2   ath     @a3
                uta     ta4
            2   ath     @a4
                uta     ta5
            2   ath     @a5
                uta     ta6
            2   ath     @a6
                uta     ta7
            2   ath     @a7
                uta     tb0
            2   ath     @b0
                uta     tb1
            2   ath     @b1
                uta     tb2
            2   ath     @b2
                uta     tb3
            2   ath     @b3
                uta     tb6
            2   ath     @b6
                uta     tb7
            2   ath     @b7
                uta     tc0
            2   ath     @c0
                uta     tc1
            2   ath     @c1
                uta     tc2
            2   ath     @c2
;=============================
; неработающие пока подтесты:
;=============================
                uta     -1
                atx     bltest + @a3
;
; инициализация счетчиков:
;
initcnt:    15  vtm     npass
                uta
                uts     -sтер           ; full=-1
                uts     lws             ; full=lws
                uts                     ; new_reg
                uts                     ; halter
                uts                     ; ercnt
                uts     7
                atx     -4              ; откр.пп-маску
                xts     =h0007 0000 0000 0000 ; cmdiv
                uts
                uts                     ; времена=0
                uts
                uts
                uts     -1
                atx     clock           ; часы=0
            15  vtm     mst
                xta     ="'@0a''@0d' *** "
                xts     ="Complex"
                xts     ="test MKB"
                xts     ="-8601."
                xts     ="Version:"
                xts     begin + @45
                xts     =",  name:"
                xts     begin + @47
                xts     begin + @48
                uts     mst
            5   vjm     output
            15  vtm     mst
                uta     @0a0d
                asn     @400 - 48
                uts     mst
            5   vtm     tbegin
                jmp     output
;
; а здесь Силин держит
; старорежимную часть теста!
;
;*********************************
;
; I.  Репертуар старой БЭСМ-6.
; ============================
;
;*********************************
;
; 21, 22 - проверка команд VZM, VIM, VTM, UTM:
;
t21:        n   vtm     @21
            2   vtm     0
            2   jmeq    * + 1
                jmp     error
:           2   jmne    error
            2   jmne    error
            2   vtm     -1
            2   jmeq    error
:           2   jmeq    error
            2   jmne    t22
                jmp     error
;
t22:        n   vtm     @22
            2   vtm     1
            3   vtm     -15
                jmp     * + 2
:           2   j+m     2               ; сдвиг "1" влево
            3   utm     1
:           2   jmne    * - 1
            3   jmne    error
            13  vjm     newtest
;
; 23 - проверка команды VLM:
;
t23:        n   vtm     @23
            n   xta     bltest
                u1a     t24
            2   vtm     -999
            3   vtm     -1000
:           3   utm     1
            2   vlm     *
            2   jmne    error
            3   jmne    error
:           2   vlm     error           ; а что при "0"
            2   jmne    error
;
; слабое место: короткий цикл
;
                xta     cful
            14  vtm     -1023
:           14  atx     ws + 1023
            14  vlm     *
                xta
            15  vtm     -1023
:           15  arx     ws + 1023
            15  vlm     *
                aex     cful
                u1a     error
            14  vtm     -1023
            13  vtm     -1023
:           14  arx     ws + 1023
            14  vlm     *
                aex     cful
                u1a     error
:           13  arx     ws + 1023
            13  vlm     *
                aex     cful
                u1a     error
            12  vtm     -1023
            11  vtm     -1023
:           12  arx     ws + 1023
            12  vlm     *
                aex     cful
                u1a     error
:           11  arx     ws + 1023
            11  vlm     *
                aex     cful
                u1a     error
            10  vtm     -1023
            9   vtm     -1023
:           10  arx     ws + 1023
            10  vlm     *
                aex     cful
                u1a     error
:           9   arx     ws + 1023
            9   vlm     *
                aex     cful
                u1a     error
            8   vtm     -1023
            7   vtm     -1023
:           8   arx     ws + 1023
            8   vlm     *
                aex     cful
                u1a     error
:           7   arx     ws + 1023
            7   vlm     *
                aex     cful
                u1a     error
            6   vtm     -1023
            5   vtm     -1023
:           6   arx     ws + 1023
            6   vlm     *
                aex     cful
                u1a     error
:           5   arx     ws + 1023
            5   vlm     *
                aex     cful
                u1a     error
            4   vtm     -1023
            3   vtm     -1023
:           4   arx     ws + 1023
            4   vlm     *
                aex     cful
                u1a     error
:           3   arx     ws + 1023
            3   vlm     *
                aex     cful
                u1a     error
            2   vtm     -1023
:           2   arx     ws + 1023
            2   vlm     *
                aex     cful
                u1a     error
            1   vtm     -1023
:           1   arx     ws + 1023
            1   vlm     *
            1   vtm     @23
                aex     cful
                u1a     error
            13  vjm     newtest
;
; 24 - проверка команд ATI, ITA:
;
t24:        n   vtm     @24
            n   xta     bltest
                u1a     t25
                xta
            2   vtm     -1
                ati     2
            2   jmne    error
                xta     cful
                ati     2
            2   jmeq    error
                ita     2
                ati     3
            3   jmeq    error
            3   utm     1
            3   jmne    error
            13  vjm     newtest
;
; 25 - проверка команд UTC, WTC:
;
t25:        n   vtm     @25
            n   xta     bltest
                u1a     t26
                utc     -1
            3   vtm
            3   jmeq    error
            3   utm     1
            3   jmne    error
:               utc     -1
:           3   vtm
            3   jmeq    error
            3   utm     1
            3   jmne    error
:               wtc     см1
            3   vtm
            3   jmeq    error
            3   utm     1
:           3   jmne    error
                wtc     см1
:           3   vtm
            3   jmeq    error
            3   utm     1
            3   jmne    error
                utc     -7
                utc     8
            3   vtm     -2
            3   jmeq    error
            3   utm     1
            3   jmne    error
                wtc     см1
                utc     8
            3   vtm     -6
            3   utm     -1
            3   jmne    error
            3   vtm     -1
:           3   wtc     chess + 1
            4   vtm
                ita     4
            3   aex     chess + 1
                asn     64 - 33
                u1a     error
            3   vlm     * - 3
            13  vjm     newtest
;
; 26 - проверка команды VJM:
;
t26:        n   vtm     @26
            n   xta     bltest
                u1a     t27
            2   vjm     t26_1           ; справа
t26_1:      2   utm     -t26_1
            2   jmne    error
:           2   vjm     t26_2           ; слева
t26_2:      2   utm     -t26_2
            2   jmne    error
:           2   vjm     * + 2
:               utc     -1
:           3   vtm     1
            3   jmeq    error
:           3   vtm     -1
            2   vjm     * + 2
:           3   vtm     -2
:           3   utm     1
            3   jmne    error
            13  vjm     newtest
;
; 27 - MTJ, J+M, VTM, UTM
;
t27:        n   vtm     @27
            n   xta     bltest
                u1a     t2а
                utc     -13
            2   vtm     14
                ita     2
                aex     i1
                u1a     error
            2   vtm     15
            2   utm     -15
                ita     2
                u1a     error
            3   vtm     1
            3   j+m     2
                ita     2
                aex     i1
                u1a     error
                ita     3
                aex     i1
                u1a     error
            3   mtj     2
                ita     2
                aex     i1
                u1a     error
                ita     3
                aex     i1
                u1a     error
            13  vjm     newtest
;
; 2a, 2b - проверка мат.адреса 0
;          и модификатора 0:
;
t2а:        n   vtm     @2a
            n   xta     bltest
                u1a     t2b
            2   vtm     -1
                ita     2
                atx
:               xta                     ; слева
                ati     2
            2   jmne    error
            2   vtm     -1
                ita     2
:               atx
                xta                     ; справа
                ati     2
            2   jmne    error
t2b:        n   vtm     @2b
            n   xta     bltest
                u1a     t2с
            2   vtm     -1
                ita     2
                ati
:               ita                     ; слева
                ati     2
            2   jmne    error
            2   vtm     -1
                ita     2
:               ati
                ita                     ; справа
                ati     2
            2   jmne    error
            13  vjm     newtest
;
; 2с - работа с регистром режима
;      UZA, U1A, XTR, NTR, RТЕ, УТА
;
t2с:        n   vtm     @2c
            n   xta     bltest
                u1a     t30
            2   vtm     63
            3   vtm     -63
lt0c2c:     2   ntr
                rte     63
                atx     ws
                its     2
                asn     64 - 41
            15  aex
                u1a     error
                u1a     error
                xtr
                rte     63
                uza     error
                aox
                u1a     error
                xtr     ws
                rte     63
                its     2
                asn     64 - 41
            15  aex
                u1a     error
                u1a     error
;
            15  vtm     ws+1
            15  xtr
            15  vtm     mst
                rte     63
                its     2
                asn     64-41
            15  aex
                u1a     error
            2   utm     -1
            3   vlm     lt0c2c
;
                ntr     63
                rte     @21
                aex     е42х
                u1a     error
                ntr     0
                uza     error
:               u1a     * + 1
                jmp     error
:               ntr     7               ; лог.гр.
                u1a     error
                ntr     11              ; гр.умн.
                uza     error
                aox
                u1a     error
                ntr     19              ; гр.слож.
                u1a     error
                xta     cful
                uza     error
                ntr     11
                u1a     error
                ntr     19
                uza     error
;
                ntr     24              ; гс+гу=гс
                uza     error
                ntr     12              ; гу+гл=гу
                u1a     error
                xta     i1
                ntr     20              ; гс+гл=гс
                u1a     error
                xta     cful
                aex
                xta
                yta
                aex     cful
                u1a     error
;;                ntr     11                  ; этл было в
;;                yta     1025                ; новом тесте
;;                aex     =h002f ffff ffff ffff
;;                u1a     error               ; и еще не работает
                arx                         ; должна
                uza     error               ; получиться
                arx     cful                ; гр.умн.
                u1a     error
                aax     cful                ; лог.гр.
                uza     error
            13  vjm     newtest
;
; 30:39 - магазинное обращение
; ===============================
; 30: 15 ATX   31: XTS   32: ITS
; 33: 15 XTA   34: SТХ   35: STI
; 36: 15 ATX а      37: 15 XTA а
; 38: 15 WTC        3а: 15 АОР (разные)
;
t30:        n   vtm     @30
            n   xta     bltest
                u1a     t40
                atx     ws
                atx     ws + 1
                atx     ws + 2
            15  vtm     ws + 1
                xta     cful
            15  atx
            15  utm     -2 - ws
            13  vjm     chstake
;
t31:        n   vtm     @31
            15  vtm     ws
                xta
                xts     cful
                xts
                xts
            15  utm     -3 - ws
            13  vjm     chstake
;
t32:        n   vtm     @32
            15  vtm     ws
                ita
                its
                xta     cful
                its
                its
            15  utm     -3 - ws
            13  vjm     chstake
;
t36:        n   vtm     @36
            15  vtm     ws - 1
                xta
            15  atx     1
            15  atx     3
                xta     cful
                utc     2
            15  atx
            15  utm     1 - ws
            13  vjm     chstake
;
t33:        n   vtm     @33
                xta
                atx     ws + 1
            15  vtm     ws + 3
            15  xta
                ati     2
                asn     64 + 24
                ati     3
            15  xta
                ati     4
                asn     64 + 24
                ati     5
            15  xta
                ati     6
                asn     64 + 32
                ati     7
            13  vjm     chst2e
;
t34:        n   vtm     @34
            15  vtm     ws + 3
                stx     ws + 4
                ati     2
                asn     64 + 32
                ati     3
                stx     ws + 4
                ati     4
                asn     64 + 32
                ati     5
                stx     ws + 4
                ati     6
                asn     64 + 32
                ati     7
            13  vjm     chst2e
;
t35:        n   vtm     @35
            15  vtm     ws + 3
                sti     6
                ati     6
                asn     64 + 32
                sti     7
                ati     4
                asn     64 + 32
                sti     5
                ati     2
                asn     64 + 32
                ati     3
            13  vjm     chst2e
;
t37:        n   vtm     @37
            15  vtm     ws + 3
                utc     -1
            15  xta
                ati     6
                asn     64 + 32
                ati     7
            15  xta     -2
                ati     4
                asn     64 + 32
                ati     5
            15  xta     -3
                ati     2
                asn     64 + 32
                ati     3
            15  utm     -3
            13  vjm     chst2e
;
t38:        n   vtm     @38
            4   vtm     1
            7   vtm     -1
            3   vtm     -1
            15  vtm     ws + 3
            15  wtc
            6   vtm
            15  wtc
            4   vtm
            15  wtc
            2   vtm
            13  vjm     chst2e
            15  vtm     ws
                xta     i1
                xts
                xts     i2
                xts     i3
            15  wtc     -2
            2   vtm
            2   jmne    error
            15  utm     -3 - ws
            15  jmne    error
;
; ранее забытые команды:
;
t3а:        n   vtm     @3a
            15  vtm     ws
                xta     chess
                xts     chess + 1
            15  aax
                u1a     error
                xta     chess
                xts     chess + 1
            15  arx
                xts     chess
                xts     chess + 1
            15  aox
            15  aex
                u1a     error
                xta     chess
                xts     chess + 1
                xts     cful
            15  apx
            15  aux
                aex     chess
                u1a     error
                xts     cful
            15  acx
                aex     i48
                u1a     error
                xts     cful
            15  anx
                aex     i1
                u1a     error
                xta     cful
            15  atx
            15  asx
                u1a     error
            13  vjm     newtest
;
; 40 - AAX, AOX, AEX
;
t40:        n   vtm     @40
            n   xta     bltest
                u1a     t42
                xta     cful
                aax
                u1a     error
                xta     cful
                aax     cful
                aex     cful
                u1a     error
                xta     chess
                aax     chess
                aex     chess
                u1a     error
                xta     chess
                aax     chess + 1
                u1a     error
                xta     chess
                aox     chess + 1
                aex     cful
                u1a     error
            13  vjm     newtest
;
; 42 - ARX
;
t42:        n   vtm     @42
            n   xta     bltest
                u1a     t43
                xta     i11
                arx     i1
                aex     i12
                u1a     error
                xta     cful
                arx     i1
                aex     i1
                u1a     error
                xta     cful
                arx     cful
                aex     cful
                u1a     error
            13  vjm     newtest
;
; 43 - APX, AUX
;
t43:        n   vtm     @43
            n   xta     bltest
                u1a     t44
                xta     chess
                apx     cful
                aux     c0ful
                aex     chess + 1
                u1a     error
                xta     chess
                apx     chess + 1
                u1a     error
                xta     chess
                apx     chess
                aux     chess + 1
                aex     chess + 1
                u1a     error
                xta     cful
                aux     chess + 1
                aex     chess + 1
                u1a     error
            13  vjm     newtest
;
; 44 - ACX, ANX
;
t44:        n   vtm     @44
            n   xta     bltest
                u1a     t45
                acx
                u1a     error
                xta     cful
                acx
                aex     i48
                u1a     error
                xta     chess + 1
                acx     iм24
                aex     i1
                u1a     error
            12  vtm     -48
            11  vtm     48
                xta     i1
tanxe:      11  jmne    * + 1
                xta
:               atx     ws
                anx
                its     11
            15  aex
                u1a     error
                xta     ws
                asn     64 - 1
                its     11
                aax     i7
            15  aox
            11  utm     -1
            12  vlm     tanxe
                xta
                anx     cful
                aex     cful
                u1a     error
            14  vtm     @201
                ita     14              ; проверка
                anx     cful            ; засылки
                yta
                aex     c008u           ; остатка
                u1a     error           ; в рмр
            13  vjm     newtest
;
; 45 - ASN, ASX
;
t45:        n   vtm     @45
            n   xta     bltest
                u1a     t46
            12  vtm     -48
            11  vtm     48
tsft1e:         xta     c8u
            11  asn     64 - 1
                anx
                its     11
            15  aex
                u1a     error
            11  utm     -1
            12  vlm     tsft1e
            12  vtm     -48
            11  vtm     48
tsft2e:         xta     i1
            11  asn     64 - 48
                anx
                its     11
            15  aex
                u1a     error
            11  utm     -1
            12  vlm     tsft2e
                xta     cful
                asx     cful
                u1a     error
                xta     chess + 1
                asx     c0ful
                aex     chess
                u1a     error
                xta     cful            ; а что
                asn     64 - 12         ; попадет
                yta                     ; в рмр
                aex     cfff            ; при
                u1a     error           ; сдвигах ?
                xta     cful
                asn     64 + 4
                yta
                aex     cfu
                u1a     error
            13  vjm     newtest
;
; 46 - Е+N, Е-N, Е+Х, Е-Х
;
t46:        n   vtm     @46
            n   xta     bltest
                u1a     t47
            12  vtm     -@7e
                xta     cfe8u
                atx     ws
l76е:           xta     ws
                e+n     64 - 1
                atx     ws
                asn     64 + 41
                ati     14
            12  j+m     14
            14  jmne    error
            12  vlm     l76е
                xta     ws
                e-n     64 + 1
                uza     error
            12  vtm     -@7e
                xta     c008u
                atx     ws
            11  vtm     -1
l761е:          xta     ws
                e-x     c7e8u
                atx     ws
                asn     64 + 41
                ati     14
            11  j+m     14
            14  jmne    error
            11  utm     -1
            12  vlm     l761е
                xta     ws
                e+x     c008u
                aex     c7e8u
                u1a     error
            13  vjm     newtest
;
; 47 - А+Х, А-Х, Х-А
;
t47:        n   vtm     @47
            n   xta     bltest
                u1a     t48
                ntr     3
            14  vtm     64
                ita     14
                a-x     i65
                uza     error
                a+x     i1
                u1a     error
                aox
                u1a     error
                xta     i2
                x-a     i1
                a-x     iм1
                u1a     error
                aox
                u1a     error
                xta     i2
                xts     i1
                xts     i2
                xts     i3
            15  a-x                     ; 3-2=1
                u1a     error
            15  a+x                     ; 1+1 = 2
            15  x-a                     ; 2-2 = 0
                u1a     error
                aox
                u1a     error
                xta     cdu40l          ; 64
                a-x     cdu42l          ; 66
                uza     error
                a+x     c848u           ; 2.
                u1a     error
                aox
                uza     error
                aex     cdu             ; i0
                u1a     error
                ntr     2
                xta     c848u           ; 2.
                xts     c84cu           ; 3.
                xts     c848u           ; 2.
                xts     c84cu           ; 3.
            15  a+x                     ; 3+2
            15  a-x                     ; 5-3
            15  x-a                     ; 2-2
                u1a     error
                aox
            13  vjm     newtest
;
; 48  - А*Х, А/Х
;
t48:        n   vtm     @48
            n   xta     bltest
                u1a     oldfin
                ntr     3
                xta     cdu5l
                a*x     c5udl           ; 13/2**64
            15  atx
                yta     64
                stx     ws
                aex     cau
                u1a     error
                xta     ws
                aex     cau41l          ; 65/2**24
                u1a     error
                xta     c5u5l           ; 5/2**64
                a*x     cim13           ; = -65
            15  atx
                yta     64
                stx     ws
                aex     ca1ufs
                u1a     error
                xta     ws
                e+n     64 + 24
                aex     cd0fsbf         ; -65!-
                u1a     error
                ntr     2
                xta     c848u           ; 2.
                a*x     c84cu           ; 3.
                atx     ws
                aex     c84cu           ; 3.
                aex     c02u
                u1a     error           ; !=6
                xta     ws              ; восст. а=6.
                a/x     c84cu           ; 3.
                aex     c848u           ; 2.
                u1a     error
            13  vjm     newtest
;--------------------------------------
oldfin:         jmp     t51             ; *** в тест нового режима
;--------------------------------------
;
chstake:    15  jmne    error
                xta     ws
                ati     2
            2   jmne    error
                asn     64 + 24
                ati     2
            2   jmne    error
                xta     ws + 2
                ati     2
            2   jmne    error
                asn     64 + 24
                ati     2
            2   jmne    error
                xta     ws + 1
                ati     2
                asn     64 + 24
                ati     3
            2   utm     1
            2   jmne    error
            3   utm     1
            3   jmne    error
                xta     ufsl1
                atx     ws
                atx     ws + 1
                atx     ws + 2
            13  jmp
chst2e:     15  utm     -ws
            15  jmne    error
            2   utm     -1
            2   jmne    error
            3   utm     1
            3   jmne    error
            4   jmne    error
            5   jmne    error
            6   utm     -1
            6   jmne    error
            7   utm     1
            7   jmne    error
            13  jmp
;
; константы
;
i1:             atx
                atx     1
i2:             atx
                atx     2
i3:             atx
                atx     3
i11:            atx
                atx     11
i12:            atx
                atx     12
i7:             atx
                atx     7
i48:            atx
                atx     48
cful:       15  vlm     @fffff
            15  vlm     @fffff
см1:        15  vlm     @fffff
            15  vlm     @fffff
ufsl1:      15  vlm     @fffff
                atx     1
c0ful:      7   vlm     @fffff
            15  vlm     @fffff
iм24:       15  vlm     @fffff
            15  vlm     @fffe8
c8u:        8   atx
                atx
cfu:        15  atx
                atx
cfff:           atx
                atx     @fff
е42х:       4   ati
                atx
cfe8u:      15  jmne
                atx
c008u:      0   xta
                atx
c7e8u:      7   jmne
                atx
i65:            atx
                atx     65
iм1:            ntr     @ffff
            15  vlm     @ffff
cdu40l:     13  atx
                atx     @40
cdu41l:     13  atx
                atx     @41
cdu42l:     13  atx
                atx     @42             ; 66
;;c828u:      8   *50
;;                atx
cdu:        13  atx
                atx
c848u:      8   xta     @7000
                atx                     ; 2.
c84cu:      8   avx     @7000
                atx                     ; 3.
cdu5l:      13  atx
                atx     5
c5udl:      5   atx
                atx     @d
c5u5l:      5   atx
                atx     5
cau:        10  atx
                atx
cau41l:     10  atx
                atx     @41
;;c86au:      8   *52     @7000
;;                atx
;;c88du:      8   *71     @7000
;;                atx
c02u:           ati
                atx
cim13:      13  ntr     @fff
            15  vlm     @7ff3
ca1ufs:     10  ntr     @7fff
            15  vlm     @7fff
cd0fsbf:    13  a*x     @fff
            15  vlm     @7fbf           ; -65!-
;;cim65:      13  *77     @fff
;;            15  vlm     @7f57
chess:      10  utm     @aaaaa
            10  utm     @aaaaa
                atx
                atx
;
; конец теста эмуляции
;
tbegin:     15  vtm     mst
                rmod    @1c14           ; сьем часов
                aeu     -1              ; инверсия
                atx     ws
                rmod    @15
                asn     @400 - 32
                atx     ws + 1
                rmod    @16
                aax     =h0000 0000 ffff ffff
                aox     ws + 1
                aeu     -1
                atx     ws + 1          ; время обр.прер.
            2   vtm     -1
                xta     ="'@0d''@0d'round-"
                xts     npass
                asn     @400 + 48
            14  vjm     dhex8
                asn     @400 - 32
                aox     ="'0''0''0''0'. т="
ltim:
            2   xts     ws+1
                a/u     @400            ; "1" = 1 мсек.
            14  vjm     dhex8
            2   xts     cptim + 1
                a/u     @400
            2   xts     ws+1            ; обновление
            2   atx     cptim + 1       ; времен
                a/u     @400
            15  a-l
            14  vjm     dhex8
                asn     @400 - 24
                asn     @400 + 16
                aox     =" ('0''0''0''0''0')"
                xts     ="  т/int="
            2   vlm     ltim
                xta     =". clock:"
                xts     ="00.00.00"
            15  mtj     13
            13  msn     @400 - 3
                xts     =z".00'@0a''@0d'"
                xts     clock
                aeu     -1
                atx     cptim + 2
                a/u     10000           ; 1/100 cek.
                a/u     360000
                ati     2               ; "h"
                uta
                aoy
                a/u     6000
                ati     3               ; "m"
                uta
                aoy
                a/u     100
                ati     4               ; "s"
                uta
                aoy
                ati     5               ; "ss"
            14  vtm     -3
:           14  ita     5
                a/u     10
                aou     @30             ; "0"
            13  atb
                uta     @30
                aoy
            13  atb     1
            13  utm     3
:           14  vlm     * - 4
            5   vtm     newtesti
            13  vtm     t51             ; обход режима эмуляции
                xta     bltest + @21
:               jane    * + 2           ; - целиком
                xta     new_reg
:               jalt    * + 1
            13  vtm     t21 & m15       ; начинаем с режима эмуляции
:               uta     mst
                jmp     output
;
;
tloop:          ita     13              ; для зацикливания
                ath     npass<<1 + 1    ; подтеста
                uta     =z"- ок.'@а''@d'"
            5   vjm     output
;
newtesti:       uta     errint          ; перехват
            2   vtm     -63             ; всех преры-
:           2   atx     adr + 63         ; ваний - на
            2   vlm     *               ; "errint"
                uta     extr
            2   vtm     -3
:           2   atx     adr + 67
            2   vlm     *
            14  vtm     work_reg        ; раб.режим
            12  vjm     setgr
;
newtest:
                xta     con_in
                jane    anal            ; был ввод
                xta     npass
                ati     2
:           2   jmne    * + 1           ; один тест
            13  mtj     2               ; все подряд
:           15  vtm     mst             ; уст.магазина
                arx     =h0000 0001 0000 0000
                atx     npass
            14  vtm     main_reg        ; уст., если
            14  clrr    @e0000          ; надо, факульт.
                wtc     new_reg         ; режим (напр.рш)
                setr
            2   jmp
;
; Обработка внешних прерываний:
; =============================
;
extint:         rmod    @1802
            15  atx     2               ; for test-05
                jmp     extint1
;
endtim:         uta     quant
            ng  wmod    @14
                uta     -1              ; подкачка таймера
                wmod    @14             ; 0-й группы
;
ret_int:
                cmon    -1              ; ***
                rmod    @1802
extint1:        aax     wellint
                wmod    @1802
:               jane    * + 1
            ng  ijp
:               aau     @f0000
                jaeq    pult
                anu     -1
                ati     2
                rmod    @1802
            2   aen
                wmod    @1802
            2   utm     41 - 65
            2   jmeq    endtim          ; 40-й разряд
:           n   vtm     5
                jmp     int             ; 41-программное
;
pult:           wmod    @1c19           ; сброс кэша
                smon    @80             ; ***
                xta     ppinf
                asn     @400 + 8
                aau     @ff
                jaeq    retpult         ; это ввод
                ati     3               ; конец вывода
                uta     -mc
:               ati     11
            11  bta     que << 3
                jaeq    badpult         ; нет заявки
                ati     5
            3   j-m     5
            5   jmne    * - 2
            3   utc     -1
            3   xta     jов - 1
                aan     64 - 39
:               jane    * + 1
                hlt     @39
:           3   atx     jов + 511       ; -дубль
            3   bta     que<<3          ; продвижка
            11  atb     que<<3          ; очереди
            3   bta     que<<3 + 4096
            11  atb     que<<3 + 4096   ; -дубль
                bta     que<<3
            3   atb     que<<3
                bta     que<<3 + 4096
            3   atb     que<<3 + 4096   ; -дубль
                ita     3               ; в список
                atb     que<<3          ; своб.заявок
                atb     que<<3 + 4096   ; -дубль
;
retpult:
                uta
                atx     ppinf
                rmod    @1802 ; силин ставил
                aau     @ffff1 ; сразу 3
                wmod    @1802 ; единички !
                jmp     ret_int
badpult:        hlt     @40
                jmp     retpult
;
; ожидание ввода с консоли:
;
:               xta     con_in
                jaeq    *
;
input:
                wmod    @1c19
                hta     refer << 1
                jane    dport
                xta     con_in
            13  jane
            5   vtm     input - 1
                uta     =z" wait> "
;
;
;
; выдача строки на консоль:
; портятся регистры: 11,12,14
;
output:         ati     11              ; адрес текста
                wmod    @1c19
                hta     refer << 1
                jane    dport
            14  vtm     limit
                setr    @80             ; smon @80 ; ***
                uta     -mc
:               ati     12
            12  bta     que << 3
                jaeq    * + 2
            14  vrm     * - 1
                xta     last_out + 1
                atx     last_out
:               clrr    @fff7f          ; cmon @fff7f ; ***
output11:       rmod    @1819
                asn     @400 - 56       ; процесс
                aox     last_out        ; адр.в буфере
                atx     last_out + 1
                ati     12
                a+u     con_out - refer ;
                aon     64 - 40         ; +готовность
                atx     last_job        ; заявка
:           11  xta
            12  atx     con_out         ; перепись
            11  utm     1               ; в кольцевой
            12  utm     1 - lо
:           12  jmlt    * + 1
            12  vtm     -lо
:           12  utm     lо
                aau     @ff
                jane    * - 4
            5   utc
            14  jmle                    ; сверх лимита!
                setr    @80             ; smon @80 ; ***
                ita     12              ; своб.
                atx     last_out        ; слово
:               bta     que<<3
                ati     14              ; своб.эл-т
            14  bta     que<<3
                atb     que<<3          ; сняли с головы
                atb     que<<3 + 4096   ; -дубль
                xta     last_job
            14  utc     -1
            14  atx     jов - 1
            14  atx     jов + 511       ; -дубль
                uta     -mc
:               ati     11
            11  bta     que<<3
                jane    * - 1
            14  atb     que<<3
            14  atb     que<<3 + 4096   ; -дубль
                ita     14
            11  atb     que<<3
            11  atb     que<<3 + 4096   ; -дубль
                clrr    @fff7f          ; cmon @fff7f ; ***
            5   jmp
;
; Анализ введенной директивы:
; производится в конце каждого подтеста.
;
; qdhlton    - установить "hlt" при ошибках
; qdhltoff   - снять "hlt"  (кроме того, он
;              снимается при перезапуске).
; qdfull     - установка шага=1 в тесте
;              страничных прерываний
; qdmemo     - определение количества
;              имеющихся страниц  озу
; qdmem2     - двусторонняя долбежка
;              (от цп и пп одновременно)
; qdtest     - продолжение работы
;              комплексного теста
; qddelnn    - блокировка подтеста <nn>
; qdrepnn    - зацикливание подтеста <nn>:
;              60 - магазинные команды;
;              70 - роспись и чтение памяти;
;              41 - тест экстракодов;
;              42 - пустой экстракод с рез.группой
;              43 - ---"---  ---"---  без оной
;              05 - тест программных прерываний;
;              3е - тест теговских прерываний
;              3f - тест страничных прерываний
;              4в - тест семафорных команд;
;             ... - прочая мелочь.
;
okdir:          uta     =z" - ок. "
            5   vjm     output
anal:       15  vtm     mst
            13  vjm     input
                uts
                stx     con_in
;
            n   vtm     @ff             ; ***
                atx     ws
                aex     ="full"
                asn     @400 + 32
                jaeq    fullstep
                xta     ws
                aex     ="test"
                asn     @400 + 32
                jaeq    stndstep
                xta     ws
                aex     ="hltoff"
                asn     @400 + 16
                jaeq    sethlt+1
                asn     @400 + 16
                jaeq    sethlt
                xta     ws
                aex     ="memo"
                asn     @400 + 32
            13  vtm     sс_мем
                jaeq    memory
                aeu     @7d
                jaeq    memory2         ; "mem2"
                xta     ws
                aex     ="repeatnn"
                asn     @400 + 40
            5   vtm     trep
                jaeq    маке_nт
                xta     ws
                aex     ="deletenn"
                asn     @400 + 40
            5   vtm     tdel
                jane    baddir
маке_nт:        xta     ws
                asn     @400 + 24
                aau     @4040
                asn     @400 + 3
            15  atx
                asn     @400 + 3
            15  aox
                asn     @400 - 24
                arx     ws
                apx     =h0000 000f 0f00 0000
                asn     @400 + 56
                ati     13
            13  hta     atest << 1
            5   jmp
;
tdel:           uta     -1
            13  atx     bltest
                jmp     okdir
;
trep:           extf    64 - 20
            13  ath     atest << 1
                uts
            13  stx     bltest
                ati     13
            13  jmne    tloop
;
baddir:         uta     =z"  not und:"
            5   vjm     output
                xta     ws
                atx     con_in
                uta     con_in
            5   vjm     output
                uta
                atx     con_in
                jmp     anal
;
sethlt:         uta     @eee
:               atx     halter
                jmp     okdir
;
fullstep:       uta     -1
stndstep:       aou     -sтер
                atx     nexpag
                uta     lws
                atx     lrw
                xta     npass
                aax     =hffff 0000 0000 0000
                atx     npass
                jmp     tbegin
;
; определение количества памяти:
;
memory:         uta     nomemor
                atx     adr
                atx     adr + 1
                atx     adr + 2
                atx     adr + 3
            3   vtmf    mscale
                uta     -1
            2   vtm     15
:           2   atx     mscale
            2   vrm     *
                xta     =hс000 0000 0000 0000
                atx     mscale + 15     ; посл.блок "озу"
            2   vtm     1023 - 20 - 62
            4   vtm     @5000           ; 20-й физ.лист
            3   utm     20
                tta     begin + @3ff
                atx     рав             ; спасение ячейки
                ytx     рав + 1         ; из 0-го листа
;
                rmod    @400
                atx     рав + 2
lмем:       4   uta     @3ff            ; припишем
                wmod    @400            ; к 0 мат.листу
                setr    @178            ; блок.тег.прер.
                uta
                atx     @3ff            ; ***
                uta     -1
                xta     @3ff            ; ***
                jaeq    elmem + 1
elmem:      3   clrf                    ; исключ.
            3   clrf                    ; из шкалы
:               clrr    @fce87          ; бзо,бзз+теговские
                tta     begin + @3ff
                jaeq    error           ; порча памяти
            3   utm     1
            4   utm     @400
            2   vrm     lмем            ; след.лист
            3   vtm     15
                xta     рав + 2
                wmod    @400
            13  jmp
;
sс_мем:     3   xta     mscale
                jaeq    esc_мем
                ita     3
            14  vjm     dhex8
                asn     @400 - 56
                asn     @400 + 24
                aox     ="'@а''@d' '0' :  "
                atx     mst + 10
            3   xta     mscale
            14  vjm     dhex8
                atx     mst + 12
            3   xta     mscale
                asn     @400 + 32
            14  vjm     dhex8
                atx     mst + 11
                uta
                atx     mst + 13
                uta     mst + 10
            5   vjm     output
esc_мем:    3   vrm     sс_мем
                jmp     okdir
;
; двусторонняя долбежка:
;
memory2:        uta     =z"'@0а''@0d'begin sрес.test  "
            5   vjm     output
:               bta     heads << 3
                jane    *               ; ждем
            1   vtm
            1   rmod    @1c15
            1   ati     10
            1   uta     -1
            1   wmod    @1c15
            1   uta     долблист
            1   atx     долбежка
;
:           15  vtm     @aaaaa
            1   jmp     *
;
:           1   uta
            1   atx     долбежка
            2   vtm     @7ffff
:           1   asn     @400 + 50
            2   vrm     *
            1   ita     10
            1   wmod    @1c15
            5   vtm     anal
            1   ita
:           1   jaeq    * + 1
            1   hlt     2
:           1   uta     =z"  end sрес.test.'@0d''@0а'"
            1   jmp     output
;
; Тест памяти двойного доступа
; ============================
; ПП расписывает 16-битные слова 0-ffb
; затем посылает в ffc,ffd эталон, а
; в ffe,fff - код работы ЦП:
;   0 - память расписана эталоном.
;       ЦП должен сравнивать слова 0-ffb
;       с эталоном. Можно и писать туда
;       тот же самый эталонный код.
;   1 - память расписана кодом, отличным от
;       эталона.  ЦП расписывает ее эталоном,
;       а потом читает сам.
; В обоих случаях ПП сканирует память в течение
; 2 мин., а потом обнуляет ffc,ffd.  Это для цп
; является сигналом об окончании спец.теста.
;
; ПП работает по возрастанию адресов: 0--->ffb
; ЦП работает по убыванию адресов: ffb--->0
;
dport:
                wmod    @1c19
                qta     долбежка<<2 + 1 ; ждем конца
:               jaeq    dport           ; росписи памяти
            1   vtm     100000
:           1   vrm     *               ; мелкая пауза
            1   vtm     1               ; сч.проходов
                hta     долбежка<<1 + 1 ; начнем с
                jaeq    wrport          ; чтения
                hta     долбежка<<1
            2   vtm     2045
:           2   ath     refer<<1
            2   vrm     *
                wmod    @1c19
                uta     1               ; - с записи
wrport:         ati     4
            2   vtm     2045
;
rwport:         wmod    @1c19
                hta     долбежка<<1
                ati     5               ; эталон
                jaeq    test            ; - конец режима
                aeh     refer << 1
                jane    dport + 1       ; смена эталона
                ita     5
            4   jmeq    report
            2   ath     refer << 1
                jmp     lport
report:     2   aeh     refer << 1
                jaeq    lport
            2   mtj     3
            3   msn     @400 + 1
            5   uty
                hlt     2
lport:      2   vrm     rwport
                ita     4
                aeu     1
            1   vlm     wrport
;
; Тест обнаружил ошибку.
; **********************
;
errint1:        ita     n
            ng  wmod    4               ; ном.прер.
                uta                     ; надо: rmod @1c
            ng  wmod    @1c
            ng  rmod    6
                atx     er6
;
special:    ng  rmod    @1c             ; РОП
            ng  vtm     1 << 5          ; группа = 1!!!
            ng  wmod    5
                ita     ri
            ng  wmod    3
                ita     iа
            ng  wmod    2
                rmod    @1802
                aax     wellint
                aon     64 - 41
                aen     64 - 41
                wmod    @1802
                uta     ругань
                jmp     put_рс
;
; Первым делом - встанем, чтобы можно было
; посмотреть регистры. Потом можно дать "gо"
;
errint:         wtc     halter
                hlt                     ; ***
                rmod    @1818
                jaeq    errint1
                ita     6
                atx     er6
;
error:          wtc     halter
                hlt                     ; ***
:               uta     special
                atx     adr + 4
            4   vtm                     ; "мат.реж."
                uta
                wmod    @24
                wmod    @1c13           ; п/п для прот.роп
;
; 2-ИАОП, 3-СчАС, 4-NInt, 5-РОП
;
ругань:     15  vtm     mst
                wtc     er6
            6   vtm
                uta     1
                arx     ercnt
                atx     ercnt
            14  vjm     dhex8
                aax     =h0000 0000 00ff ffff
                asn     @400 - 24
                aox     ="'@а''@d''0''0''0' - "
                xts     ="error in"
                its     n
            14  vjm     dhex8
                aau     @ffff
                aox     =" test-'0''0'"
            4   jmeq    ругань1
                its     4
            3   mtj     5
            14  vjm     dhex8
                aau     @ffff
                aox     ="  int:'0''0'"
            2   jmeq    ругань1
                xts     ="  iаор: "
                its     2
            14  vjm     dhex8
ругань1:        xts     ="   adr: "
                its     5
            14  vjm     dhex8
            6   jmeq    ругань2
                asn     @400 - 24
                aox     =h0000 0000 002с 2020
                uts
                atx     er6
                ita     6
            14  vjm     dhex8
ругань2:        asn     @400 - 16
                aou     @0a0d
                asn     @400 - 8
                uts     mst
            5   vjm     output
                xta     begin + @3ff
                jane    norest
                setr    @3178           ; восстановление
                xty     рав + 1         ; испорченной
                xta     рав             ; ячейки 0-го листа
                ttx     begin + @3ff
norest:         clrr    @fce87
            5   vjm     cout
            5   vtm     tbegin
            14  vtm     5
;
pause:      12  vtm     @1ffff
:               xta     con_in          ; примерно
                jane    anal            ; 1 сек.
            12  vrm     * - 1
            14  vrm     pause
            5   jmp
;
; организация насильственного входа
;
put_рс:     ng  wmod    @1b             ; СчАС
            ng  rmod    @11
                aax     =h0000 0000 c7ff ffff
            ng  wmod    @11             ; гаш. ППУ,ПИА,ППК
            ng  rmod    0
                jane    horror
                jmp     ret_int
;
nomemor:        uta     elmem
                jmp     put_рс
;
horror:     11  vtm     =z" mod.0 is nот zero ! "
            5   vjm     output11
:               bta     heads << 3
                jane    *
:               hlt     -7
                jmp     *
;
;*********************************
;
; I. Репертуар старой БЭСМ-6.
; ============================
;
;*********************************
;
; 51,52 - проверка команд JMEQ, JMNE:
;
t51:        n   vtm     @51
            n   xta     bltest
                jane    t53
            2   vtm     0
            2   jmeq    * + 1
                jmp     error
:           2   jmne    error
            2   jmne    error
            2   vtm     -1
            2   jmeq    error
:           2   jmeq    error
            2   jmne    t52
                jmp     error
;
t52:        n   vtm     @52
            2   vtm     1
            3   vtm     -32
                jmp     * + 2
:           2   j+m     2               ; сдвиг "1" влево
            3   utm     1
:           2   jmne    * - 1
            3   jmne    error
            13  vjm     newtest
;
; 53 - проверка команд VLM, VRM:
;
t53:        n   vtm     @53
            n   xta     bltest
                jane    t54
            2   vtm     -999
            3   vtm     -1000
:           3   utm     1
            2   vlm     *
            2   jmne    error
            3   jmne    error
:           2   vlm     error           ; а что при "0"
            2   jmne    error
;
            2   vtm     999
            3   vtm     -1000
  :         3   utm     1
            2   vrm     *
            2   jmne    error
            3   jmne    error
  :         2   vrm     * - 2           ; а что при "0"
            2   jmne    error
            13  vjm     newtest
;
; 54 - проверка команд ATI, ITA:
;
t54:        n   vtm     @54
            n   xta     bltest
                jane    t55
            2   vtm     -1
                ati     2
            2   jmne    error
                xta     ful
                ati     2
            2   jmeq    error
                ita     2
                ati     3
            3   jmeq    error
            3   utm     1
            3   jmne    error
            13  vjm     newtest
;
; 55 - проверка команд UTC, WTC:
;
t55:        n   vtm     @55
            n   xta     bltest
                jane    t56
                utc     -1
            3   vtm
            3   jmeq    error
            3   utm     1
            3   jmne    error
:               utc     -1
:           3   vtm
            3   jmeq    error
            3   utm     1
            3   jmne    error
:               wtc     =i-1
            3   vtm
            3   jmeq    error
            3   utm     1
:           3   jmne    error
                wtc     =i-1
:           3   vtm
            3   jmeq    error
            3   utm     1
            3   jmne    error
                utc     -7
                utc     8
            3   vtm     -2
            3   jmeq    error
            3   utm     1
            3   jmne    error
                wtc     =i-1
                utc     8
            3   vtm     -6
            3   utm     -1
            3   jmne    error
            3   vtm     1
:           3   wtc     chess1
            4   vtm
                ita     4
            3   aex     chess1
                asn     1024 - 32
                jane    error
            3   vrm     * - 3
            13  vjm     newtest
;
; 56 - проверка команды VJM:
;
t56:        n   vtm     @56
            n   xta     bltest
                jane    t57
            2   vjm     t6_1            ; справа
t6_1:       2   utm     -t6_1
            2   jmne    error
:           2   vjm     t6_2            ; слева
t6_2:       2   utm     -t6_2
            2   jmne    error
:           2   vjm     * + 2
:               utc     -1
:           3   vtm     1
            3   jmeq    error
:           3   vtm     -1
            2   vjm     * + 2
:           3   vtm     -2
:           3   utm     1
            3   jmne    error
            13  vjm     newtest
;
; 57 - MTJ, J+M, VTM, UTM
;
t57:        n   vtm     @57
            n   xta     bltest
                jane    t5а
                utc     -13
            2   vtm     14
                ita     2
                aex     =1
            13  vjm     снасс
            2   vtm     15
            2   utm     -15
                ita     2
            13  vjm     снасс
            3   vtm     1
            3   j+m     2
                ita     2
                aex     =1
            13  vjm     снасс
            13  vjm     снм3
            3   mtj     2
                ita     2
                aex     =1
            13  vjm     снасс
            13  vjm     снм3
            13  vjm     newtest
;
; 5а,5в - проверка мат.адреса 0
;         и модификатора 0:
;
t5а:        n   vtm     @5a
            n   xta     bltest
                jane    t5с
            2   vtm     -1
                ita     2
                atx
:               xta                     ; слева
                ati     2
            2   jmne    error
            2   vtm     -1
                ita     2
:               atx
                xta                     ; справа
                ati     2
            2   jmne    error
t5в:        n   vtm     @5b
            2   vtm     -1
                ita     2
                ati
:               ita                     ; слева
                ati     2
            2   jmne    error
            2   vtm     -1
                ita     2
:               ati
                ita                     ; справа
                ati     2
            2   jmne    error
            13  vjm     newtest
;
; 5с - работа с регистром режима
;      UZA, U1A, XTR, NTR, RTE, YTA
;
t5с:        n   vtm     @5c
            n   xta     bltest
                jane    t60
            2   vtm     63
lт0с:       2   ntr
                rte     63
                atx     ws
                its     2
                asn     1024 - 53
            15  aex
                jane    error
                u1a     error
                xtr
                rte     63
                jane    error
                uza     error
                xtr     ws
                rte     63
                its     2
                asn     1024 - 53
            15  aex
                jane    error
                u1a     error
;
            15  vtm     ws+1
            15  xtr
            15  vtm     mst
                rte     63
                its     2
                asn     1024 - 53
            15  aex
                jane    error
            2   vrm     lт0с
;
                ntr     63
                rte     @21
                aex     =h0420 0000 0000 0000
                jane    error
                u1a     error
                ntr     0
                uza     error
                jane    error
:               u1a     *+1
                jmp     error
:               ntr     7               ; лог.гр.
                u1a     error
                jane    error
                ntr     11              ; гр.умн.
                uza     error
                jane    error
                ntr     19              ; гр.слож.
                u1a     error
                jane    error
                xta     ful
                uza     error
                jaeq    error
                jage    error
                jagt    error
                ntr     11
                u1a     error
                jaeq    error
                jage    error
                jagt    error
                ntr     19
                uza     error
                jaeq    error
                jage    error
                jagt    error
;
                ntr     24              ; гс+гу=гс
                uza     error
                ntr     12              ; гу+гл=гу
                u1a     error
                xta     =1
                ntr     20              ; гс+гл=гс
                u1a     error
                jaeq    error
                jalt    error
                jale    error
                xta     ful
                aex
                xta
                yta
                aex     ful
                u1a     error
;;                ntr     11
;;                yta     1025
;;                aex     =h002f ffff ffff ffff
;;                u1a     error
                arx                     ; должна
                uza     error           ; получиться
                arx     ful             ; гр.умн.
                u1a     error
                aax     ful             ; лог.гр.
                uza     error
            13  vjm     newtest
;
; 60:69 - магазинное обращение
; ===============================
; 60: 15 ATX   61: XTS   62: ITS
; 63: 15 XTA   64: STX   65: STI
; 66: 15 ATX а      67: 15 XTA а
; 68: 15 WTC        69: 15 ATD
;
t60:        n   vtm     @60
            n   xta     bltest
                jane    t70
                atx     ws
                atx     ws + 1
                atx     ws + 2
            15  vtm     ws + 1
                xta     ful
            15  atx
            15  utm     -2 - ws
            13  vjm     chstak
;
            n   vtm     @61
            15  vtm     ws
                xta
                xts     ful
                xts
                xts
            15  utm     -3 - ws
            13  vjm     chstak
;
            n   vtm     @62
            15  vtm     ws
                ita
                its
                xta     ful
                its
                its
            15  utm     -3 - ws
            13  vjm     chstak
;
            n   vtm     @66
            15  vtm     ws - 1
                xta
            15  atx     1
            15  atx     3
                xta     ful
                utc     2
            15  atx
            15  utm     1 - ws
            13  vjm     chstak
;
            n   vtm     @63
                xta
                atx     ws + 1
            15  vtm     ws + 3
            15  xta
                ati     2
                asn     1024 + 32
                ati     3
            15  xta
                ati     4
                asn     1024 + 32
                ati     5
            15  xta
                ati     6
                asn     1024 + 32
                ati     7
            13  vjm     chst2
;
            n   vtm     @64
            15  vtm     ws + 3
                stx     ws + 4
                ati     2
                asn     1024 + 32
                ati     3
                stx     ws + 4
                ati     4
                asn     1024 + 32
                ati     5
                stx     ws + 4
                ati     6
                asn     1024 + 32
                ati     7
            13  vjm     chst2
;
            n   vtm     @65
            15  vtm     ws + 3
                sti     6
                ati     6
                asn     1024 + 32
                sti     7
                ati     4
                asn     1024 + 32
                sti     5
                ati     2
                asn     1024 + 32
                ati     3
            13  vjm     chst2
;
            n   vtm     @67
            15  vtm     ws + 3
                utc     -1
            15  xta
                ati     6
                asn     1024 + 32
                ati     7
            15  xta     -2
                ati     4
                asn     1024 + 32
                ati     5
            15  xta     -3
                ati     2
                asn     1024 + 32
                ati     3
            15  utm     -3
            13  vjm     chst2
;
            n   vtm     @68
            4   vtm     1
            7   vtm     -1
            3   vtm     -1
            15  vtm     ws + 3
            15  wtc
            6   vtm
            15  wtc
            4   vtm
            15  wtc
            2   vtm
            13  vjm     chst2
            15  vtm     ws
                xta     =1
                xts
                xts     =2
                xts     =3
            15  wtc     -2
            2   vtm
            2   jmne    error
            15  utm     -3 - ws
            15  jmne    error
;
            n   vtm     @69
            15  vtm     ws
                xta     chess1
                aex     ful
            15  atd
            15  mtj     13
            13  utm     -2-ws
            13  jmne    error
                aex     chess2
                jane    error
                xta     ws+1
                aex     chess1
                jane    error
                xta     ws
                aex     chess2
                jane    error
            15  dta
                ytx     ws
                aex     chess2
                jane    error
                xta     ws
                aex     chess1
                jane    error
            15  utm     -ws
            15  jmne    error
;
; ранее забытые команды:
;
            n   vtm     @6a
                utcs    2
            14  vtm
                ita     14
                aeu     @20000
                jane    error
            15  vtm     ws
                xty     chess2
            15  ytx
                jane    error
            15  utm     -ws-1
            15  jmne    error
                xta     ws
                aex     chess2
                jane    error
            15  vtm     ws+1
                aex
            15  xty
                jane    error
            15  utm     -ws
            15  jmne    error
                yex     chess2
                jane    error
            15  vtm     ws
                xta     chess1
                xts     chess2
            15  aax
                jane    error
                xta     chess1
                xts     chess2
            15  arx
                xts     chess1
                xts     chess2
            15  aox
            15  aex
                jane    error
                xta     chess1
                xts     chess2
                xts     ful
            15  apx
            15  aux
                aex     chess1
                jane    error
                xts     ful
            15  acx
            14  vtm     -64
                a+i     14
                jane    error
                xts     ful
            15  anx
                a+l     ful
                jane    error
                uta     2
                l-a     =1
                a-l     ful
                jane    error
                xta     ful
            15  atx
            15  asx
                jane    error
                uta     2
                uts     1
                uts     2
                uts     3
            15  a-l     ; 3-2=1
            15  a+l     ; +1=2
            15  l-a
                jane    error
                xta     chess1
                xts     chess2
                xts     ful
            15  xty
            15  yox
                xty     ful
                aey
                jane    error
                xta     chess1
                xts     chess1
                xts     ful
                aex
            15  yax
                aex
            15  yex
                jane    error
            15  utm     -ws
            15  jmne    error
            13  vjm     newtest
;
; 70 - запись/чтение
;
t70:        n   vtm     @70
            n   xta     bltest
                jane    t71
                wtc     lrw             ; длина массива
            6   vtm     -1              ; больше кэша !
            7   vtm     66
                uta     1
            9   vjm     rewr
:               asn     1024 - 1
            9   vjm     rewr            ; бегущая "1"
            7   vrm     * - 1
                xta     =hffff ffff ffff fffe
            7   vtm     66
            6   vtm     256             ; все в кэше
:           9   vjm     rewr            ; бегущий "0"
                asn     1024 - 1
                aou     1
            7   vrm     * - 2
                wtc     lrw             ; опять больше
            6   vtm     -1              ; размера кэша
            9   vtm                     ; номе adress
;
rewr:           atx     mst             ; эталон
            6   mtj     4
:           9   jmne    * + 1           ; пост.код
            4   uta     ws              ; номе adress
:           4   atx     ws
            4   vrm     * - 1
            6   mtj     4
            9   jmeq    l2rewr
l1rewr:         xta     mst
            4   aex     ws
:               jane    ert70
            4   vrm     l1rewr
                jmp     rrewr
l2rewr:     4   uta     ws
            4   aex     ws
:               jane    ert70
            4   vrm     l2rewr
rrewr:          xta     con_in
                jane    anal            ; был ввод
                xta     mst
            9   jmeq    сt70
            9   jmp
;
; Несовпадение.  сум=<разница>, рмр=<эталон>
;
ert70:      15  vtm     mst+1
                ytx     mst
                aey
                xts     ercnt
                arx     =h0000 0001 0000 0000
                atx     ercnt
                asn     @400 + 32
            14  vjm     dhex8
                aax     =h0000 0000 00ff ffff
                aox     ="'@d'err:'0''0''0'"
                xts     =" in test"
                xts     ="-70. ет="
                xts     mst
                asn     @400 + 32
            14  vjm     dhex8
                xts     mst
            14  vjm     dhex8
                xts     =" memory="
                xts     mst + 1
                asn     @400 +32
            14  vjm     dhex8
                xts     mst + 1
            14  vjm     dhex8
                xts     ="   adr: "
            4   uts     ws
            14  vjm     dhex8
                asn     @400 - 16
                aou     @0a0d
                asn     @400 - 8
                uts     mst + 2
            5   vjm     output
            14  vtm     3
            5   vjm     pause
            9   jmeq    l2rewr + 1
                jmp     l1rewr + 1
;
сt70:           xta     chess1
                aex     ful
                atd     ws
                aex     chess2
                jane    error
                xta     ws
                aex     chess2
                jane    error
                xta     ws + 1
                aex     chess1
                jane    error
            14  vtm     ws + 1
            14  dta     -1
                ytx     ws
                aex     chess2
                jane    error
                xta     ws
                aex     chess1
                jane    error
            13  vjm     newtest
;
; 71 - AAX, AOX, AEX
;
t71:        n   vtm     @71
            n   xta     bltest
                jane    t72
                xta     ful
                aax
            13  vjm     снасс
                xta     ful
                aax     ful
                aex     ful
            13  vjm     снасс
                xta     chess1
                aax     chess1
                aex     chess1
            13  vjm     снасс
                xta     chess1
                aax     chess2
            13  vjm     снасс
                xta     chess1
                aox     chess2
                aex     ful
            13  vjm     снасс
                xta     chess2          ; проверка
                aex     chess1          ; засылки
                xta     chess2          ; в рмр
                aey
                jane    error
            13  vjm     newtest
;
; 72 - ARX
;
t72:        n   vtm     @72
            n   xta     bltest
                jane    t73
                xta     =11
                arx     =1
                aex     =12
            13  vjm     снасс
                xta     ful
                arx     =1
                aex     =1
            13  vjm     снасс
                xta     ful
                arx     ful
                aex     ful
            13  vjm     снасс
            13  vjm     newtest
;
; 73 - APX, AUX
;
t73:        n   vtm     @73
            n   xta     bltest
                jane    t74
                xta     chess1
                apx     ful
                aux     =h7fff ffff ffff ffff
                aex     chess2
            13  vjm     снасс
                xta     chess1
                apx     chess2
            13  vjm     снасс
                xta     chess1
                apx     chess1
                aux     chess2
                aex     chess2
            13  vjm     снасс
                xta     ful
                aux     chess2
                aex     chess2
            13  vjm     снасс
            13  vjm     newtest
;
; 74 - ACX, ANX
;
t74:        n   vtm     @74
            n   xta     bltest
                jane    t75
                acx
            13  vjm     снасс
                xta     ful
                acx
                aex     =64
            13  vjm     снасс
                xta     chess2
                acx     =hffff ffff ffff ffe0
                aex     =1
            13  vjm     снасс
            11  vtm     64
                xta     =1
tanx:       11  jmne    * + 1
                xta
:               atx     ws
                anx
                its     11
            15  aex
            13  vjm     снасс
                xta     ws
                asn     1024 - 1
                its     11
                aax     =7
            15  aox
            11  vrm     tanx
                xta
                anx     ful
                aex     ful
            13  vjm     снасс
                uta     5               ; проверка
                anx     ful             ; засылки
                xta     =h4000 0000 0000 0000
                aey                     ; остатка
                jane    error           ; в рмр
            13  vjm     newtest
;
; 75 - ASN, ASX
;
t75:        n   vtm     @75
            n   xta     bltest
                jane    t76
            11  vtm     64
tsft1:          xta     =h8000 0000 0000 0000
            11  asn     1024 - 1
                anx
                its     11
            15  aex
            13  vjm     снасс
            11  vrm     tsft1
            11  vtm     64
tsft2:          xta     =1
            11  asn     1024 - 64
                anx
                its     11
            15  aex
            13  vjm     снасс
            11  vrm     tsft2
                xta     ful
                asx     ful
            13  vjm     снасс
                xta     chess2
                asx     =h7fff ffff ffff ffff
                aex     chess1
            13  vjm     снасс
                xta     ful             ; а что
                asn     1024 - 12       ; попадет
                uta     @fff            ; в рмр
                aey                     ; при
                jane    error           ; сдвигах ?
                xta     ful
                asn     1024 + 4
                xta     =hf000 0000 0000 0000
                aey
                jane    error
            13  vjm     newtest
;
; 76 - E+N, E-N, E+X, E-X
;
t76:        n   vtm     @76
            n   xta     bltest
                jane    t77
            12  vtm     @7fe
                xta     =hffe8 0000 0000 0000
                atx     ws
l76:            xta     ws
                e+n     @3ff
                atx     ws
                asn     1024 + 53
                ati     14
            12  j-m     14
            14  jmne    error
            12  vrm     l76
                xta     ws
                e-n     @401
                jane    error
                uza     error
            12  vtm     @7fe
            11  vtm     1
                xta     =h0008 0000 0000 0000
                atx     ws
l761:           xta     ws
                e-x     =h7ff7 0000 0000 0000
                atx     ws
                asn     1024 + 53
                ati     14
            11  j-m     14
            14  jmne    error
            11  utm     1
            12  vrm     l761
                xta     ws
                e+x     =h0000 0000 0000 0000
                aex     =h7fe8 0000 0000 0000
                u1a     error
            13  vjm     newtest
;
; 77 - A+X, A-X, X-A
;
t77:        n   vtm     @77
            n   xta     bltest
                jane    t78
                ntr     3
                uta     64
                a-x     =65
                uza     error
                uza     error
                jaeq    error
                a+x     =1
                u1a     error
                jane    error
                xta     =2
                x-a     =1
                a-x     =h001f ffff ffff ffff
                u1a     error
                jane    error
                uta     2
                uts     1
                uts     2
                uts     3
            15  a-x                     ; 3-2=1
                u1a     error
            15  a+x                     ; 1+1=2
            15  x-a
                u1a     error
                jane    error
                xta     =h8680 0000 0000 0040   ; 64
                a-x     =h8680 0000 0000 0041   ;
                uza     error
                a+x     =h8028 0000 0000 0000   ; 1.
                u1a     error
                aex     =h8680 0000 0000 0000   ; 0, ненормализованный
                u1a     error
                ntr     2
                xta     =h8048 0000 0000 0000   ; 2.
                xts     =h8028 0000 0000 0000   ; 1.
                xts     =h8048 0000 0000 0000   ; 2
                xts     =h804c 0000 0000 0000   ; 3
            15  a-x
            15  a+x
            15  x-a
                u1a     error
                jane    error
            13  vjm     newtest
;
; 78 - A*X, A/X
;
t78:        n   vtm     @78
            n   xta     bltest
                jane    t80
                ntr     3
                xta     =h8680 0000 0000 0005
                a*x     =h8680 0000 0000 000d   ; 13
                ytx     ws
                aex     =h8d00 0000 0000 0000   ;
                u1a     error
                xta     ws
                aex     =h8d00 0000 0000 0041   ; 65*2!52
                u1a     error
                xta     =h8680 0000 0000 000d   ; 13
                a*x     =h869f ffff ffff fff3   ; -13
                ytx     ws
                aex     =h8d1f ffff ffff ffff
                u1a     error
                xta     ws
                aex     =h8d0f ffff ffff ff57
                u1a     error
                ntr     2
                xta     =h806а 0000 0000 0000   ; 5.
                a*x     =h808d 0000 0000 0000   ; 13.
                aex     =h80е8 2000 0000 0000   ; 65.
                u1a     error
                yta
                a/x     =h808d 0000 0000 0000   ; 13.
                aex     =h806а 0000 0000 0000   ; 5.
                u1a     error
            13  vjm     newtest
;
; II. Новые команды:
; ===================
;
; 80 - JMLT, JMLE, JMGT, JMGE
;
t80:        n   vtm     @80
            n   xta     bltest
                jane    t81
            3   vtm
            3   jmgt    error
            3   jmlt    error
:           3   jmge    * + 1
                jmp     error
:           3   jmle    * + 1
                jmp     error
:               xta     =h0000 0000 8000 0000
                ati     3
            3   jmgt    error
            3   jmge    error
:           3   jmle    * + 1
                jmp     error
:           3   jmlt    * + 1
                jmp     error
;
:           2   vtm     31
                xta     chess1
lt80:           asn     1024 + 1
            15  atx
                aax     =4
                sti     4
                ati     3
            4   jmp     * + 1
;------------
:           3   jmgt    error
            3   jmge    error
:           3   jmle    * + 1
                jmp     error
:           3   jmlt    elt80
                jmp     error
:               jmp     error
;------------
:           3   jmle    error
            3   jmlt    error
:           3   jmge    * + 1
                jmp     error
:           3   jmgt    elt80
                jmp     error
;------------
elt80:      2   vrm     lt80
            13  vjm     newtest
;
; 81 - JAEQ, JANE, JAGT, JAGE, JALT, JALE
;
t81:        n   vtm     @81
            n   xta     bltest
                jane    t82
                uta     1
            2   vtm     -63
lt81:           jaeq    error
                jaeq    error
:               jane    * + 1
                jmp     error
:               asn     1024 - 1
            2   vlm     lt81
:               jaeq    * + 1           ; а=0
                jmp     error
:               jane    error
                jane    error
                jagt    error
                jalt    error
:               jage    * + 1
                jmp     error
:               jale    * + 1
                jmp     error
:               xta     =h8000 0000 0000 0000
                jagt    error
:               jale    * + 1
                jmp     error
:               jalt    * + 1
                jmp     error
:               jage    error
            2   vtm     -60
;
l1t81:          xta     chess1
            2   asn     1024
                its     2
                aax     =1
                sti     3
            3   jmeq    t81min
t81poz:         jalt    error
                jale    error
:               jage    * + 1
                jmp     error
:               jagt    el1t81
                jmp     error
t81min:         jalt    * + 1
                jmp     error
:               jale    * + 1
                jmp     error
:               jagt    error
                jage    error
el1t81:     2   vlm     l1t81
            13  vjm     newtest
;
; 82 - JOVR, JCRY
;
t82:        n   vtm     @82
            n   xta     bltest
                jane    t83
                jovr    error
                jcry    error
                uta
                a+u     1
                jcry    error
                a+u     -1
:               jcry    * + 1
                jmp     error
:               a+u     -1
                jcry    error
                xta     chess2
                a+l     chess2
:               jovr    * + 1
                jmp     error
:               xta     ful
                a+l     ful
                jovr    error
            13  vjm     newtest
;
; 83 - JMPS, RETS
;
t83:        n   vtm     @83
            n   xta     bltest
                jane    t8с
                rmod    @1818
                ati     5
            5   rmod    @13
                ati     6               ; РАВ
            6   mtj     7
            7   utm     1
            2   vtm     100
lt33:           ita     2
                aau     1
                ati     3
            3   xta     chess1
                aex     ful
            3   jmne    снt33 - 1
:               jmps    calls33         ; слева
:               jmp     снt33
;
calls33:    15  atx
                ytx     ws+1
            5   rmod    @13
                aei     7
                aax     =h0000 0000 ffff ffff
                jane    error
                xty     ws + 1
            15  xta
:           3   jmne    * + 1
                rets
:               rets
;
:               utc     -1
                jmps    calls33 + 1     ; справа
;
снt33:          ytx     ws
            3   aex     chess1
                aex     ful
                jane    error
                xta     ws
            3   aex     chess1
                jane    error
            5   rmod    @13
                aei     6
                aax     =h0000 0000 ffff ffff
                jane    error
            2   vrm     lt33
            13  vjm     newtesti
;
; 8с - UZAS, U1AS
;
t8с:        n   vtm     @8c
            n   xta     bltest
                jane    t90
            15  vtm     mst
            15  mtj     14
                xta     chess1
                xts     chess2
                uzas    error
                aex     chess1
                jane    error
            15  j-m     14
            14  jmne    error
            15  mtj     14
                xta     ful
                xts
                u1as    error
                aex     ful
                jane    error
            15  j-m     14
            14  jmne    error
                xta
                xts     ful
                ntr     11              ; гр.умн
                u1as    error
                u1a     error           ; будет лог.гр !
                xta     ful
            15  atx
                ntr     11
                u1as    error
                uza     error
                xta
                xts     ful
                ntr     19              ; гр.слож.
                uzas    error
                u1a     error           ; будет лог.гр.
            15  mtj     14
                xta
                xts     ful
:               u1as    * + 1
                jmp     error
:           15  j-m     14
            14  jmne    error
                u1a     error
            13  vjm     newtest
;
; 90 - UTA, UTS, UTY
;
t90:        n   vtm     @90
            n   xta     bltest
                jane    t91
                xta     ful
                uta
                jane    error
                uta     -1
                aex     ful
                jane    error
                xta     ful
                atx     mst
            2   vtm     -2
                utc     1
            2   uta     1
                jane    error
                atx     mst + 1
                atx     mst + 2
                uts     -1
                uts     -1
                aex     ful
                jane    error
            15  xta
                aex     ful
                jane    error
            15  aox
                aox     mst + 2
                jane    error
            15  utm     -mst
            15  jmne    error
;
            15  vtm     mst
            3   vtm     -29
            2   vtm     -10
:               uts     -1
                uts     -1
                uts     -1
            2   vlm     * - 1
:               aex     ful
                u1as    error
            3   vlm     * - 1
;
                uty     5
                uta     5
                aey
                jane    error
                uty     -1
                xta     ful
                aey
                jane    error
            2   vtm     32
            3   vtm     1
            15  vtm     mst
:               ita     3
            2   atx     ws
            3   msn     @400 - 1
            2   vrm     * - 1
            2   vtm     32
            3   vtm     1
lt50:       3   uty
            2   wtc     ws
                uta
            3   uts
            2   wtc     ws
                uts
                aey
                jane    error
            3   uta
            15  aex
                jane    error
            2   xta     ws
            15  aex
                jane    error
            3   msn     @400 - 1
            2   vrm     lt50
            13  vjm     newtest
;
; 91 - AAU, AOU, AEU
;
t91:        n   vtm     @91
            n   xta     bltest
                jane    t94
                xta     ful
                aau     -1
                aex     ful
                jane    error
                xta     ful
                aau
                jane    error
                uta     1
                aou     -2
                aex     ful
                jane    error
                aex                     ; рмр=0
                xta     ful
                aeu     -1              ; проверим
                jane    error           ; размножение
                aey                     ; и что рмр
                jane    error           ; не портится
            13  vjm     newtest
;
; 94 - ACU, ANU
;
; (в отличие от ACX,ANX здесь сложение
; с исп.адресом не циклическое, а арифметическое!)
;
t94:        n   vtm     @94
            n   xta     bltest
                jane    t95
                acu
                jane    error
                xta     ful
                acu
                aeu     64
                jane    error
                xta     chess2
                acu     -32
                jane    error
                xta     chess1
                acu     -31
                aeu     1
                jane    error
                xta     chess1
                acu     -33
                aex     ful
                jane    error
            11  vtm     64
                uta     1
tanu:       11  jmne    * + 1
                uta
:               atx     ws
                anu
                its     11
            15  aex
                jane    error
                xta     ws
                asn     1024 - 1
                its     11
                aau     7
            15  aox
            11  vrm     tanu
                uta     1
                anu     -64
                jane    error
                uta     1
                anu     -65
                aex     ful
                jane    error
                uta     1
                anu     -63
                aeu     1
                jane    error
                anu
                jane    error
                anu     -1
                aex     ful
                jane    error
                uta     5
                anu     -1
                xta     =h4000 0000 0000 0000
                aey
                jane    error
            13  vjm     newtest
;
; 95 - MCJ, J-M
;
t95:        n   vtm     @95
            n   xta     bltest
                jane    t96
            2   vtm
            3   vtm     1
            2   mcj     3
            3   jmne    error
            2   utm     -1
            2   jmne    error
;
            2   vtm     2
            3   vtm     3
            2   j-m     3
            3   utm     -1
            3   jmne    error
            2   utm     -2
            2   jmne    error
            13  vjm     newtest
;
; 96 - MSN
;
t96:        n   vtm     @96
            n   xta     bltest
                jane    ta0
                xta     =h0000 0000 4000 0000
l1t56:          ati     2
            2   msn     1024 + 3
                asn     1024 + 3
                ati     3
            3   j-m     2
            2   jmne    error
                jane    l1t56
;
                xta     =h0000 0000 8000 0000
l2t56:          ati     2
            2   msn     1024 + 3
                asn     1024 + 3
                aox     =h0000 0000 e000 0000
                ati     3
            3   j-m     2
            2   jmne    error
            3   utm     1
            3   jmne    l2t56
;
                uta     1
l3t56:          ati     2
            2   msn     1024 - 3
                asn     1024 - 3
                aax     =h0000 0000 7fff ffff
                ati     3
            3   j-m     2
            2   jmne    error
            3   jmne    l3t56
;
            4   vtm     12
                uta     -1
l4t56:          ati     2
            2   msn     1024 - 3
                asn     1024 - 3
                aox     =h0000 0000 8000 0000
                ati     3
            3   j-m     2
            2   jmne    error
            4   vrm     l4t56
            13  vjm     newtest
;
; а0 - работа с РМР:
;
ta0:        n   vtm     @a0
            n   xta     bltest
                jane    ta1
                xty     ful
                ytx     ws
                xta     ws
                aex     ful
                jane    error           ; у=ful
                yex     chess2
                yox     chess2
                aex     ful
                jane    error           ; у=ful
                yex     chess2
                aex     chess1
                jane    error           ; у=chess1
                yax     chess2
                jane    error
                xta     chess2
                aay
                jane    error
                xta     chess2
                aoy
                aex     ful
                jane    error           ; у=ful
                xta     chess2
                aey
                aex     chess1
                jane    error
            13  vjm     newtest
;
; а1 - AAI, AOI, AEI, А-I, I-А
;
ta1:        n   vtm     @a1
            n   xta     bltest
                jane    ta2
            2   vtm     -12
lt61:           uta     -1
            2   ati     15
            2   aai     15
                aex     ful
                jane    error
                xta     ful
                aai
                jane    error
                xty
                xta     ful
            2   aei     15
                jane    error
                aoy
                jane    error
            2   uta     15
            2   ati     15
            2   aei     15
                jane    error
            2   aoi     15
            2   aei     15
                jane    error
            2   uta     15
            2   a-i     15
                jane    error
            2   uta     16
            2   a-i     15
                jale    error
            2   uta     14
            2   a-i     15
                jage    error
            2   uta     15
            2   i-a     15
                jane    error
            2   uta     16
            2   i-a     15
                jage    error
            2   uta     14
            2   i-a     15
                jale    error
            2   vlm     lt61
            13  vjm     newtest
;
; а2 -  МРАС, MUNP
;
ta2:        n   vtm     @a2
            n   xta     bltest
                jane    ta3
                uta     -20
lt621:          atx     ws + 4          ; смещение
            2   vtm     -11             ; регистры 4-15
:           2   uta     15
                arx     ws + 4
            2   ati     15
            2   vlm     * - 1
            2   vtm     -8
;
lt62:           xta
                aex
            2   mpac    12
                atx     ws
                ytx     ws + 1
                uta
            2   ati     12
            2   ati     13
            2   ati     14
            2   ati     15
                xta     ws
            2   munp    12
                ytx     ws + 2
                aex     ws
                jane    error
                xta     ws + 2
                aex     ws + 1
                jane    error
            3   vtm     -11
:           3   uta     15
                arx     ws + 4
            3   aei     15
                jane    error
            3   vlm     * - 2
            2   vlm     lt62
;
                xta     ws + 4
                a+u     1
                jale    lt621
            13  vjm     newtest
;
; а3,а4,а5 - целое умножение и деление
;
ta3:        n   vtm     @a3
            n   xta     bltest
                jane    ta4
                uta     @f
            2   vtm     2
            3   vtm     1
rа4:            atx     ws
            4   vtm     24
rра4:           xta     ws
            15  atx
                asna    1024 - 1
                atx     ws + 1
                xta     ws
                a*u     2
                jovr    error
                aex     ws + 1
                jane    error
                xta     ws
                a*i     2
                jovr    error
                aex     ws + 1
                jane    error
                uta     2
                utc     ws
                a*l
                jovr    error
                aex     ws + 1
                jane    error
                uta     2
            15  a*l
                jovr    error
                aex     ws + 1
                jane    error
            6   vtmh    ws
                uta     2
            6   a*h     1
                jovr    error
                aex     ws + 1
                jane    error
                ytx     ws
            4   vrm     rра4
                uta     -1
            3   vrm     rа4
;
:               uta     @80fff
            2   vtm     2
            3   vtm     1
rsa4:           atx     ws
            4   vtm     24
rpsa4:          xta     ws
                asna    1024 + 1
                atx     ws + 1
                xta     ws
                a/u     2
                jovr    error
                aex     ws + 1
                jane    error
                xta     ws
                a/i     2
                jovr    error
                aex     ws + 1
                jane    error
                uta     2
                atx     ws + 2
                xta     ws
                a/l     ws + 2
                jovr    error
                aex     ws + 1
                jane    error
                uta     2
            15  atx
                xta     ws
            15  a/l
                jovr    error
                aex     ws + 1
                jane    error
            6   vtmh    ws + 2
                xta     ws
            6   a/h     1
                jovr    error
                aex     ws + 1
                jane    error
                ytx     ws
            4   vrm     rpsa4
                uta     -1
            3   vrm     rsa4
;
            13  vjm     newtest
;
ta4:        n   vtm     @a4
            n   xta     bltest
                jane    ta6
            4   vtm     3
lta4:           uta     13
            13  vjm     setoper         ; множитель
                uta     5               ; множимое
            13  vjm     multa4
                aeu     65
                jane    error
                uta     -13
            13  vjm     multa4
                aeu     -169
                jane    error
            13  vjm     multa4
                jane    error
            13  vjm     setoper
                uta     5
            13  vjm     multa4
                jane    error
                nta     64 - 25
            13  vjm     setoper
            13  vjm     multa4
                aen     64 - 49
                jane    error
            4   vrm     lta4
            13  vjm     newtest
;
ta5:        n   vtm     @a5
            5   vtm     3
lta5:           uta     7               ; делитель
            13  vjm     setoper
                uta     13              ; делимое
            13  vjm     divta5
                aeu     1
                jane    error
                uta     6
                aey
                jane    error
            13  vjm     divta5
                aoy
                jane    error
                uta     -20
            13  vjm     divta5
                aeu     -2
                jane    error
                uta     -6
                aey
                jane    error
                uta     77
            13  vjm     divta5
                aeu     11
                aoy
                jane    error
            5   vrm     lta5
            13  vjm     newtest
;
; а6 - ASNA
;
ta6:        n   vtm     @a6
            n   xta     bltest
                jane    ta7
                xta     =h4000 0000 0000 0000
l1t66:      15  atx
                asn     1024 + 3
                stx     ws
                asna    1024 + 3
                aex     ws
                jane    error
                xta     ws
                jane    l1t66
;
            2   vtm     25
                xta     =h8000 0000 0000 0000
l2t66:      15  atx
                asn     1024 + 3
                aox     =hе000 0000 0000 0000
                stx     ws
                asna    1024 + 3
                aex     ws
                jane    error
                xta     ws
            2   vrm     l2t66
;
                uta     2
l3t66:      15  atx
                asn     1024 - 3
                stx     ws
                asna    1024 - 3
                aex     ws
                jane    error
                xta     ws
                jane    l3t66
;
                uta     -1
            2   vtm     25
l4t66:      15  atx
                asn     1024 - 11
                aox     =h8000 0000 0000 0000
                stx     ws
                asna    1024 - 11
                aex     ws
                jane    error
                xta     ws
            2   vrm     l4t66
            13  vjm     newtest
;
; а7 - VTMH, VTMQ, VTMB, VTMF
;
ta7:        n   vtm     @a7
            n   xta     bltest
                jane    tb0
            2   vtm     ws
                ita     2
                asn     1024 - 1
            3   vtmh    ws
                its     3
            15  aex
                jane    error
                ita     2
                asn     1024 - 2
            3   vtmq    ws
                its     3
            15  aex
                jane    error
                ita     2
                asn     1024 - 3
            3   vtmb    ws
                its     3
            15  aex
                jane    error
                ita     2
                asn     1024 - 6
            3   vtmf    ws
                its     3
            15  aex
                jane    error
;
            3   vtmh    100
            3   utm     -200
            3   jmne    error
            3   vtmq    100
            3   utm     -400
            3   jmne    error
            3   vtmb    100
            3   utm     -800
            3   jmne    error
            3   vtmf    100
            3   utm     -6400
            3   jmne    error
            13  vjm     newtest
;
; в0 - нумерованные биты:
;      NTA, NTS, AAN, AON, AEN
;
tb0:        n   vtm     @b0
            n   xta     bltest
                jane    tb1
            2   vtm     63
            15  vtm     ws
                xta     =h8000 0000 0000 0000
:           15  atx                     ; 64,63,...,1
                asn     1024 + 1
                jane    * - 1
                uta     1
:           15  atx                     ; 1,2,...,64
                asn     1024 - 1
                jane    * - 1
            15  vtm     mst
;
:           2   nta
            2   aex     ws
                jane    error
            2   vrm     * - 1
;
            2   vtm     63
            3   vtm     63
:           3   nta     1024
            3   aex     ws + 64
                jane    error
            3   vrm     * - 1
;
:           2   xta     ws
            2   nts
            15  aex
                jane    error
            2   vrm     * - 2
;
            3   vtm     63
:           3   xta     ws + 64
            3   nts     1024
            15  aex
                jane    error
            3   vrm     * - 2
            15  utm     -mst
            15  jmne    error
;
            2   vtm     63
:           2   aen
            2   vrm     *
                aex     ful
                jane    error
                uta     -1
            3   vtm     63
:           3   aen     1024
            3   vrm     *
                jane    error
;
            2   vtm     31
:           2   utc     -1
            2   aon     1
            2   vrm     * - 1
                aex     chess1
                jane    error
;
            2   vtm     63
:               uta     -1
            2   aan
            2   aex     ws
                jane    error
            2   vrm     * - 2
            13  vjm     newtest
;
; в1 - работа с полусловами
;
tb1:        n   vtm     @b1
            n   xta     bltest
                jane    tb2
            2   vtmh    ws
                uta     -32
            3   vtm     63
:           2   ath                     ; -32,-31,...,30,31
            2   utm     1
                a+u     1
            3   vrm     * - 1
;
                uta     32
            3   vtm     63
:               a-u     1
            15  atx
            2   hts     -1
            2   utm     -1
            15  aex
                u1as    error
            3   vrm     * - 3
;
                xta     ws
                aex     =hffff ffe0 ffff ffe1
                jane    error
            3   vtm     31
;
:           2   hta
            2   a-h     1
                aeu     -1
                jane    error
            2   hta     1
            2   h-a
                u-a     -1
                jane    error
            2   utm     2
            3   vrm     * - 4
;
            3   vtm     63
                uty
:           3   uta     -32
            2   aeh     -1
                aoy
                jane    error
            2   utm     -1
            3   vrm     * - 2
;
                atx     ws
                xta     chess2
                xts
                xts     ful
                sth     ws<<1
                jane    error
                uta     1
                a+h     ws<<1
                jane    error
                xta     chess1
                sth     ws<<1 + 1
                aah     ws<<1
                aoh     ws<<1 + 1
                aex     ful
                ati     14
                asn     1024 + 32
                jane    error
            14  jmne    error
            13  vjm     newtest
;
; в2 - работа с четвертинками:
;
tb2:        n   vtm     @b2
            n   xta     bltest
                jane    tb3
            2   vtmq    ws
            3   vtm     63
                uta     -32
;
:           2   atq                     ; -32,-31,...,30,31
            2   utm     1
                a+u     1
            3   vrm     * - 1
;
            3   vtm     63
                uta     32
:               a-u     1
            15  atx
            2   qts     -1
            2   utm     -1
                asn     1024 + 16
                jane    error
            2   qta
            15  aex
                aau     @ffff
                u1as    error
            3   vrm     * - 5
;
                xta     ws
                aex     =hffe0 ffe1 ffe2 ffe3
                jane    error
;
            3   vtm     -63
                uty
:           3   uta     63 - 32
            2   aeq
                aau     @ffff
                aoy
                jane    error
            2   utm     1
            3   vlm     * - 3
;
            2   vtmq    ws
                uts     -1
            2   stq     1
                jane    error
                xta     ful
            2   aaq     1
                aeu     @ffff
                jane    error
            2   aoq     1
                aeu     @ffff
                jane    error
            13  vjm     newtest
;
; в3 - работа с байтами:
;
tb3:        n   vtm     @b3
            n   xta     bltest
                jane    tb6
            2   vtmb    ws
            3   vtm     63
                uta     -32
:           2   atb
            2   utm     1
                a+u     1
            3   vrm     * - 1
;
            3   vtm     63
                uta     32
:               a-u     1
            15  atx
            2   bts     -1
                asn     1024 + 8
                jane    error
            2   bta     -1
            15  aex
                aau     @ff
                u1as    error
            2   utm     -1
            3   vrm     * - 5
;
                xta     ws
                aex     =he0e1 e2e3 e4e5 e6e7
                jane    error
;
            3   vtm     -63
                uty
:           3   uta     63 - 32
            2   aeb
                aau     @ff
                aoy
                jane    error
            2   utm     1
            3   vlm     * - 3
;
            2   vtmb    ws
                uts     -1
            2   stb     3
                jane    error
            2   aob     3
                aeu     @ff
                jane    error
                uta     -1
            2   aab     3
                aeu     @ff
                jane    error
            13  vjm     newtest
;
; в6 - работа с битами:
;      FTA, ATF, FTS, STF, AAF, AOF, AEF
;
tb6:        n   vtm     @b6
            n   xta     bltest
                jane    tb7
            2   vtmf    ws
            3   vtm     127
            4   vtm     128
:               ita     3
            2   atf
            2   utm     1
            3   vrm     * - 1
:               its     4
            2   stf
            2   utm     1
            4   vrm     * - 1
                jane    error
                ita     15
                aeu     mst
                jane    error
                xta     ws
                aex     chess1
                jane    error
                xta     ws + 1
                aex     chess1
                jane    error
                xta     ws + 2
                aex     chess2
                jane    error
                xta     ws + 3
                aex     chess2
                jane    error
;
            2   vtmf    ws
            3   vtm     127
:               ita     3
                aau     1
            2   fts
            2   utm     1
            15  aex
                jane    error
            3   vrm     * - 3
;
            4   vtm     128
:           2   fta
            2   utm     1
                its     4
                aau     1
            15  aex
                jane    error
            4   vrm     * - 3
;
            4   vtm     128
:           2   utm     -1
                uta     -1
            2   aaf
                its     4
                aau     1
            15  aex
                jane    error
            4   vrm     * - 3
;
            4   vtm     63
            3   vtm     127
:           3   uta     1
                aau     1
            2   aef     -1
            2   utm     -1
                jane    error
            3   vrm     * - 2
;
:               asn     1024 - 1
            2   aof
            2   utm     1
            4   vrm     * - 1
                aex     chess1
                jane    error
            13  vjm     newtest
;
; в7 - работа с битами:
;      EXTF, SETF, CLRF
;
tb7:        n   vtm     @b7
            n   xta     bltest
                jane    tc0
            2   vtmf    ws
                atx     ws
                atx     ws + 1
            3   vtm     -63
:               xta     =h8000 0000 0000 0000
            3   asna    1024 + 63
            2   setf
            2   utm     1
                aex     ws
                jane    error
            3   vlm     * - 3
;
            4   vtm     63
:               uta     -1
            4   asn     1024 - 64
            2   clrf    -1
            2   utm     -1
                aex     ws
                jane    error
            4   vrm     * - 3
;
            3   vtm     63
lt77:       3   jmeq    * + 2
                ita     3
                aau     1
            4   aon     1
:               atx     ws
            4   extf                    ; размн."0"
                aex     ws
                jane    error
                xta     =h8000 0000 0000 0000
            4   asna    1024
            4   nts
            4   extf                    ; размн."1"
            15  aex
                jane    error
            4   utm     1
            3   vrm     lt77
;
            13  vjm     newtest
;
; Тесты типа: "кто что портит":
; (убрать ";" после пропайки ПНА групп)
;
; с0 - команды, не портящие сумматор
;
tc0:        n   vtm     @c0
            n   xta     bltest
                jane    tc1
            2   vtm     1
ltc0:       2   xta     chess1
                uza     * + 1
:               atx     ws
                u1a     * + 1
:               asn     1024
                jmp     * + 1
:               asx     =h8000 0000 0000 0000
            13  vjm     * + 1
:               ati     3
            3   jmeq    * + 1
:           3   mtj     4
            4   jmne    * + 1
:           3   j+m     4
            4   vlm     * + 1
:               utc     2
                wtc     adr + 1
:           5   vtm     4
            5   vrm     * + 1
:           5   utm     1
            5   jmgt    * + 1
:               xtr     0
            5   jmge    * + 1
:               ntr     63
            5   jmlt    * + 1
:           3   mcj     4
            5   jmle    * + 1
:           4   msn     1024 + 3
                jalt    * + 1
:           4   j-m     5
                jale    * + 1
:               asna    1024
                jaeq    * + 1
:           8   vtmh    ws
                jane    * + 1
:           9   vtmq    ws
                jage    * + 1
:           10  vtmb    ws
                jagt    * + 1
:           11  vtmf    ws
                jcry    * + 1
:               munp    3
                jovr    * + 1
:               xts     ws
                stx     ws
                its     5
                sti     5
                a+u
                a-u
                aau     -1
                aou
                aeu
                uty
                ttx     ws              ; надо у=0 !
                xty     ful
                ytx     ws
                aay
            3   vtm
                a+i     3
                a-i     3
                aei     3
                aoi     3
            4   vtm     -1
                aai     4
                a+l
                a-l
            8   ath
            9   atq
            10  atb
            11  atf
                atd     ws
                semr    ws
                semw    ws
                smon
                cmon    @fff7f
            2   aex     chess1
                jane    error
            2   vrm     ltc0
            13  vjm     newtest
;
; с1 - команды, не портящие РМР
;
tc1:        n   vtm     @c1
            n   xta     bltest
                jane    tc2
            2   vtm     1
ltc1:       2   xty     chess1
                jcry    * + 1
:               atx     ws
                jovr    * + 1
:               xta     ws
                uza     * + 1
:               xts     ws
                u1a     * + 1
:               stx     ws
                jmp     * + 1
:               aax
            13  vjm     * + 1
:               aox     ful
            13  vlm     * + 1
:               arx     ful
            13  vrm     * + 1
:               apx     ful
            3   jmeq    * + 1
:               aux     ful
            3   jmne    * + 1
:               acx     ful
            3   jmlt    * + 1
:               ati     3
            3   jmle    * + 1
:               ita     3
            3   jmgt    * + 1
:               its     3
            3   jmge    * + 1
:               sti     3
                jaeq    * + 1
:           3   mtj     4
                jane    * + 1
:           3   j+m     4
                jalt    * + 1
:           3   j-m     4
                jale    * + 1
:           4   utm     -1
                jagt    * + 1
:           3   mcj     4
                jage    * + 1
:               utc     2
                wtc     adr + 4
            5   vtm     -1
                xtr     ful
                ntr     0
                rte     63
                a+u     -1
                a-u     -1
                u-a     1
                uta     -1
                aau     -1
                aeu
                aou     -1
                acu
                yax     ful
                yex     ful
                yox     ful
                aay
                aey
                aoy
            8   vtmh    ws
            9   vtmq    ws
            10  vtmb    ws
            11  vtmb    ws
                munp    3
                a+i     3
                a-i     3
                i-a     3
                aai     3
                aei     3
                aoi     3
                asna    1024 + 5
                asna    1024 - 7
                a+l     ful
                a-l     ful
                l-a     ful
                atd     ws
                semr    ws
                semw    ws
                smon
                cmon    @fff7f
                rmod    1
                wmod    1
            2   xta     chess1
                aey
                jane    error
            2   vrm     ltc1
            13  vjm     newtest
;
; с2 - команды, не портящие РР:
;
tc2:        n   vtm     @c2
            n   xta     bltest
                jane    t41
            2   vtm     63
ltc2:       2   ntr
                uza     * + 1
:               atx     ws
                u1a     * + 1
:               ati
                jmp     * + 1
:           3   mtj     4
            13  vjm     * + 1
:           3   j+m     4
            3   jmeq    * + 1
:           3   j-m     4
            3   jmne    * + 1
:               atd     ws
                jcry    * + 1
:           3   mcj     4
                jovr    * + 1
:           4   utm     -1
            4   vlm     * + 1
:               utc     2
                wtc     adr + 4
:           5   vtm     4
            5   vrm     * + 1
:               rte     63
            3   jmlt    * + 1
:               xty     ws
            3   jmle    * + 1
:               ytx     ws
            3   jmgt    * + 1
:           3   msn     1024 + 5
            3   jmge    * + 1
:           3   msn     1024 - 5
                jalt    * + 1
:           8   vtmh    ws
                jale    * + 1
:           9   vtmq    ws
                jagt    * + 1
:           10  vtmb    ws
                jage    * + 1
:           11  vtmf    ws
                jaeq    * + 1
:               munp    3
                jane    * + 1
:           8   ath
            9   atq
            10  atb
            11  atf
                atd     ws
                rmod    1
                wmod    1
                rte     63
                its     2
                asn     1024 - 53
            15  aex
                jane    error
            2   vrm     ltc2
            13  vjm     newtest
;
; *******************
; * 41 - экстракоды *
; *******************
;
t41:        n   vtm     @41
            n   xta     bltest
                jane    t4а
            2   vtm     50              ; сч-к цикла
                uta     сhexт
            n   atx     adr - 1         ; перехват
;
l1t41:          ita     2
                aau     1
                ati     3               ; лево/право
                ita     2
                aau     2
                ati     4               ; без/с рез.гр.
                rmod    @1818
                ati     5               ; РНГ
            5   rmod    @11
                ati     6               ; РР
            5   rmod    @12
                aau     @ffff
:           4   jmeq    * + 1           ; рез.гр.=31
                aox     =h0000 0000 003f 0000
:           5   wmod    @12
                ati     7               ; РРР
            5   rmod    @13
                ati     8               ; РАВ
            5   rmod    @1d
                ati     9               ; РАПУ
            5   rmod    @1e
                ati     10              ; РНП
                ita     15
            15  vtm     -14
:           15  atx     mst + 14        ; 15, 1, 2, ... 14
            15  ita     15
            15  vlm     * - 1
                xta     mst
                ati     15
            3   xta     chess1
                aex     ful
            3   jmp     callext
;
; *** для ручной передачи управления: ***
; 1 - "дерганье" пустого экстракода
; 2 - "дерганье" прерывания по контр.ком.
;
getfun:
                ita
                jane    horror
                fun
                ita
                jaeq    getfun
aret:           ita
            5   vjm     cout
                jane    horror
                xta     con_in
                jane    anal
                ret
;
t41_емр:        utc     1               ; с рез.группой
:           4   vtm                     ; без оной
            n   vtm     @41
                uta     aret
            n   atx     adr - 1
                rmod    @1818
                ati     5
            5   rmod    @12
                aau     @ffff
:           4   jmeq    * + 1
                aox     =h0000 0000 003f 0000
:           5   wmod    @12
                jmp     getfun
;
loopint:    n   vtm     @0d
                uta     акк
            n   atx     adr - 1
                setr    @100            ; бптз
                xty                     ; тег=0
                uta
                ttx     ws
            5   vtm     ws
                jmp     cout
;
акк:            ita
            5   vjm     cout
                jane    horror
            ng  rmod    0
                jane    horror
                xta     con_in
                jaeq    ret_int
                uta     anal
                jmp     put_рс
;
; Внутри экстракода.
; Меняем местами сумматор с РМР.
; Проверим все условия.
;
сhexт:          atx     ws + 1
                ytx     ws + 2
                ita     iа
                aex     mst + 2         ; исп.адрес
                jane    error
                ita     ng
                aex     mst + 5         ; группа у подателя
                jane    error
                ita     tn
                aex     mst + 10        ; процесс-податель
                jane    error
                rmod    @1819
                aex     mst + 10
                jane    error
                rmod    @1818
                ati     14
                xta     mst + 4
                jaeq    * + 3
            14  rmod    @12             ; в РРР
                asn     1024 + 3        ; должен
                aei     ng              ; появиться
                aau     @3e0            ; номер
:               jane    error           ; прерв.группы
            14  rmod    @1d
                ati     14              ; новое рапу
                xta     mst + 9         ; стар.рапу
                a+u     16
                aei     14
                jane    error
            14  j-m     15
            15  utm     6
            15  jmne    error
;
                xty     ws + 1
                uta     -1
            15  vtm     -13
:           15  ati     14              ; портим все
            15  vlm     *               ; регистры
                xta     ws + 2
                ret                     ; - отвал
;
callext:    2   fun                     ; слева
                jmp     * + 2
:           2   utc     1
                fun     -1              ; справа
;
; После экстракода.  Проверим передачу
; сумматора и РМР, и что никого более не портим.
;
:               ytx     ws
            3   aex     chess1
                jane    error
                xta     ws
            3   aex     chess1
                aex     ful
                jane    error
                ita     15
            15  vtm     -14
:           15  aex     mst + 14
                jane    error
            15  ita     15
            15  vlm     * - 1
                rmod    @1818
                aex     mst + 5
                jane    error           ; не та группа
            5   rmod    @11
                aex     mst + 6
                aax     =h0000 0000 07ef fс03
                jane    error           ; испорчен РР
            5   rmod    @12
                aex     mst + 7
                aax     =h0000 0000 ffff ffff
                jane    error           ; испорчен РРР
            5   rmod    @13
                aex     mst + 8
                aax     =h0000 0000 ffff ffff
                jane    error           ; испорчен РАВ
            5   rmod    @1d
                aex     mst + 9
                aax     =h0000 0000 ffff ffff
                jane    error           ; испорчен РАПУ
            5   rmod    @1e
                aex     mst + 10
                jane    error           ; не тот процесс
                rmod    @1819
                aex     mst + 10
                jane    error           ; не тот РНП
            2   vrm     l1t41
            13  vjm     newtesti
;
; 4а - чтение/запись с тегом (TTA, TTX)
;
t4а:        n   vtm     @4a
            n   xta     bltest
                jane    tinter
                setr    @0c17f          ; теговские блокировки
            2   vtm     255
lt4а:           ita     2
                aex
                ttx     ws
            5   vjm     cout            ; сброс кэша
                uta     1
                tta     ws
                aei     2
                jane    error
                ita     2
                aey
                jane    error
            2   vrm     lt4а
;
                clrr    @ff604          ; снять блокир.
            13  vjm     newtest
;
; ***************
; * ПРЕРЫВАНИЯ: *
; ***************
;
; Следующая группа тестов подготавливает условия
; для возникновения различных прерываний при
; обращении к ячейке ws. Блок реакции на прерывание
; должен обнулять ячейку ws+1. Если это не
; сделано, значит прерывания не было.
;
;   ws   - все "1" или команда возврата
;   ws+1 - признак "ждем прерывания" или 0, если было
;   ws+2 - номер группы прервавшегося процесса
;   ws+3 - номер этого процесса
;   ws+4 - РР      ---"---
;   ws+5 - РРР
;   ws+6 - сумматор
;   ws+7 - РМР     ---"---
;   ws+8 - раб.ячейка
;   ws+9 - дозволенная приписка яч. "ws"
;   ws+10 - раб.ячейка
;
tinter:         xta     bltest + @3e
                jane    pinter
                rmod    @1818
                ati     2               ; РНГ
                atx     ws + 2
                rmod    @1819
                ati     3               ; РНП
                atx     ws + 3
            2   rmod    @11
                atx     ws + 4          ; РР
            2   rmod    @12
                atx     ws + 5          ; РРР
            7   vtm     ws              ; эталон и15
            4   vjm     ltws
;
; Инф.слова тестов:
; -----------------
;  1:20 - адрес прерываемой программы
; 33:40 - устанавливаемый тег
; 41:48 - номер теста
; 49:60 - "0" если рвет при работе с операндом
;         иначе тестируется выборка команды
;
iwtest:         atx     @0b80           ; 0в - пинт(оп)
                jmp     tiu
:               atx     @0b80
                jmp     til
:               atx     @0b80
                jmp     tir
:               atx     @0b80
                jmp     tirh
:               atx     @0b80
                jmp     tirq
:               atx     @0b80
                jmp     tirb
:               atx     @0b80
                jmp     tirf
:               atx     @0b80
                jmp     tirs1
:               atx     @0b80
                jmp     tirs2
:               atx     @0b80
                jmp     tirs3
:               atx     @0b80
                jmp     tirs4
:               atx     @0b80
                jmp     tirs5
:               atx     @0b80
                jmp     tirs6
;
:               jmp     @0a81           ; 0а - пинт(ком)
                jmp     ws
;
:               atx     @1702           ; 17 - операнд в рэ
                jmp     tiu
:               atx     @1702
                jmp     til
:               atx     @1702
                jmp     tir
:               atx     @1702
                jmp     tirh
:               atx     @1702
                jmp     tirq
:               atx     @1702
                jmp     tirb
:               atx     @1702
                jmp     tirf
:               atx     @1702
                jmp     tirs1
:               atx     @1702
                jmp     tirs2
:               atx     @1702
                jmp     tirs3
:               atx     @1702
                jmp     tirs4
:               atx     @1702
                jmp     tirs5
:               atx     @1702
                jmp     tirs6
;
:               jmp     @1603           ; 16 - команда в рэ
                jmp     ws
;
:               atx     @0c04           ; 0с - защ.адр (чт)
                jmp     tiu
:               atx     @0c04
                jmp     til
:               atx     @0c04
                jmp     tir
:               atx     @0c04
                jmp     tirh
:               atx     @0c04
                jmp     tirq
:               atx     @0c04
                jmp     tirb
:               atx     @0c04
                jmp     tirf
:               atx     @0c04
                jmp     tirs1
:               atx     @0c04
                jmp     tirs2
:               atx     @0c04
                jmp     tirs3
:               atx     @0c04
                jmp     tirs4
:               atx     @0c04
                jmp     tirs5
:               atx     @0c04
                jmp     tirs6
;
:               atx     @1508           ; 15 - защ.адр (зп)
                jmp     tiuw
:               atx     @1508
                jmp     tilw
:               atx     @1508
                jmp     tirw
:               atx     @1508
                jmp     tiwh
:               atx     @1508
                jmp     tiwq
:               atx     @1508
                jmp     tiwb
:               atx     @1508
                jmp     tiwf
:               atx     @1508
                jmp     tiws1
:               atx     @1508
                jmp     tiws2
:               atx     @1508
                jmp     tiws3
:               atx     @1508
                jmp     tiws5
:               atx     @1508
                jmp     tiws6
;
:               jmp     @0d00           ; 0d - контр.ком.
                jmp     ws
:               jmp     @1311           ; 13 - защ.выборки
                jmp     ws
:               jmp     @1421           ; 14 - защ.п/у
                jmp     ws
;
:               jmp     @07ff           ;  7 - ош.адрес (к)
                jmp     ws
:               atx     @07ff           ;  7 - ош.адрес (оп)
                jmp     tiu
:               atx     @07ff
                jmp     til
:               atx     @07ff
                jmp     tir
:               atx     @07ff
                jmp     tiwh
:               atx     @07ff
                jmp     tiwq
:               atx     @07ff
                jmp     tiwb
:               atx     @07ff
                jmp     tiwf
;
varjump:    6   utm     1
                jmp     cltws           ; конец списка
;
; блоки "обработки прерываний"
;
picontr:        setr    @f1ff
            ng  rmod    @11
                aon     64 - 25
            ng  wmod    @11             ; вернем "РОА"
            ng  rmod    2
                ati     2               ; страница
                xta     ws + 9          ; ее приписка
            2   wmod    @400            ; доступ к ней
            n   nta
                aax     comint
:               jaeq    * + 1
            ri  mtj     iа              ; СчАС ==> ИАОП
:               ita     2
                asn     1024 - 10
                aou     ws & @3ff
                extf    64 - 20
                aei     iа
                jaeq    contr1
                jmp     errint          ; ош.ИАОП
;
control:        setr    @f1ff
                xta     ws
                uty     1               ; тег = <команда нр>
                ttx     ws
            5   vjm     cout            ; сброс кэша
            n   nta
                aax     comint
:               jaeq    * + 1
            ri  mtj     iа              ; СчАС ==> ИАОП
:               ita     iа
                aeu     ws
            n   mtj     5
            5   utm     -@17
:           5   jmne    * + 1
                aau     @7fff           ; "РЭ"
:           5   utm     @17 - @16
            5   jmeq    * - 1           ; "РЭ"
            5   utm     @16 - 7
:           5   jmne    * + 1           ; норм.адрес
                aax     =h0000 0000 000f ffff
:               jane    errint          ; не тот ИАОП
            ng  wmod    8               ; и8=0
            ng  rmod    @1b             ; подправка
                extf    64 - 20         ; знака
            ng  wmod    @1b             ; у СЧАС
                jmp     contr1
;
contrext:
            15  xta     2               ; см. extint
                atx     mircopy
;
contr1:         xta     ws + 1
                jaeq    errint          ; не ждали
                ita     ng
                aex     ws + 2
                jane    errint          ; не та группа
            ng  rmod    0
                aoi     0
                jane    horror
                rmod    @1818
                ati     2
            2   rmod    @12             ; в РРР должен
                asn     1024 + 3        ; появиться
                aei     ng              ; номер
                aau     @3e0            ; прерванной
                jane    errint          ; группы!
                ita     tn
                aex     ws + 3
                jane    errint          ; не тот процесс
            ng  rmod    n
                aei     n
                jane    errint          ; не то прерывание
                atx     ws + 1
                jmp     ret_int
;
; после возврата: правильно ли отработали
;
contr2:     7   j-m     15
contr3:     15  jmne    errint
                ytx     ws + 8
                aex     ws + 6
                jane    errint          ; испорчен сумматор
                xta     ws + 7
                aex     ws + 8
                jane    errint          ; испорчен РМР
                xta     ws + 1
                jane    errint          ; не рвались!
                rmod    @1818
                aex     ws + 2
                jane    errint          ; испорчен РНГ
                rmod    @1819
                aex     ws + 3
                jane    errint          ; испорчен РНП
                xta     ws              ; не должно рвать!!
                atx     ws              ;  ---"---
            12  jmp
;
; 3:0в - прерывания по тегу
;
ltws:       4   xta     ; инф.слово
                asn     1024 + 40
                aau     @ff
                ati     n
            n   jmeq    eltws
                aeu     @07
:               jane    * + 1
                utc     =h0000 0000 8000 0000   ; портим адрес
:               xta
                ati     8
                uta     control
            n   atx     adr - 1
                atx     ws + 1
            4   xta
                asn     1024 + 32
                aau     @ff             ; тег
                atx     ws + 7
            4   xta
                aox     =h0000 0000 fff0 0000
                ati     11              ; jump adress
                asn     1024 + 48
                aau     @ff
                jaeq    * + 2
            8   j+m     11
                utc     varjump - ful
:               xta     ful
                atx     ws + 6
                xty     ws + 7
                setr    @100            ; БПТЗ
                ttx     ws
            5   vjm     cout            ; сброс кэша
                clrr    @ff604          ; сброс блокировок
            6   vtm     -1
            15  vtm     ws
            11  jmp                     ; на дерганье
;
;--------------------
                jmp     errint
                jmp     errint
tiu:            utc     -1
            8   xta     ws + 1
            6   utm     1
                jmp     cltws
;--------------------
                jmp     errint
                jmp     errint
til:        8   xta     ws
            6   vlm     cltws
;--------------------
                jmp     errint
                jmp     errint
tir:        6   utm     -1
            8   xta     ws
            6   utm     2
                jmp     cltws
                jmp     errint
                jmp     errint
;--------------------
tiuw:           utc     -1
            8   atx     ws + 1
            6   utm     1
                jmp     cltws
                jmp     errint
                jmp     errint
;--------------------
tilw:       8   atx     ws
            6   vlm     cltws
                jmp     errint
                jmp     errint
;-------------------
tirw:       6   utm     -1
            8   atx     ws
            6   utm     2
                jmp     cltws
                jmp     errint
                jmp     errint
;-----------------
tirh:       8   hta     ws<<1
            6   utm     1
                extf    64 - 32
                jmp     cltws
;-----------------
tiwh:       6   utm     -1
            8   ath     ws << 1
            6   utm     2
                jmp     cltws
;----------------
tirq:       8   qta     ws << 2
            6   utm     1
                extf    64 - 16
                jmp     cltws
;----------------
tiwq:       6   utm     -1
            8   atq     ws << 2
            6   utm     2
                jmp     cltws
;----------------
tirb:       9   vtmb    ws
            9   utc     13
            8   bta     -13
            6   utm     1
                extf    64 - 8
                jmp     cltws
;-----------------
tiwb:       6   utm     -1
            9   vtmb    ws
            9   utc     13
            8   atb     -13
            6   utm     2
                jmp     cltws
;----------------
tirf:       9   vtmf    ws
            9   utc     13
            8   fta     -13
            6   utm     1
                extf    64 - 1
                jmp     cltws
;----------------
tiwf:       6   utm     -1
            9   vtmf    ws
            9   utc     13
            8   atf     -13
            6   utm     2
                jmp     cltws
;-----------------
tirs1:      15  vtm     ws + 1
                stx     ws + 10
            6   vlm     cltws
                jmp     errint
;-----------------
tirs2:      15  vtm     ws + 1
            6   utm     1
            15  xta
                jmp     cltws
;-----------------
tirs3:      15  vtm     ws + 1
                uta
                sti     14
            6   vlm     cltws
;-----------------
tirs4:      15  vtm     ws + 1
            15  wtc
            6   vtm
            6   vlm     cltws
;-----------------
tirs5:      9   vtmh    ws + 10
            15  vtm     ws + 1
            9   sth
            6   vlm     cltws
;-----------------
tirs6:      9   vtmb    ws + 10
            15  vtm     ws + 1
            9   stb     3
            6   vlm     cltws
;-----------------
tiws1:      15  atx
            6   vlm     cltws1
tiws2:          xts     ful
            6   vlm     cltws1
tiws5:      9   vtmh    ful
            9   hts     1
            6   utm     1
                jmp     cltws1
tiws6:      9   vtmb    ws + 10
            6   utm     -1
            9   bts     3
                extf    64 - 8
            6   utm     2
                jmp     cltws1
tiws3:      6   utm     1
                uts     -1
cltws1:     15  vrm     cltws
                jmp     errint
;-----------------
;
cltws:      6   jmne    errint          ; ош.ппк
            12  vjm     contr2
                uta     errint
            n   atx     adr - 1         ; восстановление
                xta     con_in
                jane    anal            ; был ввод
            4   vlm     ltws
eltws:      13  vtm     pinter
                jmp     newtesti
;
; **************************
; * Страничные прерывания: *
; **************************
;
; Ячейка "ws" последовательно приписывается к
; разным мат.страницам.  Затем туда тыкаемся в
; различных режимах и проверяем, что прерывались
; только по делу и что не портили регистров.
; В самой "ws" находится команда возврата.
;
codws:      15  vtm
            6   jmp
;
conex:      12  mtj     14              ; выход по и12
            12  vjm     contr2
;
preambul:   14  mtj     12              ; выход по и14
            n   jmp     * - @0e
:           3   uta     @3fe            ; защ.по N процесса
                jmp     preamb
:           3   uta     @3fe            ;    ---"---
                jmp     preamb
:           3   uta     @1ff            ; защ.по обращ.
                jmp     preamb
:           3   uta     @2ff            ; защ.по записи
;
preamb:     2   wmod    @400            ; уст. РП/РЗ
                atx     ws+1            ; "ждем прерывания"
                xty     ws+7            ; РМР
                xta     ws+6            ; сумматор
            7   mtj     15
            7   mtj     8
                clrr    @f4604          ; снять блокировки
            12  jmp                     ; готовы к дерганью
;
; разнообразное дерганье по чтению:
;
readws:     6   vtm
            14  vjm     preambul        ; выход по и11
            7   xta
            12  vjm     conex
                utc     -1
            7   tta     1
            12  vjm     conex
            15  utm     1
                stx
            12  vjm     conex
            15  utm     1
                sti
            12  vjm     conex
            15  utm     1
            15  xta
            12  vjm     conex
                uta     -1
            7   aax
            12  vjm     conex
                uta
            7   aox
            12  vjm     conex
            15  utm     1
                sth     ws<<1 + 20
            12  vjm     conex
            8   msn     1024 - 1
            8   hta     1
            7   xta
            12  vjm     conex
            15  utm     1
                stq     ws<<2 + 40
            12  vjm     conex
            8   msn     1024 - 2
            8   qta     3
            7   xta
            12  vjm     conex
            15  utm     1
            9   vtmb    ws + 10
            9   stb
            12  vjm     conex
            8   msn     1024 - 3
            8   bta     7
            7   xta
            12  vjm     conex
            15  utm     1
            9   vtmf    ws + 10
            9   stf
            12  vjm     conex
            8   msn     1024 - 6
            8   fta     63
            7   xta
            12  vjm     conex
            7   wtc
            12  vtm
            11  mtj     12
                jmp     contr2          ; конец списка
;
; разнообразное дерганье по записи:
;
writws:     6   vtm
            14  vjm     preambul        ; выход по и11
            7   atx
            12  vjm     conex
            7   ttx
            12  vjm     conex
                utc     -1
                xts     codws+1
            15  utm     -1
            12  vjm     conex
                utc     1
            15  atx     -1
            15  utm     -1
            12  vjm     conex
                uts
            15  utm     -1
            7   xta
            12  vjm     conex
            8   msn     1024-6
            8   atf     63
            12  vjm     conex
            8   msn     1024-3
            8   atb     7
            12  vjm     conex
            8   msn     1024-2
            8   atq     3
            12  vjm     conex
            8   msn     1024-1
            8   ath     1
            11  mtj     12
                jmp     contr2          ; конец списка
;
; ЦИКЛ ПО МАТ. ЛИСТАМ:
;
pinter:         xta     bltest + @3f
                jane    tprogi
            2   vtm     1023
                rmod    ws>>10 & @3ff + @400
                aou     @3ff
                atx     ws + 9
                aau     @ffc00
                ati     3               ; эталон приписки
                setr    @0c17f
                uty     1
                ytx     ws + 7
                xta     codws
                atx     ws + 6
                ttx     ws              ; ***
                uta     picontr         ; перехваты:
                atx     adr + 14        ; чуж.рп (чт/зп)
                atx     adr + 15        ; чуж.РП (вкс)
                atx     adr + 16        ; защ.стр.по обращ.
                atx     adr + 17        ; защ.стр.по записи
                atx     adr + 7         ; отр.N стр (вкс)
                atx     adr + 8         ; отр.N стр (чт/зп)
;
tpi:        2   mtj     12
                ita     2
            12  utm     -main_pag
            12  jmlt    noown
            12  utm     -4              ; себя
            12  jmlt    etpi            ; не тронем !
            12  utm     main_pag + 4 - @3c0
            12  jmeq    etpi            ; пп-лист
noown:          asn     1024 - 10
                extf    64 - 20
                aou     ws & @3ff
                ati     7               ; тек.мат.адрес
                aeu     ws
                jaeq    etpi            ; этот нельзя!
            2   rmod    @400
                atx     oldrp           ; старая приписка
;
; вначале исследуем РП на пригодность
;
            8   vtm     -20             ; разряды
            9   vtm     -1              ; бег."0" или "1"
l1rp:       8   nta     64 - 1
                aei     9
            2   wmod    @400
                aax     =h0000 0000 000f ffff
                ati     10
                xta     chess1
            2   rmod    @400
                ati     11
                aei     10
                jaeq    l2rp
            15  vtm     mst
                xta     ="bad regi"
            2   uts     @400
            14  vjm     dhex8
                aax     =h0000 0000 00ff ffff
                aox     =z"ster:"
                its     10
            14  vjm     dhex8
                aax     =h0000 00ff ffff ffff
                aox     =z" w:"
                its     11
            14  vjm     dhex8
                aax     =h0000 00ff ffff ffff
                aox     =z" r:"
                uts     @0a0d
                asn     @400 - 32
                uts     mst
            5   vjm     output
            15  vtm     mst
                jmp     repri
l2rp:       9   vlm     l1rp
            9   vtm     -1
            8   vlm     l1rp
            15  vtm     mst
;
; 10 - чужой РП при выборке команды
;
            n   vtm     @10
            14  vjm     preambul        ; портим n проц.
            7   utc
            6   vjm                     ; должно рвануть
            7   mtj     15
            12  vjm     conex
                setr    @8000           ; а с БПНП - нет
            7   utc
            6   vjm
                xta     ws + 1
                jaeq    errint          ; увы, рвануло
            15  jmne    error           ; не попали в "ws"
;
            3   uta     @ff             ; уст.защ.по обращ.
            12  vjm     preamb          ; при выборке
            7   utc                     ; команд она не
            6   vjm                     ; прерывает
                xta     ws + 1
                jaeq    errint          ; увы, это случилось
            15  jmne    errint          ; не туда попали
;
; 0f - чужой РП при обращении к операнду
;
            n   vtm     @0f
            6   vtm
            14  vjm     preambul
            7   xta                     ; должно рвануть
            12  vjm     conex
                setr    @8000
            7   xta                     ; а с БПНП - нет
                xta     ws + 1
                jaeq    errint          ; увы, рвануло
            11  vjm     readws
            11  vjm     writws
;
; 12 - защита страницы по записи:
;
            n   vtm     @12
            14  vjm     preambul
            7   atx                     ; должно рвануть
            12  vjm     conex
                setr    @1000
            7   atx                     ; а с БЗЗ - нет!
            7   utc
            6   vjm                     ; и вып. можно
                xta     ws + 1
                jaeq    errint          ; увы, рвануло
            15  jmne    errint
            14  vjm     preambul
            7   utc                     ; а это все
            6   vjm                     ; вообще без БЗЗ
            15  jmne    errint
            6   vtm
            7   mtj     15
            7   xta                     ;
            7   tta
            15  utm     1
                stx
            15  utm     1
                sti
            15  utm     1
            15  xta
            15  utm     1
                stq     ws<<2 + 40
                xta     ws + 1
                jaeq    errint          ; где-то рвануло
            11  vjm     writws
;
; 11 - защита страницы по обращению
;
            n   vtm     @11
            14  vjm     preambul
            7   xta                     ; должно рвануть
            12  vjm     conex
                setr    @2000
            7   xta                     ; а с БЗО - нет!
            7   utc
            6   vjm
            15  jmne    errint
                xta     ws + 1
                jaeq    errint          ; увы, рвануло
            14  vjm     preambul
            7   utc
            6   vjm                     ; а как без БЗО?
            15  jmne    errint
                xta     ws + 1
                jaeq    errint          ; - нехорошо
            11  vjm     readws
            11  vjm     writws
            7   jmge    repri
;
; 8, 9 - отрицательный номер страницы:
;
            n   vtm     9
                rmod    @1c15
                ati     10              ; старый таймер
                uta     quant
                wmod    @1c15
            3   uta     @3ff
            12  vjm     preamb
:               clrr    @fbfff          ; снять роа
            7   xta
            12  vjm     contr2
;
            3   uta     @ff
            12  vjm     preamb
:               clrr    @fbfff
            15  atx
            15  utm     -1
            12  vjm     contr2
;
            n   vtm     8
            6   vtm     rws
            3   uta     @ff
            12  vjm     preamb
:               clrr    @fbfff
            7   jmp
rws:        12  vjm     contr3
                ita     10              ; восст.
                wmod    @1c15           ; таймера
;
; КОНЕЦ ЦИКЛА СТРАНИЦ:
;
repri:          xta     oldrp
            2   wmod    @400            ; восст.приписки
etpi:           wtc     nexpag
            2   utm                     ; шаг по РП
                xta     con_in
                jane    anal            ; был ввод
            2   jmge    tpi
            13  vjm     newtesti
;
; 5 - программное прерывание
;
tprogi:     n   vtm     5
            n   xta     bltest
                jane    tsem
                uta     contrext
            n   atx     adr - 1
            2   vtm     63
;
tp1f:           xta     ful
            2   aen
                atx     ws + 6
                atx     ws + 7
                atx     ws + 1
                aex
            15  vtm
                wmod    @1c13           ; уст.прог.прер.
            12  vjm     contr3          ;
                xta     mircopy
                aan     64 - 41
                jaeq    errint          ; нет бита в грп
                rmod    @1802
                aan     64 - 41
                jane    errint          ; не погасился
                atx     mircopy
            2   vrm     tp1f
            13  vjm     newtesti
;
; 4в - семафорное чтение (SEMR)
;
tsem:       n   vtm     @4b
            n   xta     bltest
                jane    newfin
                rmod    @1818
                ati     8               ; РНГ
                rmod    @1819
                ati     3               ; РНП
            2   vtm     255
ltsem:          uta                     ; чистим
                atx     ws              ; семафор
                setr    @80
                ita     2               ; изобразим
            8   wmod    @1e             ; из себя
                wmod    @1819           ; чужой процесс
                aei     3
                clrr    @fff7f
                ati     14
                xta     ful
                semr    ws              ; он лезет в семафор
:               jcry    * + 1           ; есть захват
                jmp     error
:               aex     ful
                jane    error           ; портит сумматор
                setr    @80
                ita     3
            8   wmod    @1e
                wmod    @1819
                clrr    @fff7f
                xta     ful
:               semr    ws              ; а теперь - мы
                jcry    * + 2           ; - дают!!!
:           14  jmeq    error
                jmp     * + 2
:           14  jmne    error
:               aex     ful
                jane    error
                semw    ws              ; попытка отказа
                jane    error           ; порчен сумматор
:               xta     ws
                jaeq    * + 2
            14  jmeq    error           ; нет отказа от своего
                jmp     eltsem
:           14  jmne    error           ; был отказ от чужого
eltsem:     2   vrm     ltsem
            13  vjm     newtest
;
;
newfin:
                uta     quant
                wmod    @1c15           ; малый таймер
;
                xta     npass
                arx     =h0001 0000 0000 0000
                aax     =hffff 0000 0000 0000
                atx     npass           ; конец раунда
                aax     cmdiv
                jane    tbegin          ; делитель
                uta     -1
                wmod    @1c15           ; большой таймер
;
            1   vtm     free_с - begin - 2
                setr    @3178
compare:    1   xta     begin
            1   aex     begin + @4000
                jaeq    есомр
            15  vtm     mst
                xta     ="uncomp:"
            1   xts     begin
                asn     @400 + 32
            14  vjm     dhex8
            1   xts     begin
            14  vjm     dhex8
                xts     =" doubl: "
            1   xts     begin + @4000
                asn     @400 + 32
            14  vjm     dhex8
            1   xts     begin + @4000
            14  vjm     dhex8
                xts     ="   adr: "
                its     1
            14  vjm     dhex8
                asn     @400 - 24
                uts     mst
            5   vtm     input
            13  vjm     output
                uts
                stx     con_in
                asn     @400 + 56
                aeu     @31             ; "1"
                jaeq    dubl1
                aeu     3               ; "2"
                jaeq    dubl2
                aeu     @74             ; "f"
                jane    есомр
:           1   tta     begin
            1   ttx     begin + @4000
            1   vrm     * - 1
                jmp     есомр
dubl2:      1   tta     begin
            1   ttx     begin + @4000
                jmp     есомр
dubl1:      1   tta     begin + @4000
            1   ttx     begin
есомр:      1   vrm     compare
;
; чтение всей памяти:
;
            7   vtm     1023 - 64
                rmod    @401
                atx     oldrp
lrmem:      6   vtmf    mscale
            7   utc
            6   fta
                jaeq    elrmem
                ita     7
                asn     @400 - 10
                aou     @3ff
                wmod    @401            ; приписка
                setr    @178
            2   vtm     1023
;
; проверка БОБР, БИЗМ
;
                uta
            7   wmod    @800
            5   vtm     2
                xta     @7ff
            7   rmod    @800
                ati     11
                aei     5
                jane    bobism
            7   wmod    @800
            5   vtm     6
                tta     @7ff
                ttx     @7ff
            7   rmod    @800
                ati     11
                aei     5
                jaeq    insindr
bobism:     15  vtm     mst
            5   msn     -5
            5   j+m     11
                xta     ="BOBR,BIS"
                its     11
            14  vjm     dhex8
                aau     @ffff
                asn     @400 - 32
                aox     =z"М:'0''0''@0а''@0d'"
                uts     mst
            5   vjm     output
insindr:        xta     sindrom
                ati     4
l2rmem:     2   xta     1024
                xta     sindrom
                aei     4
                jaeq    el2rmem
                aei     4
                ati     4
            15  vtm     mst
                aau     @7f
                ati     3 ; без бита нечета
                xta     ="'@0а''@0d'memory"
                xts     =" adress:"
                its     7
                asn     @400 - 10
                aoi     2
                extf    64 - 20
            14  vjm     dhex8
                xts     ="   error"
                xts     =" in bit "
            14  vtmb    s_num
            3   j+m     14
            14  bts
                asn     @400 - 56
                aux     =h0f0f 0000 0000 0000
                aox     ="00. sind"
                its     4
            14  vjm     dhex8
                aau     @ffff
                asn     @400 - 16
                aox     ="rом='0''0''@0а''@0d'"
                uts
                uts     mst
            5   vjm     output
                xta     sindrom
                ati     4
el2rmem:    2   vrm     l2rmem
                clrr    @ffe87
elrmem:     7   vrm     lrmem
                xta     oldrp
                wmod    @401
                jmp     tbegin          ; на начало теста
;
; ПОДПРОГРАММЫ:
; =============
;
cout:           wmod    @1c19 ; сброс кэша
            5   jmp
;
снм3:           ita     3
                aex     =1
снасс:          jane    error
;;                ati     2
;;            2   jmne    error
;;                asn     1024+32
;;                ati     2
;;            2   jmne    error
            13  jmp
;
setoper:        ati     2
                ath     ws << 1
                atx     ws + 1
            13  jmp
multa4:     4   jmp     * + 1
:           2   a*u
            13  jmp
:               a*i     2
            13  jmp
:               a*l     ws + 1
            13  jmp
:               a*h     ws << 1
            13  jmp
divta5:     5   jmp     * + 1
:           2   a/u
            13  jmp
:               a/i     2
            13  jmp
:               a/l     ws + 1
            13  jmp
:               a/h     ws << 1
            13  jmp
;
dhex8:          asn     @400 - 32
                aux     =h0f0f0f0f0f0f0f0f
            15  atx
                arx     =h0606060606060606
                aax     =h1010101010101010
                asn     @400 + 2        ; 04
            15  atx
                asn     @400 + 1        ; 06
            15  aox     -1
                asn     @400 + 1
            15  aox                     ; 07
            15  arx
                arx     ="00000000"
            14  jmp
;
chst2:      15  utm     -ws
            15  jmne    error
            2   utm     -1
            2   jmne    error
            3   utm     1
            3   jmne    error
            4   jmne    error
            5   jmne    error
            6   utm     -1
            6   jmne    error
            7   utm     1
            7   jmne    error
            13  jmp
;
chstak:
            15  jmne    error
                xta     ws
                ati     2
            2   jmne    error
                asn     1024 + 32
                ati     2
            2   jmne    error
                xta     ws + 2
                ati     2
            2   jmne    error
                asn     1024 + 32
                ati     2
            2   jmne    error
                xta     ws + 1
                ati     2
                asn     1024 + 32
                ati     3
            2   utm     1
            2   jmne    error
            3   utm     1
            3   jmne    error
                xta     =hffff ffff 0000 0001
                atx     ws
                atx     ws + 1
                atx     ws + 2
            13  jmp
;
; Дуриком получился экстракод
; и перескочили в резервную группу.
; срочно вертаемся назад!!!
;
extr:           uta     * + 3
                wmod    @3b             ; новый СчАС
                ita     13              ; а это - старый
                ret
; вернулись вот сюда
:               atx
:               atx
:               ati     3
            2   vtm
            4   vtm     @41
                uta
                atx     er6
                jmp     ругань
;
                end
