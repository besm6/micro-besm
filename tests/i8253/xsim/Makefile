#
# Using Cadence IUS
#
SOURCES         = ../../../rtl/i8253.sv \
                  ../test_8253.sv

# Xilinx Vivado toolchain
NC              = x
NCSIM           = /opt/Xilinx/Vivado/2017.2/bin/$(NC)

all:            $(NC)sim.dir

clean:
		rm -rf $(NC)sim.dir .Xil
		rm -f *.o *.vcd $(NC)vhdl.pb $(NC)vlog.pb $(NC)elab.pb $(NC)sim*.jou webtalk*.jou webtalk*.log run_*.log

$(NC)sim.dir:
		$(NCSIM)vlog --nolog --sv $(SOURCES)
		$(NCSIM)elab --nolog testbench

run:            $(NC)sim.dir
		$(NCSIM)sim --R --log run.log testbench

view:
		gtkwave output.vcd test.gtkw &
