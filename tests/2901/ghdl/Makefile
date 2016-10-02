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
#MODELSIM        = /usr/local/modelsim
MODELSIM        = /mips/proj/tools/questa/10.2_1/questasim/linux

vpath %.vhd ../rtl

all:            $(PROG)

clean:
	rm -rf *.o testbench *.lst *.vcd work-obj93.cf work transcript vsim.wlf INCA_libs ncsim.key ncvhdl.log ncelab.log ncsim.log $(PROG)

run:
	$(GHDL) -r $(GHDLFLAGS) testbench --vcd=$(PROG).vcd --stop-time=140ms --ieee-asserts=disable 2>&1 | tee run.log

runrun:
	$(GHDL) -r $(GHDLFLAGS) testbench --ieee-asserts=disable

$(PROG):        $(OBJ)
	$(GHDL) -e $(GHDLFLAGS) testbench

view:
	gtkwave $(PROG).vcd databus.gtkw

# Using Mentor ModelSim
modelsim:
	$(MODELSIM)/vlib work
	$(MODELSIM)/vcom ../types.vhd
	$(MODELSIM)/vcom ../MVL7_functions.vhd
	$(MODELSIM)/vcom ../synthesis_types.vhd
	$(MODELSIM)/vcom ../funct_blocks_alg_beh/funct_block_alg_beh2901.vhdl
	$(MODELSIM)/vcom ../test_vectors_2901.vhdl
	$(MODELSIM)/vsim -c -do 'run 100000us; quit' testbench

# Using Cadence UIS
ius:
	ncvhdl -v93 ../types.vhd
	ncvhdl -v93 ../MVL7_functions.vhd
	ncvhdl -v93 ../synthesis_types.vhd
	ncvhdl -v93 ../funct_blocks_alg_beh/funct_block_alg_beh2901.vhdl
	ncvhdl -v93 ../test_vectors_2901.vhdl
	ncelab testbench
	ncsim testbench

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
