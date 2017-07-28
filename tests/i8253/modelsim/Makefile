#
# Using Mentor ModelSim
#
SOURCES         = ../../../rtl/i8253.sv \
                  ../test_8253.sv

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
		gtkwave output.vcd test.gtkw &
