#
# Using Cadence IUS
#
RTL             = alg_beh/alg_beh2901.vhdl
#RTL             = funct_blocks_alg_beh/funct_block_alg_beh2901.vhdl

# Xilinx Vivado toolchain
NC              = x
NCSIM           = /opt/Xilinx/Vivado/2016.2/bin/$(NC)

vpath %.vhd ../rtl

all:            $(NC)sim.dir

clean:
		rm -rf $(NC)sim.dir
		rm -f *.o *.vcd $(NC)vhdl.pb $(NC)elab.pb $(NC)sim*.jou webtalk*.jou webtalk*.log run_*.log

run:            $(NC)sim.dir
		$(NCSIM)sim --R --log run.log testbench

view:
		gtkwave testbench.vcd databus.gtkw

$(NC)sim.dir:
		$(NCSIM)vhdl --nolog ../types.vhd
		$(NCSIM)vhdl --nolog ../MVL7_functions.vhd
		$(NCSIM)vhdl --nolog ../synthesis_types.vhd
		$(NCSIM)vhdl --nolog ../$(RTL)
		$(NCSIM)vhdl --nolog ../test_vectors_2901.vhdl
		$(NCSIM)elab --nolog testbench
