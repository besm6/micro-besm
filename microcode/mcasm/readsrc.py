# -*- encoding: utf-8 -*-
#
# Read sources of Micro-BESM microcode.
#
import re

#
# Process an input line;
# strip out comments and monitor instructions.
# Replace 'PROM:' pseudo-comment with PROM instruction.
#
def remove_comments(s):
    if s[0] == '*':
        return ''
    if s[0:6] == ";PROM:":
        return s[1:]
    idx = s.find(";")
    if idx >= 0:
        s = s[:idx]
    return s
#
# Replace cyrillic letters with latin.
#
def replace_char(c):
    if c == u"А": return "A"
    if c == u"В": return "B"
    if c == u"Е": return "E"
    if c == u"К": return "K"
    if c == u"М": return "M"
    if c == u"Н": return "H"
    if c == u"О": return "O"
    if c == u"Р": return "P"
    if c == u"С": return "C"
    if c == u"Т": return "T"
    if c == u"У": return "Y"
    if c == u"Х": return "X"
    return c

#
# Process an input line;
# replace cyrillic letters with latin.
#
def convert_encoding(s):
    s = s.strip()
    s = unicode(s, "utf-8")
    s = ''.join(map(replace_char, s))
    s = s.encode("utf-8")
    return s

#
# Join continuation lines
#
def join_continuations(a):
    i = 0
    while i < len(a):
        if i>0 and a[i][0] == ">":
            a[i-1].extend(a[i][1:])
            del a[i]
        elif a[i][0] == "FLIST" and a[i][-1] == '':
            del a[i][-1]
            a[i].extend(a[i+1])
            del a[i+1]
        else:
            i += 1
    return a

#
# Read the contents of the input file.
# Remove comments.
#
def read_sources(filename):
    file = open(filename)
    a = file.readlines()

    # Remove comments, replace PROM pseudo-comment
    a = map(remove_comments, a)

    # Convert encoding, strip white space.
    a = map(convert_encoding, a)

    # Remove empty lines.
    a = filter(lambda x : x != '', a)

    # Split instruction lines.
    a = [ re.split("[: ,]+", i) for i in [ x for x in a ] ]

    # Join continuation lines
    a = join_continuations(a)
    return a
