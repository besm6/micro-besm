#
# Using Mentor ModelSim
#
#RTL             = alg_beh/alg_beh2901.vhdl
RTL             = funct_blocks_alg_beh/funct_block_alg_beh2901.vhdl

MODELSIM        = /opt/Altera/16.0/modelsim_ase/linuxaloem

vpath %.vhd ../rtl

all:            work

clean:
		rm -rf *.o *.vcd work

work:
		$(MODELSIM)/vlib work
		$(MODELSIM)/vcom ../types.vhd
		$(MODELSIM)/vcom ../MVL7_functions.vhd
		$(MODELSIM)/vcom ../synthesis_types.vhd
		$(MODELSIM)/vcom ../$(RTL)
		$(MODELSIM)/vcom ../test_vectors_2901.vhdl

run:            work
		$(MODELSIM)/vsim -c -l run.log -do 'run 100000us; quit' testbench

view:
		gtkwave testbench.vcd databus.gtkw
