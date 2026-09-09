#
# Using Verilator (open source: apt install verilator)
#
# NOTE: this test's local testbench (../initest.sv) pokes DUT-internal
# registers (uPC, opcode, no_intr) with blocking assignments to
# fast-forward past already-verified microcode, while cpu.sv/am2910.sv
# drive those same signals with non-blocking assignments elsewhere.
# Verilator refuses to schedule a signal driven both ways
# (%Error-BLKANDNBLK) and this can't be worked around with flags -- it
# would need the accelerator hack in ../initest.sv re-engineered.
# Kept here for consistency with the other simulator directories, but
# `make` currently fails during Verilation. Not yet attempted.
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
                  ../initest.sv

DPI_SOURCES     = ../../../rtl/gettimeofday_dpi.c

INCLUDES        = ../../../microcode/tests/initest.v \
                  ../../../microcode/constants.v \
                  ../../../microcode/optab.v

INCDIRS         = -I../../../microcode -I../../../microcode/tests
RUNFLAGS        = +limit=20000

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
