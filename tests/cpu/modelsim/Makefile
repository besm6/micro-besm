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
                  ../../../rtl/clz.sv \
                  ../../../rtl/i8253.sv \
                  ../../../rtl/tmemory.sv \
                  ../../../rtl/tracer.sv \
		  ../test_cpu.sv

# Altera Quartus toolchain
MODELSIM        = /opt/Altera/16.0/modelsim_ase/linuxaloem

RUNFLAGS        = +hex=../test.hex
RUNFLAGS	+= +limit=40000		# Limit by a number of cycles
#RUNFLAGS	+= +trace=0		# No trace
RUNFLAGS	+= +trace=1		# Print instructions
#RUNFLAGS	+= +trace=2		# Print micro-instructions
#RUNFLAGS	+= +dump		# Dump waveforms to output.vcd

all:            work

clean:
		rm -rf *.o *.vcd work

work:           $(SOURCES)
		[ -d word ] || $(MODELSIM)/vlib work
		$(MODELSIM)/vlog -sv -nologo $(SOURCES)

run:            work
		$(MODELSIM)/vsim -c -l run.log -do 'run 1ms;quit' testbench $(RUNFLAGS)

view:
		gtkwave output.vcd test.gtkw &
