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
default_opcode = 0              # Default opcode when no args
prog_name = ""                  # Current routine
label_defined = []              # Labels defined in the current routine
label_external = []             # External labels for the current routine
code = []                       # Accumulated code of current routine

#
# Process the input file.
#
def main(filename):
    global default_opcode
    load_defines("define.json")
    default_opcode = build_default_opcode()
    #print "Default opcode: %x" % default_opcode
    a = read_sources(filename)
    a = map(do_flist, a)
    a = map(do_check, a)
    a = map(do_macro, a)
    translate(a)

#
# Build a value of default microinstruction code when no parameters present.
#
def build_default_opcode():
    opcode = 0
    for name in field.keys():
        dflt = field[name]['default']
        if dflt != 0:
            lower = field[name]['lower']
            opcode |= dflt << (lower-1)
    return opcode

#
# Load field[], const[] and equ[] from file define.json.
#
def load_defines(filename):
    global field, const, equ
    try:
        file = open(filename, 'r')
        field, const, equ = json.load(file)
        file.close()
    except:
        print "Fatal error: Cannot load file '" + filename + "'"
        sys.exit(1)

    #print "Defines loaded from file '"+filename+"':",
    #print "%d fields, %d constants, %d symbols" % \
    #    (len(field), len(const), len(equ))
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
    if not name in flist['SQI']:
        # Probably a label. Try next field.
        if not op[1] in flist['SQI']:
            print "Fatal error: Unknown instruction", op
            sys.exit(1)

        label_define(name, len(code))
        name = op[1]
        op = op[1:]
    op = op[1:]
    op = expand_macro(op)
    generate_code(name, op)

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
    # Create a safe file name: replace / by %.
    filename = prog_name.replace('/', '%') + ".json"
    file = open(filename,'w')
    json.dump([label_defined, label_external, code], file,
        indent=4, sort_keys=True)
    file.close()
    print "%s: %d symbols, %d externals, %d instructions" % \
        (prog_name, len(label_defined), len(label_external), len(code))
    return

def expand_macro(list):
    i = 0
    while i < len(list):
        elem = list[i]
        if elem[0] == "%" and elem[-1] == "%":
            name = elem.split('%')[1]
            #print "--- Macro", elem, "expand", name
            list.extend(macro[name])
            del list[i]
        else:
            i += 1
    return list

#
# Get value of equ or const.
#
def symbol_value(name):
    if name in equ.keys():
        return equ[name]
    if name in const.keys():
        return const[name]['index']
    return -1

#
# Get value of expression.
#
def get_value(expr):
    try:
        # Integer constant
        value = int(expr)
        return value
    except:
        # Name, or name+int, or name-int.
        pair = expr.split('+')
        if len(pair) > 1:
            offset = int(pair[1])
            return offset + symbol_value(pair[0])
        pair = expr.split('-')
        if len(pair) > 1:
            offset = int(pair[1])
            return -offset + symbol_value(pair[0])
        return symbol_value(expr)

def generate_code(op, args):
    #print "--- Compile", op, args
    #TODO: verify flist and check (someday).
    opcode = default_opcode
    ref = ''
    args.append("SQI=" + op)
    for param in args:
        pair = param.split('=')
        if len(pair) > 1:
            name = pair[0]
            value = get_value(pair[1])
            if value < 0:
                # Must be a local or external symbol
                if name == "A":
                    ref = pair[1]
                else:
                    print "--- Unresolved reference:", name, "=", pair[1]
            lower = field[name]['lower']
            upper = field[name]['upper']
        else:
            name = param
            value = 1
            lower = field[name]['lower']
            upper = field[name]['upper']
            # Treat CI as CI=1 (known issue).
            if upper != lower and name != "CI":
                print "Error: Incorect parameter", name, "in command", \
                    op, "of routine", prog_name + ":",
                print "Multibit field requires assignment operation"
                return
        mask = (1 << (upper-lower+1)) - 1
        opcode &= ~(mask << (lower-1))
        opcode |= value << (lower-1)
    if ref:
        code.append([opcode, ref])
    else:
        code.append([opcode])

if __name__ == "__main__":
    main(sys.argv[1])
