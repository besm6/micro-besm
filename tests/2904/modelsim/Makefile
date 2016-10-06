#
# Using Mentor ModelSim
#
SOURCES         = ../../../rtl/am2904.sv \
		  ../test_2904.sv

# Altera Quartus toolchain
MODELSIM        = /opt/Altera/16.0/modelsim_ase/linuxaloem

all:            work

clean:
		rm -rf *.o *.vcd work

work:           $(SOURCES)
		[ -d word ] || $(MODELSIM)/vlib work
		$(MODELSIM)/vlog -sv $(SOURCES)

run:            work
		$(MODELSIM)/vsim -c -l run.log -do 'run 100000us; quit' testbench

view:
		gtkwave test.vcd test.gtkw &
