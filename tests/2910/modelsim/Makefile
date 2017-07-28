#
# Using Mentor ModelSim
#

# Altera Quartus toolchain
MODELSIM        = /opt/Altera/17.0/modelsim_ase/linuxaloem

all:            work

clean:
		rm -rf *.o *.vcd work

work:
		$(MODELSIM)/vlib work
		$(MODELSIM)/vlog -sv ../../../rtl/am2910.sv
		$(MODELSIM)/vlog -sv ../test_2910.sv

run:            work
		$(MODELSIM)/vsim -c -l run.log -do 'run 100000us; quit' testbench

view:
		gtkwave testbench.vcd databus.gtkw
