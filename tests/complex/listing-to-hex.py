#!/usr/bin/python
# -*- encoding: utf-8 -*-
#
# Convert hexdump output listing into test.hex file.
# Copyright (C) 2005 Serge Vakulenko <serge@vak.ru>
#
import sys, string

if len(sys.argv) != 2:
    print "Usage: listing-to-hex hexdump.lst"
    sys.exit (1)

#
# Replace cyrillic letters with latin.
#
def replace_char(c):
    if c == u"А": return "A"
    if c == u"В": return "B"
    if c == u"С": return "C"
    if c == u"Е": return "E"
    if c == u"Н": return "H"
    if c == u"К": return "K"
    if c == u"М": return "M"
    if c == u"О": return "O"
    if c == u"Р": return "P"
    if c == u"Т": return "T"
    if c == u"У": return "Y"
    if c == u"Х": return "X"
    return c

#
# Process an input line;
# replace cyrillic letters with latin.
#
def convert_encoding(s):
    s = unicode(s, "utf-8")
    s = ''.join(map(replace_char, s))
    s = s.encode("utf-8")
    return s

#
# Обрабатываем файл
#
f = open(sys.argv[1])
print_flag = 0
for line in f.readlines():
    line = convert_encoding(line.strip())

    if line == "---START---":
        print_flag = 1
        continue
    elif line == "---END---":
        print_flag = 0

    if print_flag:
        print line
