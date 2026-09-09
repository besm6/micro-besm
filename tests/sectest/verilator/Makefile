#
# Using Verilator (open source: apt install verilator)
#
# ../sectest.sv originally force-wrote DUT-internal registers (uPC, opcode,
# and a few test-specific signals) with blocking assignments, while the
# RTL drives the same signals with non-blocking assignments elsewhere --
# Verilator refuses to schedule a signal driven both ways
# (%Error-BLKANDNBLK). Fixed by switching those writes to non-blocking
# (matching the RTL) in ../sectest.sv, and by delaying reset deassertion off
# the clock edge (#2.1 instead of #2, to avoid a separate event-ordering
# race with cpu.sv's synchronous reset).
#
# Verified: `make && make run` passes (Test PASS) under Verilator 5.032
# as of this writing.
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
                  ../../../rtl/tracer.sv \
                  ../sectest.sv

DPI_SOURCES     = ../../../rtl/gettimeofday_dpi.c

INCLUDES        = ../../../microcode/tests/sectest.v \
                  ../../../microcode/constants.v \
                  ../../../microcode/optab.v

INCDIRS         = -I../../../microcode -I../../../microcode/tests
RUNFLAGS        = +limit=600000

VERILATOR       = verilator

all:            obj_dir/Vtestbench

clean:
		rm -rf obj_dir *.vcd *.trace run.log

obj_dir/Vtestbench: $(SOURCES) $(DPI_SOURCES) $(INCLUDES)
		$(VERILATOR) --binary -sv --timing -Wno-fatal $(INCDIRS) \
		    --top-module testbench $(SOURCES) $(DPI_SOURCES)

run:            obj_dir/Vtestbench
		./obj_dir/Vtestbench $(RUNFLAGS) 2>&1 | tee run.log

view:
		gtkwave output.vcd test.gtkw &
