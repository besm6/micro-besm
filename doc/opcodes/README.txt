Here you can find a database of all micro-BESM opcodes in JSON format:

 * File 'native.json' contains native opcodes.
 * File 'besm6.json' has opcodes for BESM-6 mode.

The data can be processed by Python scripts.

For every opcode, the following information is provided:

 * name: mnemonics as used in assembler, uppercase
 * brief: a short one-line description
 * opcode: operation code in hex (8 bits)
 * ext_op: extended format flag
 * privileged: available only in privileged mode
