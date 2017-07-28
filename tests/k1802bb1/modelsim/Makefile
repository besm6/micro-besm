#
# Using Mentor ModelSim
#
SOURCES         = ../../../rtl/k1802bb1.sv \
		  ../test_k1802bb1.sv

# Altera Quartus toolchain
MODELSIM        = /opt/Altera/17.0/modelsim_ase/linuxaloem

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
