#
# Using Synopsys VCS
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
		  ../../cpu/test_cpu.sv

INCLUDES        = ../../../microcode/microcode.v \
                  ../../../microcode/constants.v \
                  ../../../microcode/optab.v \
                  ../../../microcode/rwiotab.v \
                  ../../../microcode/intrtab.v \
                  ../../../microcode/grouptab.v

VCS             = vcs -l vcs.log -sverilog -debug_all

RUNFLAGS        = +hex=../test.hex +clearmem
RUNFLAGS	+= +limit=20000000	# Limit by a number of cycles
#RUNFLAGS	+= +trace=0		# No trace
RUNFLAGS	+= +trace=1		# Print instructions
#RUNFLAGS	+= +trace=2		# Print micro-instructions
#RUNFLAGS	+= +dump		# Dump waveforms to output.vcd

all:            simv

clean:
		rm -rf simv.daidir csrc
		rm -rf *.o *.vcd *~ simv vcs.log ucli.key

simv:           $(SOURCES) $(INCLUDES)
		$(VCS) +incdir+..+../../../rtl $(SOURCES)

run:            simv
		./simv $(RUNFLAGS) 2>&1 | tee run.log

view:
		gtkwave output.vcd test.gtkw &
