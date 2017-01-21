шифр 419999 зс5^
лен 41(2048)^
лен 50(1001)^
лен 60(1002-ЗП)^
лен 61(1003-ЗП)^
eeв1а3
*name МКБ-тесты
*call yesmemory
*perso:50
*call LIBINIT:600000,40,тест
*main MKB/ASS
*execute
;
; Generic test startup for micro-BESM
;
; Copyright (c) 2017 Serge Vakulenko
;
; Permission is hereby granted, free of charge, to any person obtaining a copy
; of this software and associated documentation files (the "Software"), to deal
; in the Software without restriction, including without limitation the rights
; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
; copies of the Software, and to permit persons to whom the Software is
; furnished to do so, subject to the following conditions:
;
; The above copyright notice and this permission notice shall be included in all
; copies or substantial portions of the Software.
;
; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
; SOFTWARE.
;
main_sw:        name    qf

beg_с:          equ     @fff8 0800      ; нач. C-обл.
free_c:         pccb    (0)             ; конец C-обл.

beg_v:          equ     @fffe 0000      ; нач. V-обл.
free_v:         pcb     (0)             ; конец V-обл.

macro50:        equ     @8021a          ; экстракод 050

;---------------------------------------
                const

;---------------------------------------
                cmd

;---------------------------------------
; Переключатель прерываний
;
interrupts:     hlt     @1               ; Адрес 80800
 :              hlt     @2
 :              hlt     @3
 :              hlt     @4
 :              hlt     @5
 :              hlt     @6
 :              hlt     @7
 :              hlt     @8
 :              hlt     @9
 :              hlt     @10
 :              hlt     @11
 :              hlt     @12
 :              hlt     @13
 :              hlt     @14
 :              hlt     @15
 :              hlt     @16
 :              hlt     @17
 :              hlt     @18
 :              hlt     @19
 :              hlt     @20
 :              hlt     @21
 :              hlt     @22
 :              hlt     @23
 :              hlt     @24
 :              hlt     @25
 :              hlt     @26
 :              hlt     @27
 :              hlt     @28
 :              hlt     @29
 :              hlt     @30
 :              hlt     @31
 :              hlt     @32
 :              hlt     @33
 :              hlt     @34
 :              hlt     @35
 :              hlt     @36
 :              hlt     @37
 :              hlt     @38
 :              hlt     @39
 :              hlt     @40
 :              hlt     @41
 :              hlt     @42
 :              hlt     @43
 :              hlt     @44
 :              hlt     @45
 :              hlt     @46
 :              hlt     @47
 :              hlt     @48
 :              hlt     @49
 :              hlt     @50
 :              hlt     @51
 :              hlt     @52
 :              hlt     @53
 :              hlt     @54
 :              hlt     @55
 :              hlt     @56
 :              hlt     @57
 :              hlt     @58
 :              hlt     @59
 :              hlt     @60
 :              hlt     @61
 :              hlt     @62
 :              hlt     @63
 :              hlt     @64

;---------------------------------------
; Служебные данные
;
s_mem:          atx                     ; 80840 - семафор памяти
                atx

 :              atx                     ; 80841 - версия микрокода
                atx     @a2

 :              atx                     ; 42 - резерв
 :              atx                     ; 43
 :              atx                     ; 44
 :              atx                     ; 45 - дата сборки
 :              atx                     ; 46 - d:\besm6
 :              atx                     ; 47 - \кт<n>.bin
 :              atx                     ; 48
 :              atx                     ; 49
 :              atx                     ; 4a
 :              atx                     ; 4b
 :              atx                     ; 4c
 :              atx                     ; 4d
 :              atx                     ; 4e
 :              atx                     ; 4f

;---------------------------------------
; Экстракоды микро-БЭСМ нового режима
;
extracodes:     hlt     @e0             ; 80850

;---------------------------------------
; Экстракоды старого режима БЭСМ-6
;
 :              jmp     enter50         ; 80851

;---------------------------------------
; Экстракоды ЭЛЬБРУС-Б, команды ЭЛЬБРУС-Б,
; которые редко используются или сложно реализовать.
;
 :              hlt     @e2             ; 80852

;---------------------------------------
; Запрещенные команды, в том числе привилегированные
; в режиме пользователя, а также резервные коды операций.
;
 :              hlt     @e3             ; 80853

