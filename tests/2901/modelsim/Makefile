#
# Using Mentor ModelSim
#
RTL             = alg_beh2901
#RTL             = funct_block_alg_beh2901
OBJ             = types.o \
                  MVL7_functions.o \
                  synthesis_types.o \
                  $(RTL).o \
                  test_vectors_2901.o

MODELSIM        = /opt/Altera/16.0/modelsim_ase/linuxaloem

vpath %.vhd ../rtl

all:            work

clean:
		rm -rf *.o *.vcd work transcript vsim.wlf INCA_libs ncsim.key ncvhdl.log ncelab.log ncsim.log

run:            work
		$(MODELSIM)/vsim -c -l run.log -do 'run 100000us; quit' testbench

view:
		gtkwave testbench.vcd databus.gtkw

work:
		$(MODELSIM)/vlib work
		$(MODELSIM)/vcom ../types.vhd
		$(MODELSIM)/vcom ../MVL7_functions.vhd
		$(MODELSIM)/vcom ../synthesis_types.vhd
		$(MODELSIM)/vcom ../funct_blocks_alg_beh/funct_block_alg_beh2901.vhdl
		$(MODELSIM)/vcom ../test_vectors_2901.vhdl
