#!/bin/bash

#
# Select: modelsim, xsim, vcs, verilator
#

# Mentor ModelSim Starter Edition from Altera Quartus Prime Lite toolchain.
engine=modelsim

# Xilinx Vivado Simulator (essentially a licensed Cadence IUS)
# from Xilinx Vivado Design Suite HL WebPACK toolchain.
#engine=xsim

# Synopsys VCS.
#engine=vcs

# Verilator (open source: apt install verilator). Note: initest, intrtest,
# sectest, octtest and memtest do not build under Verilator yet -- see
# tests/*/verilator/Makefile for why -- so a full run currently fails on
# the first of those it reaches.
#engine=verilator

#
# Run short tests first.
#
tests="initest intrtest startup sectest octtest memtest complex"

#
# Identify the simulator engine.
#
case $engine in
modelsim)  echo "Use Altera Modelsim";;
xsim)      echo "Use Xilinx Vivado simulator";;
vcs)       echo "Use Synopsys VCS";;
verilator) echo "Use Verilator";;
*)         echo "Unknown simulator: $engine"
           exit 1;;
esac

#
# Delete log files from previous run.
#
rm -f build-*.log run-*.log

#
# Build all tests.
#
for t in $tests
do
    echo "Build $t"
    make -C $t/$engine >& build-$t-$engine.log
    if [ $? != 0 ]; then
        echo "FAIL"
        exit 1
    fi
done

#
# Run all tests.
#
for t in $tests
do
    echo "Run $t"
    make -C $t/$engine run >& run-$t-$engine.log
    grep -q '\*\*\* Test PASS' run-$t-$engine.log
    if [ $? = 0 ]; then
        echo "PASS"
    else
        echo "FAIL"
    fi
done
