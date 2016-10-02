PROG            = am2910
RTL             = alg_beh2910
#RTL             = funct_block_alg_beh2910
OBJ             = types.o \
                  MVL7_functions.o \
                  synthesis_types.o \
                  $(RTL).o \
                  test_vectors_2910.o

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

# Using Cadence UIS
ius:
		ncvhdl -v93 ../types.vhd
		ncvhdl -v93 ../MVL7_functions.vhd
		ncvhdl -v93 ../synthesis_types.vhd
		ncvhdl -v93 ../funct_block_alg_beh/funct_block_alg_beh2910.vhdl
		ncvhdl -v93 ../test_vectors_2910.vhdl
		ncelab testbench
		ncsim testbench

types.o: ../types.vhd
		$(GHDL) -a $(GHDLFLAGS) $<

MVL7_functions.o: ../MVL7_functions.vhd
		$(GHDL) -a $(GHDLFLAGS) $<

synthesis_types.o: ../synthesis_types.vhd
		$(GHDL) -a $(GHDLFLAGS) $<

funct_block_alg_beh2910.o: ../funct_block_alg_beh/funct_block_alg_beh2910.vhdl types.o MVL7_functions.o synthesis_types.o
		$(GHDL) -a $(GHDLFLAGS) $<

alg_beh2910.o: ../alg_beh/alg_beh2910.vhdl types.o MVL7_functions.o synthesis_types.o
		$(GHDL) -a $(GHDLFLAGS) $<

test_vectors_2910.o: ../test_vectors_2910.vhdl types.o MVL7_functions.o synthesis_types.o
		$(GHDL) -a $(GHDLFLAGS) $<
