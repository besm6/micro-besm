#
# Using Mentor ModelSim
#
SOURCES         = ../../../rtl/cpu.sv \
                  ../../../rtl/datapath.sv \
                  ../../../rtl/am2901.sv \
                  ../../../rtl/am2902.sv \
                  ../../../rtl/am2904.sv \
                  ../../../rtl/am2910.sv \
		  ../test_cpu.sv

# Altera Quartus toolchain
MODELSIM        = /opt/Altera/16.0/modelsim_ase/linuxaloem

all:            work

clean:
		rm -rf *.o *.vcd work

work:           $(SOURCES)
		[ -d word ] || $(MODELSIM)/vlib work
		$(MODELSIM)/vlog -sv $(SOURCES)

run:            work
		$(MODELSIM)/vsim -c -l run.log -do 'run 1us;quit' testbench +trace=2 +dump +limit=100

view:
		gtkwave output.vcd test.gtkw &
