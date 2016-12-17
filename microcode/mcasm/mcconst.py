#!/usr/bin/python
#
# Generate contents of constant ROM.
# Use defines from JSON file, as compiled by mcdef.py script.
#
from readsrc import read_sources
import sys, json

# Check parameters.
if len(sys.argv) != 1:
    print "Usage: mcconst.py"
    sys.exit(1)

const = {}                      # Constants
map = {}                        # Index to name

#
# Process the input file.
#
def main():
    global map
    load_defines("define.json")
    for name in const.keys():
        map[const[name]['index']] = name
    write_results("constants.v")

#
# Load field[], const[] and equ[] from file define.json.
#
def load_defines(filename):
    global const
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
# Write the ROM contents to a verilog file.
#
def write_results(filename):
    file = open(filename, 'w')
    for index in sorted(map.keys()):
        name = map[index]
        value = const[name]['value']
        file.write("%8d: 64'h%016x,    // %s\n" % (index, value, name))
    file.close()
    print "Constants: %d words" % len(const)

if __name__ == "__main__":
    main()