;---------------------------------------
; Служебные данные
;
 :              atx                     ; 80854
 :              atx                     ; 55
 :              atx                     ; 56
 :              atx                     ; 57
 :              atx                     ; 58
 :              atx                     ; 59
 :              atx                     ; 5a
 :              atx                     ; 5b
 :              atx                     ; 5c
 :              atx                     ; 5d
 :              atx                     ; 5e
csumm:          atx                     ; 5а - для контрольной
                atx                     ; суммы

;---------------------------------------
; Старт программы
;
test:

; Биты регистра режимов:
; 30 - ППУ:  признак команды передачи управления
; 29 - ППК:  RCB, признак правой команды
; 28 - ПИА:  CB, признак изменения адреса 16 регистром
; 27 - БП:   блокировка приписки
; 26 - БПНП: блокировка проверки номера процесса
; 25 - РОА:  режим отрицательных адресов
; 24 - БЗО:  блокировка защиты страниц по обращению
; 23 - БЗЗ:  блокировка защиты страниц по записи
; 22 - ПОП:  признак останова по прерыванию
; 21 - РШ:   режим пошагового выполнения команд
; 20 - РЭС:  надо ли проверять сумматор и операнд в режиме БЭСМ-6
; 19 - БПТЗ: блокировка проверки тега при записи
; 18 - БВП:  блокировка внешних прерываний
; 17 - БПИНТ: блокировка программной интерпретации тега
; 16 - БЧС:  блокировка реакции на чужой сумматор
; 15 - БПТЧ: блокировка проверки тега при чтении операнда
; 14 - БЧОП: блокировка реакции на чужой операнд
; 13 - РД:   режим диспетчера
; 12 - БППУ: блокировка проверки переполнения поля упрятывания
; 11 - ББЧ:  блокировка выхода числа за диапазон БЭСМ-6

;  E    C    1    F    F
; 1110 1100 0001 1111 1111
;    |   || |||
;   БП   || ||РЭС
;      БЗО| |РШ
;       БЗЗ ПОП
;
                clrr    @ec1ff          ; снимаем БП, БЗО, БЗЗ, ПОП, РШ, РЭС

;  0    C    1    F    F
; 0000 1100 0001 1111 1111
;      ||      | |||| ||||
;   БПНП|   БПТЗ |||| |||ББЧ
;      РОА     БВП||| ||БППУ
;             БПИНТ|| |РД
;                БЧС| БЧОП
;                   БПТЧ
;
                setr    @0c1ff          ; устанавливаем БПНП, РОА, БПТЗ, БВП,
                                        ; БПИНТ, БЧС, БПТЧ, БЧОП, РД, БППУ, ББЧ

                uta     8
                wmod    @1819           ; номер процесса

                rmod    @1818
                ati     2               ; РНГ
                uta     @21
                asn     1024 - 16       ; резервная
                aou     1               ; группа = 1
              2 wmod    @12             ; в РРР

;---------------------------------------
; Приписка физических страниц 4-35, содержащих код приложения,
; на виртуальные страницы 0-31.
;
              1 vtm     31              ; номер вирт.страницы
                uta     35<<10 + @3ff   ; физ.страница и права доступа

:             1 wmod    @400            ; запись в регистр приписки
                a-u     1 << 10
              1 vrm     * - 1           ; цикл по страницам


;---------------------------------------
; Приписка физической страницы 1, содержащей экстракоды элементарных
; функций, на виртуальную страницу 512 (адрес 80000).
;
                uta     1<<10 + @3ff    ; физ.страница и права доступа
                wmod    @600            ; запись в регистр приписки

;---------------------------------------
; Формируем команды возврата из экстракода
; и останова по ошибке экстракода.
;
                tta     ret50
                ttx     macro50 + 1
                tta     fatal50
                ttx     macro50 + 2

;---------------------------------------
; Переход на код теста
;
;;;                jmp     @20e            ; Whetstone
                jmp     @0001           ; тест экстракодов

 ret50:         jmp     retint          ; возврат из экстракода
 fatal50:       hlt     @111            ; авост экстракода

;---------------------------------------
; Вход в экстракод.
; Переключаем приписку 0-й страницы.
;
 enter50:       uta     1<<10 + @3ff    ; физ.страница 1
                wmod    @400            ; вирт.страница 0
                jmp     macro50         ; прыгаем в режим БЭСМ-6

;---------------------------------------
; Возврат из экстракода
; Переключаем приписку 0-й страницы.
;
 retint:        uta     4<<10 + @3ff    ; физ.страница 4
                wmod    @400            ; вирт.страница 0

              8 ijp                     ; TODO

                end
*call DISPLOAD
*end file
``````
еконец
