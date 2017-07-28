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
		  ../../../rtl/testbench.sv

INCLUDES        = ../../../microcode/microcode.v \
                  ../../../microcode/constants.v \
                  ../../../microcode/optab.v \
                  ../../../microcode/rwiotab.v \
                  ../../../microcode/intrtab.v \
                  ../../../microcode/grouptab.v

# Altera Quartus toolchain
MODELSIM        = /opt/Altera/17.0/modelsim_ase/linuxaloem

RUNFLAGS        = +hex=../test.hex
RUNFLAGS	+= +limit=40000		# Limit by a number of cycles
#RUNFLAGS	+= +trace=0		# No trace
#RUNFLAGS	+= +trace=1		# Print instructions
RUNFLAGS	+= +trace=2		# Print micro-instructions
#RUNFLAGS	+= +dump		# Dump waveforms to output.vcd

all:            work

clean:
		rm -rf *.o *.vcd work

work:           $(SOURCES) $(INCLUDES)
		[ -d word ] || $(MODELSIM)/vlib work
		$(MODELSIM)/vlog -sv -nologo $(SOURCES)

run:            work
		$(MODELSIM)/vsim -c -l run.log -do 'run 1ms;quit' testbench $(RUNFLAGS)

view:
		gtkwave output.vcd test.gtkw &
