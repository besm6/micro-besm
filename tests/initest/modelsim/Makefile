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
                  ../../../rtl/arbiter.sv \
                  ../../../rtl/shifter.sv \
                  ../../cpu/tracer.sv \
		  ../initest.sv

INCLUDES        = ../../microcode/initest.v \
                  ../../../microcode/constants.v \
                  ../../../microcode/optab.v

# Altera Quartus toolchain
MODELSIM        = /opt/Altera/16.0/modelsim_ase/linuxaloem

all:            work

clean:
		rm -rf *.o *.vcd work

work:           $(SOURCES) $(INCLUDES)
		[ -d word ] || $(MODELSIM)/vlib work
		$(MODELSIM)/vlog -sv -nologo $(SOURCES)

run:            work
		$(MODELSIM)/vsim -c -l run.log -do 'run 1000us;quit' testbench +limit=200000

view:
		gtkwave output.vcd test.gtkw &
