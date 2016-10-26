#!/usr/bin/python
# -*- encoding: utf-8 -*-
#
# Link a set of Micro-BESM microcode object files into a PROM image.
#
from readsrc import read_sources
import sys, json

# Check parameters.
if len(sys.argv) < 3:
    print "Usage: mclink loadcom.src file.json..."
    sys.exit(1)

library = []                    # List of input object files
code = []                       # Linked result
symtab = {}                     # Defined symbols
undefined = []                  # List of undefined symbols

def main(filenames):
    # Read link script.
    if filenames[0][:2] == "-p":
        # Single prog name
        script = [["EXTERNAL", filenames[0][2:]]]
    else:
        script = read_sources(filenames[0])

    # Load object files.
    global library
    for name in filenames[1:]:
        try:
            file = open(name, 'r')
            code = json.load(file)
            file.close()
            library.append(code)
        except:
            print "Fatal error: Cannot load file '" + name + "'"
            sys.exit(1)

    # Process the link script.
    for op in script:
        if op == '':
            continue
        if len(op)>1 and op[1] == "PROG":
            continue
        if op[0] == "END":
            continue
        if op[0] == "EXTERNAL":
            for name in op[1:]:
                # Link the symbol.
                if not name in symtab:
                    #print "--- Link", name
                    obj = find_object(name)
                    link(obj)
            continue
        print "Fatal error: Unknown instruction", op
        sys.exit(1)

    resolve()
    relocate()
    annotate()
    write_microcode("microcode.out")
    write_optab()

#
# Main linker loop: resolve all undefined symbols,
# adding object files one by one to the resulting image.
#
def resolve():
    while len(undefined) > 0:
        name = undefined[0]
        del undefined[0]
        #print "--- Link", name
        obj = find_object(name)
        link(obj)

#
# Find object that defines a given name.
#
def find_object(name):
    for i in range(len(library)):
        obj = library[i]
        for s in obj[0]:
            if name == s[0]:
                del library[i]
                return obj
    print "Fatal error: Undefined symbol", name
    sys.exit(1)

#
# Link an object file.
#
def link(obj):
    base = len(code)
    # Relocate symbols
    for s in obj[0]:
        name = s[0]
        value = s[1] + base
        #print "--- Relocate", name, "=", value
        if name in symtab.keys():
            print "Fatal error:", name, "redefined"
            #sys.exit(1)
        symtab[name] = value
        delete_undefined(name)

    # Merge undefined externals
    for name in obj[1]:
        if not name in symtab.keys() and not name in undefined:
            #print "--- Merge", name
            undefined.append(name)

    # Copy the code
    for s in obj[2]:
        #print "--- Code", s
        op = s[0]
        if len(s) > 1:
            arg = s[1]
        else:
            arg = ''
        code.append([s[0], arg])

#
# Relocate the code.
#
def relocate():
    global code
    relocated = []
    for s in code:
        #print "--- Relocate", s
        opcode = s[0]
        name = s[1]
        if name:
            if not name in symtab:
                print "Fatal error: Relocation needs undefined symbol", name
                sys.exit(1)
            opcode |= symtab[name] << 96
            s[0] = opcode
        relocated.append(s)
    code = relocated

#
# Delete a name from undefined list.
#
def delete_undefined(name):
    try:
        i = undefined.index(name)
        del undefined[i]
    except:
        return

#
# Add labels to the code.
#
def annotate():
    for name in symtab.keys():
        addr = symtab[name]
        if len(code[addr]) < 2:
            code[addr].append('')
        code[addr].append(name)

#
# Find the nearest label
#
def find_label(addr):
    min_offset = 999999
    min_name = ""
    for name in symtab.keys():
        if name[0] == '@':
            # Ignore PROM references
            continue

        value = symtab[name]
        if value > addr or name[:3] == "END":
            continue

        if value == addr:
            # Exact match
            return name

        if addr-value < min_offset:
            min_offset = addr - value
            min_name = name
    return "%s + %u" % (min_name, min_offset)

#
# Write the resulting microcode PROM contents.
#
def write_microcode(filename):
    file = open(filename, 'w')
    offset = 0
    for s in code:
        op = s[0]
        ref = s[1]
        if len(s) > 2:
            # Print label(s)
            for label in s[2:]:
                if label[0] != '@':
                    file.write("// %s\n" % label.encode("utf-8"))
        file.write("%8d: 112'h%028x," % (offset, op))
        if ref:
            file.write("    // a= " + ref)
        file.write("\n")
        offset += 1
    file.close()
    print "%s: %d words" % (filename, len(code))

#
# Write the table of opcode addresses.
#
def write_optab():
    # Build a list of optab names
    optab = []
    rwiotab = []
    grouptab = []
    intrtab = []
    for name in symtab.keys():
        if name[0] == '@':
            index = int(name[1:], 16)
            if index < 0x1000:
                optab.append([index, symtab[name]])
            elif index < 0x1800:
                rwiotab.append([index - 0x1000, symtab[name]])
            elif index < 0x2000:
                grouptab.append([index - 0x1800, symtab[name]])
            else:
                intrtab.append([index - 0x2000, symtab[name]])
    optab.sort()
    rwiotab.sort()
    grouptab.sort()
    intrtab.sort()

    if optab:
        file = open("optab.out", 'w')
        file.write("// ПНА: память начальных адресов машинных инструкций\n")
        for s in optab:
            op = s[0]
            offset = s[1]
            name = find_label(offset)
            file.write("'h%x_%02x: %4d,   // %s\n" % (op >> 8, op & 0xff, offset, name))
        file.close()
        print "Instruction table: %d opcodes" % (len(optab))

    if rwiotab:
        file = open("rwiotab.out", 'w')
        file.write("// ПНА: память начальных адресов операций обмена с пультовым процессором\n")
        for s in rwiotab:
            op = s[0]
            offset = s[1]
            name = find_label(offset)
            file.write("'h%03x: %4d,    // %s\n" % (op, offset, name))
        file.close()
        print "RW/IO table: %d entries" % (len(rwiotab))

    if grouptab:
        file = open("grouptab.out", 'w')
        file.write("// ПНА групп: память начальных адресов для условных операций\n")
        for s in grouptab:
            op = s[0]
            offset = s[1]
            name = find_label(offset)
            file.write("'h%02x: %4d,     // %s\n" % (op, offset, name))
        file.close()
        print "Group table: %d entries" % (len(grouptab))

    if intrtab:
        file = open("intrtab.out", 'w')
        file.write("// ПНА прерываний: память начальных адресов для переходов при внешних прерываниях\n")
        for s in intrtab:
            op = s[0]
            offset = s[1]
            name = find_label(offset)
            file.write("'h%02x: %4d,     // %s\n" % (op, offset, name))
        file.close()
        print "Interrupt table: %d entries" % (len(intrtab))

if __name__ == "__main__":
    main(sys.argv[1:])
