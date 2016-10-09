#!/usr/bin/python
#
# Translate Micro-BESM microcode sources.
# Use defines from JSON file, as compiled by mcasm-define.py script.
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
flist = {}                      # Valid field values
check = []                      # Semantic checks
macro = {}                      # Macro operations
prog_name = ""                  # Current routine
label_defined = []              # Labels defined in the current routine
label_external = []             # External labels for the current routine
code = []

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

def load_defines(filename):
    global field, const, equ
    try:
        file = open(filename, 'r')
        field, const, equ = json.load(file)
        file.close()
    except:
        print "Fatal error: Cannot load file '" + filename + "'"
        sys.exit(1)

    print "Defines loaded from file '"+filename+"'"
    print "Total %d fields, %d constants, %d equivalences" % \
        (len(field), len(const), len(equ))
    #print "Fields:", field
    #print "Constants:", const
    #print "Equivalences:", equ

#
# Process FLIST instruction.
#
def do_flist(op):
    if len(op) < 2 or op[0] != "FLIST":
        return op

    # Store a list of valid field values.
    name, value = op[1].split('=')
    value = [value] + op[2:]
    flist[name] = value
    #print name, "=", flist[name]
    return ''

#
# Process CHECK instruction.
#
def do_check(op):
    if len(op) < 2 or op[0] != "CHECK":
        return op

    # Store a semantic check.
    value = op[1:]
    check.append(value)
    #print "Check", value
    return ''

#
# Process MACRO instruction.
#
def do_macro(op):
    if len(op) < 3 or op[0] != "MACRO":
        return op

    # Store a list of valid field values.
    name = op[1]
    value = op[2:]
    macro[name] = value
    #print name, "=", macro[name]
    return ''

#
# Define a label.
#
def label_define(name, offset):
    global label_defined
    #print "--- Label", name
    label_defined.append([name, offset])

#
# Declare an external label.
#
def label_ref(name):
    global label_external
    label_external.extend(name)

#
# Process a microinstruction.
#
def do_instruction(op):
    name = op[0]
    try:
        idx = flist['SQI'].index(name)
    except:
        # Probably a label. Try next field.
        try:
            idx = flist['SQI'].index(op[1])
        except:
            print "Fatal error: Unknown instruction", op
            sys.exit(1)

        label_define(name, len(code))
        name = op[1]
        op = op[1:]
    #TODO
    #print "--- Compile", op
    code.append(idx)

#
# Process the list of routines.
# Every routine starts with PROG and ends with END.
#
def translate(a):
    global prog_name, label_defined, label_external, code
    for op in a:
        if op == '':
            continue

        if op[0] == "END":
            #print "--- Done", prog_name
            write_results()
            label_defined = []
            label_external = []
            code = []
            offset = 0
            continue

        if len(op) > 1 and op[1] == "PROG":
            prog_name = op[0]
            #print "--- Start", prog_name
            label_define(prog_name, 0)
            continue

        if op[0] == "EXTERN" or op[0] == "EXTERNAL":
            label_ref(op[1:])
            continue

        if len(op) > 1 and op[1] == "ENTRY":
            label_define(op[0], len(code))
            continue

        # Regular microinstruction
        do_instruction(op)

#
# Write the current routine to a separate JSON file.
#
def write_results():
    filename = prog_name + ".json"
    file = open(filename,'w')
    json.dump([label_defined, label_external, code], file)
    file.close()
    print "%s: Total %d defines, %d externals, %d instructions" % \
        (prog_name, len(label_defined), len(label_external), len(code))
    return

if __name__ == "__main__":
    main(sys.argv[1])
