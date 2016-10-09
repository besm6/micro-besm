#!/usr/bin/python
#
# Translate the defines section of Micro-BESM microcode sources.
# Save the data in JSON format.
#
from readsrc import read_sources
import sys, json

# Check parameters.
if len(sys.argv) != 2:
    print "Usage: mcasm-define file.src"
    sys.exit(1)

field = {}                      # Field declarations
const = {}                      # Constants
equ = {}                        # Equivalences
const_index = 0                 # ROM index of next constant

#
# Process the input file.
#
def main(filename):
    a = read_sources(filename)
    a = map(do_field, a)
    a = map(do_const, a)
    a = map(do_equ, a)
    translate(a)
    write_results("define.json")

#
# Process FIELD instruction.
#
def do_field(op):
    if len(op) < 2 or op[1] != "FIELD":
        return op

    # Store the field description in the global dictionary.
    name = op[0]
    upper = int(op[2])
    lower = int(op[3])
    try:
        dflt = int(op[4])
    except:
        dflt = 0
    field[name] = {'upper':upper, 'lower':lower, 'default':dflt}
    #print name, field[name]['upper'], field[name]['lower'], field[name]['default']
    return ''

#
# Process CONST instruction.
#
def do_const(op):
    global const_index
    if len(op) < 2 or op[1] != "CONST":
        return op

    # Store the const description in the global dictionary.
    name = op[0]
    value = int(op[2], 16)
    const[name] = {'value':value, 'index':const_index}
    const_index += 1
    #print name, "%x"%const[name]['value'], const[name]['index']
    return ''

#
# Process EQU instruction.
#
def do_equ(op):
    global const_index
    if len(op) < 2 or op[1] != "EQU":
        return op

    # Store the symbol value in the global dictionary.
    name = op[0]
    try:
        if op[2][0] == '$':
            # Hex value
            value = int(op[2][1:], 16)
        else:
            # Decimal value
            value = int(op[2])
    except:
        # Name of constant or another equivalence
        if op[2] in equ.keys():
            value = equ[op[2]]
        else:
            value = const[op[2]]['index']

    equ[name] = value
    #print name, equ[name]
    return ''

#
# Process the body: PROG and END instructions.
#
def translate(a):
    for op in a:
        if op == '':
            continue
        if op[0] == "DEFINE" and op[1] == "PROG":
            print "Instruction width:", op[2]
            print "Constant width:", op[3]
            continue
        if op[0] == "END":
            continue
        print "Fatal error: Unknown instruction", op
        sys.exit(1)

#
# Write the lists of fields, constants and equ to the output file.
#
def write_results(filename):
    #print "Fields:", field
    #print "Constants:", const
    #print "Equivalences:", equ
    file = open(filename, 'w')
    json.dump([field, const, equ], file, indent=4, sort_keys=True)
    #json.dump(const, file)
    #json.dump(equ, file)
    file.close()
    print "Defines saved to file '"+filename+"'"
    print "Total %d fields, %d constants, %d equivalences" % \
        (len(field), len(const), len(equ))

#
# Invoke main routine.
#
if __name__ == "__main__":
    main(sys.argv[1])
