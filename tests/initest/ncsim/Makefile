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
                  ../../cpu/tracer.sv \
                  ../initest.sv

# Xilinx Vivado toolchain
NC              = x
NCSIM           = /opt/Xilinx/Vivado/2016.2/bin/$(NC)
PROG            = $(NC)sim.dir/work.testbench/xsimk

all:            $(PROG)

clean:
		rm -rf $(NC)sim.dir .Xil
		rm -f *.o *.vcd $(NC)vhdl.pb $(NC)vlog.pb $(NC)elab.pb $(NC)sim*.jou webtalk*.jou webtalk*.log run_*.log

$(PROG):        $(SOURCES)
		$(NCSIM)vlog --nolog --sv $(SOURCES)
		$(NCSIM)elab --nolog testbench

run:            $(PROG)
		$(NCSIM)sim --R --log run.log testbench --testplusarg limit=200000

view:
		gtkwave testbench.vcd databus.gtkw
