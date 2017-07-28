#
# Using Cadence IUS
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

# Xilinx Vivado toolchain
NC              = x
NCSIM           = /opt/Xilinx/Vivado/2017.2/bin/$(NC)
PROG            = $(NC)sim.dir/work.testbench/xsimk

RUNFLAGS        = --testplusarg hex=../test.hex
RUNFLAGS	+= --testplusarg limit=40000	# Limit by a number of cycles
#RUNFLAGS	+= --testplusarg trace=1	# Print instructions
RUNFLAGS	+= --testplusarg trace=2	# Print micro-instructions
#RUNFLAGS	+= --testplusarg dump		# Dump waveforms to output.vcd

all:            $(PROG)

clean:
		rm -rf $(NC)sim.dir .Xil
		rm -f *.o *.vcd $(NC)vhdl.pb $(NC)vlog.pb $(NC)elab.pb $(NC)sim*.jou webtalk*.jou webtalk*.log run_*.log

$(PROG):        $(SOURCES) $(INCLUDES)
		$(NCSIM)vlog --nolog --sv $(SOURCES)
		$(NCSIM)elab --nolog -O3 -cc gcc testbench

run:            $(PROG)
		$(NCSIM)sim --R --log run.log testbench $(RUNFLAGS)


view:
		gtkwave testbench.vcd databus.gtkw
