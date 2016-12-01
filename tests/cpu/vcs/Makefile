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
                  ../../../rtl/tracer.sv \
                  ../test_cpu.sv

INCLUDES        = ../../../microcode/microcode.v \
                  ../../../microcode/constants.v \
                  ../../../microcode/optab.v \
                  ../../../microcode/rwiotab.v \
                  ../../../microcode/grouptab.v

VCS             = vcs -l vcs.log -sverilog -debug_all

all:            simv

clean:
		rm -rf simv.daidir csrc
		rm -rf *.o *.vcd *~ simv vcs.log ucli.key

simv:           $(SOURCES) $(INCLUDES)
		$(VCS) +incdir+..+../../../rtl $(SOURCES)

run:            simv
		./simv +trace=2 +dump +limit=200000 2>&1 | tee run.log

view:
		gtkwave simv.vcd databus.gtkw
