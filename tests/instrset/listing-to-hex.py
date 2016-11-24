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

# Обрабатываем файл
f = open(sys.argv[1])
print_flag = 0
for line in f.readlines():
    line = line.strip()

    if line == "---SТАRТ---":
        print_flag = 1
        continue
    elif line == "---ЕND---":
        print_flag = 0

    if print_flag:
        print line
