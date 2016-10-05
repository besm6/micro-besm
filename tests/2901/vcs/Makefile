#
# Using Synopsys VCS
#
SOURCES         = ../../../rtl/am2901.sv ../test_2901.sv

VCS             = vcs -l vcs.log -sverilog -debug_all

all:            simv

clean:
		rm -rf simv.daidir csrc
		rm -rf *.o *.vcd *~ simv vcs.log ucli.key

simv:           $(SOURCES)
		$(VCS) $(SOURCES)

run:            simv
		./simv 2>&1 | tee run.log

view:
		gtkwave simv.vcd databus.gtkw
