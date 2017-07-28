#
# Using Mentor ModelSim
#
SOURCES         = ../../../rtl/am2901.sv ../test_2901.sv

# Altera Quartus toolchain
MODELSIM        = /opt/Altera/16.1/modelsim_ase/linuxaloem

all:            work

clean:
		rm -rf *.o *.vcd work

work:           $(SOURCES)
		$(MODELSIM)/vlib work
		$(MODELSIM)/vlog -sv $(SOURCES)

run:            work
		$(MODELSIM)/vsim -c -l run.log -do 'run 100000us; quit' testbench

view:
		gtkwave testbench.vcd databus.gtkw
