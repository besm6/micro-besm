This directory contains a set of tests for verification of micro-BESM
CPU design. To run all the tests, use script:

    ./run-all-tests.sh

It takes about an hour on modern Intel i7 processor.

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
