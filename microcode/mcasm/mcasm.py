#!/usr/bin/python
#
# Translate Micro-BESM microcode sources into binary files.
#
from readsrc import read_sources
import sys, json

# Check parameters.
if len(sys.argv) != 2:
    print "Usage: mcasm file.src"
    sys.exit(1)

field = {}                      # Field declarations
const = {}                      # Constants
equ = {}                        # Equivalences

#
# Process the input file.
#
def main(filename):
    load_defines("define.json")
    a = read_sources(filename)
    a = map(do_flist, a)
    a = map(do_check, a)
    a = map(do_macro, a)
    translate(a)
    write_results()

def load_defines(filename):
    try:
        file = open(filename, 'r')
        field, const, equ = json.load(file)
        file.close()
    except:
        print "Fatal error: Cannot load file '" + filename + "'"
        sys.exit(1)

    #print "Defines loaded from file '"+filename+"'"
    #print "Total %d fields, %d constants, %d equivalences" % \
    #    (len(field), len(const), len(equ))
    #print "Fields:", field
    #print "Constants:", const
    #print "Equivalences:", equ

#
# Process FLIST instruction.
#
def do_flist(op):
    #TODO
    return op

#
# Process CHECK instruction.
#
def do_check(op):
    #TODO
    return op

#
# Process MACRO instruction.
#
def do_macro(op):
    #TODO
    return op

def translate(a):
    #TODO
    print "--- Unknown instructions:"
    for s in a:
        if s: print s

def write_results():
    #name = filename + ".hack"
    #file = open(name,'w')
    #for i in a:
    #    file.write(i+"\n")
    #file.close()
    #TODO
    return

if __name__ == "__main__":
    main(sys.argv[1])
