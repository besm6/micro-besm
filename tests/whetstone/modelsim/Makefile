#
# Using Mentor ModelSim
#
include ../config.mak

SOURCES         = $(MICROBESM_HOME)/rtl/cpu.sv \
                  $(MICROBESM_HOME)/rtl/datapath.sv \
                  $(MICROBESM_HOME)/rtl/extbus.sv \
                  $(MICROBESM_HOME)/rtl/am2901.sv \
                  $(MICROBESM_HOME)/rtl/am2902.sv \
                  $(MICROBESM_HOME)/rtl/am2904.sv \
                  $(MICROBESM_HOME)/rtl/am2910.sv \
                  $(MICROBESM_HOME)/rtl/k1802bb1.sv \
                  $(MICROBESM_HOME)/rtl/decoder.sv \
                  $(MICROBESM_HOME)/rtl/arbiter.sv \
                  $(MICROBESM_HOME)/rtl/shifter.sv \
                  $(MICROBESM_HOME)/rtl/clz.sv \
                  $(MICROBESM_HOME)/rtl/i8253.sv \
                  $(MICROBESM_HOME)/rtl/tmemory.sv \
                  $(MICROBESM_HOME)/rtl/tracer.sv \
		  $(MICROBESM_HOME)/rtl/testbench.sv

INCLUDES        = $(MICROBESM_HOME)/microcode/microcode.v \
                  $(MICROBESM_HOME)/microcode/constants.v \
                  $(MICROBESM_HOME)/microcode/optab.v \
                  $(MICROBESM_HOME)/microcode/rwiotab.v \
                  $(MICROBESM_HOME)/microcode/intrtab.v \
                  $(MICROBESM_HOME)/microcode/grouptab.v

# Altera Quartus toolchain
MODELSIM        = /opt/Altera/16.0/modelsim_ase/linuxaloem

RUNFLAGS        = +hex=../test.hex #+clearmem
RUNFLAGS	+= +limit=20000000	# Limit by a number of cycles
#RUNFLAGS	+= +trace=0		# No trace
RUNFLAGS	+= +trace=1		# Print instructions
#RUNFLAGS	+= +trace=2		# Print micro-instructions
#RUNFLAGS	+= +dump		# Dump waveforms to output.vcd

all:            work

clean:
		rm -rf *.o *.vcd work

work:           $(SOURCES) $(INCLUDES)
		[ -d word ] || $(MODELSIM)/vlib work
		$(MODELSIM)/vlog -sv -nologo $(SOURCES)

run:            work
		$(MODELSIM)/vsim -c -l run.log -do 'run 1000ms;quit' testbench $(RUNFLAGS)

view:
		gtkwave output.vcd test.gtkw &
