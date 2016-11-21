#!/usr/bin/python
#
# Manage JSON database of Micro-BESM opcodes.
#
import sys, json, codecs

# Check parameters.
if len(sys.argv) != 2:
    print "Usage:"
    print "    opcode [option] file.json"
    print "Options:"
    print "    TODO"
    sys.exit(1)

opcode = []                     # List of all opcodes

#
# Process the input file.
#
def main(filename):
    read_data(filename)
    write_results("output.json")

#
# Load opcode[] from JSON file.
#
def read_data(filename):
    global opcode
    try:
        file = open(filename)
        opcode = json.load(file)
        file.close()
    except:
        print "Fatal error: Cannot load file '" + filename + "'"
        sys.exit(1)

    print "Load file '"+filename+"':",
    print "%d opcodes" % len(opcode)
    #print "Opcodes:", opcode

#
# Write the data to another JSON file.
#
def write_results(filename):
    file = codecs.open(filename, 'w', encoding="utf-8")
    json.dump(opcode, file, indent=4, sort_keys=True, ensure_ascii=False)
    file.close()
    print "Write file %s: %d opcodes" % (filename, len(opcode))

if __name__ == "__main__":
    main(sys.argv[1])
