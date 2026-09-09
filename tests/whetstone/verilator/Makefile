#
# Using Verilator (open source: apt install verilator)
#
# Verilates, compiles and links cleanly (verified), same as
# tests/startup/verilator. This is a benchmark, not a pass/fail test,
# and has not been run to completion here.
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

DPI_SOURCES     = ../../../rtl/gettimeofday_dpi.c

INCLUDES        = ../../../microcode/microcode.v \
                  ../../../microcode/constants.v \
                  ../../../microcode/optab.v \
                  ../../../microcode/rwiotab.v \
                  ../../../microcode/intrtab.v \
                  ../../../microcode/grouptab.v

INCDIRS         = -I../../../microcode
RUNFLAGS        = +hex=../test.hex #+clearmem
RUNFLAGS       += +limit=160000000	# Limit by a number of cycles
RUNFLAGS       += +trace=1		# Print instructions

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
