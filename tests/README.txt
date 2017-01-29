This directory contains a set of tests for verification of micro-BESM
CPU design. To run all the tests, use script:

    ./run-all-tests.sh

It takes about an hour on a decent processor.
Typical times for Intel i7 2.50GHz:

    Test        Modelsim    XSim
    --------------------------------
    initest     5 sec       5 sec
    intrtest    1 sec       1 sec
    startup     2 sec       3 sec
    sectest     63 sec      71 sec
    octtest     48 sec      40 sec
    memtest     29 sec      37 sec
    complex     1807 sec    1947 sec

Microcode level tests:

    initest - verify basic control unit and ALU functionality
    sectest - check memory mapping and timer
    octtest - check external bus connection and instruction decoder
    memtest - verify main RAM
    intrtest - check interrupts

CPU level tests:

    startup - short check of CPU initialization and instruction fetch
    complex - big test of all micro-BESM instructions and features

Benchmarks:

    whetstone

Tests for individual components:

    2901
    2904
    2910
    i8253
    k1802bb1
    standardizer
