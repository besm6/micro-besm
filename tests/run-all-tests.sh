#!/bin/bash

#
# Select: modelsim, xsim, vcs
#

# Mentor ModelSim Starter Edition from Altera Quartus Prime Lite toolchain.
engine=modelsim

# Xilinx Vivado Simulator (essentially a licensed Cadence IUS)
# from Xilinx Vivado Design Suite HL WebPACK toolchain.
#engine=xsim

#
# Run short tests first.
#
tests="initest intrtest startup sectest octtest memtest complex"

for t in $tests
do
    echo "Build $t"
    make -C $t/$engine >& build-$t-$engine.log
    if [ $? != 0 ]; then
        echo "Build FAIL"
        exit 1
    fi
done

for t in $tests
do
    echo "Run $t"
    make -C $t/$engine run >& run-$t-$engine.log
    if [ $? = 0 ]; then
        echo "PASS"
    else
        echo "FAIL"
    fi
done
