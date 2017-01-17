#!/usr/bin/python
# -*- encoding: utf-8 -*-
#
# Convert dispak input package into test.hex file.
# Copyright (C) 2017 Serge Vakulenko
#
import sys, string

if len(sys.argv) != 2:
    print "Usage: b6-to-hex input.b6"
    sys.exit (1)

#
# Initial physical address
#
paddr = 0x1001

#
# Memory tags
#
itag = 0x03     # BESM-6 instruction
dtag = 0x02     # BESM-6 data

def print_word(addr, tag, lh, rh):
    # Arrange a word in besm6 format.
    w = rh << 12
    w += (lh & 0x7fffff) << 36
    if lh >> 23 != 0:
        w += 1 << 63
    else:
        w += 0xF << 59

    print "%05x %02x %04x_%04x_%04x_%04x" % (addr, tag,
        w>>48&0xffff, w>>32&0xffff, w>>16&0xffff, w&0xffff)

#
# Build instruction opcode.
#
def instruction(r, op, a):
    r = int(r, 8)
    a = int(a, 8)
    if len(op) < 3:
        # Long address instruction
        op = int(op, 8)
        #print "%02o %02o %05o" % (r, op, a)
        return (r << 20) + (op << 15) + a;
    else:
        # Short address instruction
        op = int(op, 8)
        #print "%02o %03o %04o" % (r, op, a)
        return (r << 20) + (op << 12) + a;

#
# Convert line from cyrillics to latin.
#
def parse(line):
    global paddr
    word = line.split()
    #print word

    if word[0] == "шифр":
        return

    if word[0] == "ЕКОНЕЦ":
        return

    if word[0] == "K":
        if len(word) != 7:
            print >> sys.stderr, "*** Wrong line:", line
            sys.exit (1)

        lh = instruction(word[1], word[2], word[3])
        rh = instruction(word[4], word[5], word[6])
        print_word(paddr, itag, lh, rh)
        paddr += 1
        return

    if word[0] == "C":
        if len(word) != 5:
            print >> sys.stderr, "*** Wrong line:", line
            sys.exit (1)

        lh = int(word[1], 8) << 12 | int(word[2], 8)
        rh = int(word[3], 8) << 12 | int(word[4], 8)
        print_word(paddr, dtag, lh, rh)
        paddr += 1
        return

    print >> sys.stderr, "*** Unrecognized line:", line
    sys.exit (1)

#
# Process the input file.
#
f = open(sys.argv[1])
for line in f.readlines():
    line = line.strip()

    if len(line) <= 0:
        continue

    parse(line)
