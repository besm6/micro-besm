#!/usr/bin/python
from tables import *
from helpers import *
import sys
import time

atable, ltable, ctable = {}, {}, {} #initialize global tables
filename = sys.argv[1]

def main():
    a = prepare_file(filename)
    make_ltable(a)
    make_atable(a)
    make_ctable(a)
    results = translate(a)
    write_file(results)

def prepare_file(filename):
    file = open(filename)
    a = file.readlines()
    a = map(filter_line, a) #map remove comments
    a = [ i.strip() for i in [ x for x in a ] ] #remove white space
    a = filter(lambda x : x != '', a) #remove empty elements
    return a

def translate(a):
    f = []
    for i in a:
        if is_a_command(i):
            f.append(atable[i])
        elif is_c_command(i):
            f.append(ctable[i])
    return f

def make_ltable(a):
    x = 0
    for i in a: # add to symbols table
        x += 1
        if is_l_command(i): #find a label, add line number to it
            x -= 1
            ltable[i[1:-1]] = to_b(x) #use binary helper with 0's padding

def make_atable(a):
    start = 16 #start address for symbolic variables
    for i in a: # add to symbols table
        if is_a_command(i): #A_Command
            val = i[1:]
            if try_parse_int(val) is not None:
                atable[i] = to_b(int(val))
            elif val in predef_table.keys(): #not int, variable
                atable[i] = to_b(predef_table[val])
            elif val in ltable.keys():
                atable[i] = ltable[val]
            elif i in atable.keys():
                continue
            else:
                atable[i] = to_b(start)
                start += 1

def make_ctable(a):
    for i in a:
        if is_c_command(i):
            semi = i.find(';')
            equa = i.find('=')

            if equa != -1 and semi != -1: #dest=comp;jump
                dest = i[:equa]
                comp = i[equa+1:semi]
                jump = i[semi+1:]
                abit = set_abit(comp)
                ctable[i] = first + abit + comp_table[comp] + dest_table[dest] + jump_table[jump]

            if equa == -1 and semi != -1: #comp;jump
                comp = i[:semi]
                jump = i[semi+1:]
                abit = set_abit(comp)
                ctable[i] = first + abit + comp_table[comp] + dest_table["null"] + jump_table[jump]

            if equa != -1 and semi == -1: #dest=comp
                dest = i[:equa]
                comp = i[equa+1:]
                abit = set_abit(comp)
                ctable[i] = first + abit + comp_table[comp] + dest_table[dest] + jump_table["null"]

def write_file(a):
    name = filter_line(filename, op=".")
    name = name+".hack"
    file = open(name,'w')
    for i in a:
        file.write(i+"\n")
    file.close()

if __name__ == "__main__":
    #t0 = time.time()
    main()
    #print time.time()-t0
