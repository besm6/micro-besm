SRC             = whetstone.b6
#SRC             = extracode.b6
DISPAK          = dispak --input-encoding=utf8

all:            test.hex

clean:
		rm -f *.lst

test.hex:       startup.hex macro50.hex b6-to-hex.py $(SRC)
		cat startup.hex macro50.hex > $@
		./b6-to-hex.py $(SRC) >> $@

startup.hex:    startup.asm ../complex/hexdump.b6
		$(MAKE) assembler.lst
		$(MAKE) loader.lst
		$(DISPAK) startup.asm > startup.lst
		$(DISPAK) ../complex/hexdump.b6 > hexdump.lst
		../complex/listing-to-hex.py hexdump.lst > $@

macro50.hex:    macro50.b6
		$(DISPAK) macro50.b6 > macro50.lst
		./oct-to-hex.py macro50.lst > $@

assembler.lst:  ../complex/assembler.b6
		$(DISPAK) $< > $@

loader.lst:     ../complex/loader.b6
		$(DISPAK) $< > $@
