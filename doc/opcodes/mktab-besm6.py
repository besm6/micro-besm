#!/usr/bin/python
import sys, json

#
# Load opcode[] from JSON file.
#
filename = "besm6.json"
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
# Print table of opcodes.
#
op_name = {}        # instruction name by opcode
ext_name = {}       # extended instruction name by opcode

for op in opcode:
    name = op['name'].encode('ascii').lower()
    opcode = int(op['opcode'], 8)
    try: ext_flag = op['ext_op']
    except: ext_flag = False

    if ext_flag:
        ext_name[opcode] = name
    else:
        op_name[opcode] = name

print "// BESM-6 short address ops:"
for i in range(0,64):
    if i in ext_name.keys():
        name = ext_name[i]
    else:
        name = "*%02o" % i

    print "%d:'%s'," % (i, name),
    if i%8 == 7:
        print

print "// BESM-6 long address ops:"
for i in range(020,040):
    if i in op_name.keys():
        name = op_name[i]
    else:
        name = "%02o" % i

    print "%d:'%s'," % (i-020, name),
    if i%8 == 7:
        print
