#!/usr/bin/python
#
# Link a set of Micro-BESM microcode object files into a PROM image.
#
from readsrc import read_sources
import sys, json

# Check parameters.
if len(sys.argv) != 2:
    print "Usage: mclink loadcom.src"
    sys.exit(1)

def main(filename):
    print "*** MCLINK not implemented yet!"

if __name__ == "__main__":
    main(sys.argv[1])
