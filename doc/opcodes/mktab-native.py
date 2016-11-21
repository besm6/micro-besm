#!/usr/bin/python
import sys, json

#
# Load opcode[] from JSON file.
#
filename = "native.json"
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
    opcode = int(op['opcode'], 16)
    try: ext_flag = op['ext_op']
    except: ext_flag = False

    if ext_flag:
        ext_name[opcode] = name
    else:
        op_name[opcode] = name

print "// Main ops:"
for i in range(0,256):
    if i in op_name.keys():
        name = op_name[i]
    else:
        name = "%02x" % i

    print "%d:'%s'," % (i, name),
    if i%8 == 7:
        print

print "// Extended ops:"
for i in range(0,256):
    if i in ext_name.keys():
        name = ext_name[i]
    else:
        name = "3f%02x" % i

    print "%d:'%s'," % (i, name),
    if i%8 == 7:
        print
