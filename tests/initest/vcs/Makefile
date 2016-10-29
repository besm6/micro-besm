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
                  ../../cpu/tracer.sv \
                  ../initest.sv

VCS             = vcs -l vcs.log -sverilog -debug_all

all:            simv

clean:
		rm -rf simv.daidir csrc
		rm -rf *.o *.vcd *~ simv vcs.log ucli.key

simv:           $(SOURCES)
		$(VCS) $(SOURCES)

run:            simv
		./simv +limit=13000 2>&1 | tee run.log

view:
		gtkwave simv.vcd databus.gtkw
