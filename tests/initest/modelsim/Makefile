#
# Using Mentor ModelSim
#
SOURCES         = ../../../rtl/cpu.sv \
                  ../../../rtl/datapath.sv \
                  ../../../rtl/extbus.sv \
                  ../../../rtl/am2901.sv \
                  ../../../rtl/am2902.sv \
                  ../../../rtl/am2904.sv \
                  ../../../rtl/am2910.sv \
                  ../../../rtl/k1802bb1.sv \
                  ../../../rtl/decoder.sv \
                  ../../cpu/tracer.sv \
		  ../initest.sv

# Altera Quartus toolchain
MODELSIM        = /opt/Altera/16.0/modelsim_ase/linuxaloem

all:            work

clean:
		rm -rf *.o *.vcd work

work:           $(SOURCES)
		[ -d word ] || $(MODELSIM)/vlib work
		$(MODELSIM)/vlog -sv -nologo $(SOURCES)

run:            work
		$(MODELSIM)/vsim -c -l run.log -do 'run 1000us;quit' testbench +limit=1000

view:
		gtkwave output.vcd test.gtkw &
