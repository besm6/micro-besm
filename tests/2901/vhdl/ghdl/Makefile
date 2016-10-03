PROG            = am2901
RTL             = alg_beh2901
#RTL             = funct_block_alg_beh2901
OBJ             = types.o \
                  MVL7_functions.o \
                  synthesis_types.o \
                  $(RTL).o \
                  test_vectors_2901.o

GHDL            = ghdl
GHDLFLAGS       = -fexplicit --ieee=synopsys

vpath %.vhd ../rtl

all:            $(PROG)

clean:
		rm -rf *.o testbench *.lst *.vcd work-obj93.cf INCA_libs ncsim.key ncvhdl.log ncelab.log ncsim.log $(PROG)

run:
		$(GHDL) -r $(GHDLFLAGS) testbench --vcd=$(PROG).vcd --stop-time=140ms --ieee-asserts=disable 2>&1 | tee run.log

runrun:
		$(GHDL) -r $(GHDLFLAGS) testbench --ieee-asserts=disable

$(PROG):        $(OBJ)
		$(GHDL) -e $(GHDLFLAGS) testbench

view:
		gtkwave $(PROG).vcd databus.gtkw

types.o: ../types.vhd
		$(GHDL) -a $(GHDLFLAGS) $<

MVL7_functions.o: ../MVL7_functions.vhd
		$(GHDL) -a $(GHDLFLAGS) $<

synthesis_types.o: ../synthesis_types.vhd
		$(GHDL) -a $(GHDLFLAGS) $<

funct_block_alg_beh2901.o: ../funct_blocks_alg_beh/funct_block_alg_beh2901.vhdl types.o MVL7_functions.o synthesis_types.o
		$(GHDL) -a $(GHDLFLAGS) $<

alg_beh2901.o: ../alg_beh/alg_beh2901.vhdl types.o MVL7_functions.o synthesis_types.o
		$(GHDL) -a $(GHDLFLAGS) $<

test_vectors_2901.o: ../test_vectors_2901.vhdl types.o MVL7_functions.o synthesis_types.o
		$(GHDL) -a $(GHDLFLAGS) $<
