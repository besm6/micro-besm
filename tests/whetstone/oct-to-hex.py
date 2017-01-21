#!/usr/bin/python
# -*- encoding: utf-8 -*-
#
# Convert dispak input package into test.hex file.
# Copyright (C) 2017 Serge Vakulenko
#
import sys, string

if len(sys.argv) != 2:
    print "Usage: oct-to-hex input.lst"
    sys.exit (1)

#
# Initial physical address
#
paddr = 0x1001

#
# Memory tags
#
itag = 0x03     # BESM-6 instruction

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
    global paddr, word_count
    for word in line.split():
        #print word
        word = int(word, 8)

        print_word(paddr+0x400, itag, word >> 24, word & 077777777)
        paddr += 1
        word_count -= 1

#
# Process the input file.
#
start_seen = 0
word_count = 0
f = open(sys.argv[1])
for line in f.readlines():
    line = line.strip()

    if len(line) <= 0:
        continue

    if not start_seen:
        if line == "---SТАRТ---":
            start_seen = 1
        continue

    if start_seen == 1:
        # Read start address
        paddr = int(line, 8)
        #print "Start address: %05o" % paddr
        start_seen = 2
        continue

    if start_seen == 2:
        # Read word count
        word_count = int(line, 8)
        #print "Word count:", word_count
        start_seen = 3
        continue

    parse(line)
    if word_count == 0:
        break
