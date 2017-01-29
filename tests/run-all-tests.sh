#!/bin/bash

#
# Select: modelsim, xsim, vcs
#

# Mentor ModelSim Starter Edition from Altera Quartus Prime Lite toolchain,
# installed as /opt/Altera/16.0/modelsim_ase/linuxaloem
engine=modelsim

# Xilinx Vivado Simulator (essentially a licensed Cadence IUS)
# from Xilinx Vivado Design Suite HL WebPACK toolchain,
# installed in /opt/Xilinx/Vivado/2016.2/bin directory.
#engine=xsim

# Synopsys VCS.
#engine=vcs

#
# Run short tests first.
#
tests="initest intrtest startup sectest octtest memtest complex"

#
# Identify the simulator engine.
#
case $engine in
modelsim) echo "Use Altera Modelsim";;
xsim)     echo "Use Xilinx Vivado simulator";;
vcs)      echo "Use Synopsys VCS";;
*)        echo "Unknown simulator: $engine"
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
