#!/usr/bin/python
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
                    undefined.append(name)
                    resolve()
            continue
        print "Fatal error: Unknown instruction", op
        sys.exit(1)

    relocate()
    write_results("microcode.out")

#
# Main linker loop: resolve all undefined symbols,
# adding object files one by one to the resulting image.
#
def resolve():
    while len(undefined) > 0:
        name = undefined[0]
        del undefined[0]
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
        if not name in symtab.keys():
            #print "--- Merge", name
            undefined.append(name)

    # Copy the code
    for s in obj[2]:
        #print "--- Code", s
        code.append(s)

#
# Relocate the code.
#
def relocate():
    global code
    relocated = []
    for s in code:
        #print "--- Relocate", s
        opcode = s[0]
        if len(s) > 1:
            name = s[1]
            if name in symtab:
                opcode |= symtab[name] << 96
            else:
                print "Fatal error: Relocation needs undefined symbol", name
                sys.exit(1)
        relocated.append(opcode)
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
# Write the resulting PROM contents.
#
def write_results(filename):
    file = open(filename, 'w')
    offset = 0
    for i in code:
        file.write("112'h%028x,      // %d\n" % (i, offset))
        offset += 1
    file.close()
    print "%s: %d words" % (filename, len(code))

if __name__ == "__main__":
    main(sys.argv[1:])
